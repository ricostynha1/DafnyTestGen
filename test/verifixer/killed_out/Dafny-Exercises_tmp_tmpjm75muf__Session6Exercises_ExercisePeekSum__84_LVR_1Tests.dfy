// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny-Exercises_tmp_tmpjm75muf__Session6Exercises_ExercisePeekSum__84_LVR_1.dfy
// Method: mPeekSum
// Generated: 2026-04-08 16:50:54

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  v.Length > 0
  //   POST: sum == peekSum(v, v.Length)
  //   ENSURES: sum == peekSum(v, v.Length)
  {
    var v := new int[1] [2];
    var sum := mPeekSum(v);
    expect sum == 2;
  }

  // Test case for combination {1}/Osum>0:
  //   PRE:  v.Length > 0
  //   POST: sum == peekSum(v, v.Length)
  //   ENSURES: sum == peekSum(v, v.Length)
  {
    var v := new int[4] [5, 6, 7, 8];
    var sum := mPeekSum(v);
    expect sum == 26;
  }

  // Test case for combination {1}/Osum<0:
  //   PRE:  v.Length > 0
  //   POST: sum == peekSum(v, v.Length)
  //   ENSURES: sum == peekSum(v, v.Length)
  {
    var v := new int[5] [6, 7, 8, 9, 10];
    var sum := mPeekSum(v);
    expect sum == 40;
  }

  // Test case for combination {1}/Osum=0:
  //   PRE:  v.Length > 0
  //   POST: sum == peekSum(v, v.Length)
  //   ENSURES: sum == peekSum(v, v.Length)
  {
    var v := new int[6] [7, 8, 9, 10, 11, 12];
    var sum := mPeekSum(v);
    expect sum == 57;
  }

}

method Failing()
{
  // Test case for combination {1}/Bv=2:
  //   PRE:  v.Length > 0
  //   POST: sum == peekSum(v, v.Length)
  //   ENSURES: sum == peekSum(v, v.Length)
  {
    var v := new int[2] [4, 3];
    var sum := mPeekSum(v);
    // expect sum == peekSum(v, v.Length);
  }

  // Test case for combination {1}/Bv=3:
  //   PRE:  v.Length > 0
  //   POST: sum == peekSum(v, v.Length)
  //   ENSURES: sum == peekSum(v, v.Length)
  {
    var v := new int[3] [5, 4, 6];
    var sum := mPeekSum(v);
    // expect sum == peekSum(v, v.Length);
  }

}

method Main()
{
  Passing();
  Failing();
}
