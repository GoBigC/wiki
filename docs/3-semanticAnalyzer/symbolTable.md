# Structure of The Symbol Table

| Name                  | Type                                | Scope                                      | Array Size                          | Value                                              | Parameters                                    | Return Type |
| --------------------- | ----------------------------------- | ------------------------------------------ | ----------------------------------- | -------------------------------------------------- | --------------------------------------------- | ----------- |
| Identifier for symbol | Type of symbol (int, function, ...) | Size of array, null if symbol is not array | Value of the symbol, if initialized | The list of parameters if the symbol is a function | Return type of the symbol if it is a function |

# List of Caught Semantic Errors

1. Index out of bound
2. Divide by zero
3. Type mismatch:

- Assignment type mismatch
- Function return type mismatch
- Operator type mismatch
- Function argument type mismatch

4. Invalid function

- Argument count mismatch

5. Undefined symbol
6. Variable out of scope
