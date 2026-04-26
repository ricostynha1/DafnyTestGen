// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Verify_tmp_tmphq7j0row_Fine_Tune_Examples_normal_data_completion_MaxPerdV2__656_VER_max.dfy
// Method: max
// Generated: 2026-04-24 21:59:08

// Dafny_Verify_tmp_tmphq7j0row_Fine_Tune_Examples_normal_data_completion_MaxPerdV2.dfy

function contains(v: int, a: array<int>, n: int): bool
  requires n <= a.Length
  reads a
  decreases {a}, v, a, n
{
  exists j: int {:trigger a[j]} :: 
    0 <= j < n &&
    a[j] == v
}

function upper_bound(v: int, a: array<int>, n: int): bool
  requires n <= a.Length
  reads a
  decreases {a}, v, a, n
{
  forall j: int {:trigger a[j]} :: 
    0 <= j < n ==>
      a[j] <= v
}

function is_max(m: int, a: array<int>, n: int): bool
  requires n <= a.Length
  reads a
  decreases {a}, m, a, n
{
  contains(m, a, n) &&
  upper_bound(m, a, n)
}

method max(a: array<int>, n: int) returns (max: int)
  requires 0 < n <= a.Length
  ensures is_max(max, a, n)
  decreases a, n
{
  var i: int := 1;
  max := a[0];
  while i < n
    invariant i <= n
    invariant is_max(max, a, i)
    decreases n - i
  {
    if a[i] > max {
      max := a[max];
    }
    i := i + 1;
  }
}


method TestsFormax()
{
  // Test case for combination {1}/Rel:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: is_max(max, a, n)
  //   POST Q2: a[0] == max
  //   POST Q3: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[1] [175];
    var n := 1;
    var max := max(a, n);
    expect max == 175;
  }

  // Test case for combination {2}/Rel:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: exists j :: 1 <= j < (n - 1) && a[j] == max
  //   POST Q2: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[4] [17868, 17867, 17868, -12189];
    var n := 4;
    var max := max(a, n);
    expect max == 17868;
  }

  // Test case for combination {1}/Bn=2:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: is_max(max, a, n)
  //   POST Q2: a[0] == max
  //   POST Q3: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[2] [400, -175];
    var n := 2;
    var max := max(a, n);
    expect max == 400;
  }

  // Test case for combination {1}/Bn=a_len-1:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: is_max(max, a, n)
  //   POST Q2: a[0] == max
  //   POST Q3: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[2] [14, 175];
    var n := 1;
    var max := max(a, n);
    expect max == 14;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bn=a_len-1:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: exists j :: 1 <= j < (n - 1) && a[j] == max
  //   POST Q2: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[4] [-175, 0, -400, 26];
    var n := 3;
    var max := max(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.max(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_pw4nebiirrw\runner.cs:line 5971
    // runtime error: at _module.__default.TestCase__4() in C:\cygwin64\tmp\DafnyCBT_pw4nebiirrw\runner.cs:line 6143
    // expect max == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/Bn=2:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: is_max(max, a, n)
  //   POST Q2: a[(n - 1)] == max
  //   POST Q3: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[2] [-400, 175];
    var n := 2;
    var max := max(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.max(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_pw4nebiirrw\runner.cs:line 5971
    // runtime error: at _module.__default.TestCase__5() in C:\cygwin64\tmp\DafnyCBT_pw4nebiirrw\runner.cs:line 6177
    // expect max == 175;
  }

  // Test case for combination {1}/Omax=0:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: is_max(max, a, n)
  //   POST Q2: a[0] == max
  //   POST Q3: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[1] [0];
    var n := 1;
    var max := max(a, n);
    expect max == 0;
  }

  // Test case for combination {1}/Omax<0:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: is_max(max, a, n)
  //   POST Q2: a[0] == max
  //   POST Q3: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[1] [-1];
    var n := 1;
    var max := max(a, n);
    expect max == -1;
  }

  // Test case for combination {2}/Omax<0:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: exists j :: 1 <= j < (n - 1) && a[j] == max
  //   POST Q2: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[4] [-176, -176, -176, -177];
    var n := 4;
    var max := max(a, n);
    expect max == -176;
  }

  // Test case for combination {1}/R5:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: is_max(max, a, n)
  //   POST Q2: a[0] == max
  //   POST Q3: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[1] [18];
    var n := 1;
    var max := max(a, n);
    expect max == 18;
  }

}

method Main()
{
  TestsFormax();
  print "TestsFormax: all non-failing tests passed!\n";
}
