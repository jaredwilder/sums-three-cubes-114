# Sums of three cubes — 114

This repository contains the recovered modular and computational program for

\[
a^3+b^3+c^3=114.
\]

The equation itself remains unresolved in this package.

## Formal ingredients

[`lean/S3C_Oracle_114.lean`](lean/S3C_Oracle_114.lean) formalizes the mod-9 and mod-7 restrictions used by the search, including the exact mod-7 one-zero-coordinate condition.

These ingredients feed an exact mod-21 CRT sieve described in [`archive/README.md`](archive/README.md). The historical computation records searches at `H=5,000` and `H=20,000`.

The Lean theorem named `s3c_114_combined_sieve_necessary` proves the necessary mod-7 zero-coordinate condition. The complete mod-21 residue table is an exact arithmetic consequence used by the search layer, but it is not itself kernelized in the recovered file.

## Source inventory

[`audit/source-inventory.json`](audit/source-inventory.json) records file hashes and declaration counts for the recovered source.

The original seven PARI scripts and their raw output files are not present in this repository, so the historical large searches have not been rerun here.

## Main files

- [`lean/S3C_Oracle_114.lean`](lean/S3C_Oracle_114.lean) — modular Lean development.
- [`archive/README.md`](archive/README.md) — CRT sieve and recorded computational program.
- [`audit/source-inventory.json`](audit/source-inventory.json) — source inventory and hashes.

Author: Jared Wilder.
