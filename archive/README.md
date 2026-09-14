# Sums of three cubes — structural arithmetic for k = 114

**Author:** Jared Wilder  
**Recovered from:** May 27–28, 2026 research estate  
**Public extraction:** 2026-09-11

This directory preserves the exact modular mathematics recovered for

\[
a^3+b^3+c^3=114.
\]

The equation itself is **not claimed solved** here.

## Main exact theorem — exactly one variable is divisible by 7

Every integer solution of

\[
a^3+b^3+c^3=114
\]

has **exactly one** of `a,b,c` divisible by `7`.

### Proof

The cubic residues modulo 7 are

\[
\{0,1,6\}=\{0,1,-1\}.
\]

Also

\[
114\equiv2\pmod7.
\]

The only way three elements of `{0,1,-1}` can sum to `2 mod 7` is, up to permutation,

\[
0+1+1.
\]

Thus exactly one of `a^3,b^3,c^3` is `0 mod 7`, and the other two are `1 mod 7`. Since

\[
x^3\equiv0\pmod7\iff x\equiv0\pmod7,
\]

exactly one of `a,b,c` is divisible by 7.

A convenient root-cause formulation is:

\[
\boxed{2\text{ is not a cubic residue modulo }7.}
\]

## Mod-9 structure

The cubic residues modulo 9 are

\[
\{0,1,8\}.
\]

Since

\[
114\equiv6\pmod9,
\]

any solution must have all three cubes congruent to `8 mod 9`. Consequently every variable is
congruent to `2 mod 3`.

## CRT sieve modulo 21

Combining the mod-3 and mod-7 conditions gives the following exact residue architecture after choosing
which variable is the unique multiple of 7:

| variable role | mod 3 | mod 7 | mod 21 |
|---|---:|---:|---:|
| unique multiple-of-7 variable | `2` | `0` | `14` |
| first nonzero-mod-7 variable | `2` | `{1,2,4}` | `{8,2,11}` |
| second nonzero-mod-7 variable | `2` | `{1,2,4}` | `{8,2,11}` |

Using symmetry for the choice of the multiple-of-7 coordinate, this leaves a theoretical fraction

\[
\frac1{21}\left(\frac3{21}\right)^2\cdot3
=\frac1{343}
\]

of the naive residue search space.

The historical CPU runs measured the practical consequence as approximately the same factor:

```text
unsieved search: H=5,000 in ~176 s
mod-21 sieved search: H=20,000 in ~44 s
```

Those bounded searches are tooling evidence, not a literature-level nonexistence result.

## Lean 4 formalization inventory

The recovered research log records a clean build of

```text
UNIVERSAL_LAW/oracle/math/EG411Formal/EG411Formal/S3C_Oracle_114.lean
lake build EG411Formal.S3C_Oracle_114
```

with **15 proved theorems and 0 `sorry`**. The recorded theorem inventory is:

| # | theorem | statement role | proof method recorded |
|---:|---|---|---|
| 1 | `cube_residues_mod9` | cubes mod 9 lie in `{0,1,8}` | `revert a; decide` |
| 2 | `s3c_mod9_not_four` | three cubes cannot sum to 4 mod 9 | `revert a b c; decide` |
| 3 | `s3c_mod9_not_five` | three cubes cannot sum to 5 mod 9 | `revert a b c; decide` |
| 4 | `k114_mod9` | `114 ≡ 6 mod 9` | `decide` |
| 5 | `k114_obstruction_clear` | 114 is not 4 or 5 mod 9 | `decide` |
| 6 | `s3c_114_each_cube_minus1` | sum 6 mod 9 forces all cubes 8 mod 9 | `revert a b c; decide` |
| 7 | `s3c_114_base_mod3` | cube residue 2 mod 3 forces base 2 mod 3 | `decide` |
| 8 | `s3c_114_no_soln_height3` | no solution with all absolute values ≤3 | `interval_cases + norm_num` |
| 9 | `s3c_114_from_triple` | exact future-triple verification template | `exact` |
| 10 | `cube_residues_mod7` | cubes mod 7 lie in `{0,1,6}` | `revert a; decide` |
| 11 | `k114_mod7` | `114 ≡ 2 mod 7` | `decide` |
| 12 | `s3c_114_mod7_zero_count` | exactly one variable is 0 mod 7 | `revert a b c; decide` |
| 13 | `s3c_114_mod7_one_div_by7` | excludes 0/2/3 divisible-by-7 variables | `revert a b c; decide` |
| 14 | `two_not_cube_mod7` | 2 is not a cube mod 7 | `decide` |
| 15 | `s3c_114_combined_sieve_necessary` | any solution has a 7-divisible variable | `revert a b c; decide` |

The original Lean source bytes were referenced by path in the surviving estate but were not recovered
as a standalone Library file in this extraction. This README therefore publishes the exact theorem
inventory and mathematics without fabricating source code.

## Conditional / heuristic layer — deliberately not promoted

The May campaign also computed partial singular-series products and used a Heath-Brown-style density
heuristic to estimate very large first-solution scales for `k=114`. Those numbers remain **conditional
heuristics**. They are not used in any theorem above and are not evidence that no integer solution
exists.

## Scope boundary

- `k=114` remains open in this release.
- The mod-7 theorem and mod-21 sieve are unconditional elementary arithmetic.
- The bounded PARI searches are finite computations only.
- The first-solution-height estimates are conditional heuristics only.
- No historical-priority claim is attached to the elementary modular facts.

## License

Apache-2.0 for repository-authored material.
