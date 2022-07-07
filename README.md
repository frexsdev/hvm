# hvm

Simple Virtual Machine with its own Bytecode and Assembly language.

## Quick Start

```console
$ ./build.sh        # or `./build_msvc.bat examples` if you are on Windows
$ ./hack -i ./examples/hello.har
$ ./hack -i ./examples/fib.har
$ ./hack -i ./examples/e.har
$ ./hack -i ./examples/pi.har
```

## Components

### hackc

Assembly language for the Virtual Machine. For examples see [./examples/](./examples) folder.

### hack

HVM emulator. Used to run programs generated by [hackc](#hackc).

### hdb

HVM debuger. Used to step debug programs generated by [hack](#hack).

### dehack

Disassembler for the binary files generated by [hackc](#hackc).

## Editor Support

### Emacs

Emacs mode available in [./tools/hack-mode.el](./tools/hack-mode.el). Until the language stabilized and I upload the mode on [MELPA](https://melpa.org/) you need to install this mode manually.

Add the following lines to your emacs configuration:

```emacs-lisp
(add-to-list 'load-path "/path/to/hack-mode/")
(require 'hack-mode)
```

### Vim

Copy [./tools/hack.vim](./tools/hack.vim) in `.vim/syntax/hack.vim`. Add the following line to your `.vimrc` file:

```vimscript
autocmd BufRead,BufNewFile *.hack set filetype=hack
```
