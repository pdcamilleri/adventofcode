#include <stdio.h>
#include <stdlib.h>

/*
It's interesting how similar the key lines in part1 and part2 are.
*/

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
      int p1 = w + l;
      int p2 = l + h;
      int p3 = h + w;
      total += 2 * min(p1, p2, p3) + (w * l * h);
   }
   
   printf("%ld\n", total);

   return 0;

}
