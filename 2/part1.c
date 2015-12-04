#include <stdio.h>
#include <stdlib.h>

int min2(int a, int b) {
   if (a > b) return b;
   return a;
}

int min(int a, int b, int c) {
   return min2(a, min2(b, c));
}

int main(void) {

   FILE* input = fopen("input", "r"); 
   if (input == NULL) {
      printf("error reading file\n");
      return -1;
   }

   long total = 0;
   int w, l, h;
   
   while (fscanf(input, "%dx%dx%d", &w, &l, &h) != EOF) {
      int a = w * l;
      int b = l * h;
      int c = h * w;
      total += 2* (a + b + c) + min(a, b, c);
   }
   
   printf("%ld\n", total);

   return 0;

}
