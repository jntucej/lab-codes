/*
 * 2. Cyclic Redundancy Check - CRC (SAS)
 *
 * HOW IT WORKS (one line):
 *  You append zeros to the data so its length matches the divisor,
 *  do binary long division, and the remainder is the FCS (Frame Check Sequence).
 *  The FCS is appended to the original data before sending.
 *
 * KEY IDEA:
 *  The divisor's length determines how many zeros you append:
 *  (divisor length - 1) zeros.
 *  The sender transmits original data + FCS, receiver divides by the same
 *  divisor; if the remainder is 0, no bit errors (or undetected errors).
 */

#include <stdio.h>
#include <string.h>

int main() {
    char data[100], div[50], rem[50];

    printf("Enter the data: ");
    scanf("%s", data);
    printf("Enter the divisor: ");
    scanf("%s", div);

    int datalen = strlen(data);
    int divlen  = strlen(div);

    /* Append (divlen-1) zeros to the data */
    for (int i = 0; i < divlen - 1; i++)
        data[datalen + i] = '0';
    data[datalen + divlen - 1] = '\0';

    /* Binary long division to find the remainder (FCS) */
    strncpy(rem, data, divlen);           /* start with the first divlen bits */

    for (int i = 0; i < datalen; i++) {
        int bit = (rem[0] == '1');        /* 1 -> XOR, 0 -> just shift */
        for (int j = 0; j < divlen - 1; j++)
            rem[j] = bit ? (rem[j + 1] == div[j + 1] ? '0' : '1')
                         : rem[j + 1];
        rem[divlen - 1] = data[divlen + i];
    }
    rem[divlen - 1] = '\0';

    /* Strip the appended zeros from data, then append the FCS */
    data[datalen] = '\0';
    strcat(data, rem);

    printf("The data to be sent is:\n%s\n", data);

    return 0;
}

/*
 * SAMPLE RUN:
 * Enter the data: 100100
 * Enter the divisor: 1101
 * The data to be sent is:
 * 100100001
 *
 * (data = 100100, divisor 1101 -> 1 zero appended -> division remainder = 001,
 *  transmitted frame = 100100001)
 */
