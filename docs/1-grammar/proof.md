# Proof of Unambiguity

A grammar is considered unambiguous if it is LL(1) or LR(1), meaning the parser can determine the exact rule to apply next by examining only one token ahead in the input stream. In the same sense, the more tokens a parser needs to lookahead, the more ambiguous the grammar is. 

The proof of BigC's grammar unambiguity is therefore done by using ANTLR. ANTLR writes logs for each production rules it consume, and if the rule is unambiguous, it marks this rule to be `LL(1)? true`. When all rules/decisions in the grammar is marked like this, we say that the entire grammar is unambiguous. 

You can read the log [here](https://github.com/GoBigC/grammar/blob/main/antlr-2025-04-02-09.51.45.log) to verify that BigC has an unambiguous grammar: 

```
DECISION 0 in rule program
2025-04-02 09:51:44:646 LL1 LogManager.java:25 look=[{3..7}, <EOF>]
2025-04-02 09:51:44:646 LL1 LogManager.java:25 LL(1)? true

DECISION 1 in rule declaration
2025-04-02 09:51:44:646 LL1 LogManager.java:25 look=[1, {8, 10, 18}]
2025-04-02 09:51:44:646 LL1 LogManager.java:25 LL(1)? true

DECISION 2 in rule declarationRemainder
2025-04-02 09:51:44:646 LL1 LogManager.java:25 look=[{3..7}, 9]
2025-04-02 09:51:44:646 LL1 LogManager.java:25 LL(1)? true

DECISION 3 in rule declarationRemainder
2025-04-02 09:51:44:646 LL1 LogManager.java:25 look=[18, 10]
2025-04-02 09:51:44:646 LL1 LogManager.java:25 LL(1)? true

DECISION 4 in rule declarationRemainder
2025-04-02 09:51:44:646 LL1 LogManager.java:25 look=[8, {10, 18}]
2025-04-02 09:51:44:646 LL1 LogManager.java:25 LL(1)? true

DECISION 5 in rule parameterList
2025-04-02 09:51:44:646 LL1 LogManager.java:25 look=[11, 9]
2025-04-02 09:51:44:646 LL1 LogManager.java:25 LL(1)? true

DECISION 6 in rule parameter
2025-04-02 09:51:44:646 LL1 LogManager.java:25 look=[1, {9, 11}]
2025-04-02 09:51:44:646 LL1 LogManager.java:25 LL(1)? true

DECISION 7 in rule block
2025-04-02 09:51:44:647 LL1 LogManager.java:25 look=[{3..8, 14, 16..17, 28, 31..36}, 13]
2025-04-02 09:51:44:647 LL1 LogManager.java:25 LL(1)? true

DECISION 8 in rule blockItem
2025-04-02 09:51:44:647 LL1 LogManager.java:25 look=[{3..7}, {8, 14, 16..17, 28, 31..36}]
2025-04-02 09:51:44:647 LL1 LogManager.java:25 LL(1)? true

DECISION 9 in rule statement
2025-04-02 09:51:44:647 LL1 LogManager.java:25 look=[14, {8, 16..17, 28, 31..36}]
2025-04-02 09:51:44:647 LL1 LogManager.java:25 LL(1)? true

DECISION 10 in rule ifStatement
2025-04-02 09:51:44:648 LL1 LogManager.java:25 look=[15, {3..8, 13..14, 16..17, 28, 31..36}]
2025-04-02 09:51:44:648 LL1 LogManager.java:25 LL(1)? true

DECISION 11 in rule elseClause
2025-04-02 09:51:44:648 LL1 LogManager.java:25 look=[12, 14]
2025-04-02 09:51:44:648 LL1 LogManager.java:25 LL(1)? true

DECISION 12 in rule nonIfStatement
2025-04-02 09:51:44:648 LL1 LogManager.java:25 look=[{8, 28, 31..36}, 16, 17]
2025-04-02 09:51:44:648 LL1 LogManager.java:25 LL(1)? true

DECISION 13 in rule assignmentExpression
2025-04-02 09:51:44:648 LL1 LogManager.java:25 look=[18, {2, 9..11}]
2025-04-02 09:51:44:648 LL1 LogManager.java:25 LL(1)? true

DECISION 14 in rule logicalOrExpression
2025-04-02 09:51:44:648 LL1 LogManager.java:25 look=[19, {2, 9..11, 18}]
2025-04-02 09:51:44:648 LL1 LogManager.java:25 LL(1)? true

DECISION 15 in rule logicalAndExpression
2025-04-02 09:51:44:648 LL1 LogManager.java:25 look=[20, {2, 9..11, 18..19}]
2025-04-02 09:51:44:648 LL1 LogManager.java:25 LL(1)? true

DECISION 16 in rule equalityExpression
2025-04-02 09:51:44:648 LL1 LogManager.java:25 look=[{21..22}, {2, 9..11, 18..20}]
2025-04-02 09:51:44:649 LL1 LogManager.java:25 LL(1)? true

DECISION 17 in rule comparisonExpression
2025-04-02 09:51:44:649 LL1 LogManager.java:25 look=[{23..26}, {2, 9..11, 18..22}]
2025-04-02 09:51:44:649 LL1 LogManager.java:25 LL(1)? true

DECISION 18 in rule additionExpression
2025-04-02 09:51:44:649 LL1 LogManager.java:25 look=[{27..28}, {2, 9..11, 18..26}]
2025-04-02 09:51:44:649 LL1 LogManager.java:25 LL(1)? true

DECISION 19 in rule multiplicationExpression
2025-04-02 09:51:44:649 LL1 LogManager.java:25 look=[{29..30}, {2, 9..11, 18..28}]
2025-04-02 09:51:44:650 LL1 LogManager.java:25 LL(1)? true

DECISION 20 in rule unaryExpression
2025-04-02 09:51:44:650 LL1 LogManager.java:25 look=[{8, 32..36}, {28, 31}]
2025-04-02 09:51:44:650 LL1 LogManager.java:25 LL(1)? true

DECISION 21 in rule postfixExpression
2025-04-02 09:51:44:650 LL1 LogManager.java:25 look=[1, 8, {2, 9..11, 18..30}]
2025-04-02 09:51:44:650 LL1 LogManager.java:25 LL(1)? true

DECISION 22 in rule functionCallArgs
2025-04-02 09:51:44:650 LL1 LogManager.java:25 look=[{8, 28, 31..36}, 9]
2025-04-02 09:51:44:650 LL1 LogManager.java:25 LL(1)? true

DECISION 23 in rule argList
2025-04-02 09:51:44:650 LL1 LogManager.java:25 look=[11, 9]
2025-04-02 09:51:44:650 LL1 LogManager.java:25 LL(1)? true

DECISION 24 in rule primaryExpression
2025-04-02 09:51:44:651 LL1 LogManager.java:25 look=[32, {33..36}, 8]
2025-04-02 09:51:44:651 LL1 LogManager.java:25 LL(1)? true
```