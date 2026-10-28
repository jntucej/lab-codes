# How To Run — All Lab Programs

## 1. Prerequisites (Ubuntu)

```bash
sudo apt update
sudo apt install -y build-essential flex
```

---

## 2. Running C Programs (Computer Networks)

### 1a. Bit-Stuffing (`Bit-Stuffing.c`)

```bash
gcc Bit-Stuffing.c -o bit_stuffing
./bit_stuffing
```
**Sample Input:** bit length `16`, then `1 1 1 1 1 0 1 0 0 0 1 1 1 1 1 1`

### 1b. Character-Stuffing (`Character-Stuffing.c`)

```bash
gcc Character-Stuffing.c -o char_stuffing
./char_stuffing
```
**Sample Input:** size `7`, Flag `A`, Escape `R`, String `KHALIFA`

### 2. CRC (`CRC.c`)

```bash
gcc CRC.c -o crc
./crc
```
**Sample Input:** Data `100100`, Divisor `1101`

### 3. Dijkstra (`Dijkstra.c`)

```bash
gcc Dijkstra.c -o dijkstra
./dijkstra
```
**Sample Input:** Vertices `5`, the 5x5 adjacency matrix row-by-row, starting node `0`

### 4. Distance-Vector (`Distance-Vector.c`)

```bash
gcc Distance-Vector.c -o dvr
./dvr
```
**Sample Input:** Nodes `4`, the 4x4 cost matrix

---

## 3. Running LEX / Flex Programs (CD-CN)

Two-step build: `flex` generates C source, `gcc` compiles it.

```bash
flex Identifiers.lex
gcc lex.yy.c -o identifiers
./identifiers
```

### 5i. Identifiers (`Identifiers.lex`)

```bash
flex Identifiers.lex
gcc lex.yy.c -o identifiers
./identifiers
```
**Sample Input:** `intuhit` → valid; `12sah` → invalid

### 5ii. Constants (`Constants.lex`)

```bash
flex Constants.lex
gcc lex.yy.c -o constants
./constants
```
**Sample Input:** `46` → int; `6.7` → float; `Sahithi` → invalid

### 5iii. Comments (`Comments.lex`)

```bash
flex Comments.lex
gcc lex.yy.c -o comments
./comments
```
**Sample Input:** `// CD-CN Lab` → single line; `/* Hi */` → multi line; `Apple` → not a comment

### 5iv. Operators (`Operators.lex`)

```bash
flex Operators.lex
gcc lex.yy.c -o operators
./operators
```
**Sample Input:** `+` → arithmetic; `==` → relational; `&&` → logical; `$` → not an operator

### 6. Word-Count (`Word-Count.lex`)

```bash
flex Word-Count.lex
gcc lex.yy.c -o word_count
./word_count
```
**Sample Input:** Read `input.txt` in the same directory.
**Output:** `Number of words = 12`, `Number of lines = 3`

---

## Quick Note on Lex Build

Every `.lex` file contains `int yywrap() { return 1; }`, so the `-lfl` flag is optional
but harmless. After running `flex file.lex`, a `lex.yy.c` is generated in the
current directory — compile that with `gcc`.
