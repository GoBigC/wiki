# Proof of Unambiguity

A grammar is considered unambiguous if it is LL(1) or LR(1), meaning the parser can determine the exact rule to apply next by examining only one token ahead in the input stream. In the same sense, the more tokens a parser needs to lookahead, the more ambiguous the grammar is. 

The proof of BigC's grammar unambiguity is therefore done by using ANTLR. ANTLR writes logs for each production rules it consume, and if the rule is unambiguous, it marks this rule to be `LL(1)? true`. When all rules/decisions in the grammar is marked like this, we say that the entire grammar is unambiguous. 

You can read the log [here](https://github.com/GoBigC/grammar/blob/main/antlr-2025-03-26-06.55.54.log) to verify that BigC has an unambiguous grammar: 

```
DECISION 0 in rule program
2025-03-26 11:30:50:073 LL1 LogManager.java:25 look=[{1..5}, <EOF>]
2025-03-26 11:30:50:073 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:073 LL1 LogManager.java:25 

DECISION 1 in rule declarationRemainder
2025-03-26 11:30:50:073 LL1 LogManager.java:25 look=[{1..5}, 7]
2025-03-26 11:30:50:073 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:073 LL1 LogManager.java:25 

DECISION 2 in rule declarationRemainder
2025-03-26 11:30:50:073 LL1 LogManager.java:25 look=[16, 8]
2025-03-26 11:30:50:073 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:073 LL1 LogManager.java:25 

DECISION 3 in rule declarationRemainder
2025-03-26 11:30:50:073 LL1 LogManager.java:25 look=[6, 34]
2025-03-26 11:30:50:073 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:073 LL1 LogManager.java:25 

DECISION 4 in rule parameterList
2025-03-26 11:30:50:073 LL1 LogManager.java:25 look=[9, 7]
2025-03-26 11:30:50:073 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:073 LL1 LogManager.java:25 

DECISION 5 in rule block
2025-03-26 11:30:50:073 LL1 LogManager.java:25 look=[{1..6, 12, 14..15, 30..31, 34..38}, 11]
2025-03-26 11:30:50:073 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:073 LL1 LogManager.java:25 

DECISION 6 in rule blockItem
2025-03-26 11:30:50:073 LL1 LogManager.java:25 look=[{1..5}, {6, 12, 14..15, 30..31, 34..38}]
2025-03-26 11:30:50:073 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:074 LL1 LogManager.java:25 

DECISION 7 in rule statement
2025-03-26 11:30:50:074 LL1 LogManager.java:25 look=[12, {6, 14..15, 30..31, 34..38}]
2025-03-26 11:30:50:074 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:074 LL1 LogManager.java:25 

DECISION 8 in rule ifStatement
2025-03-26 11:30:50:074 LL1 LogManager.java:25 look=[13, {1..6, 11..12, 14..15, 30..31, 34..38}]
2025-03-26 11:30:50:074 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:074 LL1 LogManager.java:25 

DECISION 9 in rule elseClause
2025-03-26 11:30:50:074 LL1 LogManager.java:25 look=[10, 12]
2025-03-26 11:30:50:074 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:074 LL1 LogManager.java:25 

DECISION 10 in rule nonIfStatement
2025-03-26 11:30:50:074 LL1 LogManager.java:25 look=[{6, 30..31, 34..38}, 14, 15]
2025-03-26 11:30:50:074 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:074 LL1 LogManager.java:25 

DECISION 11 in rule assignmentExpression
2025-03-26 11:30:50:074 LL1 LogManager.java:25 look=[16, {7..9, 33}]
2025-03-26 11:30:50:074 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:074 LL1 LogManager.java:25 

DECISION 12 in rule logicalOrExpression
2025-03-26 11:30:50:074 LL1 LogManager.java:25 look=[17, {7..9, 16, 33}]
2025-03-26 11:30:50:074 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:074 LL1 LogManager.java:25 

DECISION 13 in rule logicalAndExpression
2025-03-26 11:30:50:074 LL1 LogManager.java:25 look=[18, {7..9, 16..17, 33}]
2025-03-26 11:30:50:074 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:074 LL1 LogManager.java:25 

DECISION 14 in rule equalityExpression
2025-03-26 11:30:50:075 LL1 LogManager.java:25 look=[{19..20}, {7..9, 16..18, 33}]
2025-03-26 11:30:50:075 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:075 LL1 LogManager.java:25 

DECISION 15 in rule comparisonExpression
2025-03-26 11:30:50:075 LL1 LogManager.java:25 look=[{21..24}, {7..9, 16..20, 33}]
2025-03-26 11:30:50:075 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:075 LL1 LogManager.java:25 

DECISION 16 in rule additionExpression
2025-03-26 11:30:50:075 LL1 LogManager.java:25 look=[{25..26}, {7..9, 16..24, 33}]
2025-03-26 11:30:50:075 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:075 LL1 LogManager.java:25 

DECISION 17 in rule multiplicationExpression
2025-03-26 11:30:50:075 LL1 LogManager.java:25 look=[{27..29}, {7..9, 16..26, 33}]
2025-03-26 11:30:50:075 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:075 LL1 LogManager.java:25 

DECISION 18 in rule unaryExpression
2025-03-26 11:30:50:075 LL1 LogManager.java:25 look=[{6, 34..38}, {30..31}]
2025-03-26 11:30:50:075 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:075 LL1 LogManager.java:25 

DECISION 19 in rule postfixExpression
2025-03-26 11:30:50:075 LL1 LogManager.java:25 look=[32, 6, {30..31}, {7..9, 16..29, 33}]
2025-03-26 11:30:50:075 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:075 LL1 LogManager.java:25 

DECISION 20 in rule functionCallArgs
2025-03-26 11:30:50:075 LL1 LogManager.java:25 look=[{6, 30..31, 34..38}, 7]
2025-03-26 11:30:50:075 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:075 LL1 LogManager.java:25 

DECISION 21 in rule argList
2025-03-26 11:30:50:076 LL1 LogManager.java:25 look=[9, 7]
2025-03-26 11:30:50:076 LL1 LogManager.java:25 LL(1)? true
2025-03-26 11:30:50:076 LL1 LogManager.java:25

DECISION 22 in rule primaryExpression
2025-03-26 11:30:50:076 LL1 LogManager.java:25 look=[34, {35..38}, 6]
2025-03-26 11:30:50:076 LL1 LogManager.java:25 LL(1)? true
```