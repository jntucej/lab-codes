# jntucej / lab-codes

Computer Networks + Compiler Design (CD-CN) lab programs.
Organized by topic, named by experiment.

## Layout

```
computer-networks/
  bits-stuffing.c        # 1a  Bit stuffing
  char-stuffing.c        # 1b  Character stuffing
  crc.c                  # 2   Cyclic Redundancy Check
  dijkstra.c             # 3   Dijkstra's shortest path
  distance-vector.c      # 4   Distance vector routing

cdcn-lab/
  identifiers.lex        # 5i  Identifier validation
  constants.lex         # 5ii  Constant validation
  comments.lex          # 5iii Comment detection
  operators.lex         # 5iv  Operator classification
  count-words-lines.lex # 6   Count words & lines in a file
  input.txt             # sample input for #6
```

## Building

C programs:
```
gcc bits-stuffing.c -o bit_stuff
./bit_stuff
```

LEX programs (need flex):
```
flex identifiers.lex -o identifiers.c
gcc identifiers.c -lfl -o identifiers
./identifiers
```
On macOS: `brew install flex`
On Ubuntu: `sudo apt-get install flex`

## Conventions

- Every file header says **what the program does in one line**.
- SAMPLE RUN blocks are kept inside the file so you can diff against
  your own output without scrolling.
- "SAS" marks these as the SAS (Sahithi) version of the code.
