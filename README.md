# Sums of three cubes — the case `114`

For

\[
a^3+b^3+c^3=114,
\]

this repository develops exact congruence restrictions and a mod-21 sieve used in finite searches for integer solutions.

## Exact modular restriction

The Lean development [`lean/S3C_Oracle_114.lean`](lean/S3C_Oracle_114.lean) formalizes the mod-9 and mod-7 constraints relevant to `114`.

In particular, the theorem

```text
s3c_114_combined_sieve_necessary
```

proves the necessary mod-7 condition used by the search: any solution lies in the residue pattern in which the required coordinate class vanishes modulo 7.

Combined with the mod-3/mod-9 information, this yields an exact CRT filter modulo 21. The complete residue table and its use in the finite search are described in [`archive/README.md`](archive/README.md).

## Finite computation

The recovered computation records searches at

```text
H = 5,000
H = 20,000
```

under the mod-21 sieve.

The modular restrictions are exact. The historical large-search record is less complete: the original seven PARI scripts and their raw output files were not recovered into this repository, so those runs are preserved as historical computation records rather than presented as newly replayed searches.

## Formal source

The main formal file is

- [`lean/S3C_Oracle_114.lean`](lean/S3C_Oracle_114.lean) — Lean proofs of the modular restrictions.

[`audit/source-inventory.json`](audit/source-inventory.json) records source hashes and declaration counts for the recovered package.

The full mod-21 residue table is an exact arithmetic consequence used by the search layer, but it is not separately kernelized in the recovered Lean file.

## Scope

The contribution here is the modular reduction and the recovered finite-search program. The Diophantine equation

\[
a^3+b^3+c^3=114
\]

is not solved by the material currently in this repository.

Author: Jared Wilder.
