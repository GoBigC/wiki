# Proof of Unambiguity

A grammar is considered unambiguous if it is LL(1) or LR(1), meaning the parser can determine the exact rule to apply next by examining only one token ahead in the input stream. In the same sense, the more tokens a parser needs to lookahead, the more ambiguous the grammar is. 

The proof of BigC's grammar unambiguity is therefore done by using ANTLR. ANTLR writes logs for each production rules it consume, and if the rule is unambiguous, it marks this rule to be `LL(1)? true`. When all rules/decisions in the grammar is marked like this, we say that the entire grammar is unambiguous. 

You can read the log [here](https://github.com/GoBigC/grammar/blob/main/antlr-2025-03-26-06.55.54.log) to verify that BigC has an unambiguous grammar: 

```
DECISION 0 in rule program
2025-03-26 06:55:54:419 LL1 LogManager.java:25 look=[{4..8}, <EOF>]
2025-03-26 06:55:54:419 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:419 LL1 LogManager.java:25 

DECISION 1 in rule assignmentExpression
2025-03-26 06:55:54:419 LL1 LogManager.java:25 look=[2, {3, 10, 12, 15}]
2025-03-26 06:55:54:419 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:419 LL1 LogManager.java:25 

DECISION 2 in rule postfixExpression
2025-03-26 06:55:54:419 LL1 LogManager.java:25 look=[9, 11, {13..14}, {2..3, 10, 12, 15..28}]
2025-03-26 06:55:54:419 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:420 LL1 LogManager.java:25 

DECISION 3 in rule functionCallArgs
2025-03-26 06:55:54:420 LL1 LogManager.java:25 look=[{11, 13..14, 35..39}, 12]
2025-03-26 06:55:54:420 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:420 LL1 LogManager.java:25 

DECISION 4 in rule argList
2025-03-26 06:55:54:420 LL1 LogManager.java:25 look=[15, 12]
2025-03-26 06:55:54:420 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:420 LL1 LogManager.java:25 

DECISION 5 in rule primaryExpression
2025-03-26 06:55:54:420 LL1 LogManager.java:25 look=[35, {36..39}, 11]
2025-03-26 06:55:54:420 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:420 LL1 LogManager.java:25 

DECISION 6 in rule logicalOrExpression
2025-03-26 06:55:54:420 LL1 LogManager.java:25 look=[16, {2..3, 10, 12, 15}]
2025-03-26 06:55:54:420 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:420 LL1 LogManager.java:25 

DECISION 7 in rule logicalAndExpression
2025-03-26 06:55:54:420 LL1 LogManager.java:25 look=[17, {2..3, 10, 12, 15..16}]
2025-03-26 06:55:54:420 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:420 LL1 LogManager.java:25 

DECISION 8 in rule equalityExpression
2025-03-26 06:55:54:420 LL1 LogManager.java:25 look=[{18..19}, {2..3, 10, 12, 15..17}]
2025-03-26 06:55:54:420 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:420 LL1 LogManager.java:25 

DECISION 9 in rule comparisonExpression
2025-03-26 06:55:54:420 LL1 LogManager.java:25 look=[{20..23}, {2..3, 10, 12, 15..19}]
2025-03-26 06:55:54:420 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:420 LL1 LogManager.java:25 

DECISION 10 in rule additionExpression
2025-03-26 06:55:54:421 LL1 LogManager.java:25 look=[{24..25}, {2..3, 10, 12, 15..23}]
2025-03-26 06:55:54:421 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:421 LL1 LogManager.java:25 

DECISION 11 in rule multiplicationExpression
2025-03-26 06:55:54:421 LL1 LogManager.java:25 look=[{26..28}, {2..3, 10, 12, 15..25}]
2025-03-26 06:55:54:421 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:421 LL1 LogManager.java:25 

DECISION 12 in rule unaryExpression
2025-03-26 06:55:54:421 LL1 LogManager.java:25 look=[{11, 35..39}, {13..14}]
2025-03-26 06:55:54:421 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:421 LL1 LogManager.java:25 

DECISION 13 in rule statement
2025-03-26 06:55:54:421 LL1 LogManager.java:25 look=[29, {11, 13..14, 33..39}]
2025-03-26 06:55:54:421 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:421 LL1 LogManager.java:25 

DECISION 14 in rule ifStatement
2025-03-26 06:55:54:421 LL1 LogManager.java:25 look=[30, {4..8, 11, 13..14, 29, 32..39}]
2025-03-26 06:55:54:421 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:421 LL1 LogManager.java:25 

DECISION 15 in rule elseClause
2025-03-26 06:55:54:421 LL1 LogManager.java:25 look=[31, 29]
2025-03-26 06:55:54:421 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:421 LL1 LogManager.java:25 

DECISION 16 in rule declarationRemainder
2025-03-26 06:55:54:421 LL1 LogManager.java:25 look=[{4..8}, 12]
2025-03-26 06:55:54:421 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:421 LL1 LogManager.java:25 

DECISION 17 in rule declarationRemainder
2025-03-26 06:55:54:421 LL1 LogManager.java:25 look=[2, 3]
2025-03-26 06:55:54:421 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:421 LL1 LogManager.java:25 

DECISION 18 in rule declarationRemainder
2025-03-26 06:55:54:422 LL1 LogManager.java:25 look=[11, 35]
2025-03-26 06:55:54:422 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:422 LL1 LogManager.java:25 

DECISION 19 in rule parameterList
2025-03-26 06:55:54:422 LL1 LogManager.java:25 look=[15, 12]
2025-03-26 06:55:54:422 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:422 LL1 LogManager.java:25 

DECISION 20 in rule block
2025-03-26 06:55:54:422 LL1 LogManager.java:25 look=[{4..8, 11, 13..14, 29, 33..39}, 32]
2025-03-26 06:55:54:422 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:422 LL1 LogManager.java:25 

DECISION 21 in rule blockItem
2025-03-26 06:55:54:422 LL1 LogManager.java:25 look=[{4..8}, {11, 13..14, 29, 33..39}]
2025-03-26 06:55:54:422 LL1 LogManager.java:25 LL(1)? true
2025-03-26 06:55:54:422 LL1 LogManager.java:25 

DECISION 22 in rule nonIfStatement
2025-03-26 06:55:54:422 LL1 LogManager.java:25 look=[{11, 13..14, 35..39}, 33, 34]
2025-03-26 06:55:54:422 LL1 LogManager.java:25 LL(1)? true
```