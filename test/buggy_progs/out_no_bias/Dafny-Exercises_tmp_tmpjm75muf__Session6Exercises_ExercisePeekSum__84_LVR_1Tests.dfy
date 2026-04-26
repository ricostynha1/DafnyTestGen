// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny-Exercises_tmp_tmpjm75muf__Session6Exercises_ExercisePeekSum__84_LVR_1.dfy
// Method: mPeekSum
// Generated: 2026-04-24 11:51:15

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
    var v := new int[1] [15];
    var sum := mPeekSum(v);
    expect sum == 15;
  }

  // Test case for combination {2}:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[3] [15, 576, 575];
    var sum := mPeekSum(v);
    expect sum == 591;
  }

  // Test case for combination {1}/O|v|>=2:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[2] [14, 16];
    var sum := mPeekSum(v);
    expect sum == 30;
  }

  // Test case for combination {1}/R3:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [19];
    var sum := mPeekSum(v);
    expect sum == 19;
  }

  // Test case for combination {1}/R4:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [18];
    var sum := mPeekSum(v);
    expect sum == 18;
  }

  // Test case for combination {1}/R5:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [20];
    var sum := mPeekSum(v);
    expect sum == 20;
  }

  // Test case for combination {1}/R6:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [21];
    var sum := mPeekSum(v);
    expect sum == 21;
  }

  // Test case for combination {1}/R7:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [22];
    var sum := mPeekSum(v);
    expect sum == 22;
  }

  // Test case for combination {1}/R8:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [23];
    var sum := mPeekSum(v);
    expect sum == 23;
  }

  // Test case for combination {1}/R9:
  //   PRE:  v.Length > 0
  //   POST Q1: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [24];
    var sum := mPeekSum(v);
    expect sum == 24;
  }

}

method Main()
{
  TestsFormPeekSum();
  print "TestsFormPeekSum: all non-failing tests passed!\n";
}
