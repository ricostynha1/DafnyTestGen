// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny-Exercises_tmp_tmpjm75muf__Session9Exercises_ExerciseSeqMaxSum__1551-1553_EVR_int.dfy
// Method: segMaxSum
// Generated: 2026-04-22 21:39:51

// Dafny-Exercises_tmp_tmpjm75muf__Session9Exercises_ExerciseSeqMaxSum.dfy

function Sum(v: array<int>, i: int, j: int): int
  requires 0 <= i <= j <= v.Length
  reads v
  decreases j
{
  if i == j then
    0
  else
    Sum(v, i, j - 1) + v[j - 1]
}

predicate SumMaxToRight(v: array<int>, i: int, s: int)
  requires 0 <= i < v.Length
  reads v
  decreases {v}, v, i, s
{
  forall l: int, ss: int {:induction l} {:trigger Sum(v, l, ss)} /*{:_induction l}*/ :: 
    0 <= l <= i &&
    ss == i + 1 ==>
      Sum(v, l, ss) <= s
}

method segMaxSum(v: array<int>, i: int)
    returns (s: int, k: int)
  requires v.Length > 0 && 0 <= i < v.Length
  ensures 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  decreases v, i
{
  s := v[0];
  k := 0;
  var j := 0;
  while j < i
    invariant 0 <= j <= i
    invariant 0 <= k <= j && s == Sum(v, k, j + 1)
    invariant SumMaxToRight(v, j, s)
    decreases i - j
  {
    if s + v[j + 1] > v[j + 1] {
      s := s + v[j + 1];
    } else {
      k := j + 1;
      s := v[j + 1];
    }
    j := j + 1;
  }
}

function Sum2(v: array<int>, i: int, j: int): int
  requires 0 <= i <= j <= v.Length
  reads v
  decreases j - i
{
  if i == j then
    0
  else
    v[i] + Sum2(v, i + 1, j)
}

predicate SumMaxToRight2(v: array<int>, j: int, i: int, s: int)
  requires 0 <= j <= i < v.Length
  reads v
  decreases {v}, v, j, i, s
{
  forall l: int, ss: int {:induction l} {:trigger Sum2(v, l, ss)} /*{:_induction l}*/ :: 
    j <= l <= i &&
    ss == i + 1 ==>
      Sum2(v, l, ss) <= s
}

method segSumaMaxima2(v: array<int>, i: int)
    returns (s: int, k: int)
  requires v.Length > 0 && 0 <= i < v.Length
  ensures 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  decreases v, i
{
  s := v[i];
  k := i;
  var j := i;
  var maxs := s;
  while j > 0
    invariant 0 <= j <= i
    invariant 0 <= k <= i
    invariant s == Sum2(v, j, i + 1)
    invariant SumMaxToRight2(v, j, i, maxs)
    invariant maxs == Sum2(v, k, i + 1)
    decreases j
  {
    s := s + v[j - 1];
    if s > maxs {
      maxs := s;
      k := 0;
    }
    j := j - 1;
  }
  s := maxs;
}


method TestsForsegMaxSum()
{
  // Test case for combination {2}:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[3] [-10, -3, -3];
    var i := 2;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == -3; // observed from implementation
    expect k == 2; // observed from implementation
  }

  // Test case for combination {2}/Bi=0:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[1] [10];
    var i := 0;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == 10; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/Bi=1:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[2] [-2, -10];
    var i := 1;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == -10; // observed from implementation
    expect k == 1; // observed from implementation
  }

  // Test case for combination {2}/R4:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[3] [-9, -2, -10];
    var i := 2;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == -10; // observed from implementation
    expect k == 2; // observed from implementation
  }

}

method TestsForsegSumaMaxima2()
{
  // Test case for combination {2}/Rel:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[4] [-2, -4, -5, 8880];
    var i := 2;
    var s, k := segSumaMaxima2(v, i);
    expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
    expect s == -5; // observed from implementation
    expect k == 2; // observed from implementation
  }

  // Test case for combination {2}/Bi=0:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[1] [3];
    var i := 0;
    var s, k := segSumaMaxima2(v, i);
    expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
    expect s == 3; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/Bi=1:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[2] [-3, 10];
    var i := 1;
    var s, k := segSumaMaxima2(v, i);
    expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
    expect s == 10; // observed from implementation
    expect k == 1; // observed from implementation
  }

  // Test case for combination {2}/R3:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[3] [2, -1, -10];
    var i := 2;
    var s, k := segSumaMaxima2(v, i);
    expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
    expect s == -9; // observed from implementation
    expect k == 0; // observed from implementation
  }

}

method Main()
{
  TestsForsegMaxSum();
  print "TestsForsegMaxSum: all non-failing tests passed!\n";
  TestsForsegSumaMaxima2();
  print "TestsForsegSumaMaxima2: all non-failing tests passed!\n";
}
