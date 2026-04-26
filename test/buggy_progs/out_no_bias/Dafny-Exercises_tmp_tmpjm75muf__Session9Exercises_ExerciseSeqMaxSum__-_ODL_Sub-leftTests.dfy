// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny-Exercises_tmp_tmpjm75muf__Session9Exercises_ExerciseSeqMaxSum__-_ODL_Sub-left.dfy
// Method: segMaxSum
// Generated: 2026-04-24 11:51:42

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
    s := s + v[1];
    if s > maxs {
      maxs := s;
      k := 1;
    }
    j := 1;
  }
  s := maxs;
}


method TestsForsegMaxSum()
{
  // Test case for combination {2}:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[1] [-175];
    var i := 0;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == -175; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/Bi=1:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[2] [8, -175];
    var i := 1;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == -167; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R3:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[1] [-176];
    var i := 0;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == -176; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R4:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[1] [-177];
    var i := 0;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == -177; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R5:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[1] [-178];
    var i := 0;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == -178; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R6:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[1] [-179];
    var i := 0;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == -179; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R7:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[1] [-180];
    var i := 0;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == -180; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R8:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[1] [-181];
    var i := 0;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == -181; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R9:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[1] [-182];
    var i := 0;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == -182; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R10:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s)
  {
    var v := new int[1] [-183];
    var i := 0;
    var s, k := segMaxSum(v, i);
    expect 0 <= k <= i && s == Sum(v, k, i + 1) && SumMaxToRight(v, i, s);
    expect s == -183; // observed from implementation
    expect k == 0; // observed from implementation
  }

}

method TestsForsegSumaMaxima2()
{
  // Test case for combination {2}/Rel:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[1] [16083];
    var i := 0;
    var s, k := segSumaMaxima2(v, i);
    expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
    expect s == 16083; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bi=1:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[2] [175, -17869];
    var i := 1;
    var s, k := segSumaMaxima2(v, i);
    // expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
  }

  // Test case for combination {2}/R2:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[1] [175];
    var i := 0;
    var s, k := segSumaMaxima2(v, i);
    expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
    expect s == 175; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R3:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[1] [174];
    var i := 0;
    var s, k := segSumaMaxima2(v, i);
    expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
    expect s == 174; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R4:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[1] [173];
    var i := 0;
    var s, k := segSumaMaxima2(v, i);
    expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
    expect s == 173; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R5:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[1] [172];
    var i := 0;
    var s, k := segSumaMaxima2(v, i);
    expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
    expect s == 172; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R6:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[1] [171];
    var i := 0;
    var s, k := segSumaMaxima2(v, i);
    expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
    expect s == 171; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R7:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[1] [170];
    var i := 0;
    var s, k := segSumaMaxima2(v, i);
    expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
    expect s == 170; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R8:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[1] [169];
    var i := 0;
    var s, k := segSumaMaxima2(v, i);
    expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
    expect s == 169; // observed from implementation
    expect k == 0; // observed from implementation
  }

  // Test case for combination {2}/R9:
  //   PRE:  v.Length > 0 && 0 <= i < v.Length
  //   POST Q1: 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s)
  {
    var v := new int[1] [168];
    var i := 0;
    var s, k := segSumaMaxima2(v, i);
    expect 0 <= k <= i && s == Sum2(v, k, i + 1) && SumMaxToRight2(v, 0, i, s);
    expect s == 168; // observed from implementation
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
