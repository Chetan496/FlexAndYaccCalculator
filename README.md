### Creating a simple arithmetic calculator with variables support using Flex and Bison.

This repo has sample code to create a primitive interpreter for a calculator.
This is not a hand-written parser. The tools `Flex` and `Bison` have been utilized. 

The file `simple.y` contains the parser specification and is processed by bison/yacc.
Bison is the GNU replacement for yacc. On modern linux distros yacc is wrapper on bison.

The file `simple.lex` contains the lexcial specification and is processed by flex.

To build the executable interpreter you just need `simple.lex` and `simple.y`

### Steps to build the executable interpreter:
1. Ensure that the `simple.y` (the grammar spec of the language) is created first.
2. Then ensure that the `simple.lex` (the token specification using regex) is created.
3. Pass the .lex file for processing to flex using `flex simple.lex`
4. Flex will process the specification and generate the `lex.yy.c` C source code - which encapsulates the lexical analyzer. It will have the lexcialanalyzer which is as per the specifications given in the simple.lex file.
5. Then process the `YACC` specification for the grammar of the language by running the command `yacc -dtv simple.y`.
This will emit two files: `y.tab.c` and `y.tab.h`.
The `y.tab.h` will have the definitions of the tokens. This same file is required to be added as a header in the `simple.lex`.
The `y.tab.c` will have the source code for the parser as per the specifications given. It will call on the lexical analyzer code from `lex.yy.c` in the file executable.
6. Now its step to generate the final executable.
7. Generate object file for the lexer using `g++ -c lex.yy.c`. This will emit the object file named `lex.yy.o`
8. Generate object file for the parser using `g++ -c y.tab.c`. This will emit the object file named `y.tab.o`
9. Link these files together to generate the final executable. Use the command `g++ -o <ExecutableName> y.tab.o lex.yy.o`
10. The executable will be generated. Let's consider that the executable is called 'simple'. Ensure that the executable has the execute bit set in linux permissions.

### Testing out the interpreter:
1. You can test the interpreter by passing input stream of text which confirms to the grammar spec.
2. You can either pass it via a linux pipe or via `stdin`.
3. Via pipe example:  `echo 3+4,| ./simple`
4. Via stdin: just run the executable using ./simple. The shell will wait for the input. Then start inputting the text. So you can input some arithmetic expressions (with integers, and +, * supported. Variables are also supported currently). Make sure to end each line by a ',' or ':'
5. The shell will behave like an interpreter , it will emit the evaluated values. You may redefine variables.
6. To stop inputting, press `Ctrl+D`


### Good references to learn more about Flex and Yacc:
1. https://www.epaperpress.com/lexandyacc/prl.html

### TODO (Items to implement):
1. Add support for division and subtraction.
2. Add support for floating point numbers.
3. Add support for simple IF ELSE
