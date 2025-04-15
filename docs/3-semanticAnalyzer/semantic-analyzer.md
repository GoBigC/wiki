# Overview of How The Analyzer Works

## Two-pass Approach

The analyzer uses the two-pass approach:

1. First pass: visits all the leaf node of the AST and add all the symbols to the table
2. Second pass: Traverse the AST again and analyze it with the complete symbol table from the first pass.

## Why The Two-pass Approach?

The first iteration used a naive approach where the analyzer traverse the AST only once, adding symbols and scanning for errors along the way. But this poses 1 major issue. Look at the code snippet below

```
int main() {
    int a = addInt(1,2);
    return a;
}

int addInt(int x, int y) {
    return x + y;
}
```

Intuitively, this code has no problems whatsoever (by design). However, the first iteration of semantic analyzers screams at me when it scans the code, saying that `addInt is an invalid symbol!`. Let this be an exercise to the reader to figure out why the first version of semantic analyzers hate this snippet. This is a very character-developing exercise, trust me.

If you dislike brain exercises, bonkers. The answer is that at the time `addInt` was called at `int a = addInt(1,2);`, the symbol was not added to the table, simply because the analyzer traverses from the root up (or down?), and the function was declared after the function call. The two-pass approach was an easy solution.

# Brief Explanation of How Each Semantic Error is Caught

## Index Out of Bound

The array size is stored as a field in the symbol table, so the check is quite straight forward. If the index is a variable, the value of the variable is also checked to scan for out of bounds error.

```
int arr[5];
int x = arr[7]; // ERROR

int y = 7;
int z = arr[y]; // ALSO ERROR
```

## Divide by Zero

Whenever the `/` operator is called, we check if the second operand is a zero or not. If yes, we throw the error.

## Type Mismatch

### Assignment Type Mismatch

We check if the type in the declaration and the initializer matches or not. The type is inferred from the syntax analysis, so the check is very straightforward.

### Function Return Type Mismatch

The return type for a function is stored in the symbol table, so this check is also simple.

### Operator Type Mismatch

Whenever an operator is called, we check the type of both operands.

- Logical operators only allow boolean expressions
- Numerical operators only allow `int` or `float`, and both operators must be the same type (we don't support type conversions yet)

### Function Argument Type Mismatch

The arguments in each function are also stored in the symbol table with their type, so the check is similar to other checks above.

## Invalid Function

### Argument Count Mismatch

The parameters are kept inside an array, so we only need to compare the length of the arguments array and the parameters array.

## Undefined Symbol

The table is a list of maps, so each variable is assigned a name, and looking up for the symbols is just using the map's query. For variables with the same name but different scope, the key for them will be determined by their scope. Each symbol's key will have a prefix based on the function that they are stored within.

```
int addInt(int x, int y) {
    return x + y; // addInt.x and addInt.y respectively.
}
```

## Symbol Out of Scope

The valid first line and valid last line of a symbol is stored in the table, so we just check if the line from which the symbol is called fits between the allowed lines.
