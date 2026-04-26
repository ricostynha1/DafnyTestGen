// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\laboratory_tmp_tmps8ws6mu2_dafny-tutorial_exercise12__367-370_EVR_int.dfy
// Method: FindMax
// Generated: 2026-04-24 16:48:33

// laboratory_tmp_tmps8ws6mu2_dafny-tutorial_exercise12.dfy

method FindMax(a: array<int>) returns (i: int)
  requires 0 < a.Length
  ensures 0 <= i < a.Length
  ensures forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  decreases a
{
  var j := 0;
  var max := 0;
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


method TestsForFindMax()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  0 < a.Length
  //   POST Q1: 0 <= i
  //   POST Q2: i < a.Length
  //   POST Q3: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[2] [-10, -1];
    var i := FindMax(a);
    // expect i == 1; // got 0
  }

  // Test case for combination {1}/Bi=0:
  //   PRE:  0 < a.Length
  //   POST Q1: 0 <= i
  //   POST Q2: i < a.Length
  //   POST Q3: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[1] [10];
    var i := FindMax(a);
    expect i == 0;
  }

  // Test case for combination {1}/R2:
  //   PRE:  0 < a.Length
  //   POST Q1: 0 <= i
  //   POST Q2: i < a.Length
  //   POST Q3: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[1] [3];
    var i := FindMax(a);
    expect i == 0;
  }

  // Test case for combination {1}/R3:
  //   PRE:  0 < a.Length
  //   POST Q1: 0 <= i
  //   POST Q2: i < a.Length
  //   POST Q3: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[1] [-5];
    var i := FindMax(a);
    expect i == 0;
  }

  // Test case for combination {1}/R4:
  //   PRE:  0 < a.Length
  //   POST Q1: 0 <= i
  //   POST Q2: i < a.Length
  //   POST Q3: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[1] [6];
    var i := FindMax(a);
    expect i == 0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  0 < a.Length
  //   POST Q1: 0 <= i
  //   POST Q2: i < a.Length
  //   POST Q3: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[1] [-6];
    var i := FindMax(a);
    expect i == 0;
  }

  // Test case for combination {1}/R6:
  //   PRE:  0 < a.Length
  //   POST Q1: 0 <= i
  //   POST Q2: i < a.Length
  //   POST Q3: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[1] [-7];
    var i := FindMax(a);
    expect i == 0;
  }

  // Test case for combination {1}/R7:
  //   PRE:  0 < a.Length
  //   POST Q1: 0 <= i
  //   POST Q2: i < a.Length
  //   POST Q3: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[1] [-8];
    var i := FindMax(a);
    expect i == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  0 < a.Length
  //   POST Q1: 0 <= i
  //   POST Q2: i < a.Length
  //   POST Q3: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[1] [-10];
    var i := FindMax(a);
    expect i == 0;
  }

  // Test case for combination {1}/R9:
  //   PRE:  0 < a.Length
  //   POST Q1: 0 <= i
  //   POST Q2: i < a.Length
  //   POST Q3: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] <= a[i]
  {
    var a := new int[1] [7];
    var i := FindMax(a);
    expect i == 0;
  }

}

method Main()
{
  TestsForFindMax();
  print "TestsForFindMax: all non-failing tests passed!\n";
}
