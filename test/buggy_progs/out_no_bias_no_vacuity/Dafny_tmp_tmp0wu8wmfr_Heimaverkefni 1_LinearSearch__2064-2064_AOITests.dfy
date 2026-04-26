// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_tmp_tmp0wu8wmfr_Heimaverkefni 1_LinearSearch__2064-2064_AOI.dfy
// Method: SearchRecursive
// Generated: 2026-04-24 21:55:31

// Dafny_tmp_tmp0wu8wmfr_Heimaverkefni 1_LinearSearch.dfy

method SearchRecursive(a: seq<int>, i: int, j: int, x: int)
    returns (k: int)
  requires 0 <= i <= j <= |a|
  ensures i <= k < j || k == -1
  ensures k != -1 ==> a[k] == x
  ensures k != -1 ==> forall r: int {:trigger a[r]} | k < r < j :: a[r] != x
  ensures k == -1 ==> forall r: int {:trigger a[r]} | i <= r < j :: a[r] != x
  decreases j - i
{
  if j == i {
    k := -1;
    return;
  }
  if a[j - 1] == x {
    k := j - 1;
    return;
  } else {
    k := SearchRecursive(a, i, j - 1, x);
  }
}

method SearchLoop(a: seq<int>, i: int, j: int, x: int)
    returns (k: int)
  requires 0 <= i <= j <= |a|
  ensures i <= k < j || k == -1
  ensures k != -1 ==> a[k] == x
  ensures k != -1 ==> forall r: int {:trigger a[r]} | k < r < j :: a[r] != x
  ensures k == -1 ==> forall r: int {:trigger a[r]} | i <= r < j :: a[r] != x
  decreases a, i, j, x
{
  if i == j {
    return -1;
  }
  var t := j;
  while t > i
    invariant forall p: int {:trigger a[p]} | t <= p < j :: a[p] != x
    decreases t
  {
    if a[t - 1] == x {
      k := t - 1;
      return;
    } else {
      t := t - -1;
    }
  }
  k := -1;
}


method TestsForSearchRecursive()
{
  // Test case for combination {2}/Rel:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i <= k
  //   POST Q2: k < j
  //   POST Q3: k != -1
  //   POST Q4: a[k] == x
  //   POST Q5: forall r: int {:trigger a[r]} | k < r < j :: a[r] != x
  {
    var a: seq<int> := [11, 11];
    var i := 0;
    var j := 2;
    var x := 11;
    var k := SearchRecursive(a, i, j, x);
    expect k == 1;
  }

  // Test case for combination {3}/Rel:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i > k
  //   POST Q2: k == -1
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < j :: a[r] != x
  {
    var a: seq<int> := [18];
    var i := 1;
    var j := 1;
    var x := 0;
    var k := SearchRecursive(a, i, j, x);
    expect k == -1;
  }

  // Test case for combination {2}/Bi=1:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i <= k
  //   POST Q2: k < j
  //   POST Q3: k != -1
  //   POST Q4: a[k] == x
  //   POST Q5: forall r: int {:trigger a[r]} | k < r < j :: a[r] != x
  {
    var a: seq<int> := [23, 10];
    var i := 1;
    var j := 2;
    var x := 10;
    var k := SearchRecursive(a, i, j, x);
    expect k == 1;
  }

  // Test case for combination {3}/Bi=0:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i > k
  //   POST Q2: k == -1
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < j :: a[r] != x
  {
    var a: seq<int> := [];
    var i := 0;
    var j := 0;
    var x := 9;
    var k := SearchRecursive(a, i, j, x);
    expect k == -1;
  }

  // Test case for combination {3}/Bi=j-1:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i > k
  //   POST Q2: k == -1
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < j :: a[r] != x
  {
    var a: seq<int> := [8];
    var i := 0;
    var j := 1;
    var x := 11;
    var k := SearchRecursive(a, i, j, x);
    expect k == -1;
  }

  // Test case for combination {2}/O|a|=1:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i <= k
  //   POST Q2: k < j
  //   POST Q3: k != -1
  //   POST Q4: a[k] == x
  //   POST Q5: forall r: int {:trigger a[r]} | k < r < j :: a[r] != x
  {
    var a: seq<int> := [10];
    var i := 0;
    var j := 1;
    var x := 10;
    var k := SearchRecursive(a, i, j, x);
    expect k == 0;
  }

  // Test case for combination {2}/Ox=0:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i <= k
  //   POST Q2: k < j
  //   POST Q3: k != -1
  //   POST Q4: a[k] == x
  //   POST Q5: forall r: int {:trigger a[r]} | k < r < j :: a[r] != x
  {
    var a: seq<int> := [0];
    var i := 0;
    var j := 1;
    var x := 0;
    var k := SearchRecursive(a, i, j, x);
    expect k == 0;
  }

  // Test case for combination {2}/Ox<0:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i <= k
  //   POST Q2: k < j
  //   POST Q3: k != -1
  //   POST Q4: a[k] == x
  //   POST Q5: forall r: int {:trigger a[r]} | k < r < j :: a[r] != x
  {
    var a: seq<int> := [-1];
    var i := 0;
    var j := 1;
    var x := -1;
    var k := SearchRecursive(a, i, j, x);
    expect k == 0;
  }

  // Test case for combination {3}/O|a|>=2:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i > k
  //   POST Q2: k == -1
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < j :: a[r] != x
  {
    var a: seq<int> := [21, 22];
    var i := 2;
    var j := 2;
    var x := 0;
    var k := SearchRecursive(a, i, j, x);
    expect k == -1;
  }

  // Test case for combination {3}/Ox<0:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i > k
  //   POST Q2: k == -1
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < j :: a[r] != x
  {
    var a: seq<int> := [23];
    var i := 0;
    var j := 0;
    var x := -1;
    var k := SearchRecursive(a, i, j, x);
    expect k == -1;
  }

}

method TestsForSearchLoop()
{
  // Test case for combination {2}/Rel:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i <= k
  //   POST Q2: k < j
  //   POST Q3: k != -1
  //   POST Q4: a[k] == x
  //   POST Q5: forall r: int {:trigger a[r]} | k < r < j :: a[r] != x
  {
    var a: seq<int> := [11, 11];
    var i := 0;
    var j := 2;
    var x := 11;
    var k := SearchLoop(a, i, j, x);
    expect k == 1;
  }

  // Test case for combination {3}/Rel:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i > k
  //   POST Q2: k == -1
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < j :: a[r] != x
  {
    var a: seq<int> := [18];
    var i := 1;
    var j := 1;
    var x := 0;
    var k := SearchLoop(a, i, j, x);
    expect k == -1;
  }

  // Test case for combination {2}/Bi=1:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i <= k
  //   POST Q2: k < j
  //   POST Q3: k != -1
  //   POST Q4: a[k] == x
  //   POST Q5: forall r: int {:trigger a[r]} | k < r < j :: a[r] != x
  {
    var a: seq<int> := [23, 10];
    var i := 1;
    var j := 2;
    var x := 10;
    var k := SearchLoop(a, i, j, x);
    expect k == 1;
  }

  // Test case for combination {3}/Bi=0:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i > k
  //   POST Q2: k == -1
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < j :: a[r] != x
  {
    var a: seq<int> := [];
    var i := 0;
    var j := 0;
    var x := 9;
    var k := SearchLoop(a, i, j, x);
    expect k == -1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/Bi=j-1:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i > k
  //   POST Q2: k == -1
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < j :: a[r] != x
  {
    var a: seq<int> := [8];
    var i := 0;
    var j := 1;
    var x := 11;
    var k := SearchLoop(a, i, j, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyCBT_lkwrd4pw413\runner.cs:line 1642
    // expect k == -1;
  }

  // Test case for combination {2}/O|a|=1:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i <= k
  //   POST Q2: k < j
  //   POST Q3: k != -1
  //   POST Q4: a[k] == x
  //   POST Q5: forall r: int {:trigger a[r]} | k < r < j :: a[r] != x
  {
    var a: seq<int> := [10];
    var i := 0;
    var j := 1;
    var x := 10;
    var k := SearchLoop(a, i, j, x);
    expect k == 0;
  }

  // Test case for combination {2}/Ox=0:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i <= k
  //   POST Q2: k < j
  //   POST Q3: k != -1
  //   POST Q4: a[k] == x
  //   POST Q5: forall r: int {:trigger a[r]} | k < r < j :: a[r] != x
  {
    var a: seq<int> := [0];
    var i := 0;
    var j := 1;
    var x := 0;
    var k := SearchLoop(a, i, j, x);
    expect k == 0;
  }

  // Test case for combination {2}/Ox<0:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i <= k
  //   POST Q2: k < j
  //   POST Q3: k != -1
  //   POST Q4: a[k] == x
  //   POST Q5: forall r: int {:trigger a[r]} | k < r < j :: a[r] != x
  {
    var a: seq<int> := [-1];
    var i := 0;
    var j := 1;
    var x := -1;
    var k := SearchLoop(a, i, j, x);
    expect k == 0;
  }

  // Test case for combination {3}/O|a|>=2:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i > k
  //   POST Q2: k == -1
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < j :: a[r] != x
  {
    var a: seq<int> := [21, 22];
    var i := 2;
    var j := 2;
    var x := 0;
    var k := SearchLoop(a, i, j, x);
    expect k == -1;
  }

  // Test case for combination {3}/Ox<0:
  //   PRE:  0 <= i <= j <= |a|
  //   POST Q1: i > k
  //   POST Q2: k == -1
  //   POST Q3: forall r: int {:trigger a[r]} | i <= r < j :: a[r] != x
  {
    var a: seq<int> := [23];
    var i := 0;
    var j := 0;
    var x := -1;
    var k := SearchLoop(a, i, j, x);
    expect k == -1;
  }

}

method Main()
{
  TestsForSearchRecursive();
  print "TestsForSearchRecursive: all non-failing tests passed!\n";
  TestsForSearchLoop();
  print "TestsForSearchLoop: all non-failing tests passed!\n";
}
