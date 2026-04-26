// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Verify_tmp_tmphq7j0row_Fine_Tune_Examples_normal_data_completion_MaxPerdV2__647-658_SDL.dfy
// Method: max
// Generated: 2026-04-24 16:02:20

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
    var a := new int[2] [2, -10];
    var n := 2;
    var max := max(a, n);
    expect max == 2;
  }

  // Test case for combination {2}/Rel:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: exists j :: 1 <= j < (n - 1) && a[j] == max
  //   POST Q2: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[4] [-7, -7, -9, -8];
    var n := 4;
    var max := max(a, n);
    expect max == -7;
  }

  // Test case for combination {3}/Rel:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: is_max(max, a, n)
  //   POST Q2: a[(n - 1)] == max
  //   POST Q3: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[2] [-4, -4];
    var n := 2;
    var max := max(a, n);
    expect max == -4;
  }

  // Test case for combination {1}/Bn=1:
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

  // Test case for combination {1}/Bn=a_len-1:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: is_max(max, a, n)
  //   POST Q2: a[0] == max
  //   POST Q3: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[3] [-10, -10, -9];
    var n := 2;
    var max := max(a, n);
    expect max == -10;
  }

  // Test case for combination {2}/Bn=a_len-1:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: exists j :: 1 <= j < (n - 1) && a[j] == max
  //   POST Q2: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[4] [-4, -4, -5, 17869];
    var n := 3;
    var max := max(a, n);
    expect max == -4;
  }

  // Test case for combination {1}/Omax=0:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: is_max(max, a, n)
  //   POST Q2: a[0] == max
  //   POST Q3: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[2] [0, -10];
    var n := 2;
    var max := max(a, n);
    expect max == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Omax=0:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: exists j :: 1 <= j < (n - 1) && a[j] == max
  //   POST Q2: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[8] [-1, -3, -10, 0, 0, 0, 0, -8017];
    var n := 8;
    var max := max(a, n);
    // expect max == 0; // got -1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Omax>0:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: exists j :: 1 <= j < (n - 1) && a[j] == max
  //   POST Q2: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[3] [-10, 10, -9];
    var n := 3;
    var max := max(a, n);
    // expect max == 10; // got -10
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/Omax=0:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: is_max(max, a, n)
  //   POST Q2: a[(n - 1)] == max
  //   POST Q3: forall j: int {:trigger a[j]} :: 0 <= j && j < n ==> a[j] <= max
  {
    var a := new int[4] [-1, -10, -4, 0];
    var n := 4;
    var max := max(a, n);
    // expect max == 0; // got -1
  }

}

method Main()
{
  TestsFormax();
  print "TestsFormax: all non-failing tests passed!\n";
}
