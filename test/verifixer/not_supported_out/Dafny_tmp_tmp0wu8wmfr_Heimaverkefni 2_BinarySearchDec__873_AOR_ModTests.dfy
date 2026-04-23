// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\not_supported\Dafny_tmp_tmp0wu8wmfr_Heimaverkefni 2_BinarySearchDec__873_AOR_Mod.dfy
// Method: SearchRecursive
// Generated: 2026-04-22 21:30:45

// Dafny_tmp_tmp0wu8wmfr_Heimaverkefni 2_BinarySearchDec.dfy

method SearchRecursive(a: seq<real>, i: int, j: int, x: real)
    returns (k: int)
  requires 0 <= i <= j <= |a|
  requires forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  ensures i <= k <= j
  ensures forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  ensures forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  decreases j - i
{
  if i == j {
    return i;
  }
  var m := i + (j - i) % 2;
  if a[m] < x {
    k := SearchRecursive(a, i, m, x);
  } else {
    k := SearchRecursive(a, m + 1, j, x);
  }
}

method SearchLoop(a: seq<real>, i: int, j: int, x: real)
    returns (k: int)
  requires 0 <= i <= j <= |a|
  requires forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  ensures i <= k <= j
  ensures forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  ensures forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  decreases a, i, j, x
{
  if i == j {
    return i;
  }
  var p := i;
  var q := j;
  while p != q
    invariant i <= p <= q <= j
    invariant forall r: int {:trigger a[r]} | i <= r < p :: a[r] >= x
    invariant forall r: int {:trigger a[r]} | q <= r < j :: a[r] < x
    decreases q - p
  {
    var m := p + (q - p) / 2;
    if a[m] < x {
      q := m;
    } else {
      p := m + 1;
    }
  }
  return p;
}

method Test(a: seq<real>, x: real)
  requires forall p: int, q: int {:trigger a[q], a[p]} | 0 <= p < q < |a| :: a[p] >= a[q]
  decreases a, x
{
  var k1 := SearchLoop(a, 0, |a|, x);
  assert forall r: int {:trigger a[r]} | 0 <= r < k1 :: a[r] >= x;
  assert forall r: int {:trigger a[r]} | k1 <= r < |a| :: a[r] < x;
  var k2 := SearchRecursive(a, 0, |a|, x);
  assert forall r: int {:trigger a[r]} | 0 <= r < k2 :: a[r] >= x;
  assert forall r: int {:trigger a[r]} | k2 <= r < |a| :: a[r] < x;
}


method TestsForSearchRecursive()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST Q1: i <= k
  //   POST Q2: k <= j
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST Q4: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [11713.875, 11714.0, 11714.0];
    var i := 2;
    var j := 3;
    var x := 11714.0;
    var k := SearchRecursive(a, i, j, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyTestGen_3xthgorlzbj\runner.cs:line 1404
    // expect k == 3;
  }

  // Test case for combination {1}/Bi=0:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST Q1: i <= k
  //   POST Q2: k <= j
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST Q4: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [18368.25, 18368.25];
    var i := 0;
    var j := 2;
    var x := 18369.125;
    var k := SearchRecursive(a, i, j, x);
    expect k == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bi=1:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST Q1: i <= k
  //   POST Q2: k <= j
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST Q4: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [-18369.0, -0.25];
    var i := 1;
    var j := 2;
    var x := 0.625;
    var k := SearchRecursive(a, i, j, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyTestGen_3xthgorlzbj\runner.cs:line 1404
    // expect k == 1;
  }

  // Test case for combination {1}/Bi=j:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST Q1: i <= k
  //   POST Q2: k <= j
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST Q4: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [-18369.089285714286, -0.3392857142857143];
    var i := 2;
    var j := 2;
    var x := 0.5357142857142857;
    var k := SearchRecursive(a, i, j, x);
    expect k == 2;
  }

}

method TestsForSearchLoop()
{
  // Test case for combination {1}/Rel:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST Q1: i <= k
  //   POST Q2: k <= j
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST Q4: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [0.0, -25995.25, -25995.0, -25995.0];
    var i := 2;
    var j := 4;
    var x := -25995.25;
    var k := SearchLoop(a, i, j, x);
    expect k == 4;
  }

  // Test case for combination {1}/Bi=0:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST Q1: i <= k
  //   POST Q2: k <= j
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST Q4: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [28332.0, 28332.0];
    var i := 0;
    var j := 2;
    var x := 28332.0;
    var k := SearchLoop(a, i, j, x);
    expect k == 2;
  }

  // Test case for combination {1}/Bi=1:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST Q1: i <= k
  //   POST Q2: k <= j
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST Q4: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [-28332.0, -0.5];
    var i := 1;
    var j := 2;
    var x := 0.375;
    var k := SearchLoop(a, i, j, x);
    expect k == 1;
  }

  // Test case for combination {1}/Bi=j:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST Q1: i <= k
  //   POST Q2: k <= j
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST Q4: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [-28332.05, -0.55];
    var i := 2;
    var j := 2;
    var x := 0.05;
    var k := SearchLoop(a, i, j, x);
    expect k == 2;
  }

}

method Main()
{
  TestsForSearchRecursive();
  print "TestsForSearchRecursive: all non-failing tests passed!\n";
  TestsForSearchLoop();
  print "TestsForSearchLoop: all non-failing tests passed!\n";
}
