// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\laboratory_tmp_tmps8ws6mu2_dafny-tutorial_exercise12.dfy
// Method: FindMax
// Generated: 2026-04-08 19:12:52

// laboratory_tmp_tmps8ws6mu2_dafny-tutorial_exercise12.dfy

method FindMax(a: array<int>) returns (i: int)
  requires 0 < a.Length
  ensures 0 <= i < a.Length
  ensures forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  decreases a
{
  var j := 0;
  var max := a[0];
  i := 1;
  while i < a.Length
    invariant 1 <= i <= a.Length
    invariant forall k: int {:trigger a[k]} :: 0 <= k < i ==> max >= a[k]
    invariant 0 <= j < a.Length
    invariant a[j] == max
    decreases a.Length - i
  {
    if max < a[i] {
      max := a[i];
      j := i;
    }
    i := i + 1;
  }
  i := j;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  0 < a.Length
  //   POST: 0 <= i < a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  //   ENSURES: 0 <= i < a.Length
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[1] [38];
    var i := FindMax(a);
    expect i == 0;
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  0 < a.Length
  //   POST: 0 <= i < a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  //   ENSURES: 0 <= i < a.Length
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[2] [35472, 35473];
    var i := FindMax(a);
    expect i == 1;
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  0 < a.Length
  //   POST: 0 <= i < a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  //   ENSURES: 0 <= i < a.Length
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[3] [23675, 23674, 23676];
    var i := FindMax(a);
    expect i == 2;
  }

  // Test case for combination {1}/Oi>0:
  //   PRE:  0 < a.Length
  //   POST: 0 <= i < a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  //   ENSURES: 0 <= i < a.Length
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[4] [-7719, -21238, -2437, 38];
    var i := FindMax(a);
    expect i == 3;
  }

  // Test case for combination {1}/Oi=0:
  //   PRE:  0 < a.Length
  //   POST: 0 <= i < a.Length
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  //   ENSURES: 0 <= i < a.Length
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[5] [7719, -38, -21238, -2437, -8855];
    var i := FindMax(a);
    expect i == 0;
  }

}

method Failing()
{
  // (no failing tests)
}

method Main()
{
  Passing();
  Failing();
}
