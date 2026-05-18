// Synthetic spike target — recursive-fold-under-symbolic-existential.
//
// sum(s, n) is an associative integer fold over the first n elements
// (prefix sum). The postcondition asks whether ANY prefix sum is < 0,
// quantifying the fold depth `n` existentially. This is the minimal shape
// of the Sum2/min/prime/Inorder/BelowZero cluster: contract-based
// generation residualises `sum(s, n)` (recursive call at a symbolic depth)
// and cannot steer inputs to the discriminating partition.
//
// Discriminating input (the one the bounded-fold encoding should find):
//   [5, -3]  — a negative element exists, but no prefix sum is < 0,
//              so the correct method returns false. A mutant that checks
//              "any single element < 0" returns true → killed.

function sum(s: seq<int>, n: nat): int
  requires n <= |s|
{
  if n == 0 then 0 else sum(s, n - 1) + s[n - 1]
}

lemma sumStep(s: seq<int>, i: nat)
  requires i < |s|
  ensures sum(s, i) + s[i] == sum(s, i + 1)
{
}

method HasNegPrefix(s: seq<int>) returns (r: bool)
  ensures r <==> exists n: nat :: n <= |s| && sum(s, n) < 0
{
  r := false;
  var t := 0;
  for i := 0 to |s|
    invariant t == sum(s, i)
    invariant r <==> exists n: nat :: n <= i && sum(s, n) < 0
  {
    sumStep(s, i);
    t := t + s[i];
    if t < 0 {
      r := true;
    }
  }
}
