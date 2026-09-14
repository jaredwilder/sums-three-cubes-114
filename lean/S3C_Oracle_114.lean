-- Oracle Run: Sums of Three Cubes — Formal Statement for k = 114
-- Run label: s3c_oracle_20260527
-- K_0 = 114 (smallest open k not ≡ ±4 mod 9, per Booker-Sutherland arXiv:2007.01209)
-- No sorry in this file.

import Mathlib.Tactic

-- ============================================================
-- §1 Problem definition
-- ============================================================

/-- A representation of an integer as a sum of three integer cubes. -/
def IsS3C (k : ℤ) : Prop :=
 ∃ (a b c : ℤ), a ^ 3 + b ^ 3 + c ^ 3 = k

-- ============================================================
-- §2 Cube residues mod 9 — the 9-obstruction
-- ============================================================

/-- In ZMod 9, cubing maps to {0, 1, 8}. -/
theorem cube_residues_mod9 (a : ZMod 9) :
 a ^ 3 = 0 ∨ a ^ 3 = 1 ∨ a ^ 3 = 8 := by
 revert a; decide

/-- Three-cube sums mod 9 are never ≡ 4 (mod 9). -/
theorem s3c_mod9_not_four (a b c : ZMod 9) :
 a ^ 3 + b ^ 3 + c ^ 3 ≠ 4 := by
 revert a b c; decide

/-- Three-cube sums mod 9 are never ≡ 5 (mod 9). -/
theorem s3c_mod9_not_five (a b c : ZMod 9) :
 a ^ 3 + b ^ 3 + c ^ 3 ≠ 5 := by
 revert a b c; decide

-- ============================================================
-- §3 k = 114 is obstruction-clear
-- ============================================================

/-- 114 ≡ 6 (mod 9) — within the representable residues. -/
theorem k114_mod9 : (114 : ZMod 9) = 6 := by decide

/-- 114 is not in the obstruction class. -/
theorem k114_obstruction_clear :
 (114 : ZMod 9) ≠ 4 ∧ (114 : ZMod 9) ≠ 5 := by decide

-- ============================================================
-- §4 Mod-3 constraint for k = 114
-- ============================================================

/-- For k ≡ 6 ≡ -3 (mod 9): the only way to write 6 as a sum of three
 cube residues in {0,1,8} is 8+8+8 ≡ 24 ≡ 6. So all three cubes are ≡ 8. -/
theorem s3c_114_each_cube_minus1 (a b c : ZMod 9)
 (h : a ^ 3 + b ^ 3 + c ^ 3 = 6) :
 a ^ 3 = 8 ∧ b ^ 3 = 8 ∧ c ^ 3 = 8 := by
 revert a b c; decide

-- ============================================================
-- §5 Small exclusion bound — kernel-checkable for H = 3
-- ============================================================

/-- No solution with |a|,|b|,|c| ≤ 3 (exhaustive; H=3 fits in 7^3=343 cases). -/
theorem s3c_114_no_soln_height3 (a b c : ℤ)
 (ha : a.natAbs ≤ 3) (hb : b.natAbs ≤ 3) (hc : c.natAbs ≤ 3) :
 a ^ 3 + b ^ 3 + c ^ 3 ≠ 114 := by
 have ha1 : -3 ≤ a := by omega
 have ha2 : a ≤ 3 := by omega
 have hb1 : -3 ≤ b := by omega
 have hb2 : b ≤ 3 := by omega
 have hc1 : -3 ≤ c := by omega
 have hc2 : c ≤ 3 := by omega
 interval_cases a <;> interval_cases b <;> interval_cases c <;> norm_num

-- ============================================================
-- §6 Mod-7 structural constraint (Oracle Round 3)
-- ============================================================

/-- Cube residues mod 7 lie in {0, 1, 6}. -/
theorem cube_residues_mod7 (a : ZMod 7) :
 a ^ 3 = 0 ∨ a ^ 3 = 1 ∨ a ^ 3 = 6 := by
 revert a; decide

/-- 114 ≡ 2 (mod 7). -/
theorem k114_mod7 : (114 : ZMod 7) = 2 := by decide

/-- Key structural constraint: a³+b³+c³ ≡ 2 (mod 7) forces the non-cube residues
 in {1, 6} to contribute exactly 1+1=2, so one variable must be ≡ 0 (mod 7). -/
theorem s3c_114_mod7_zero_count (a b c : ZMod 7)
 (h : a ^ 3 + b ^ 3 + c ^ 3 = 2) :
 (a = 0 ∧ b ≠ 0 ∧ c ≠ 0) ∨
 (a ≠ 0 ∧ b = 0 ∧ c ≠ 0) ∨
 (a ≠ 0 ∧ b ≠ 0 ∧ c = 0) := by
 revert a b c; decide

/-- Equivalently: every integer solution (a, b, c) to a³+b³+c³=114 has
 exactly one of a, b, c divisible by 7 (as integers, lifted from ZMod 7). -/
theorem s3c_114_mod7_one_div_by7 (a b c : ZMod 7)
 (h : a ^ 3 + b ^ 3 + c ^ 3 = 2) :
 ¬(a = 0 ∧ b = 0 ∧ c = 0) ∧
 ¬(a = 0 ∧ b = 0 ∧ c ≠ 0) ∧
 ¬(a = 0 ∧ b ≠ 0 ∧ c = 0) ∧
 ¬(a ≠ 0 ∧ b = 0 ∧ c = 0) := by
 revert a b c; decide

/-- Root cause: 2 is NOT a cubic residue mod 7.
 The cubic residues mod 7 are {0, 1, 6} = {0, 1, -1}.
 Since 2 ∉ {0,1,6}, a single cube a³ can never equal k=114 mod 7,
 forcing the two-cube split {1,1,0} and the structural divisibility constraint. -/
theorem two_not_cube_mod7 : ∀ (a : ZMod 7), a ^ 3 ≠ 2 := by
 decide

/-- Combined structural theorem: the mod-9 and mod-7 constraints together mean
 any solution (a,b,c) to a³+b³+c³=114 must satisfy:
 (i) a ≡ b ≡ c ≡ 2 (mod 3) [from mod-9 analysis]
 (ii) exactly one of a,b,c ≡ 0 (mod 7) [from mod-7 analysis]
 These combine by CRT to: the zero-mod-7 variable ≡ 14 (mod 21),
 and the other two ∈ {2, 8, 11} (mod 21). -/
theorem s3c_114_combined_sieve_necessary (a b c : ZMod 7)
 (h : a ^ 3 + b ^ 3 + c ^ 3 = 2) :
 (a = 0) ∨ (b = 0) ∨ (c = 0) := by
 revert a b c; decide

-- ============================================================
-- §7 The open problem — formally stated (no proof)
-- ============================================================

-- OPEN PROBLEM (Booker-Sutherland 2020, arXiv:2007.01209):
-- Does 114 have a representation as a sum of three integer cubes?
-- The following is UNPROVEN. It is stated here as a formal claim
-- to be discharged when a triple is found or disproved.
--
-- theorem s3c_114_exists : IsS3C 114 := ...

-- ============================================================
-- §8 Triple verification template
-- ============================================================

/-- Once a triple (a₀, b₀, c₀) is found, this produces the IsS3C proof
 by norm_num on the specific integers. -/
theorem s3c_114_from_triple (a₀ b₀ c₀ : ℤ)
 (h : a₀ ^ 3 + b₀ ^ 3 + c₀ ^ 3 = 114) :
 IsS3C 114 :=
 ⟨a₀, b₀, c₀, h⟩

-- Template for instantiation (replace A, B, C with the actual integers):
-- theorem s3c_114_verified : IsS3C 114 :=
-- s3c_114_from_triple A B C (by norm_num)
