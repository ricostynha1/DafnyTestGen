// k is an INPUT, bounded 0 <= k <= i, NO explicit interior literal in the spec
// (mirrors SeqMaxSum: only the bound exists; interior-ness is implied elsewhere).
// Question: does BVA spontaneously try a strictly-interior 0 < k < i value?
method ProbeK(i: nat, k: nat) returns (r: nat)
  requires 0 <= k <= i
  requires 2 <= i <= 6
  ensures r == k
{
  r := k;
}
