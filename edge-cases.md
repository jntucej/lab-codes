# Edge Cases — the ones examiners actually ask

## 1. Bit Stuffing: fewer than 5 consecutive 1s

**Question:** What happens to `11110` (only 4 ones, then a 0)?

**Answer:** Nothing is stuffed. The counter resets to 0 on the `0`,
and the output is `11110` unchanged. Stuffing only triggers on the
5th consecutive 1.

**Tricky variant:** `11111` (exactly 5 ones, end of input)
→ one 0 is appended → `111110`. The stuffing 0 at the end is NOT
the frame flag because flag detection needs a following 1 sequence
or the actual 01111110 pattern — the stuffed 0 alone doesn't form
the flag.

## 2. Bit Stuffing: 6 or more consecutive 1s

**Input:** `111111`
**Step 1:** After 5 ones, a 0 is stuffed → `111110`
**Step 2:** The 6th `1` now resets nothing (counter was reset by the 0),
so it's just appended → `1111101`
**Key insight:** every group of 5 ones gets its own stuffing 0.

## 3. Character Stuffing: consecutive flag AND escape chars

**Input:** `AR` with flag='A', escape='R'
- 'A' is the flag → gets escaped → `RA`
- 'R' is the escape → gets escaped → `RR`
- Output: `RARR`

On receive: R A R R → swallow R → A, swallow R → R → original `AR`
Correct round-trip.

## 4. CRC: divisor is all 1s (edge case, not typical)

**Not a practical edge** — in lab problems divisors like `1101`
always start with 1 (that's what makes the division work).
If you were asked "what if divisor starts with 0?", the binary
long division in this code would not behave correctly —
the `bit` check at the top of each step assumes MSB alignment.
Answer in class: "divisor must be of the form 1xxxx."

## 5. CRC: data shorter than divisor

**Data = "11", divisor = "1101"**
Append (4-1)=3 zeros → "11000". Division still works because the
code handles the general case. Remainder is 0 (11000 ÷ 1101 = 1 rem 0
approximately — verify by hand for your specific numbers).

## 6. Dijkstra: disconnected graph

**Graph where node 4 is unreachable from start 0:**
`dist[4]` stays at `INF` (9999).
The code prints `Distance of node 4 = 9999` which is the expected
"no path" marker. If your examiner asks to handle this,
add a check: `if (dist[i] == INF) printf("no path")`.

## 7. Dijkstra: multiple equal-cost paths

**Two paths both costing 10 to node 2:**
The algorithm picks the FIRST one it finds (implementation-dependent
tie-break). To get deterministic behavior, add a `<` vs `<=` choice:
`<` (current) keeps the earlier-found path; `<=` would prefer
the later one. Either is valid as long as you document it.

## 8. Dijkstra: negative weights

**Not supported.** Dijkstra's is only correct for non-negative
edge weights. If the matrix has a negative number, the result is
wrong. Answer in class: "use Bellman-Ford instead."

## 9. Distance Vector: cost matrix has 99 (infinity)

**99 is your class's "no direct link" convention.**
The algorithm treats `99` as a real cost, so it will still find
paths via 99 if no better route exists. In production you'd use
a proper `INF` type, but for lab purposes, 99 works as long as
no legitimate path sum exceeds 99.

## 10. Distance Vector: convergence

**The `do/while(count != 0)` loop converges when no table changes
in a full pass.** For 4 nodes this usually takes 2-3 passes.
For N nodes, worst case is O(N^3) passes total.

## LEX Edge Cases

## 11. LEX: identifier starting with underscore

**`_foo`** — matches `[a-zA-Z_]` → Valid Identifier.
**`_1`** — Valid. `_` is a legitimate first character in C.

## 12. LEX: identifier with digits only

**`123`** — doesn't match the identifier rule, falls to `.*`
→ Invalid Identifier. Correct.

## 13. LEX: constant with no digits after decimal

**`6.`** — doesn't match the float rule `[0-9]+\.[0-9]+`
(the `+` requires at least one digit after the dot).
Falls to `.*` → Invalid constant. Correct in this program.

**`6.7`** — valid float. **`.7`** — invalid (no leading digit).

## 14. LEX: empty input

**Just pressing Enter** — matches `.*` → Invalid/Not a comment.
All 5 LEX programs handle this gracefully via the catch-all rule.

## 15. LEX: `/*` without closing `*/`

**The multi-line rule requires the closing `*/`.**
An unclosed `/*` falls to `.*` → "Not a comment."
This is actually correct LEX behavior — it's a one-line token match,
not a multi-line scanner. Real compilers use a different strategy.

## 16. LEX operator precedence: `+` vs `+=`

**LEX matches longest, then first-listed.**
`+=` matches the `+` rule AND the `+=` rule → longest wins →
`+=` rule fires. No ambiguity issue as long as `+=` is listed.

## 17. LEX count-words: punctuation attached to words

**"program."** — the period doesn't match `[a-zA-Z0-9]+`,
so LEX counts "program" as one word (the `.` is swallowed by
the whitespace-or-other rule). Punctuation is NOT counted.
**This is why the sample output is 12 words, not 13** —
the dot in "lines." is ignored.
