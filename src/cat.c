// cat.c
#include <stdio.h>
#include <string.h>
#include <emscripten.h>

// External terminal writer
EM_JS(void, js_terminal_write, (const char *msg), {
    const str = UTF8ToString(msg);
    if (typeof window.termWrite == = "function")
    {
        window.termWrite(str);
    }
    else
    {
        console.log("[TERM OUT]", str);
    }
});

// Forward declaration
void write_to_terminal(const char *msg)
{
    js_terminal_write(msg);
}

// Simulate reading a file or stdin
EMSCRIPTEN_KEEPALIVE
void cat(const char *arg)
{
    if (strcmp(arg, "-") == 0 || strlen(arg) == 0)
    {
        // Simulate reading from stdin
        write_to_terminal("[cat] reading from stdin not supported yet\n");
        return;
    }

    // For simplicity, simulate reading a known file
    if (strcmp(arg, "file.txt") == 0)
    {
        write_to_terminal("This is the content of file.txt\n");
    }
    else
    {
        write_to_terminal("cat: ");
        write_to_terminal(arg);
        write_to_terminal(": No such file or unsupported\n");
    }
}