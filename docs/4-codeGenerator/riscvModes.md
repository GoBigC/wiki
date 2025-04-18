# RARS setup 
**tl;dr: Make sure your RARS support these extensions: RV64I, RV64M, RV64D.**

BigC was developed to work with instruction set provided by RARS - the Risc-V Assembler and Runtime Simulator. To install RARS, head to its [active repository](https://github.com/TheThirdOne/rars). 

RISC-V support 32-bit and 64-bit mode. To support floating-point numbers, we are limited to 64-bit mode. From now on, all of our discussions regarding RISC-V only refer to 64-bit mode, which would be abbreviated to "RV64". 

## Understanding RV64 modes 
RV64 have several support modules, each called "extension". 
1. Integer (I): Integer instructions. 
2. Mumtiplication (M): Integer multiplication/division instructions.  
3. Single-precision floating point (F): Single-precision floating point operations.
4. Double-precision floating point (D): Double-precision floating point operations. Note that this extension is a superset of RV64F. 
5. Atomic (A): Atomic memory operations, necessary if support multi-threading, thread synchronization mechanisms (ie. locks). 
6. Compressed (C): Compressed instructions, necessary to reduce code size for optimization. 

## Modes relevant to BigC development 
BigC is a simple language, currently in its infancy. Therefore, we do not support advanced functionalities like thread synchronization. For now, we also don't care too much about code optimization. 

So, 2 extensions are not needed: RV64A, RV64C. 

And these are the extensions needed: RV64I, RV64M, RV64D. 

You should check if your instance of RARS has all the necessary extensions. Test if this program can be assembled without any errors: 

```
.text
main:
    # Test RV64I (base 64-bit integer)
    li t0, 0x123456789ABCDEF0  # 64-bit immediate load
    addiw t1, t0, 10           # Add immediate, 32-bit result, sign-extend to 64-bit
    
    # Test RV64M (integer multiplication/division)
    li t2, 5
    li t3, 7
    mul t4, t2, t3             # Basic multiplication
    mulh t5, t2, t3            # High bits of multiplication
    div t6, t3, t2             # Division
    
    # Test RV64D (double-precision floating point)
    .data
    double_val: .double 3.14159265358979
    .text
    la t0, double_val
    fld f1, 0(t0)              # Load double
    fmv.d.x f2, t0             # Move from integer to double
    fadd.d f3, f1, f2          # Add doubles
    
    # Exit program
    li a0, 0
    li a7, 10
    ecall
```