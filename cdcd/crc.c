#include <stdio.h>
#include <string.h>

void computeCRC(char data[], char gen[]) {
    int dlen = strlen(data);
    int glen = strlen(gen);
    char temp[100];

    strcpy(temp, data);
    for (int i = 0; i < glen - 1; i++) {
        strcat(temp, "0");
    }

    for (int i = 0; i <= strlen(temp) - glen; i++) {
        if (temp[i] == '1') {
            for (int j = 0; j < glen; j++) {
                temp[i + j] = (temp[i + j] == gen[j]) ? '0' : '1';
            }
        }
    }

    printf("Data: %s\n", data);
    printf("CRC Remainder: %s\n", temp + dlen);
    printf("Transmitted Codeword: %s%s\n\n", data, temp + dlen);
}

int main() {
    char data[100];
    printf("Enter data bits: ");
    scanf("%s", data);

    printf("\n--- CRC-12 Polynomial (x^12+x^11+x^3+x^2+x+1) ---\n");
    computeCRC(data, "1100000001111");

    printf("\n--- CRC-16 Polynomial (x^16+x^15+x^2+1) ---\n");
    computeCRC(data, "11000000000000101");

    printf("\n--- CRC CCIP (x^16+x^12+x^5+1) ---\n");
    computeCRC(data, "10010000000100001");

    return 0;
}
