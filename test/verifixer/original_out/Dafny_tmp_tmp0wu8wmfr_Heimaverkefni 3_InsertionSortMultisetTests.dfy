// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_tmp_tmp0wu8wmfr_Heimaverkefni 3_InsertionSortMultiset.dfy
// Method: Search
// Generated: 2026-04-08 19:05:42

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST: 0 <= k <= |s|
  //   POST: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST: s == s[..k] + s[k..]
  //   ENSURES: 0 <= k <= |s|
  //   ENSURES: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   ENSURES: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   ENSURES: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   ENSURES: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   ENSURES: s == s[..k] + s[k..]
  {
    var s: seq<int> := [7719];
    var x := 0;
    var k := Search(s, x);
    expect k == 0;
  }

  // Test case for combination {1}/Bs=0,x=0:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST: 0 <= k <= |s|
  //   POST: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST: s == s[..k] + s[k..]
  //   ENSURES: 0 <= k <= |s|
  //   ENSURES: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   ENSURES: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   ENSURES: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   ENSURES: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   ENSURES: s == s[..k] + s[k..]
  {
    var s: seq<int> := [];
    var x := 0;
    var k := Search(s, x);
    expect k == 0;
  }

  // Test case for combination {1}/Bs=0,x=1:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST: 0 <= k <= |s|
  //   POST: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST: s == s[..k] + s[k..]
  //   ENSURES: 0 <= k <= |s|
  //   ENSURES: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   ENSURES: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   ENSURES: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   ENSURES: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   ENSURES: s == s[..k] + s[k..]
  {
    var s: seq<int> := [];
    var x := 1;
    var k := Search(s, x);
    expect k == 0;
  }

  // Test case for combination {1}/Bs=1,x=1:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST: 0 <= k <= |s|
  //   POST: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST: s == s[..k] + s[k..]
  //   ENSURES: 0 <= k <= |s|
  //   ENSURES: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   ENSURES: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   ENSURES: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   ENSURES: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   ENSURES: s == s[..k] + s[k..]
  {
    var s: seq<int> := [39];
    var x := 1;
    var k := Search(s, x);
    expect k == 0;
  }

  // Test case for combination {1}/Ok>0:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST: 0 <= k <= |s|
  //   POST: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST: s == s[..k] + s[k..]
  //   ENSURES: 0 <= k <= |s|
  //   ENSURES: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   ENSURES: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   ENSURES: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   ENSURES: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   ENSURES: s == s[..k] + s[k..]
  {
    var s: seq<int> := [-1];
    var x := -1;
    var k := Search(s, x);
    expect k == 0;
  }

  // Test case for combination {1}/Ok=0:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST: 0 <= k <= |s|
  //   POST: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST: s == s[..k] + s[k..]
  //   ENSURES: 0 <= k <= |s|
  //   ENSURES: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   ENSURES: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   ENSURES: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   ENSURES: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   ENSURES: s == s[..k] + s[k..]
  {
    var s: seq<int> := [0];
    var x := -2;
    var k := Search(s, x);
    expect k == 0;
  }

  // Test case for combination {1}:
  //   POST: multiset(r) == m
  //   POST: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  //   ENSURES: multiset(r) == m
  //   ENSURES: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{};
    var r := Sort(m);
    expect r == [];
    expect multiset(r) == m;
    expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q];
  }

  // Test case for combination {1}/Bm=1:
  //   POST: multiset(r) == m
  //   POST: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  //   ENSURES: multiset(r) == m
  //   ENSURES: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{-2};
    var r := Sort(m);
    expect r == [-2];
    expect multiset(r) == m;
    expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q];
  }

  // Test case for combination {1}/Bm=2:
  //   POST: multiset(r) == m
  //   POST: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  //   ENSURES: multiset(r) == m
  //   ENSURES: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{-2, -2};
    var r := Sort(m);
    expect r == [-2, -2];
    expect multiset(r) == m;
    expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q];
  }

  // Test case for combination {1}/Bm=3:
  //   POST: multiset(r) == m
  //   POST: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  //   ENSURES: multiset(r) == m
  //   ENSURES: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{-2, -2, -2};
    var r := Sort(m);
    expect r == [-2, -2, -2];
    expect multiset(r) == m;
    expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q];
  }

  // Test case for combination {1}/O|r|>=3:
  //   POST: multiset(r) == m
  //   POST: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  //   ENSURES: multiset(r) == m
  //   ENSURES: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{5};
    var r := Sort(m);
    expect r == [5];
    expect multiset(r) == m;
    expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q];
  }

  // Test case for combination {1}/O|r|>=2:
  //   POST: multiset(r) == m
  //   POST: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  //   ENSURES: multiset(r) == m
  //   ENSURES: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{4};
    var r := Sort(m);
    expect r == [4];
    expect multiset(r) == m;
    expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q];
  }

  // Test case for combination {1}/O|r|=1:
  //   POST: multiset(r) == m
  //   POST: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  //   ENSURES: multiset(r) == m
  //   ENSURES: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{3};
    var r := Sort(m);
    expect r == [3];
    expect multiset(r) == m;
    expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q];
  }

}

method Failing()
{
  // (no failing tests)
}

method Main()
{
  Passing();
  Failing();
}
