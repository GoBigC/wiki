# RISC-V RV64D Instruction Set
Copied from [https://msyksphinz-self.github.io/riscv-isadoc/html/rvfd.html](https://msyksphinz-self.github.io/riscv-isadoc/html/rvfd.html) and [https://msyksphinz-self.github.io/riscv-isadoc/html/rv64d.html](https://msyksphinz-self.github.io/riscv-isadoc/html/rv64d.html).

## fmadd.d

**Format:** `fmadd.d rd,rs1,rs2,rs3`

**Description:** Perform double-precision fused multiply addition.

**Implementation:** `f[rd] = f[rs1]×f[rs2]+f[rs3]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
|-----|-----|-----|-----|-----|-----|-----|---|
|rs3  |01   |rs2  |rs1  |rm   |rd   |10000|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fmsub.d

**Format:** `fmsub.d rd,rs1,rs2,rs3`

**Description:** Perform double-precision fused multiply subtraction.

**Implementation:** `f[rd] = f[rs1]×f[rs2]-f[rs3]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|rs3  |01   |rs2  |rs1  |rm   |rd   |10001|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fnmsub.d

**Format:** `fnmsub.d rd,rs1,rs2,rs3`

**Description:** Perform double-precision negated fused multiply subtraction.

**Implementation:** `f[rd] = -f[rs1]×f[rs2]+f[rs3]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|rs3  |01   |rs2  |rs1  |rm   |rd   |10010|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fnmadd.d

**Format:** `fnmadd.d rd,rs1,rs2,rs3`

**Description:** Perform double-precision negated fused multiply addition.

**Implementation:** `f[rd] = -f[rs1]×f[rs2]-f[rs3]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|rs3  |01   |rs2  |rs1  |rm   |rd   |10011|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fadd.d

**Format:** `fadd.d rd,rs1,rs2`

**Description:** Perform double-precision floating-point addition.

**Implementation:** `f[rd] = f[rs1] + f[rs2]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fsub.d

**Format:** `fsub.d rd,rs1,rs2`

**Description:** Perform double-precision floating-point subtraction.

**Implementation:** `f[rd] = f[rs1] - f[rs2]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00001|01   |rs2  |rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fmul.d

**Format:** `fmul.d rd,rs1,rs2`

**Description:** Perform double-precision floating-point multiplication.

**Implementation:** `f[rd] = f[rs1] × f[rs2]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00010|01   |rs2  |rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fdiv.d

**Format:** `fdiv.d rd,rs1,rs2`

**Description:** Perform double-precision floating-point division.

**Implementation:** `f[rd] = f[rs1] / f[rs2]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00011|01   |rs2  |rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fsqrt.d

**Format:** `fsqrt.d rd,rs1`

**Description:** Perform double-precision square root.

**Implementation:** `f[rd] = sqrt(f[rs1])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|01011|01   |00000|rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fsgnj.d

**Format:** `fsgnj.d rd,rs1,rs2`

**Description:** Produce a result that takes all bits except the sign bit from rs1. The result's sign bit is rs2's sign bit.

**Implementation:** `f[rd] = {f[rs2][63], f[rs1][62:0]}`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00100|01   |rs2  |rs1  |000  |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fsgnjn.d

**Format:** `fsgnjn.d rd,rs1,rs2`

**Description:** Produce a result that takes all bits except the sign bit from rs1. The result's sign bit is opposite of rs2's sign bit.

**Implementation:** `f[rd] = {~f[rs2][63], f[rs1][62:0]}`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00100|01   |rs2  |rs1  |001  |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fsgnjx.d

**Format:** `fsgnjx.d rd,rs1,rs2`

**Description:** Produce a result that takes all bits except the sign bit from rs1. The result's sign bit is XOR of sign bit of rs1 and rs2.

**Implementation:** `f[rd] = {f[rs1][63] ^ f[rs2][63], f[rs1][62:0]}`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00100|01   |rs2  |rs1  |010  |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fmin.d

**Format:** `fmin.d rd,rs1,rs2`

**Description:** Write the smaller of double precision data in rs1 and rs2 to rd.

**Implementation:** `f[rd] = min(f[rs1], f[rs2])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00101|01   |rs2  |rs1  |000  |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fmax.d

**Format:** `fmax.d rd,rs1,rs2`

**Description:** Write the larger of double precision data in rs1 and rs2 to rd.

**Implementation:** `f[rd] = max(f[rs1], f[rs2])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00101|01   |rs2  |rs1  |001  |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fcvt.s.d

**Format:** `fcvt.s.d rd,rs1`

**Description:** Converts double floating-point register in rs1 into a single-precision floating-point number in floating-point register rd.

**Implementation:** `f[rd] = f32_{f64}(f[rs1])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|01000|00   |00001|rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fcvt.d.s

**Format:** `fcvt.d.s rd,rs1`

**Description:** Converts single floating-point register in rs1 into a double floating-point number in floating-point register rd.

**Implementation:** `f[rd] = f64_{f32}(f[rs1])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|01000|01   |00000|rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## feq.d

**Format:** `feq.d rd,rs1,rs2`

**Description:** Performs a quiet equal comparison between floating-point registers rs1 and rs2 and record the Boolean result in integer register rd. Only signaling NaN inputs cause an Invalid Operation exception. The result is 0 if either operand is NaN.

**Implementation:** `x[rd] = f[rs1] == f[rs2]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|10100|01   |rs2  |rs1  |010  |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## flt.d

**Format:** `flt.d rd,rs1,rs2`

**Description:** Performs a quiet less-than comparison between floating-point registers rs1 and rs2 and record the Boolean result in integer register rd. Only signaling NaN inputs cause an Invalid Operation exception. The result is 0 if either operand is NaN.

**Implementation:** `x[rd] = f[rs1] < f[rs2]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|10100|01   |rs2  |rs1  |001  |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fle.d

**Format:** `fle.d rd,rs1,rs2`

**Description:** Performs a quiet less-than-or-equal comparison between floating-point registers rs1 and rs2 and record the Boolean result in integer register rd. Only signaling NaN inputs cause an Invalid Operation exception. The result is 0 if either operand is NaN.

**Implementation:** `x[rd] = f[rs1] <= f[rs2]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|10100|01   |rs2  |rs1  |000  |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fclass.d

**Format:** `fclass.d rd,rs1`

**Description:** Examines the value in floating-point register rs1 and writes to integer register rd a 10-bit mask that indicates the class of the floating-point number. The corresponding bit in rd will be set if the property is true and clear otherwise. All other bits in rd are cleared. Note that exactly one bit in rd will be set.

**Implementation:** `x[rd] = classifyd(f[rs1])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|11100|01   |00000|rs1  |001  |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fcvt.w.d

**Format:** `fcvt.w.d rd,rs1`

**Description:** Converts a double-precision floating-point number in floating-point register rs1 to a signed 32-bit integer, in integer register rd.

**Implementation:** `x[rd] = sext(s32_{f64}(f[rs1]))`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|11000|01   |00000|rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fcvt.wu.d

**Format:** `fcvt.wu.d rd,rs1`

**Description:** Converts a double-precision floating-point number in floating-point register rs1 to an unsigned 32-bit integer, in integer register rd.

**Implementation:** `x[rd] = sext(u32_{f64}(f[rs1]))`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|11000|01   |00001|rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fcvt.d.w

**Format:** `fcvt.d.w rd,rs1`

**Description:** Converts a 32-bit signed integer, in integer register rs1 into a double-precision floating-point number in floating-point register rd.

**Implementation:** `f[rd] = f64_{s32}(x[rs1])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|11010|01   |00000|rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fcvt.d.wu

**Format:** `fcvt.d.wu rd,rs1`

**Description:** Converts a 32-bit unsigned integer, in integer register rs1 into a double-precision floating-point number in floating-point register rd.

**Implementation:** `f[rd] = f64_{u32}(x[rs1])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|11010|01   |00001|rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fld

**Format:** `fld rd,offset(rs1)`

**Description:** Load a double-precision floating-point value from memory into floating-point register rd.

**Implementation:** `f[rd] = M[x[rs1] + sext(offset)][63:0]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|imm[11:0]        |rs1  |011  |rd   |00001|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fsd

**Format:** `fsd rs2,offset(rs1)`

**Description:** Store a double-precision value from the floating-point registers to memory.

**Implementation:** `M[x[rs1] + sext(offset)] = f[rs2][63:0]`

**Encoding:**
```
+-----+-----+-----+-----+-----+--------+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7    |6-2  |1-0|
+-----+-----+-----+-----+-----+--------+-----+---+
|imm[11:5]  |rs2  |rs1  |011  |imm[4:0]|01001|11 |
+-----+-----+-----+-----+-----+--------+-----+---+
```

## fcvt.l.d

**Format:** `fcvt.l.d rd,rs1`

**Description:** Converts a double-precision floating-point value to a 64-bit signed integer.

**Implementation:** `x[rd] = s64_{f64}(f[rs1])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|11000|01   |00010|rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fcvt.lu.d

**Format:** `fcvt.lu.d rd,rs1`

**Description:** Converts a double-precision floating-point value to a 64-bit unsigned integer.

**Implementation:** `x[rd] = u64_{f64}(f[rs1])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|11000|01   |00011|rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fmv.x.d

**Format:** `fmv.x.d rd,rs1`

**Description:** Moves the double-precision value from floating-point register to integer register.

**Implementation:** `x[rd] = f[rs1][63:0]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|11100|01   |00000|rs1  |000  |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fcvt.d.l

**Format:** `fcvt.d.l rd,rs1`

**Description:** Converts a 64-bit signed integer to a double-precision floating-point value.

**Implementation:** `f[rd] = f64_{s64}(x[rs1])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|11010|01   |00010|rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fcvt.d.lu

**Format:** `fcvt.d.lu rd,rs1`

**Description:** Converts a 64-bit unsigned integer to a double-precision floating-point value.

**Implementation:** `f[rd] = f64_{u64}(x[rs1])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|11010|01   |00011|rs1  |rm   |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## fmv.d.x

**Format:** `fmv.d.x rd,rs1`

**Description:** Moves the 64-bit integer from integer register to floating-point register.

**Implementation:** `f[rd] = x[rs1][63:0]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|11110|01   |00000|rs1  |000  |rd   |10100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

### Floating-Point Classification

The `fclass.d` instruction sets bits in the destination register according to this table:

| rd bit | Meaning |
|--------|---------|
| 0 | rs1 is -infinity |
| 1 | rs1 is a negative normal number |
| 2 | rs1 is a negative subnormal number |
| 3 | rs1 is −0 |
| 4 | rs1 is +0 |
| 5 | rs1 is a positive subnormal number |
| 6 | rs1 is a positive normal number |
| 7 | rs1 is +infinity |
| 8 | rs1 is a signaling NaN |
| 9 | rs1 is a quiet NaN |