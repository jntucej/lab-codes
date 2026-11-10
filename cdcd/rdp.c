#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char input[100];
int i = 0;

void E();
void Eprime();
void T();
void Tprime();
void F();

void error() {
    printf("Syntax Error at position %d\n", i);
    exit(0);
}

void match(char c) {
    if (input[i] == c) i++;
    else error();
}

void E() { T(); Eprime(); }
void Eprime() {
    if (input[i] == '+') { match('+'); T(); Eprime(); }
    else if (input[i] == '-') { match('-'); T(); Eprime(); }
}
void T() { F(); Tprime(); }
void Tprime() {
    if (input[i] == '*') { match('*'); F(); Tprime(); }
    else if (input[i] == '/') { match('/'); F(); Tprime(); }
}
void F() {
    if (input[i] == '(') {
        match('('); E(); match(')');
    } else if ((input[i] >= 'a' && input[i] <= 'z') || (input[i] >= 'A' && input[i] <= 'Z')) {
        match(input[i]);
    } else {
        error();
    }
}

int main() {
    printf("Enter expression: ");
    scanf("%s", input);
    E();
    if (input[i] == '\0') printf("Parsing Successful!\n");
    else printf("Parsing Failed! Extra characters at end.\n");
    return 0;
}
