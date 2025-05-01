# Language quirks

1. Array accessing
   This is not supported:

```
// assuming arr is an array
arr[1+1];
```

You need to declare a separate variable to compute the index first:

```
// assuming arr is an array
int k = 1+1;
arr[k];
```
