# Built-in Functions

BigC provides basic builtin functions for printing output to console.

## List of builtins

1. `_printInt()`
2. `_printFloat()`
3. `_printBool()`
4. `_printChar()`

## How are builtins implemented?

BigC provides built-in functions in the most naive, simple way possible:

- Each builtin function is hand-written in assembly
- Before generate user code, generate all builtin functions at the top of the assembly code file

It doesn't get much stupider than that. But if it works, it works.

This way of builtin support also means that the builtin functions will bypass Syntax Analyzer and Semantic Analyzer. Bypassing these phases means losing most of the error-catching mechanisms. Losing error-catching mechanisms means these builtin functions have no room for error.

To resolve this, we chose a **skinny interface**.

## Builtin interface

All \_printX() functions assume the thing to be printed is already loaded at the correct register:

- `_printFloat()` will print the item in register `fa0`
- all other print functions will print the item in register `a0`

This is a skinny interface, as it is not flexible and require the setup to be right to function correctly. So:

- As language developer: If the thing you want to print is not in these registers, it is your responsibility to load it to the expected register.
- As language user: If the language developers do their job right, you should not have to care about this.
