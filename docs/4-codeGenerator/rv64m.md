# RISC-V RV64M Instruction Set
Copied from [https://msyksphinz-self.github.io/riscv-isadoc/html/rvm.html](https://msyksphinz-self.github.io/riscv-isadoc/html/rvm.html) and [https://msyksphinz-self.github.io/riscv-isadoc/html/rv64m.html](https://msyksphinz-self.github.io/riscv-isadoc/html/rv64m.html)

## mul

**Format:** `mul rd,rs1,rs2`

**Description:** Performs an XLEN-bit × XLEN-bit multiplication of signed rs1 by signed rs2 and places the lower XLEN bits in the destination register.

**Implementation:** `x[rd] = x[rs1] × x[rs2]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |000  |rd   |01100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## mulh

**Format:** `mulh rd,rs1,rs2`

**Description:** Performs an XLEN-bit × XLEN-bit multiplication of signed rs1 by signed rs2 and places the upper XLEN bits in the destination register.

**Implementation:** `x[rd] = (x[rs1] s×s x[rs2]) >>s XLEN`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |001  |rd   |01100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## mulhsu

**Format:** `mulhsu rd,rs1,rs2`

**Description:** Performs an XLEN-bit × XLEN-bit multiplication of signed rs1 by unsigned rs2 and places the upper XLEN bits in the destination register.

**Implementation:** `x[rd] = (x[rs1] s× x[rs2]) >>s XLEN`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |010  |rd   |01100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## mulhu

**Format:** `mulhu rd,rs1,rs2`

**Description:** Performs an XLEN-bit × XLEN-bit multiplication of unsigned rs1 by unsigned rs2 and places the upper XLEN bits in the destination register.

**Implementation:** `x[rd] = (x[rs1] u× x[rs2]) >>u XLEN`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |011  |rd   |01100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## div

**Format:** `div rd,rs1,rs2`

**Description:** Perform an XLEN bits by XLEN bits signed integer division of rs1 by rs2, rounding towards zero.

**Implementation:** `x[rd] = x[rs1] /s x[rs2]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |100  |rd   |01100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## divu

**Format:** `divu rd,rs1,rs2`

**Description:** Perform an XLEN bits by XLEN bits unsigned integer division of rs1 by rs2, rounding towards zero.

**Implementation:** `x[rd] = x[rs1] /u x[rs2]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |101  |rd   |01100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## rem

**Format:** `rem rd,rs1,rs2`

**Description:** Perform an XLEN bits by XLEN bits signed integer reminder of rs1 by rs2.

**Implementation:** `x[rd] = x[rs1] %s x[rs2]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |110  |rd   |01100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## remu

**Format:** `remu rd,rs1,rs2`

**Description:** Perform an XLEN bits by XLEN bits unsigned integer reminder of rs1 by rs2.

**Implementation:** `x[rd] = x[rs1] %u x[rs2]`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |111  |rd   |01100|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## mulw

**Format:** `mulw rd,rs1,rs2`

**Description:** Performs multiplication operation on the lower 32 bits of the source registers.

**Implementation:** `x[rd] = sext((x[rs1] × x[rs2])[31:0])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |000  |rd   |01110|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## divw

**Format:** `divw rd,rs1,rs2`

**Description:** Perform an 32 bits by 32 bits signed integer division of rs1 by rs2.

**Implementation:** `x[rd] = sext(x[rs1][31:0] /s x[rs2][31:0])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |100  |rd   |01110|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## divuw

**Format:** `divuw rd,rs1,rs2`

**Description:** Perform an 32 bits by 32 bits unsigned integer division of rs1 by rs2.

**Implementation:** `x[rd] = sext(x[rs1][31:0] /u x[rs2][31:0])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |101  |rd   |01110|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## remw

**Format:** `remw rd,rs1,rs2`

**Description:** Perform an 32 bits by 32 bits signed integer reminder of rs1 by rs2.

**Implementation:** `x[rd] = sext(x[rs1][31:0] %s x[rs2][31:0])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |110  |rd   |01110|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```

## remuw

**Format:** `remuw rd,rs1,rs2`

**Description:** Perform an 32 bits by 32 bits unsigned integer reminder of rs1 by rs2.

**Implementation:** `x[rd] = sext(x[rs1][31:0] %u x[rs2][31:0])`

**Encoding:**
```
+-----+-----+-----+-----+-----+-----+-----+---+
|31-27|26-25|24-20|19-15|14-12|11-7 |6-2  |1-0|
+-----+-----+-----+-----+-----+-----+-----+---+
|00000|01   |rs2  |rs1  |111  |rd   |01110|11 |
+-----+-----+-----+-----+-----+-----+-----+---+
```