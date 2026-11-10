#include <stdio.h>
#include <string.h>

void charStuffing() {
    char in[100], out[200];
    int i = 0, j = 0;
    printf("\n--- Character Stuffing ---\n");
    printf("Enter data: ");
    scanf("%s", in);
    
    out[j++] = 'S'; out[j++] = 'T'; out[j++] = 'X';
    while (in[i] != '\0') {
        if (in[i] == 'S' && in[i+1] == 'T' && in[i+2] == 'X') {
            out[j++] = 'E'; out[j++] = 'S'; out[j++] = 'C';
        }
        out[j++] = in[i++];
    }
    out[j++] = 'E'; out[j++] = 'T'; out[j++] = 'X';
    out[j] = '\0';
    printf("Stuffed Data: %s\n", out);
}

void bitStuffing() {
    char in[100], out[200];
    int i = 0, j = 0, count = 0;
    printf("\n--- Bit Stuffing ---\n");
    printf("Enter data (0s and 1s): ");
    scanf("%s", in);

    out[j++] = '0'; out[j++] = '1'; out[j++] = '1'; out[j++] = '1'; out[j++] = '1'; out[j++] = '1'; out[j++] = '0';
    while (in[i] != '\0') {
        out[j++] = in[i];
        if (in[i] == '1') {
            count++;
            if (count == 5) {
                out[j++] = '0';
                count = 0;
            }
        } else {
            count = 0;
        }
        i++;
    }
    out[j++] = '0'; out[j++] = '1'; out[j++] = '1'; out[j++] = '1'; out[j++] = '1'; out[j++] = '1'; out[j++] = '0';
    out[j] = '\0';
    printf("Stuffed Data: %s\n", out);
}

int main() {
    charStuffing();
    bitStuffing();
    return 0;
}
