# Sums of three cubes: 114

Focused recovery of the finite modular and computational program for `a³+b³+c³ = 114`. The historical program leaves the equation open.

The original [Lean source](lean/S3C_Oracle_114.lean) is now recovered from the local estate. It kernelizes the mod-9 and mod-7 ingredients, including the exact mod-7 one-zero-coordinate result. The historical [account](archive/README.md) combines those ingredients into the exact mod-21 CRT search sieve and records searches at H=5,000 and H=20,000.

**Formal-scope note:** the theorem named `s3c_114_combined_sieve_necessary` in the recovered Lean file proves the necessary mod-7 zero-coordinate condition; it does **not** itself formalize the complete mod-21 residue table. The mod-21 table is elementary exact arithmetic derived from the formalized mod-3/mod-7 restrictions, but it remains a written/search-layer derivation in this repository unless separately kernelized.

[Source inventory](audit/source-inventory.json) gives file hashes and an exact lexical declaration count. The original seven PARI scripts and their raw search outputs have not been recovered into this repository; historical search claims have not been rerun. No fresh Lean build is claimed.

Source: `oracle/math/EG411Formal/EG411Formal/S3C_Oracle_114.lean` in the local estate; historical public account: https://github.com/jaredwilder/unpublished-math-papers/tree/main/sums-three-cubes-114
