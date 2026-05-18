// SeqMaxSum structure WITHOUT the recursive fold: k is an OUTPUT bounded
// 0<=k<=i (no explicit interior literal); optimality is a plain (non-recursive)
// forall over array elements. BUG: s tracks the max but k is never updated
// (stays 0) — only an input whose max is at an interior index catches it.
method ArgMaxish(a: array<int>, i: nat) returns (k: nat, s: int)
  requires 0 <= i < a.Length
  ensures 0 <= k <= i
  ensures s == a[k]
  ensures forall l: nat :: 0 <= l <= i ==> a[l] <= s
{
  s := a[0];
  k := 0;
  var j := 1;
  while j <= i
    invariant 1 <= j <= i + 1
    invariant 0 <= k <= i
    invariant s == a[k]
    invariant forall l: nat :: 0 <= l < j ==> a[l] <= s
  {
    if a[j] > s {
      s := a[j];   // BUG: missing  k := j;
    }
    j := j + 1;
  }
}
