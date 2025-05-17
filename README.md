# Prolog-List-Ops

Utility predicates in Prolog (set permutations, sum, reverse, palindrome) plus a SWI-Prolog runner script that reads an input file and streams formatted results to an output file.

A lightweight toolkit developed for Homework 8 using **SWI-Prolog**, this project showcases list manipulation predicates and a batch runner for automated testing.

---

## Features

| Predicate      | Purpose                                                       | Notes                                                            |
|----------------|---------------------------------------------------------------|------------------------------------------------------------------|
| `set/2`        | Generates every **permutation of every subset** of a list     | Removes duplicates first, then uses backtracking + `findall/3`  |
| `sum/2`        | Computes the **sum of a list** without using `sum_list/2`     | Implements recursion manually                                   |
| `reverse/2`    | Manually **reverses a list**                                   | Uses recursive accumulator logic                                |
| `palindrome/2` | Checks if a **string is a palindrome** (reads same both ways) | Relies on string ↔ character list conversion helpers             |

The included `runner.pl` script takes an input file of commands, evaluates each predicate, and writes the results to an output file.

---

## Project Structure

```text
.
├── homework8.pl     # Core Prolog predicates
├── runner.pl        # Runner script (entry point)
└── input.txt        # Sample input (you provide)
```

## Getting Started

1. Install SWI-Prolog

On macOS (Homebrew):
```bash
brew install swi-prolog
```

On Ubuntu / Debian:
```bash
sudo apt-get update
sudo apt-get install swi-prolog
```

2. Make the Runner Executable
```bash
chmod +x runner.pl
```

3. Prepare an input.txt file
Each line is a Prolog-style command:

```text
set [1,2,3]
sum [4,5,6]
reverse [a,b,c]
palindrome "racecar"
```

4. Run the Program
```bash
./runner.pl input.txt output.txt
cat output.txt
```

## Example Output
```text
set [1,2] [[1],[2],[1,2],[2,1]]
sum [4,5,6] 15
reverse [a,b,c] [c,b,a]
palindrome "racecar" true
```

## Testing Tips

You can loop through multiple input files and run them with runner.pl for bulk testing.

For CI/CD (e.g., GitHub Actions), install SWI-Prolog, then run:

```bash
./runner.pl tests/input1.txt tests/output1.txt
diff tests/output1.txt tests/expected1.txt
```
