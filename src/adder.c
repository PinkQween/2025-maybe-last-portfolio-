#include <emscripten.h>

EMSCRIPTEN_KEEPALIVE
int adder(int a, int b)
{
    return a + b;
}