# BigC Full Grammar

This wiki page consolidates all grammar rules into one place for easy lookup, but in reality we split the grammar into multiple files for better focus and maintenance. [Go to code repository](https://github.com/GoBigC/grammar/tree/main).

## Parser Rules 
program
    : declaration* EOF
    ;

declaration
    : type Identifier declarationRemainder
    ;

type
    : 'int'
    | 'float'
    | 'bool'
    | 'char'
    | 'void' 
    ;

declarationRemainder 
    : '(' parameterList? ')' block 
    | Identifier variableInitializer? ';'
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
    : 'if' '(' expression ')' block elseClause?
    ;

elseClause
    : 'else' (block | ifStatement)
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
    : logicalOrExpression assignmentRest?
    ;

assignmentRest
    : '=' assignmentExpression
    ;

variableInitializer
    : '=' expression ';'
    ;

logicalOrExpression
    : logicalAndExpression logicalOrRest*
    ;

logicalOrRest
    : '||' logicalAndExpression
    ;

logicalAndExpression
    : equalityExpression logicalAndRest*
    ;

logicalAndRest
    : '&&' equalityExpression
    ;

equalityExpression
    : comparisonExpression equalityRest*
    ;

equalityRest
    : equalityOperator comparisonExpression
    ;

equalityOperator 
    : '=='
    | '!='
    ;

comparisonExpression 
    : additionExpression comparisonRest*
    ;

comparisonRest
    : comparisonOperator additionExpression
    ;

comparisonOperator
    : '>'
    | '<'
    | '>='
    | '<='
    ;

additionExpression
    : multiplicationExpression additionExpressionRest*
    ;

additionExpressionRest
    : addSubtractOperator multiplicationExpression
    ;

addSubtractOperator 
    : '+'
    | '-'
    ;

multiplicationExpression
    : unaryExpression multiplicationExpressionRest*
    ;

multiplicationExpressionRest
    : multDivModOperator unaryExpression
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
    : primaryExpression (arrayAccess | functionCallArgs | increaseDecrease)?
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
Identifier: [a-zA-Z_][a-zA-Z0-9_]*;

IntegerConstant: [0-9]+;
FloatingConstant: [0-9]+ '.' [0-9]+;
BooleanConstant: 'true' | 'false';
CharConstant: '\'' . '\'';

WS: [ \t\r\n]+ -> skip;
COMMENT: '//' ~[\r\n]* -> skip;
MULTILINE_COMMENT: '/*' .*? '*/' -> skip;