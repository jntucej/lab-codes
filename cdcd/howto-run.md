# CD-CD Lab — How to Run Every Program

Compiler Design + Computer Networks experiments.
10 source files, organized by experiment.

## Setup (one-time)

On macOS: `brew install flex bison`
On Ubuntu: `sudo apt install -y build-essential flex bison`

All commands are run from inside the `cdcd/` directory.

---

## Compiler Design (PART A)

### Exp 1 — Lexical Analyzer (`lexer.l`)
Recognizes comments, constants, identifiers, operators.

```
flex lexer.l
gcc lex.yy.c -o lexer
./lexer input.txt      # or just ./lexer for interactive (Ctrl+D to end)
```
Create `input.txt` with a few lines of code (mix of identifiers, numbers, operators, comments) before running.

---

### Exp 2 — Yacc Calculator (`calc.l` + `calc.y`)
(a) arithmetic expression, (b) variable recognition, (c) calculator.

```
bison -d calc.y         # generates calc.tab.c and calc.tab.h
flex calc.l             # generates lex.yy.c
gcc calc.tab.c lex.yy.c -o calc -lfl
./calc
```
Try inputs:
- `2+3*4`        → Result: 14
- `abc12`        → (b) Valid Variable Recognized
- `(1+2)*3`      → Result: 9

---

### Exp 3 — Word/Line Counter (`count.l`)
Counts words and lines in a file.

```
flex count.l
gcc lex.yy.c -o count -lfl
./count test.txt
```
Note: this overwrites `lex.yy.c` from Exp 2 — run this *after* building Exp 2, or rebuild Exp 2 with `flex calc.l` if needed.

---

### Exp 4 — Recursive Descent Parser (`rdp.c`)
Parses expressions for grammar E→E+E' etc. (left recursion removed).

```
gcc rdp.c -o rdp
./rdp
```
Try inputs: `a+b`, `(a+b)*c`, `a+b+c`

---

### Exp 5 — Yacc Top-Down Style Parser (`parser.y`)
Yacc (bison) parser for the same expression grammar.

```
bison parser.y          # generates parser.tab.c
gcc parser.tab.c -o parser -lfl
./parser
```
Try: `a+b*c`, `(a+b)`

---

## Computer Networks (PART B)

### Exp 1 — Framing: Character + Bit Stuffing (`framing.c`)

```
gcc framing.c -o framing
./framing
```
Character stuffing input: any string (delimiters STX/ETX are added automatically).
Bit stuffing input: a string of 0s and 1s.

---

### Exp 2 — CRC Computation (`crc.c`)
Computes CRC-12, CRC-16, and CRC-CCIP for your input.

```
gcc crc.c -o crc
./crc
```
Enter data bits like `1101001101`.

Note: polynomial strings used:
- CRC-12: `1100000001111`
- CRC-16: `11000000000000101`
- CRC-CCIP: `10010000000100001`

---

### Exp 3 — Routing Algorithms (`dijkstra.c` + `dvr.c`)

**Dijkstra's shortest path:**
```
gcc dijkstra.c -o dijkstra
./dijkstra
```
Inputs (all on separate lines / spaces):
1. Number of nodes
2. Full adjacency matrix (0 = no edge, row by row)
3. Starting node

Example (4 nodes):
```
4
0 1 5 0
1 0 3 2
5 3 0 4
0 2 4 0
0
```

**Distance Vector Routing:**
```
gcc dvr.c -o dvr
./dvr
```
Inputs:
1. Number of nodes
2. Cost matrix (use 999 for no direct link, row by row)

Example (4 nodes):
```
4
0 10 99 30
10 0 5 99
99 5 0 5
30 99 5 0
```

---

## File List

| File | Experiment |
|---|---|
| `lexer.l` | CD 1 — lexical analyzer |
| `calc.l` + `calc.y` | CD 2 — yacc calculator |
| `count.l` | CD 3 — word/line counter |
| `rdp.c` | CD 4 — recursive descent |
| `parser.y` | CD 5 — yacc parser |
| `framing.c` | CN 1 — char + bit stuffing |
| `crc.c` | CN 2 — CRC |
| `dijkstra.c` | CN 3a — Dijkstra |
| `dvr.c` | CN 3b — distance vector |

## cdcd/

Compiler Design + Computer Networks combined lab set (10 programs).
See `cdcd/howto-run.md` for build and run commands.
