# BigC Full Grammar

This wiki page consolidates all grammar rules into one place for easy lookup, but in reality we split the grammar into multiple files for better focus and maintenance. [Go to code repository](https://github.com/GoBigC/grammar/tree/main).

## Parser Rules 

program
    : declaration* EOF 
    ; 

declaration
    : constDeclaration
    | type Identifier declarationRemainder 
    ; 

type
    : 'int'
    | 'float'
    | 'bool'
    | 'char'
    | 'void' 
    ; 

constDeclaration
    : 'const' type Identifier '=' expression ';'
    ;

declarationRemainder 
    : '(' parameterList? ')' block 
    | Identifier variableInitializer? ';'
    ; 

variableInitializer
    : '=' expression ';'
    ;

parameterList
    : parameter (',' parameter)*
    ; 

parameter
    : type Identifier
    ;

block 
    : '{' blockItem* '}'
    ; 

blockItem
    : declaration
    | statement
    ; 

statement
    : ifStatement
    | nonIfStatement
    ; 

ifStatement
    : 'if' '(' expression ')' block elseBlock?
    ;

elseBlock
    : 'else' elseBlockRemainder 
    ; 

elseBlockRemainder 
    : block 
    | ifStatement 
    ; 

nonIfStatement 
    : expression ';'
    | whileStatement
    | returnStatement
    ;

whileStatement
    : 'while' '(' expression ')' block 
    ; 

returnStatement 
    : 'return' expression ';'
    ; 

expression 
    : assignmentExpression 
    ; 

assignmentExpression
    : logicalOrExpression ('=' assignmentExpression)?
    ; 

logicalOrExpression
    : logicalAndExpression ('||' logicalAndExpression)*
    ; 

logicalAndExpression
    : equalityExpression ('&&' equalityExpression)*
    ; 

equalityExpression
    : comparisonExpression (equalityOperator comparisonExpression)*
    ; 

equalityOperator 
    : '=='
    | '!='
    ; 

comparisonExpression 
    : additionExpression (comparisonOperator additionExpression)* 
    ; 

comparisonOperator
    : '>'
    | '<'
    | '>='
    | '<='
    ; 

additionExpression
    : multiplicationExpression (addSubtractOperator multiplicationExpression)*
    ; 

addSubtractOperator 
    : '+'
    | '-'
    ; 

multiplicationExpression
    : unaryExpression (multDivModOperator unaryExpression)*
    ; 

multDivModOperator
    : '*'
    | '/'
    | '%'
    ; 

unaryExpression 
    : postfixExpression 
    | unaryOperator unaryExpression 
    ; 

unaryOperator
    : '++' // prefix
    | '--' // prefix
    ;

postfixExpression 
    : primaryExpression (arrayAccess | functionCallArgs | increaseDecrease)*
    ; 

arrayAccess 
    : '[' expression ']'
    ; 


functionCallArgs
    : '(' argList? ')'
    ; 

increaseDecrease
    : '++'  // postfix
    | '--'  // postfix 
    ; 

argList 
    : assignmentExpression (',' assignmentExpression)*
    ; 

primaryExpression 
    : Identifier 
    | constant 
    | '(' expression ')'
    ; 

constant
    : IntegerConstant 
    | FloatingConstant 
    | BooleanConstant 
    | CharConstant 
    ; 

## Lexer Rules

Identifier
    : [a-zA-Z_][a-zA-Z0-9]*
    ; 

IntegerConstant
    : [0-9]+
    ;

FloatingConstant
    : [0-9]+ '.' [0-9]+
    ; 

CharConstant
    : '\'' ~[\r\n]'\'' // anything but CR, LF
    ;

BooleanConstant 
    : 'true'
    | 'false'
    ; 

WS
    : [ \t\r\n]+ -> skip
    ; 

COMMENT
    : '//' ~[\r\n]* -> skip
    ; 

DOCSTRING
    : '/*' .*? '*/' -> skip 
    ; 

