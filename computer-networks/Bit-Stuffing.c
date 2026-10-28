/*
 * 1a. Bit Stuffing (SAS)
 *
 * HOW IT WORKS (one line):
 *  In the sender, after every 5 consecutive 1s, a 0 is inserted (stuffed).
 *  In the receiver, a 0 that follows 5 ones is removed (destuffed).
 *
 * RULE OF THUMB:
 *  This stops the data from accidentally looking like the
 *  01111110 flag sequence (a 6-bit 0-then-five-1s-then-0 delimiter).
 *  It keeps the clock synchronized for the receiver.
 */

#include <stdio.h>

int main() {
    int a[50], b[100], n, i, j = 0, count = 0;

    printf("Enter the size of string: ");
    scanf("%d", &n);
    printf("Enter the values of string:\n");
    for (i = 0; i < n; i++)
        scanf("%d", &a[i]);

    /* -------- SENDER SIDE: STUFFING -------- */
    /* Walk through the original data. For every 5 consecutive 1s,
       insert a 0 into the output b[] to reset the flag pattern. */
    for (i = 0; i < n; i++) {
        b[j++] = a[i];              /* copy the bit */
        if (a[i] == 1) {
            count++;
            if (count == 5) {       /* 5 consecutive 1s -> insert a 0 */
                b[j++] = 0;
                count = 0;
            }
        } else {
            count = 0;              /* a 0 resets the consecutive-1 counter */
        }
    }

    printf("Sender Side data:\n");
    for (i = 0; i < j; i++)
        printf("%d", b[i]);

    /* -------- RECEIVER SIDE: DESTUFFING -------- */
    /* Mirror image: keep copying, but every time we see 5 ones in a row,
       we skip the 0 that follows (that was the stuffing 0). */
    int destuffed[50], k = 0;
    count = 0;
    for (i = 0; i < j; i++) {
        destuffed[k++] = b[i];
        if (b[i] == 1) {
            count++;
            if (count == 5) {
                i++;                /* skip the stuffed 0 */
                count = 0;
            }
        } else {
            count = 0;
        }
    }

    printf("\nReceiver side data:\n");
    for (i = 0; i < k; i++)
        printf("%d", destuffed[i]);
    printf("\n");

    return 0;
}

/*
 * SAMPLE RUN:
 * Enter the size of string:
 * 16
 * Enter the values of string:
 * 1 1 1 1 1 0 1 0 0 0 1 1 1 1 1 1
 * Sender Side data:
 * 111110100011111011
 * receiver side data:
 * 111111000111111
 */
