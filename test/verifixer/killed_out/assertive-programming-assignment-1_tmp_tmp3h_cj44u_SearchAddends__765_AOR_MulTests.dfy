// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\assertive-programming-assignment-1_tmp_tmp3h_cj44u_SearchAddends__765_AOR_Mul.dfy
// Method: FindAddends
// Generated: 2026-04-01 22:22:41

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


method Passing()
{
  // (no passing tests)
}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST: i < j < |q|
  //   POST: q[i] + q[j] == x
  {
    var q: seq<int> := [-1081, 7017];
    var x := 5936;
    // expect Sorted(q) && HasAddends(q, x); // PRE-CHECK
    var i, j := FindAddends(q, x);
    // expect i == 0;
    // expect j == 1;
  }

  // Test case for combination {1}/Bq=2,x=0:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST: i < j < |q|
  //   POST: q[i] + q[j] == x
  {
    var q: seq<int> := [-2617, 2617];
    var x := 0;
    // expect Sorted(q) && HasAddends(q, x); // PRE-CHECK
    var i, j := FindAddends(q, x);
    // expect i == 0;
    // expect j == 1;
  }

  // Test case for combination {1}/Bq=2,x=1:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST: i < j < |q|
  //   POST: q[i] + q[j] == x
  {
    var q: seq<int> := [-590, 591];
    var x := 1;
    // expect Sorted(q) && HasAddends(q, x); // PRE-CHECK
    var i, j := FindAddends(q, x);
    // expect i == 0;
    // expect j == 1;
  }

  // Test case for combination {1}/Bq=3,x=0:
  //   PRE:  Sorted(q) && HasAddends(q, x)
  //   POST: i < j < |q|
  //   POST: q[i] + q[j] == x
  {
    var q: seq<int> := [-2328, 7, 2328];
    var x := 0;
    // expect Sorted(q) && HasAddends(q, x); // PRE-CHECK
    var i, j := FindAddends(q, x);
    // expect i == 0;
    // expect j == 2;
  }

}

method Main()
{
  Passing();
  Failing();
}
