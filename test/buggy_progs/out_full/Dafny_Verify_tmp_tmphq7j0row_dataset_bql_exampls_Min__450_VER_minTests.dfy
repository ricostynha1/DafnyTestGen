// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Verify_tmp_tmphq7j0row_dataset_bql_exampls_Min__450_VER_min.dfy
// Method: min
// Generated: 2026-04-24 09:51:55

// Dafny_Verify_tmp_tmphq7j0row_dataset_bql_exampls_Min.dfy

method min(a: array<int>, n: int) returns (min: int)
  requires 0 < n <= a.Length
  ensures exists i: int {:trigger a[i]} :: 0 <= i && i < n && a[i] == min
  ensures forall i: int {:trigger a[i]} :: 0 <= i && i < n ==> a[i] >= min
  decreases a, n
{
  var i: int;
  min := a[0];
  i := 1;
  while i < n
    invariant i <= n
    invariant exists j: int {:trigger a[j]} :: 0 <= j && j < i && a[j] == min
    invariant forall j: int {:trigger a[j]} :: 0 <= j && j < i ==> a[j] >= min
    decreases n - i
  {
    if a[i] < min {
      min := a[min];
    }
    i := i + 1;
  }
}


method TestsFormin()
{
  // Test case for combination {1}/Rel:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= (n - 1)
  //   POST Q2: a[0] == min
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i && i < n ==> a[i] >= min
  {
    var a := new int[2] [-4, -4];
    var n := 2;
    var min := min(a, n);
    expect min == -4;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Rel:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: exists i :: 1 <= i < (n - 1) && a[i] == min
  //   POST Q2: forall i: int {:trigger a[i]} :: 0 <= i && i < n ==> a[i] >= min
  {
    var a := new int[4] [-1, -10, -8, -9];
    var n := 4;
    var min := min(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.min(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_l3td1dna4z0\runner.cs:line 5924
    // runtime error: at _module.__default.TestCase__1() in C:\cygwin64\tmp\DafnyCBT_l3td1dna4z0\runner.cs:line 5993
    // expect min == -10;
  }

  // Test case for combination {2}/V2:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: exists i :: 1 <= i < (n - 1) && a[i] == min
  //   POST Q2: forall i: int {:trigger a[i]} :: 0 <= i && i < n ==> a[i] >= min  // VACUOUS (forced true by other literals for this ins)
  {
    var a := new int[3] [-10, -10, -9];
    var n := 3;
    var min := min(a, n);
    expect min == -10;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= (n - 1)
  //   POST Q2: a[0] == min
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i && i < n ==> a[i] >= min
  {
    var a := new int[1] [-1];
    var n := 1;
    var min := min(a, n);
    expect min == -1;
  }

  // Test case for combination {1}/Bn=a_len-1:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= (n - 1)
  //   POST Q2: a[0] == min
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i && i < n ==> a[i] >= min
  {
    var a := new int[3] [-9, 10, -10];
    var n := 2;
    var min := min(a, n);
    expect min == -9;
  }

  // Test case for combination {2}/Bn=a_len-1:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: exists i :: 1 <= i < (n - 1) && a[i] == min
  //   POST Q2: forall i: int {:trigger a[i]} :: 0 <= i && i < n ==> a[i] >= min
  {
    var a := new int[4] [-10, -10, -9, -11];
    var n := 3;
    var min := min(a, n);
    expect min == -10;
  }

  // Test case for combination {3}/Bn=a_len-1:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= (n - 1)
  //   POST Q2: a[(n - 1)] == min
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i && i < n ==> a[i] >= min
  {
    var a := new int[3] [-1, -1, -10];
    var n := 2;
    var min := min(a, n);
    expect min == -1;
  }

  // Test case for combination {1}/Omin=0:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= (n - 1)
  //   POST Q2: a[0] == min
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i && i < n ==> a[i] >= min
  {
    var a := new int[2] [0, 2];
    var n := 2;
    var min := min(a, n);
    expect min == 0;
  }

  // Test case for combination {1}/Omin>0:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= (n - 1)
  //   POST Q2: a[0] == min
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i && i < n ==> a[i] >= min
  {
    var a := new int[2] [8, 8];
    var n := 2;
    var min := min(a, n);
    expect min == 8;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Omin=0:
  //   PRE:  0 < n <= a.Length
  //   POST Q1: exists i :: 1 <= i < (n - 1) && a[i] == min
  //   POST Q2: forall i: int {:trigger a[i]} :: 0 <= i && i < n ==> a[i] >= min
  {
    var a := new int[6] [10, 7, 4, 0, 7645, -401];
    var n := 5;
    var min := min(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.min(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_l3td1dna4z0\runner.cs:line 5924
    // runtime error: at _module.__default.TestCase__9() in C:\cygwin64\tmp\DafnyCBT_l3td1dna4z0\runner.cs:line 6273
    // expect min == 0;
  }

}

method Main()
{
  TestsFormin();
  print "TestsFormin: all non-failing tests passed!\n";
}
