# Notes during Syntax Analyzer build
Copied from BigCooker [parser README.md](https://github.com/GoBigC/BigC/blob/main/syntax/parser/README.md) and [AST README.md](https://github.com/GoBigC/BigC/blob/main/syntax/ast/README.md). 

## How to write AST node structs from grammar file 
1. Read the grammar (`BigC.g4`), determine which nodes are necessary to build the AST 
- Not all symbols in the grammar file qualify to be an AST node (in which case we'd have a concrete syntax tree like `artifact/cst.txt`)
- AST node types include those that are important to the program struture: statement, expression, type, block, terminals, etc. 
- AST node types do not include: operation precedence, delimiters like ';', precedence grouping symbols like '(' or ')'

The ast.go file contains all the node types we considered necessary to build the AST

2. Determine if the node should be a `struct` or an `interface`
- A struct when: simple, concrete, no need for extending, need to hold data, need to be embedded into other structs 
- An interface when: polymorphic, needs extending to subclasses/subinterfaces

Specific example of when to use struct vs interface is explained as comments in `ast.go` 

3. Model the grammar 

Write the structs/interfaces so that it models the structure of the grammar, adding any fields to hold metadata if need be (for example, `Line` and `Column` number is considered metadata about the token).

If you have ever written Entity class to wrap around a database in Java Spring, this is a parallel of that. The structs/interfaces in `ast.go` is a wrapper around the grammar so that we can populate its fields with data later. 

4. Rinse and repeat until covered all rules

## How to build AST from grammar (after having AST nodes defined)
1. Locate the relevant items in grammar and `ast.go`. For example, this rule in the grammar

```
program
    : declaration* EOF
    ;
```

corresponds to this struct in `ast.go`:

```
type Program struct {
	BaseNode
	Declarations []Declaration
}
```

and now we need to implement their corresponding visitor method in `parser.go`:

```
func (v *ASTBuilder) VisitProgram(ctx *ProgramContext)
```

2. Find the common tokens and populate the data in these fields first 

Consider this rule: 
```
declaration
    : type arrayNotation? Identifier declarationRemainder
    ;
```

Which could have been a regular variable declaration or an array declaration. The first step is to process the common `type` token first, after this is done, consume the next token and decide if it is an array declaration. 

3. Branching 

When standing at a decision point (ie. after processing `type` and have to decide if this is an array declaration), proceed to process each case using if-else. 

This is when grammar unambiguity proves to be very useful: if the grammar is ambiguous, you would need to implement lookahead logic to lookahead several tokens to have enough information to keep going. 

Once again, this is very formulaic and requires detailed handling. 

## Helpful resources 
- [This guy](https://youtu.be/VKM1eLoN-gI?si=WzVZjmnYIZWEjvEG) explains and demonstrates CST, AST, and happen to also explain interpreting vs. compiling pretty well in the process. He uses lex/yacc though, so if you're only familiar with Antlr it takes some extra effort to learn lex/yacc.
- [Listener vs. Visitor](https://tomassetti.me/listeners-and-visitors/) explanation