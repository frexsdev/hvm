#define HVM_IMPLEMENTATION
#include "./hvm.h"

Hvm hvm = {0};

int main(int argc, char *argv[]) {
  if (argc < 2) {
    fprintf(stderr, "Usage: ./dehack <input.har>\n");
    fprintf(stderr, "ERROR: no input is provided\n");
    exit(1);
  }

  const char *input_file_path = argv[1];

  hvm_load_program_from_file(&hvm, input_file_path);

  for (Inst_Addr i = 0; i < hvm.program_size; ++i) {
    printf("%s", inst_name(hvm.program[i].type));
    if (inst_has_operand(hvm.program[i].type)) {
      printf(" %ld", hvm.program[i].operand.as_i64);
    }
    printf("\n");
  }

  return 0;
}
