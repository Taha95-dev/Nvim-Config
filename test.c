#include <stdio.h>

typedef struct {
    int x;
    int y;
} Point;

int add(int a, int b) {
    return a + b;
}

int subtract(int a, int b) {
  return a - b;
}

int main() {
  int result = add(432, 123);
  printf("%d", result);
  return 0;
}
