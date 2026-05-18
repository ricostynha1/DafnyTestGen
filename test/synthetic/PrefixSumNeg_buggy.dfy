// Buggy variant of PrefixSumNeg — ODL mutation (delete left operand of `+`):
//   t := t + s[i];   -->   t := s[i];
// The mutant tests "any single element < 0" instead of "any prefix sum < 0".
// Killing witness: [5, -3]  (correct = false, mutant = true).

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
    t := s[i];
    if t < 0 {
      r := true;
    }
  }
}
