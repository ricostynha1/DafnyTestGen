// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny-Exercises_tmp_tmpjm75muf__Session6Exercises_ExercisePeekSum__84_LVR_1.dfy
// Method: mPeekSum
// Generated: 2026-04-24 23:39:42

// Dafny-Exercises_tmp_tmpjm75muf__Session6Exercises_ExercisePeekSum.dfy

predicate isPeek(v: array<int>, i: int)
  requires 0 <= i < v.Length
  reads v
  decreases {v}, v, i
{
  forall k: int {:trigger v[k]} :: 
    1 <= k < i ==>
      v[i] >= v[k]
}

function peekSum(v: array<int>, i: int): int
  requires 0 <= i <= v.Length
  reads v
  decreases i
{
  if i == 0 then
    0
  else if isPeek(v, i - 1) then
    v[i - 1] + peekSum(v, i - 1)
  else
    peekSum(v, i - 1)
}

method mPeekSum(v: array<int>) returns (sum: int)
  requires v.Length > 0
  ensures sum == peekSum(v, v.Length)
  decreases v
{
  var i := 1;
  sum := v[0];
  var lmax := v[0];
  while i < v.Length
    invariant 0 < i <= v.Length
    invariant lmax in v[..i]
    invariant forall k: int {:trigger v[k]} :: 0 <= k < i ==> lmax >= v[k]
    invariant sum == peekSum(v, i)
    decreases v.Length - i
  {
    if v[i] >= lmax {
      sum := sum + v[i];
      lmax := v[i];
    }
    i := i + 1;
  }
}


method TestsFormPeekSum()
{
  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [-10];
    var sum := mPeekSum(v);
    expect sum == -10;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[3] [-1, -9, -10];
    var sum := mPeekSum(v);
    // expect sum == -10; // got -1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|v|>=2:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[2] [-9, -10];
    var sum := mPeekSum(v);
    // expect sum == -19; // got -9
  }

  // Test case for combination {1}/R3:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [-1];
    var sum := mPeekSum(v);
    expect sum == -1;
  }

  // Test case for combination {1}/R4:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [-2];
    var sum := mPeekSum(v);
    expect sum == -2;
  }

  // Test case for combination {1}/R5:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [-8];
    var sum := mPeekSum(v);
    expect sum == -8;
  }

  // Test case for combination {1}/R6:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [-9];
    var sum := mPeekSum(v);
    expect sum == -9;
  }

  // Test case for combination {1}/R7:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [-7];
    var sum := mPeekSum(v);
    expect sum == -7;
  }

  // Test case for combination {1}/R8:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [8];
    var sum := mPeekSum(v);
    expect sum == 8;
  }

  // Test case for combination {1}/R9:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [-3];
    var sum := mPeekSum(v);
    expect sum == -3;
  }

}

method Main()
{
  TestsFormPeekSum();
  print "TestsFormPeekSum: all non-failing tests passed!\n";
}
