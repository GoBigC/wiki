# Code Generator Interface 
- Input: Annotated Abstract Syntax Tree 
- Output: Bare-metal RISC-V assembly

Source code repo: [https://github.com/GoBigC/BigC/tree/main/pkg/codegen](https://github.com/GoBigC/BigC/tree/main/pkg/codegen) 

We generate bare-metal RISC-V assembly, meaning it probably will not work on any OS. The resulting assembly code would be run on [RARS the RISC-V assembler simulator](https://github.com/GoBigC/rars). 