// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_tmp_tmp0wu8wmfr_Heimaverkefni 3_InsertionSortMultiset.dfy
// Method: Sort
// Generated: 2026-03-25 22:37:07

// Dafny_tmp_tmp0wu8wmfr_Heimaverkefni 3_InsertionSortMultiset.dfy

method Search(s: seq<int>, x: int) returns (k: int)
  requires forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  ensures 0 <= k <= |s|
  ensures forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  ensures forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  ensures forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  ensures forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  ensures s == s[..k] + s[k..]
  decreases s, x
{
  var p := 0;
  var q := |s|;
  if p == q {
    return p;
  }
  while p != q
    invariant 0 <= p <= q <= |s|
    invariant forall r: int {:trigger s[r]} | 0 <= r < p :: s[r] <= x
    invariant forall r: int {:trigger s[r]} | q <= r < |s| :: s[r] >= x
    decreases q - p
  {
    var m := p + (q - p) / 2;
    if s[m] == x {
      return m;
    }
    if s[m] < x {
      p := m + 1;
    } else {
      q := m;
    }
  }
  return p;
}

method Sort(m: multiset<int>) returns (r: seq<int>)
  ensures multiset(r) == m
  ensures forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  decreases m
{
  r := [];
  var rest := m;
  while rest != multiset{}
    invariant m == multiset(r) + rest
    invariant forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
    decreases rest
  {
    var x :| x in rest;
    rest := rest - multiset{x};
    var k := Search(r, x);
    r := r[..k] + [x] + r[k..];
  }
  return r;
}


method GeneratedTests_Sort()
{
  // Test case for combination {1}:
  //   POST: multiset(r) == m
  //   POST: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m := 0;
    var r := Sort(m);
    expect multiset(r) == m;
    expect forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q];
  }

  // Test case for combination {1}:
  //   POST: multiset(r) == m
  //   POST: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m := 1;
    var r := Sort(m);
    expect multiset(r) == m;
    expect forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q];
  }

  // Test case for combination {1}/B:
  //   POST: multiset(r) == m
  //   POST: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m := 2;
    var r := Sort(m);
    expect multiset(r) == m;
    expect forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q];
  }

}

method Main()
{
  GeneratedTests_Sort();
  print "GeneratedTests_Sort: all tests passed!\n";
}
