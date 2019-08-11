#include <stdio.h>
#include <stdbool.h>

int main() {
    int num = 0, i;
    bool end = false;
    while (!end) {
        num += 2;

        for (i = 1; i <= 20; i++) {
            if (num % i != 0) {
                end = false;
                break;
            } else {
                end = true;
            }
        }
    }

    printf("%d", num);

    return 0;
}
