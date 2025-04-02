# Abstract Syntax Tree 
See all artifacts [here](https://github.com/GoBigC/BigC/tree/main/artifact). The most important output of the syntax analyzer is the AST, which we have visualized for [this source](../1-grammar/sample.md) file here. Note that the program's start symbol is not `AST Tree` but actually `Program`:

```
AST Tree:
└── Program (Line 4, Col 0) with 13 declarations
    ├── VarDeclaration: globalInt of type int
    │   ├── Initializer:
    │   │   └── IntegerLiteral: 42
    ├── VarDeclaration: globalFloat of type float
    │   ├── Initializer:
    │   │   └── FloatLiteral: 3.141590
    ├── VarDeclaration: globalBool of type bool
    │   ├── Initializer:
    │   │   └── Identifier: true
    ├── VarDeclaration: globalChar of type char
    │   ├── Initializer:
    │   │   └── CharLiteral: 'A'
    ├── VarDeclaration: globalInt2 of type int
    │   ├── Initializer:
    │   │   └── UnaryExpression: '-'
    │   │       └── IntegerLiteral: 16
    ├── VarDeclaration: globalFloat2 of type float
    │   ├── Initializer:
    │   │   └── UnaryExpression: '-'
    │   │       └── FloatLiteral: 1.232100
    ├── VarDeclaration: globalArray of type array of int with size 10
    ├── Function: fillArray returns void with 2 parameters
    │   ├── Parameters:
    │   │   ├── arr of type array of int with size 43
    │   │   └── value of type int
    │   └── Body:
    │       └── Block with 2 items
    │           ├── VarDeclaration: i of type int
    │           │   ├── Initializer:
    │           │   │   └── IntegerLiteral: 0
    │           └── WhileStatement
    │               ├── Condition:
    │               │   └── BinaryExpression: '<'
    │               │       ├── Left:
    │               │       │   ├── Identifier: i
    │               │       └── Right:
    │               │           └── IntegerLiteral: 5
    │               └── Body:
    │                   └── Block with 2 items
    │                       ├── ExpressionStatement
    │                       │   └── BinaryExpression: '='
    │                       │       ├── Left:
    │                       │       │   ├── ArrayAccess
    │                       │       │   │   ├── Array:
    │                       │       │   │   │   ├── Identifier: arr
    │                       │       │   │   └── Index:
    │                       │       │   │       └── Identifier: i
    │                       │       └── Right:
    │                       │           └── Identifier: value
    │                       └── ExpressionStatement
    │                           └── BinaryExpression: '='
    │                               ├── Left:
    │                               │   ├── Identifier: i
    │                               └── Right:
    │                                   └── BinaryExpression: '+'
    │                                       ├── Left:
    │                                       │   ├── Identifier: i
    │                                       └── Right:
    │                                           └── IntegerLiteral: 1
    ├── Function: sumArray returns int with 1 parameters
    │   ├── Parameters:
    │   │   └── arr of type array of int with size 5
    │   └── Body:
    │       └── Block with 4 items
    │           ├── VarDeclaration: i of type int
    │           │   ├── Initializer:
    │           │   │   └── IntegerLiteral: 0
    │           ├── VarDeclaration: sum of type int
    │           │   ├── Initializer:
    │           │   │   └── IntegerLiteral: 0
    │           ├── WhileStatement
    │           │   ├── Condition:
    │           │   │   └── BinaryExpression: '<'
    │           │   │       ├── Left:
    │           │   │       │   ├── Identifier: i
    │           │   │       └── Right:
    │           │   │           └── IntegerLiteral: 5
    │           │   └── Body:
    │           │       └── Block with 2 items
    │           │           ├── ExpressionStatement
    │           │           │   └── BinaryExpression: '='
    │           │           │       ├── Left:
    │           │           │       │   ├── Identifier: sum
    │           │           │       └── Right:
    │           │           │           └── BinaryExpression: '+'
    │           │           │               ├── Left:
    │           │           │               │   ├── Identifier: sum
    │           │           │               └── Right:
    │           │           │                   └── ArrayAccess
    │           │           │                       ├── Array:
    │           │           │                       │   ├── Identifier: arr
    │           │           │                       └── Index:
    │           │           │                           └── Identifier: i
    │           │           └── ExpressionStatement
    │           │               └── BinaryExpression: '='
    │           │                   ├── Left:
    │           │                   │   ├── Identifier: i
    │           │                   └── Right:
    │           │                       └── BinaryExpression: '+'
    │           │                           ├── Left:
    │           │                           │   ├── Identifier: i
    │           │                           └── Right:
    │           │                               └── IntegerLiteral: 1
    │           └── ReturnStatement
    │               └── Identifier: sum
    ├── Function: max returns int with 2 parameters
    │   ├── Parameters:
    │   │   ├── a of type int
    │   │   └── b of type int
    │   └── Body:
    │       └── Block with 1 items
    │           └── IfStatement
    │               ├── Condition:
    │               │   └── BinaryExpression: '>'
    │               │       ├── Left:
    │               │       │   ├── Identifier: a
    │               │       └── Right:
    │               │           └── Identifier: b
    │               ├── ThenBlock:
    │               │   ├── Block with 1 items
    │               │   │   └── ReturnStatement
    │               │   │       └── Identifier: a
    │               └── ElseBlock:
    │                   └── Block with 1 items
    │                       └── ReturnStatement
    │                           └── Identifier: b
    ├── Function: calculate returns float with 3 parameters
    │   ├── Parameters:
    │   │   ├── x of type int
    │   │   ├── y of type float
    │   │   └── condition of type bool
    │   └── Body:
    │       └── Block with 3 items
    │           ├── VarDeclaration: result of type float
    │           │   ├── Initializer:
    │           │   │   └── FloatLiteral: 0.000000
    │           ├── IfStatement
    │           │   ├── Condition:
    │           │   │   └── Identifier: condition
    │           │   ├── ThenBlock:
    │           │   │   ├── Block with 1 items
    │           │   │   │   └── ExpressionStatement
    │           │   │   │       └── BinaryExpression: '='
    │           │   │   │           ├── Left:
    │           │   │   │           │   ├── Identifier: result
    │           │   │   │           └── Right:
    │           │   │   │               └── BinaryExpression: '+'
    │           │   │   │                   ├── Left:
    │           │   │   │                   │   ├── Identifier: x
    │           │   │   │                   └── Right:
    │           │   │   │                       └── Identifier: y
    │           │   └── ElseBlock:
    │           │       └── Block with 1 items
    │           │           └── ExpressionStatement
    │           │               └── BinaryExpression: '='
    │           │                   ├── Left:
    │           │                   │   ├── Identifier: result
    │           │                   └── Right:
    │           │                       └── BinaryExpression: '-'
    │           │                           ├── Left:
    │           │                           │   ├── Identifier: x
    │           │                           └── Right:
    │           │                               └── Identifier: y
    │           └── ReturnStatement
    │               └── Identifier: result
    ├── Function: factorial returns int with 1 parameters
    │   ├── Parameters:
    │   │   └── n of type int
    │   └── Body:
    │       └── Block with 1 items
    │           └── IfStatement
    │               ├── Condition:
    │               │   └── BinaryExpression: '<='
    │               │       ├── Left:
    │               │       │   ├── Identifier: n
    │               │       └── Right:
    │               │           └── IntegerLiteral: 1
    │               ├── ThenBlock:
    │               │   ├── Block with 1 items
    │               │   │   └── ReturnStatement
    │               │   │       └── IntegerLiteral: 1
    │               └── ElseBlock:
    │                   └── Block with 1 items
    │                       └── ReturnStatement
    │                           └── BinaryExpression: '*'
    │                               ├── Left:
    │                               │   ├── Identifier: n
    │                               └── Right:
    │                                   └── FunctionCall with 1 arguments
    │                                       ├── Function:
    │                                       │   ├── Identifier: factorial
    │                                       └── Arguments:
    │                                           └── BinaryExpression: '-'
    │                                               ├── Left:
    │                                               │   ├── Identifier: n
    │                                               └── Right:
    │                                                   └── IntegerLiteral: 1
    └── Function: main returns int with 0 parameters
        └── Body:
            └── Block with 43 items
                ├── VarDeclaration: a of type int
                │   ├── Initializer:
                │   │   └── IntegerLiteral: 10
                ├── VarDeclaration: b of type int
                │   ├── Initializer:
                │   │   └── IntegerLiteral: 20
                ├── VarDeclaration: f of type float
                │   ├── Initializer:
                │   │   └── FloatLiteral: 1.500000
                ├── VarDeclaration: flag of type bool
                │   ├── Initializer:
                │   │   └── Identifier: false
                ├── VarDeclaration: c of type char
                │   ├── Initializer:
                │   │   └── CharLiteral: 'X'
                ├── VarDeclaration: numbers of type array of int with size 5
                ├── ExpressionStatement
                │   └── BinaryExpression: '='
                │       ├── Left:
                │       │   ├── ArrayAccess
                │       │   │   ├── Array:
                │       │   │   │   ├── Identifier: numbers
                │       │   │   └── Index:
                │       │   │       └── IntegerLiteral: 0
                │       └── Right:
                │           └── IntegerLiteral: 10
                ├── ExpressionStatement
                │   └── BinaryExpression: '='
                │       ├── Left:
                │       │   ├── ArrayAccess
                │       │   │   ├── Array:
                │       │   │   │   ├── Identifier: numbers
                │       │   │   └── Index:
                │       │   │       └── IntegerLiteral: 1
                │       └── Right:
                │           └── IntegerLiteral: 20
                ├── ExpressionStatement
                │   └── BinaryExpression: '='
                │       ├── Left:
                │       │   ├── ArrayAccess
                │       │   │   ├── Array:
                │       │   │   │   ├── Identifier: numbers
                │       │   │   └── Index:
                │       │   │       └── IntegerLiteral: 2
                │       └── Right:
                │           └── IntegerLiteral: 30
                ├── ExpressionStatement
                │   └── BinaryExpression: '='
                │       ├── Left:
                │       │   ├── ArrayAccess
                │       │   │   ├── Array:
                │       │   │   │   ├── Identifier: numbers
                │       │   │   └── Index:
                │       │   │       └── IntegerLiteral: 3
                │       └── Right:
                │           └── IntegerLiteral: 40
                ├── ExpressionStatement
                │   └── BinaryExpression: '='
                │       ├── Left:
                │       │   ├── ArrayAccess
                │       │   │   ├── Array:
                │       │   │   │   ├── Identifier: numbers
                │       │   │   └── Index:
                │       │   │       └── IntegerLiteral: 4
                │       └── Right:
                │           └── IntegerLiteral: 50
                ├── VarDeclaration: arraySum of type int
                │   ├── Initializer:
                │   │   └── BinaryExpression: '+'
                │   │       ├── Left:
                │   │       │   ├── ArrayAccess
                │   │       │   │   ├── Array:
                │   │       │   │   │   ├── Identifier: numbers
                │   │       │   │   └── Index:
                │   │       │   │       └── IntegerLiteral: 0
                │   │       └── Right:
                │   │           └── ArrayAccess
                │   │               ├── Array:
                │   │               │   ├── Identifier: numbers
                │   │               └── Index:
                │   │                   └── IntegerLiteral: 1
                ├── VarDeclaration: index of type int
                │   ├── Initializer:
                │   │   └── IntegerLiteral: 2
                ├── VarDeclaration: valueAtIndex of type int
                │   ├── Initializer:
                │   │   └── ArrayAccess
                │   │       ├── Array:
                │   │       │   ├── Identifier: numbers
                │   │       └── Index:
                │   │           └── Identifier: index
                ├── VarDeclaration: valueAtExpr of type int
                │   ├── Initializer:
                │   │   └── ArrayAccess
                │   │       ├── Array:
                │   │       │   ├── Identifier: numbers
                │   │       └── Index:
                │   │           └── BinaryExpression: '+'
                │   │               ├── Left:
                │   │               │   ├── Identifier: index
                │   │               └── Right:
                │   │                   └── IntegerLiteral: 1
                ├── VarDeclaration: complexArrayExpr of type int
                │   ├── Initializer:
                │   │   └── ArrayAccess
                │   │       ├── Array:
                │   │       │   ├── Identifier: numbers
                │   │       └── Index:
                │   │           └── BinaryExpression: '/'
                │   │               ├── Left:
                │   │               │   ├── ArrayAccess
                │   │               │   │   ├── Array:
                │   │               │   │   │   ├── Identifier: numbers
                │   │               │   │   └── Index:
                │   │               │   │       └── IntegerLiteral: 0
                │   │               └── Right:
                │   │                   └── IntegerLiteral: 10
                ├── ExpressionStatement
                │   └── FunctionCall with 2 arguments
                │       ├── Function:
                │       │   ├── Identifier: fillArray
                │       └── Arguments:
                │           ├── Identifier: numbers
                │           └── IntegerLiteral: 5
                ├── VarDeclaration: totalSum of type int
                │   ├── Initializer:
                │   │   └── FunctionCall with 1 arguments
                │   │       ├── Function:
                │   │       │   ├── Identifier: sumArray
                │   │       └── Arguments:
                │   │           └── Identifier: numbers
                ├── VarDeclaration: sum of type int
                │   ├── Initializer:
                │   │   └── BinaryExpression: '+'
                │   │       ├── Left:
                │   │       │   ├── Identifier: a
                │   │       └── Right:
                │   │           └── Identifier: b
                ├── VarDeclaration: diff of type int
                │   ├── Initializer:
                │   │   └── BinaryExpression: '-'
                │   │       ├── Left:
                │   │       │   ├── Identifier: b
                │   │       └── Right:
                │   │           └── Identifier: a
                ├── VarDeclaration: product of type int
                │   ├── Initializer:
                │   │   └── BinaryExpression: '*'
                │   │       ├── Left:
                │   │       │   ├── Identifier: a
                │   │       └── Right:
                │   │           └── Identifier: b
                ├── VarDeclaration: quotient of type int
                │   ├── Initializer:
                │   │   └── BinaryExpression: '/'
                │   │       ├── Left:
                │   │       │   ├── Identifier: b
                │   │       └── Right:
                │   │           └── Identifier: a
                ├── VarDeclaration: complexExpr of type float
                │   ├── Initializer:
                │   │   └── BinaryExpression: '*'
                │   │       ├── Left:
                │   │       │   ├── BinaryExpression: '+'
                │   │       │   │   ├── Left:
                │   │       │   │   │   ├── Identifier: a
                │   │       │   │   └── Right:
                │   │       │   │       └── Identifier: b
                │   │       └── Right:
                │   │           └── BinaryExpression: '/'
                │   │               ├── Left:
                │   │               │   ├── Identifier: f
                │   │               └── Right:
                │   │                   └── BinaryExpression: '-'
                │   │                       ├── Left:
                │   │                       │   ├── Identifier: b
                │   │                       └── Right:
                │   │                           └── Identifier: a
                ├── VarDeclaration: test1 of type bool
                │   ├── Initializer:
                │   │   └── BinaryExpression: '<'
                │   │       ├── Left:
                │   │       │   ├── Identifier: a
                │   │       └── Right:
                │   │           └── Identifier: b
                ├── VarDeclaration: test2 of type bool
                │   ├── Initializer:
                │   │   └── BinaryExpression: '>'
                │   │       ├── Left:
                │   │       │   ├── Identifier: a
                │   │       └── Right:
                │   │           └── Identifier: b
                ├── VarDeclaration: test3 of type bool
                │   ├── Initializer:
                │   │   └── BinaryExpression: '<='
                │   │       ├── Left:
                │   │       │   ├── Identifier: a
                │   │       └── Right:
                │   │           └── Identifier: b
                ├── VarDeclaration: test4 of type bool
                │   ├── Initializer:
                │   │   └── BinaryExpression: '>='
                │   │       ├── Left:
                │   │       │   ├── Identifier: a
                │   │       └── Right:
                │   │           └── Identifier: b
                ├── VarDeclaration: equal of type bool
                │   ├── Initializer:
                │   │   └── BinaryExpression: '=='
                │   │       ├── Left:
                │   │       │   ├── Identifier: a
                │   │       └── Right:
                │   │           └── Identifier: b
                ├── VarDeclaration: notEqual of type bool
                │   ├── Initializer:
                │   │   └── BinaryExpression: '!='
                │   │       ├── Left:
                │   │       │   ├── Identifier: a
                │   │       └── Right:
                │   │           └── Identifier: b
                ├── VarDeclaration: logicalExpr1 of type bool
                │   ├── Initializer:
                │   │   └── BinaryExpression: '&&'
                │   │       ├── Left:
                │   │       │   ├── BinaryExpression: '<'
                │   │       │   │   ├── Left:
                │   │       │   │   │   ├── Identifier: a
                │   │       │   │   └── Right:
                │   │       │   │       └── Identifier: b
                │   │       └── Right:
                │   │           └── BinaryExpression: '>'
                │   │               ├── Left:
                │   │               │   ├── Identifier: f
                │   │               └── Right:
                │   │                   └── FloatLiteral: 1.000000
                ├── VarDeclaration: logicalExpr2 of type bool
                │   ├── Initializer:
                │   │   └── BinaryExpression: '||'
                │   │       ├── Left:
                │   │       │   ├── BinaryExpression: '>'
                │   │       │   │   ├── Left:
                │   │       │   │   │   ├── Identifier: a
                │   │       │   │   └── Right:
                │   │       │   │       └── Identifier: b
                │   │       └── Right:
                │   │           └── BinaryExpression: '<'
                │   │               ├── Left:
                │   │               │   ├── Identifier: f
                │   │               └── Right:
                │   │                   └── FloatLiteral: 2.000000
                ├── VarDeclaration: logicalExpr3 of type bool
                │   ├── Initializer:
                │   │   └── BinaryExpression: '&&'
                │   │       ├── Left:
                │   │       │   ├── UnaryExpression: '!'
                │   │       │   │   └── BinaryExpression: '=='
                │   │       │   │       ├── Left:
                │   │       │   │       │   ├── Identifier: a
                │   │       │   │       └── Right:
                │   │       │   │           └── Identifier: b
                │   │       └── Right:
                │   │           └── BinaryExpression: '||'
                │   │               ├── Left:
                │   │               │   ├── BinaryExpression: '>='
                │   │               │   │   ├── Left:
                │   │               │   │   │   ├── Identifier: f
                │   │               │   │   └── Right:
                │   │               │   │       └── FloatLiteral: 1.000000
                │   │               └── Right:
                │   │                   └── BinaryExpression: '<='
                │   │                       ├── Left:
                │   │                       │   ├── Identifier: b
                │   │                       └── Right:
                │   │                           └── IntegerLiteral: 20
                ├── VarDeclaration: assignTest of type bool
                │   ├── Initializer:
                │   │   └── BinaryExpression: '='
                │   │       ├── Left:
                │   │       │   ├── Identifier: flag
                │   │       └── Right:
                │   │           └── Identifier: true
                ├── VarDeclaration: maxValue of type int
                │   ├── Initializer:
                │   │   └── FunctionCall with 2 arguments
                │   │       ├── Function:
                │   │       │   ├── Identifier: max
                │   │       └── Arguments:
                │   │           ├── Identifier: a
                │   │           └── Identifier: b
                ├── VarDeclaration: calcResult of type float
                │   ├── Initializer:
                │   │   └── FunctionCall with 3 arguments
                │   │       ├── Function:
                │   │       │   ├── Identifier: calculate
                │   │       └── Arguments:
                │   │           ├── Identifier: a
                │   │           ├── Identifier: f
                │   │           └── Identifier: flag
                ├── VarDeclaration: fact5 of type int
                │   ├── Initializer:
                │   │   └── FunctionCall with 1 arguments
                │   │       ├── Function:
                │   │       │   ├── Identifier: factorial
                │   │       └── Arguments:
                │   │           └── IntegerLiteral: 5
                ├── VarDeclaration: exprWithCall of type int
                │   ├── Initializer:
                │   │   └── BinaryExpression: '+'
                │   │       ├── Left:
                │   │       │   ├── Identifier: a
                │   │       └── Right:
                │   │           └── FunctionCall with 1 arguments
                │   │               ├── Function:
                │   │               │   ├── Identifier: factorial
                │   │               └── Arguments:
                │   │                   └── IntegerLiteral: 3
                ├── VarDeclaration: nestedCall of type int
                │   ├── Initializer:
                │   │   └── FunctionCall with 2 arguments
                │   │       ├── Function:
                │   │       │   ├── Identifier: max
                │   │       └── Arguments:
                │   │           ├── FunctionCall with 1 arguments
                │   │           │   ├── Function:
                │   │           │   │   ├── Identifier: factorial
                │   │           │   └── Arguments:
                │   │           │       └── IntegerLiteral: 2
                │   │           └── FunctionCall with 1 arguments
                │   │               ├── Function:
                │   │               │   ├── Identifier: factorial
                │   │               └── Arguments:
                │   │                   └── IntegerLiteral: 3
                ├── VarDeclaration: maxArrayValue of type int
                │   ├── Initializer:
                │   │   └── FunctionCall with 2 arguments
                │   │       ├── Function:
                │   │       │   ├── Identifier: max
                │   │       └── Arguments:
                │   │           ├── ArrayAccess
                │   │           │   ├── Array:
                │   │           │   │   ├── Identifier: numbers
                │   │           │   └── Index:
                │   │           │       └── IntegerLiteral: 1
                │   │           └── ArrayAccess
                │   │               ├── Array:
                │   │               │   ├── Identifier: numbers
                │   │               └── Index:
                │   │                   └── IntegerLiteral: 3
                ├── IfStatement
                │   ├── Condition:
                │   │   └── BinaryExpression: '>'
                │   │       ├── Left:
                │   │       │   ├── ArrayAccess
                │   │       │   │   ├── Array:
                │   │       │   │   │   ├── Identifier: numbers
                │   │       │   │   └── Index:
                │   │       │   │       └── IntegerLiteral: 0
                │   │       └── Right:
                │   │           └── ArrayAccess
                │   │               ├── Array:
                │   │               │   ├── Identifier: numbers
                │   │               └── Index:
                │   │                   └── IntegerLiteral: 1
                │   ├── ThenBlock:
                │   │   ├── Block with 1 items
                │   │   │   └── ExpressionStatement
                │   │   │       └── BinaryExpression: '='
                │   │   │           ├── Left:
                │   │   │           │   ├── ArrayAccess
                │   │   │           │   │   ├── Array:
                │   │   │           │   │   │   ├── Identifier: numbers
                │   │   │           │   │   └── Index:
                │   │   │           │   │       └── IntegerLiteral: 2
                │   │   │           └── Right:
                │   │   │               └── ArrayAccess
                │   │   │                   ├── Array:
                │   │   │                   │   ├── Identifier: numbers
                │   │   │                   └── Index:
                │   │   │                       └── IntegerLiteral: 0
                │   └── ElseBlock:
                │       └── Block with 1 items
                │           └── ExpressionStatement
                │               └── BinaryExpression: '='
                │                   ├── Left:
                │                   │   ├── ArrayAccess
                │                   │   │   ├── Array:
                │                   │   │   │   ├── Identifier: numbers
                │                   │   │   └── Index:
                │                   │   │       └── IntegerLiteral: 2
                │                   └── Right:
                │                       └── ArrayAccess
                │                           ├── Array:
                │                           │   ├── Identifier: numbers
                │                           └── Index:
                │                               └── IntegerLiteral: 1
                ├── VarDeclaration: j of type int
                │   ├── Initializer:
                │   │   └── IntegerLiteral: 0
                ├── WhileStatement
                │   ├── Condition:
                │   │   └── BinaryExpression: '&&'
                │   │       ├── Left:
                │   │       │   ├── BinaryExpression: '<'
                │   │       │   │   ├── Left:
                │   │       │   │   │   ├── Identifier: j
                │   │       │   │   └── Right:
                │   │       │   │       └── IntegerLiteral: 5
                │   │       └── Right:
                │   │           └── BinaryExpression: '<'
                │   │               ├── Left:
                │   │               │   ├── ArrayAccess
                │   │               │   │   ├── Array:
                │   │               │   │   │   ├── Identifier: numbers
                │   │               │   │   └── Index:
                │   │               │   │       └── Identifier: j
                │   │               └── Right:
                │   │                   └── IntegerLiteral: 100
                │   └── Body:
                │       └── Block with 2 items
                │           ├── ExpressionStatement
                │           │   └── BinaryExpression: '='
                │           │       ├── Left:
                │           │       │   ├── ArrayAccess
                │           │       │   │   ├── Array:
                │           │       │   │   │   ├── Identifier: numbers
                │           │       │   │   └── Index:
                │           │       │   │       └── Identifier: j
                │           │       └── Right:
                │           │           └── BinaryExpression: '*'
                │           │               ├── Left:
                │           │               │   ├── ArrayAccess
                │           │               │   │   ├── Array:
                │           │               │   │   │   ├── Identifier: numbers
                │           │               │   │   └── Index:
                │           │               │   │       └── Identifier: j
                │           │               └── Right:
                │           │                   └── IntegerLiteral: 2
                │           └── ExpressionStatement
                │               └── BinaryExpression: '='
                │                   ├── Left:
                │                   │   ├── Identifier: j
                │                   └── Right:
                │                       └── BinaryExpression: '+'
                │                           ├── Left:
                │                           │   ├── Identifier: j
                │                           └── Right:
                │                               └── IntegerLiteral: 1
                └── ReturnStatement
                    └── BinaryExpression: '+'
                        ├── Left:
                        │   ├── ArrayAccess
                        │   │   ├── Array:
                        │   │   │   ├── Identifier: numbers
                        │   │   └── Index:
                        │   │       └── IntegerLiteral: 4
                        └── Right:
                            └── FunctionCall with 1 arguments
                                ├── Function:
                                │   ├── Identifier: factorial
                                └── Arguments:
                                    └── BinaryExpression: '/'
                                        ├── Left:
                                        │   ├── ArrayAccess
                                        │   │   ├── Array:
                                        │   │   │   ├── Identifier: numbers
                                        │   │   └── Index:
                                        │   │       └── IntegerLiteral: 0
                                        └── Right:
                                            └── IntegerLiteral: 10
```

