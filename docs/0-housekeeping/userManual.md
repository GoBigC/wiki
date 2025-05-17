# User manual 

- Source code file extension: .uia 
- Most syntax are like C -- read the grammar
- Static type
- Static scope
- Variable redeclaration not allowed 
- Supports array of primitive types, elements in array must be assigned one by one 
- All code must be in `main()`
- Can't define custom function 
- Has built-in functions for I/O: `_printInt()`, `_printBool()`, `_printChar()`, `_printFloat()`
- Primitive types: `int`, `bool`, `char`, `float` 
- Branch: `if-else` only
- Loop: `while` only
- Generally, no shorthand notation for anything (no `i++`, no `i+=1`, must be `i=i+1`, can't init array in {}, etc.)

- Array accessing

This is not supported:

```
// assuming arr is an array
arr[1+1];
```

You need to declare a separate variable to compute the index first:

```
// assuming arr is an array
int k = 1+1;
arr[k];
```
