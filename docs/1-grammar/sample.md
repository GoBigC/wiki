# Sample BigC Code
See all sample code files in [BigC repository](https://github.com/GoBigC/BigC/blob/main/test/). Here is one of such: 

```
/* Comprehensive test file for BigC grammar */

// Global variable declarations with all primitive types
int globalInt = 42;
float globalFloat = 3.14159;
bool globalBool = true;
char globalChar = 'A';
int globalInt2 = -16; 
float globalFloat2 = -1.2321;

// Array declaration with size (syntax depends on your grammar rules)
int globalArray[10];

// Function to fill an array
void fillArray(int arr[43], int value) {
    int i = 0;
    while (i < 5) {
        arr[i] = value;
        i = i + 1;
    }
}

// Function to sum array elements
int sumArray(int arr[5]) {
    int i = 0;
    int sum = 0;
    
    while (i < 5) {
        sum = sum + arr[i];
        i = i + 1;
    }
    
    return sum;
}

// Function declaration with parameters
int max(int a, int b) {
    if (a > b) {
        return a;
    } else {
        return b;
    }
}

// Function with multiple parameters of different types
float calculate(int x, float y, bool condition) {
    float result = 0.0;
    
    if (condition) {
        result = x + y;
    } else {
        result = x - y;
    }
    
    return result;
}

// Recursive function to test function calls
int factorial(int n) {
    if (n <= 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

// Main function with comprehensive language feature testing
int main() {
    // Local variable declarations
    int a = 10;
    int b = 20;
    float f = 1.5;
    bool flag = false;
    char c = 'X';
    
    // Local array declaration
    int numbers[5];
    
    // Initialize array using array access
    numbers[0] = 10;
    numbers[1] = 20;
    numbers[2] = 30;
    numbers[3] = 40;
    numbers[4] = 50;
    
    // Array access in expressions
    int arraySum = numbers[0] + numbers[1];
    
    // Array access with expressions as index
    int index = 2;
    int valueAtIndex = numbers[index];
    int valueAtExpr = numbers[index + 1];
    
    // Nested array access in expressions
    int complexArrayExpr = numbers[numbers[0] / 10];
    
    // Fill array using function
    fillArray(numbers, 5);
    
    // Sum array using function
    int totalSum = sumArray(numbers);
    
    // Basic arithmetic operators
    int sum = a + b;
    int diff = b - a;
    int product = a * b;
    int quotient = b / a;
    
    // Complex arithmetic expression with nested parentheses
    float complexExpr = (a + b) * (f / (b - a));
    
    // Comparison operators
    bool test1 = a < b;
    bool test2 = a > b;
    bool test3 = a <= b;
    bool test4 = a >= b;
    
    // Equality operators
    bool equal = a == b;
    bool notEqual = a != b;
    
    // Logical operators with precedence testing
    bool logicalExpr1 = a < b && f > 1.0;
    bool logicalExpr2 = a > b || f < 2.0;
    bool logicalExpr3 = !(a == b) && (f >= 1.0 || b <= 20);
    
    // Assignment in expression
    bool assignTest = (flag = true);
    
    // Function calls
    int maxValue = max(a, b);
    float calcResult = calculate(a, f, flag);
    int fact5 = factorial(5);
    
    // Function call as part of expression
    int exprWithCall = a + factorial(3);
    
    // Nested function calls
    int nestedCall = max(factorial(2), factorial(3));
    
    // Array access in function call
    int maxArrayValue = max(numbers[1], numbers[3]);
    
    // If-else with array access in condition
    if (numbers[0] > numbers[1]) {
        numbers[2] = numbers[0];
    } else {
        numbers[2] = numbers[1];
    }
    
    // While loop with array access
    int j = 0;
    while (j < 5 && numbers[j] < 100) {
        numbers[j] = numbers[j] * 2;
        j = j + 1;
    }
    
    // Return statement with expression containing array access
    return numbers[4] + factorial(numbers[0] / 10);
}
```