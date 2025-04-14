# Error Handling Documentation

## Overview

Our compiler's error handling consists of two main components:

1. **Syntax Error Handling**: Enhances ANTLR's default syntax error messages with more helpful, Rust-style formatting
2. **Semantic Error Handling**: Implements custom semantic analysis with detailed error reporting

The compiler processes syntax first, then semantics. If any errors are detected at either stage, compilation stops.

## Syntax Error Handling

### How It Works

The `NewSyntaxErrorHandler` intercepts ANTLR's syntax errors and reformats them to be more user-friendly. The handler:

1. Captures the error location (line and column)
2. Retrieves the source code line where the error occurred
3. Categorizes the error type based on the error message
4. Generates a formatted error message with visual indicators

### Example

For an input like:

```c
int main() {
  int x = 5
  return x;
}
```

Instead of a generic ANTLR message like:

```
line 3:2 missing ';' at 'return'
```

Our formatter produces:

```
line 2:10
  int x = 5
          ^
Syntax Error: missing ';' at end of declaration
```

### Error Categories

The syntax error handler recognizes several common error patterns:
1. Missing braces and brackets
2. Missing semicolons
3. Invalid identifiers
4. Unexpected type keywords
5. Mismatched parentheses
6. Incomplete array declarations

## Semantic Error Handling

### How It Works

Since ANTLR doesn't handle semantic analysis, we implement our own semantic analyzer that:

1. Index out of bound
2. Divide by zero
3. Type mismatch:
4. Assignment type mismatch
5. Function return type mismatch
6. Operator type mismatch
7. Function argument type mismatch
4. Invalid function
8. Argument count mismatch
5. Undefined symbol
6. Variable out of scope

The `NewSemanticErrorFormatter` then formats these errors in a consistent style.

### Example

For input like:

```c
int main() {
  int x = 10;
  bool y = x + 5;
  return y;
}
```

Our semantic analyzer would produce:

```
line 3:12
  bool y = x + 5;
            ^
Semantic Error: type mismatch: expected bool, got int
```

### Error Detection Features

The semantic error formatter includes specialized handling for:
1. Function argument count mismatches
2. Return type mismatches
3. Array access on non-array types
4. Undefined symbols
5. Type compatibility errors
6. Invalid operator usage

## Error Reporting Flow

1. Source code is parsed by ANTLR with our custom `NewSyntaxErrorFormatter`
2. If syntax is valid, our semantic analyzer checks for semantic errors
3. All errors are formatted in a consistent style and reported to the user
4. Compilation stops if any errors are found at either stage

Source code repo: [https://github.com/GoBigC/BigC/tree/main/pkg/error_formatter](https://github.com/GoBigC/BigC/tree/main/pkg/error_formatter) 