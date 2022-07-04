#define HVM_IMPLEMENTATION
#include "./hvm.h"

#if defined(__FreeBSD__) || defined(__APPLE__) || defined(__NetBSD__) ||       \
    defined(__OpenBSD__) || defined(__DragonFly__)
#include <limits.h>
#else
#define PATH_MAX 4096
#endif

Hack hack = {0};

static char *shift(int *argc, char ***argv) {
  assert(*argc > 0);
  char *result = **argv;
  *argv += 1;
  *argc -= 1;
  return result;
}

static void usage(FILE *stream, const char *program) {
  fprintf(stream, "Usage: %s [-d] <input.hack> <output.har>\n", program);
}

int main(int argc, char **argv) {
  int have_symbol_table = 0;
  const char *program = shift(&argc, &argv);

  if (argc == 0) {
    usage(stderr, program);
    fprintf(stderr, "ERROR: expected input\n");
    exit(1);
  }
  const char *input_file_path = shift(&argc, &argv);

  if (!strcmp(input_file_path, "-d")) {
    have_symbol_table = 1;
    input_file_path = shift(&argc, &argv);
  }

  if (argc == 0) {
    usage(stderr, program);
    fprintf(stderr, "ERROR: expected output\n");
    exit(1);
  }
  const char *output_file_path = shift(&argc, &argv);

  hack_translate_source(&hack, sv_from_cstr(input_file_path), 0);
  hack_save_to_file(&hack, output_file_path);

  if (have_symbol_table) {
    char sym_file_name[PATH_MAX];

    size_t output_file_path_len = strlen(output_file_path);

    memcpy(sym_file_name, output_file_path, output_file_path_len);
    memcpy(sym_file_name + output_file_path_len, ".sym", 5);
    FILE *symbol_file = fopen(sym_file_name, "w");
    if (!symbol_file) {
      fprintf(stderr, "ERROR: Unable to open symbol table file\n");
      return EXIT_FAILURE;
    }

    // NOTE: This will dump out *ALL* symbols, no matter whether
    // they are jump labels or not. However, since the
    // preprocessor runs before the jump mark resolution, all the
    // labels are allocated in a way that enables us to just
    // overwrite prerocessor labels with a value equal to the
    // address of a jump label.
    for (size_t i = 0; i < hack.bindings_size; ++i) {
      fprintf(symbol_file, "%" PRIu64 "\t%.*s\n", hack.bindings[i].value.as_u64,
              (int)hack.bindings[i].name.count, hack.bindings[i].name.data);
    }
    fclose(symbol_file);
  }

  return 0;
}
