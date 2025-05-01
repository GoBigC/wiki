# Sample BigC Code

See [benchmark test](https://github.com/GoBigC/BigC/blob/main/test/benchmark.uia). This example may not be comprehensive.

```
int x = 15;
float y = 5.5;

int main() {
    // ================INT====================
    int addInt = 1 + 2050;
    _printInt(addInt); // Expected: 2051

    int subInt = 5 - 2;
    _printInt(subInt); // Expected: 3

    int mulInt = 3 * 4;
    _printInt(mulInt); // Expected: 12

    int divInt = 8 / 2;
    _printInt(divInt); // Expected: 4

    int literalInt = 4;
    _printInt(literalInt); // Expected: 4

    int minusInt = -5;
    _printInt(minusInt); // Expected: -5

    int mixedAddInt = x + 12;
    _printInt(mixedAddInt); // Expected: 22

    int mixMulInt = x * 1;
    _printInt(mixMulInt); // Expected: 10

    int mixSubInt = x -1;
    _printInt(mixSubInt);  // Expected: 9

    int mixDivInt = x/2;
    _printInt(mixDivInt);  // Expected: 5

    _printInt(13); // Expected: 13

    // =================FLOAT===================
    float addFloat = 3.14 + 2.5;
    _printFloat(addFloat); // Expected: 5.64

    float subFloat = 10.5 - 4.2;
    _printFloat(subFloat); // Expected: 6.3

    float mulFloat = 2.0 * 3.5;
    _printFloat(mulFloat); // Expected: 7.0

    float divFloat = 15.0 / 3.0;
    _printFloat(divFloat); // Expected: 5.0

    float literalFloat = 6.28;
    _printFloat(literalFloat); // Expected: 6.28

    float minusFloat = -3.14;
    _printFloat(minusFloat); // Expected: -3.14

    float mixedAddFloat = y + 2.3;
    _printFloat(mixedAddFloat); // Expected: 7.8

    float mixMulFloat = y * 2.0;
    _printFloat(mixMulFloat); // Expected: 11.0

    float mixSubFloat = y - 1.1;
    _printFloat(mixSubFloat); // Expected: 4.4

    float mixDivFloat = y / 2.2;
    _printFloat(mixDivFloat); // Expected: 2.5

    _printFloat(3.14159); // Expected: 3.14159

    // =================CHAR===================
    char literalChar = 'A';
    _printChar(literalChar);

    _printChar('B');

    // =================BOOL===================
    bool trueValue = true;
    _printBool(trueValue); // Expected: 1

    bool falseValue = false;
    _printBool(falseValue); // Expected: 0

    bool andOperation = true && false;
    _printBool(andOperation); // Expected: 0

    bool orOperation = true || false;
    _printBool(orOperation); // Expected: 1

    bool notOperation = !trueValue;
    _printBool(notOperation); // Expected: 0

    bool comparisonLT = (5 < 10);
    _printBool(comparisonLT); // Expected: 1

    bool comparisonGT = (20 > 15);
    _printBool(comparisonGT); // Expected: 1

    bool comparisonEQ = (7 == 7);
    _printBool(comparisonEQ); // Expected: 1

    bool comparisonNEQ = (8 != 9);
    _printBool(comparisonNEQ); // Expected: 1

    // ================ARRAY====================
    int a[x];
    a[0] = 69;
    _printInt(a[0]);

    // this is not going to work --> workaround at (I)
    // int z = 4;
    // a[x-z] = 420; // 42.0 thi sao?
    // int n = a[x-z];
    // _printInt(n);

    // (I)
    int z = 4;
    int k = x-z;
    a[k] = 420;
    int n = a[k];
    _printInt(n);

    // (I)
    a[k] = 425;
    _printInt(a[k]);
    n = a[k];
    _printInt(n);

    int n1;
    n1 = a[k];
    _printInt(n1);

    a[0] = 1;
    _printInt(a[0]);
    a[1] = 1;
    // a[2] = 1.2; // should error
    // int d[0]; // should error

    int ff = a[0] + a[1];
    _printInt(n);

    int b[x+1];
    float c[x+z+1];
    c[0] = 3.1412;
    c[1] = 6.699;
    _printFloat(c[1]);
    _printFloat(c[0]);

    float prices[3];
    prices[0] = 10.5;
    prices[1] = 20.75;
    prices[2] = 15.25;

    _printFloat(prices[0]);  // expect: 10.5
    _printFloat(prices[1]);  // expext: 20.75

    float total = prices[0] + prices[1] + prices[2];
    _printFloat(total);  // expect: 46.5

    return 0;
}
```
