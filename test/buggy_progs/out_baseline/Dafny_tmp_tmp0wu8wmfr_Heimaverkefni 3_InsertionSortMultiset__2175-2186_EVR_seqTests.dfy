// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_tmp_tmp0wu8wmfr_Heimaverkefni 3_InsertionSortMultiset__2175-2186_EVR_seq.dfy
// Method: Search
// Generated: 2026-04-24 19:44:08

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
    r := [] + r[k..];
  }
  return r;
}


method TestsForSearch()
{
  // Test case for combination {1}:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST Q1: 0 <= k
  //   POST Q2: k <= |s|
  //   POST Q3: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST Q4: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST Q5: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST Q6: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST Q7: s == s[..k] + s[k..]
  {
    var s: seq<int> := [];
    var x := 0;
    var k := Search(s, x);
    expect k == 0;
  }

  // Test case for combination {1}/Bk=1:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST Q1: 0 <= k
  //   POST Q2: k <= |s|
  //   POST Q3: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST Q4: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST Q5: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST Q6: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST Q7: s == s[..k] + s[k..]
  {
    var s: seq<int> := [-1];
    var x := -1;
    var k := Search(s, x);
    expect k == 1 || k == 0;
    expect k == 0; // observed from implementation
  }

  // Test case for combination {1}/O|s|>=2:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST Q1: 0 <= k
  //   POST Q2: k <= |s|
  //   POST Q3: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST Q4: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST Q5: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST Q6: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST Q7: s == s[..k] + s[k..]
  {
    var s: seq<int> := [-2, -2];
    var x := -2;
    var k := Search(s, x);
    expect k == 2 || k == 1 || k == 0;
    expect k == 1; // observed from implementation
  }

  // Test case for combination {1}/Ox>0:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST Q1: 0 <= k
  //   POST Q2: k <= |s|
  //   POST Q3: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST Q4: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST Q5: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST Q6: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST Q7: s == s[..k] + s[k..]
  {
    var s: seq<int> := [17870];
    var x := 1;
    var k := Search(s, x);
    expect k == 0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST Q1: 0 <= k
  //   POST Q2: k <= |s|
  //   POST Q3: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST Q4: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST Q5: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST Q6: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST Q7: s == s[..k] + s[k..]
  {
    var s: seq<int> := [];
    var x := -3;
    var k := Search(s, x);
    expect k == 0;
  }

  // Test case for combination {1}/R6:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST Q1: 0 <= k
  //   POST Q2: k <= |s|
  //   POST Q3: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST Q4: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST Q5: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST Q6: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST Q7: s == s[..k] + s[k..]
  {
    var s: seq<int> := [];
    var x := -4;
    var k := Search(s, x);
    expect k == 0;
  }

  // Test case for combination {1}/R7:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST Q1: 0 <= k
  //   POST Q2: k <= |s|
  //   POST Q3: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST Q4: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST Q5: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST Q6: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST Q7: s == s[..k] + s[k..]
  {
    var s: seq<int> := [];
    var x := -5;
    var k := Search(s, x);
    expect k == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST Q1: 0 <= k
  //   POST Q2: k <= |s|
  //   POST Q3: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST Q4: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST Q5: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST Q6: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST Q7: s == s[..k] + s[k..]
  {
    var s: seq<int> := [];
    var x := -6;
    var k := Search(s, x);
    expect k == 0;
  }

  // Test case for combination {1}/R9:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST Q1: 0 <= k
  //   POST Q2: k <= |s|
  //   POST Q3: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST Q4: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST Q5: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST Q6: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST Q7: s == s[..k] + s[k..]
  {
    var s: seq<int> := [];
    var x := -7;
    var k := Search(s, x);
    expect k == 0;
  }

  // Test case for combination {1}/R10:
  //   PRE:  forall p: int, q: int {:trigger s[q], s[p]} | 0 <= p < q < |s| :: s[p] <= s[q]
  //   POST Q1: 0 <= k
  //   POST Q2: k <= |s|
  //   POST Q3: forall i: int {:trigger s[i]} | 0 <= i < k :: s[i] <= x
  //   POST Q4: forall i: int {:trigger s[i]} | k <= i < |s| :: s[i] >= x
  //   POST Q5: forall z: int {:trigger z in s[..k]} | z in s[..k] :: z <= x
  //   POST Q6: forall z: int {:trigger z in s[k..]} | z in s[k..] :: z >= x
  //   POST Q7: s == s[..k] + s[k..]
  {
    var s: seq<int> := [];
    var x := -8;
    var k := Search(s, x);
    expect k == 0;
  }

}

method TestsForSort()
{
  // Test case for combination {1}:
  //   POST Q1: multiset(r) == m
  //   POST Q2: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{};
    var r := Sort(m);
    expect multiset(r) == m;
    expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q];
    expect r == []; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|m|=1:
  //   POST Q1: multiset(r) == m
  //   POST Q2: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{-2};
    var r := Sort(m);
    // actual runtime state: r=[]
    // expect multiset(r) == m; // LHS=multiset{}, RHS=multiset{-2}
    // expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q]; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|m|>=2:
  //   POST Q1: multiset(r) == m
  //   POST Q2: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{5, 5};
    var r := Sort(m);
    // actual runtime state: r=[]
    // expect multiset(r) == m; // LHS=multiset{}, RHS=multiset{5, 5}
    // expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q]; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   POST Q1: multiset(r) == m
  //   POST Q2: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{5};
    var r := Sort(m);
    // actual runtime state: r=[]
    // expect multiset(r) == m; // LHS=multiset{}, RHS=multiset{5}
    // expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q]; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   POST Q1: multiset(r) == m
  //   POST Q2: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{4};
    var r := Sort(m);
    // actual runtime state: r=[]
    // expect multiset(r) == m; // LHS=multiset{}, RHS=multiset{4}
    // expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q]; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   POST Q1: multiset(r) == m
  //   POST Q2: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{2};
    var r := Sort(m);
    // actual runtime state: r=[]
    // expect multiset(r) == m; // LHS=multiset{}, RHS=multiset{2}
    // expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q]; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   POST Q1: multiset(r) == m
  //   POST Q2: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{3};
    var r := Sort(m);
    // actual runtime state: r=[]
    // expect multiset(r) == m; // LHS=multiset{}, RHS=multiset{3}
    // expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q]; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   POST Q1: multiset(r) == m
  //   POST Q2: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{-1};
    var r := Sort(m);
    // actual runtime state: r=[]
    // expect multiset(r) == m; // LHS=multiset{}, RHS=multiset{-1}
    // expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q]; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   POST Q1: multiset(r) == m
  //   POST Q2: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{0};
    var r := Sort(m);
    // actual runtime state: r=[]
    // expect multiset(r) == m; // LHS=multiset{}, RHS=multiset{0}
    // expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q]; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   POST Q1: multiset(r) == m
  //   POST Q2: forall p: int, q: int {:trigger r[q], r[p]} | 0 <= p < q < |r| :: r[p] <= r[q]
  {
    var m: multiset<int> := multiset{1};
    var r := Sort(m);
    // actual runtime state: r=[]
    // expect multiset(r) == m; // LHS=multiset{}, RHS=multiset{1}
    // expect forall p: int, q: int | 0 <= p < q < |r| :: r[p] <= r[q]; // got true
  }

}

method Main()
{
  TestsForSearch();
  print "TestsForSearch: all non-failing tests passed!\n";
  TestsForSort();
  print "TestsForSort: all non-failing tests passed!\n";
}
