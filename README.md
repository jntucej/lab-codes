# jntucej / lab-codes

Computer Networks + Compiler Design (CD-CN) lab programs.
Organized by topic, named by experiment.

## Layout

```
computer-networks/
  Bit-Stuffing.c         # 1a  Bit stuffing
  Character-Stuffing.c   # 1b  Character stuffing
  CRC.c                  # 2   Cyclic Redundancy Check
  Dijkstra.c             # 3   Dijkstra's shortest path
  Distance-Vector.c      # 4   Distance vector routing

cdcn-lab/
  Identifiers.lex        # 5i  Identifier validation
  Constants.lex          # 5ii  Constant validation
  Comments.lex           # 5iii  Comment detection
  Operators.lex          # 5iv  Operator classification
  Word-Count.lex         # 6   Count words & lines in a file
  input.txt              # sample input for #6

howto-run/
  README.md              # build & run instructions for all 10 programs

agent-setup/
  endpoints.json         # OMNIROUTE base_url + API key
  models.yaml            # agnes + gemini model registry
  hermes-install.md      # Hermes install (single command)
  ollama-install.sh      # Ollama + Llama 3.2 one-click
  run-models.sh          # run all local + cloud models
```

## Building

See `howto-run/README.md` for per-program commands.

C programs:
```
gcc Bit-Stuffing.c -o bit_stuffing
./bit_stuffing
```

LEX programs:
```
flex Identifiers.lex
gcc lex.yy.c -o identifiers
./identifiers
```
On macOS: `brew install flex`
On Ubuntu: `sudo apt install -y build-essential flex`

## Conventions

- Every file header says **what the program does in one line**.
- SAMPLE RUN blocks are kept inside the file so you can diff against
  your own output without scrolling.
- "SAS" marks these as the SAS (Sahithi) version of the code.
