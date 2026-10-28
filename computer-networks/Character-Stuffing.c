/*
 * 1b. Character (Byte) Stuffing (SAS)
 *
 * HOW IT WORKS (one line):
 *  Before the frame goes on the wire, any byte that is the ESCAPE char
 *  or the FLAG char gets a leading ESCAPE byte prepended.
 *  The receiver removes the ESCAPE byte to recover the original data.
 *
 * EXAMPLE:
 *  FLAG = 'A', ESCAPE = 'R', data = "KHALIFA"
 *  'A' at index 2 and index 6 both get an 'R' in front -> "KHRALIFRA"
 *  The receiver sees 'R' and knows the next byte is real data.
 */

#include <stdio.h>
#include <string.h>

int main() {
    char a[50], b[100], res[50], f, e;
    int i, j = 0;

    printf("Enter the size: ");
    int n;
    scanf("%d", &n);

    printf("Enter the flag character: ");
    scanf(" %c", &f);

    printf("Enter the escape character: ");
    scanf(" %c", &e);

    printf("Enter the string: ");
    scanf("%s", a);

    /* -------- SENDER SIDE: STUFFING -------- */
    /* Any byte that is flag or escape gets an escape byte in front of it. */
    for (i = 0; i < strlen(a); i++) {
        if (a[i] == f || a[i] == e)
            b[j++] = e;            /* insert escape */
        b[j++] = a[i];
    }
    b[j] = '\0';
    printf("Sender side data after stuffing:\n%s\n", b);

    /* -------- RECEIVER SIDE: DESTUFFING -------- */
    /* Every time we see the escape character, we swallow it AND
       the byte right after it (that byte is the original data byte). */
    int k = 0;
    for (i = 0; i < j; i++) {
        if (b[i] == e)
            i++;                  /* skip the escaped byte */
        res[k++] = b[i];
    }
    res[k] = '\0';
    printf("Receiver side data:\n%s\n", res);

    return 0;
}

/*
 * SAMPLE RUN:
 * Enter the size: 7
 * Enter the flag character: A
 * Enter the escape character: R
 * Enter the string: KHALIFA
 * Sender side data after stuffing:
 * KHRALIFRA
 * Receiver side data:
 * KHALIFA
 */
