// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\assertive-programming-assignment-1_tmp_tmp3h_cj44u_SearchAddends__765_AOR_Mul.dfy
// Method: FindAddends
// Generated: 2026-04-24 21:30:10

// assertive-programming-assignment-1_tmp_tmp3h_cj44u_SearchAddends.dfy

method OriginalMain()
{
  var q := [1, 2, 4, 5, 6, 7, 10, 23];
  assert Sorted(q);
  assert HasAddends(q, 10) by {
    assert q[2] + q[4] == 4 + 6 == 10;
  }
  var i, j := FindAddends(q, 10);
  print "Searching for addends of 10 in q == [1,2,4,5,6,7,10,23]:\n";
  print "Found that q[";
  print i;
  print "] + q[";
  print j;
  print "] == ";
  print q[i];
  print " + ";
  print q[j];
  print " == 10";
  assert i == 2 && j == 4;
}

predicate Sorted(q: seq<int>)
  decreases q
{
  forall i: int, j: int {:trigger q[j], q[i]} :: 
    0 <= i <= j < |q| ==>
      q[i] <= q[j]
}

predicate HasAddends(q: seq<int>, x: int)
  decreases q, x
{
  exists i: int, j: int {:trigger q[j], q[i]} :: 
    0 <= i < j < |q| &&
    q[i] + q[j] == x
}

method FindAddends(q: seq<int>, x: int)
    returns (i: nat, j: nat)
  requires Sorted(q) && HasAddends(q, x)
  ensures i < j < |q| && q[i] + q[j] == x
  decreases q, x
{
  i := 0;
  j := |q| - 1;
  var sum := q[i] * q[j];
  while sum != x
    invariant LoopInv(q, x, i, j, sum)
    decreases j - i
  {
    if sum > x {
      LoopInvWhenSumIsBigger(q, x, i, j, sum);
      j := j - 1;
    } else {
      i := i + 1;
    }
    sum := q[i] + q[j];
  }
}

predicate IsValidIndex<T>(q: seq<T>, i: nat)
  decreases q, i
{
  0 <= i < |q|
}

predicate AreOreredIndices<T>(q: seq<T>, i: nat, j: nat)
  decreases q, i, j
{
  0 <= i < j < |q|
}

predicate AreAddendsIndices(q: seq<int>, x: int, i: nat, j: nat)
  requires IsValidIndex(q, i) && IsValidIndex(q, j)
  decreases q, x, i, j
{
  q[i] + q[j] == x
}

predicate HasAddendsInIndicesRange(q: seq<int>, x: int, i: nat, j: nat)
  requires AreOreredIndices(q, i, j)
  decreases q, x, i, j
{
  HasAddends(q[i .. j + 1], x)
}

predicate LoopInv(q: seq<int>, x: int, i: nat, j: nat, sum: int)
  decreases q, x, i, j, sum
{
  AreOreredIndices(q, i, j) &&
  HasAddendsInIndicesRange(q, x, i, j) &&
  AreAddendsIndices(q, sum, i, j)
}

lemma LoopInvWhenSumIsBigger(q: seq<int>, x: int, i: nat, j: nat, sum: int)
  requires HasAddends(q, x)
  requires Sorted(q)
  requires sum > x
  requires LoopInv(q, x, i, j, sum)
  ensures HasAddendsInIndicesRange(q, x, i, j - 1)
  decreases q, x, i, j, sum
{
  assert q[i .. j] < q[i .. j + 1];
}


method TestsForFindAddends()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST Q1: i < j < |q| && q[i] + q[j] == x
  {
    var q: seq<int> := [-1, 0, 0, 0];
    var x := 0;
    var i, j := FindAddends(q, x);
    // actual runtime state: i=0, j=3
    // expect i < j < |q| && q[i] + q[j] == x; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bi=0:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST Q1: i < j
  //   POST Q2: j < |q|
  //   POST Q3: q[i] + q[j] == x
  {
    var q: seq<int> := [-400, 175];
    var x := -225;
    var i, j := FindAddends(q, x);
    // actual runtime state: i=1, j=0
    // expect i == 0; // LHS=1, RHS=0
    // expect j == 1; // LHS=0, RHS=1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ox>0:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST Q1: i < j
  //   POST Q2: j < |q|
  //   POST Q3: q[i] + q[j] == x
  {
    var q: seq<int> := [-17869, 17870];
    var x := 1;
    var i, j := FindAddends(q, x);
    // actual runtime state: i=1, j=0
    // expect i == 0; // LHS=1, RHS=0
    // expect j == 1; // LHS=0, RHS=1
  }

  // Test case for combination {1}/Oi>=2:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST Q1: i < j
  //   POST Q2: j < |q|
  //   POST Q3: q[i] + q[j] == x
  {
    var q: seq<int> := [-175, 0, 0, 400];
    var x := 400;
    var i, j := FindAddends(q, x);
    expect i == 2 || i == 1;
    expect j == 3 || j == 3;
    expect i == 1; // observed from implementation
    expect j == 3; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST Q1: i < j
  //   POST Q2: j < |q|
  //   POST Q3: q[i] + q[j] == x
  {
    var q: seq<int> := [-176, -176];
    var x := -352;
    var i, j := FindAddends(q, x);
    // actual runtime state: j=0
    // expect i == 0; // LHS=0, RHS=0
    // expect j == 1; // LHS=0, RHS=1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST Q1: i < j
  //   POST Q2: j < |q|
  //   POST Q3: q[i] + q[j] == x
  {
    var q: seq<int> := [-177, -177];
    var x := -354;
    var i, j := FindAddends(q, x);
    // actual runtime state: j=0
    // expect i == 0; // LHS=0, RHS=0
    // expect j == 1; // LHS=0, RHS=1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST Q1: i < j
  //   POST Q2: j < |q|
  //   POST Q3: q[i] + q[j] == x
  {
    var q: seq<int> := [-7822, -178];
    var x := -8000;
    var i, j := FindAddends(q, x);
    // actual runtime state: i=1, j=0
    // expect i == 0; // LHS=1, RHS=0
    // expect j == 1; // LHS=0, RHS=1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST Q1: i < j
  //   POST Q2: j < |q|
  //   POST Q3: q[i] + q[j] == x
  {
    var q: seq<int> := [-4001, -4001];
    var x := -8002;
    var i, j := FindAddends(q, x);
    // actual runtime state: j=0
    // expect i == 0; // LHS=0, RHS=0
    // expect j == 1; // LHS=0, RHS=1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST Q1: i < j
  //   POST Q2: j < |q|
  //   POST Q3: q[i] + q[j] == x
  {
    var q: seq<int> := [-16881, -16881];
    var x := -33762;
    var i, j := FindAddends(q, x);
    // actual runtime state: j=0
    // expect i == 0; // LHS=0, RHS=0
    // expect j == 1; // LHS=0, RHS=1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST Q1: i < j
  //   POST Q2: j < |q|
  //   POST Q3: q[i] + q[j] == x
  {
    var q: seq<int> := [-58157, -58157];
    var x := -116314;
    var i, j := FindAddends(q, x);
    // actual runtime state: j=0
    // expect i == 0; // LHS=0, RHS=0
    // expect j == 1; // LHS=0, RHS=1
  }

}

method Main()
{
  TestsForFindAddends();
  print "TestsForFindAddends: all non-failing tests passed!\n";
}
