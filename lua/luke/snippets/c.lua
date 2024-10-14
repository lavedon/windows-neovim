local ls = require('luasnip')
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.s
local t = ls.t
local i = ls.i

print("Loading C snippets...")
ls.add_snippets("c", {
    s("hello", {
        t("printf('Hello, World!');")
    }),
    s("te", {
        t({"typedef enum {", "\t"}),
        i(1, "Red, Yellow, Blue"),
        t({",", "} "}),
        i(2, "Color"),
        t(";")
    }),
    s("safe_gets", {
        t({"char* safe_gets(char* buf, int size) {",
           "\tif (fgets(buf, size, stdin)) {",
           "\t\tchar* newline = strchr(buf, '\\n'); // Find the newline character",
           "\t\tif (newline) {",
           "\t\t\t*newline = '\\0'; // Replace it with a null terminator",
           "\t\t}",
           "\t\treturn buf;",
           "\t} else {",
           "\t\treturn NULL;",
           "\t}",
           "}"
        }),
    }),
    s("fileio_setup", {
    t({
        "FILE* inputFile;",
        "FILE* outputFile;",
        'printf("FILENAME_MAX on this system is %d bytes\\n", FILENAME_MAX); // FILENAME_MAX is defined in stdio.h',
        "char* inputFilename = (char*)calloc(FILENAME_MAX, 1);",
        "char* outputFilename = (char*)calloc(FILENAME_MAX, 1);",
        }),
    }),
    s("close_files_when_done", {
        t({
            "fclose(inputFile);",
            "fflush(outputFile);",
            "fclose(outputFile);",
            "free(inputFilename);",
            "free(outputFilename);",
        })
    }),
    s("open_input_file", fmt([[
        {inputFile} = fopen( {inputFilename} , "r" );
        if( NULL == {inputFile} ) {{
            fprintf( stderr, "input file: %s: %s\n",
                     {inputFilename} , strerror( errno ) );
            exit( EXIT_FAILURE );
        }}
    ]], {
        inputFile = i(1, "inputFile"),
        inputFilename = i(2, "inputFilename"),
    })),
    s("open_with_safe_gets", {
        t("safe_gets("),
        i(1,"inputFilename"),
        t(", FILENAME_MAX); // FILENAME_MAX is defined in stdio.h"),
    }),
   s("csv_parser_simple", 
     t({
    'char item[BUFSIZE]; // #define BUFSIZE 4096',
    'char delim;',
    '',
    'while (scanf("%[^,\\n]%c", item, &delim) != EOF) {',
    '\tprintf("item: %s\\n", item);',
    '}',
    }))
})
print("C snippets loaded...")
