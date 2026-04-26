// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_tmp_tmpmvs2dmry_pancakesort_findmax__583-583_AOI.dfy
// Method: findMax
// Generated: 2026-04-24 09:51:18

// Dafny_tmp_tmpmvs2dmry_pancakesort_findmax.dfy

method findMax(a: array<int>, n: int) returns (r: int)
  requires a.Length > 0
  requires 0 < n <= a.Length
  ensures 0 <= r < n <= a.Length
  ensures forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  ensures multiset(a[..]) == multiset(old(a[..]))
  decreases a, n
{
  var mi;
  var i;
  mi := 0;
  i := 0;
  while i < n
    invariant 0 <= i <= n <= a.Length
    invariant 0 <= mi < n
    invariant forall k: int {:trigger a[k]} :: 0 <= k < i ==> a[mi] >= a[k]
    decreases n - i
  {
    if a[i] > a[mi] {
      mi := i;
    }
    i := i + -1;
  }
  return mi;
}


method TestsForfindMax()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= r
  //   POST Q2: r < n
  //   POST Q3: n <= a.Length
  //   POST Q4: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST Q5: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [10, -10];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 5935
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 5973
    // expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/V4:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= r < n <= a.Length
  //   POST Q2: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST Q3: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [3, 3];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 5935
    // runtime error: at _module.__default.TestCase__1() in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 6009
    // expect 0 <= r < n <= a.Length;
    // expect forall k: int :: 0 <= k < n <= a.Length ==> a[r] >= a[k];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bn=1:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= r
  //   POST Q2: r < n
  //   POST Q3: n <= a.Length
  //   POST Q4: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST Q5: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-10];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 5935
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 6051
    // expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bn=a_len-1:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= r
  //   POST Q2: r < n
  //   POST Q3: n <= a.Length
  //   POST Q4: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST Q5: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[3] [-10, -10, -10];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 5935
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 6088
    // expect r == 1 || r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= r
  //   POST Q2: r < n
  //   POST Q3: n <= a.Length
  //   POST Q4: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST Q5: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [-6, 2];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 5935
    // runtime error: at _module.__default.TestCase__4() in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 6121
    // expect r == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= r
  //   POST Q2: r < n
  //   POST Q3: n <= a.Length
  //   POST Q4: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST Q5: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [7, 7];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 5935
    // runtime error: at _module.__default.TestCase__5() in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 6157
    // expect r == 0 || r == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= r
  //   POST Q2: r < n
  //   POST Q3: n <= a.Length
  //   POST Q4: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST Q5: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [-7, -10];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 5935
    // runtime error: at _module.__default.TestCase__6() in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 6190
    // expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= r
  //   POST Q2: r < n
  //   POST Q3: n <= a.Length
  //   POST Q4: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST Q5: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [8, 8];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 5935
    // runtime error: at _module.__default.TestCase__7() in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 6226
    // expect r == 1 || r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= r
  //   POST Q2: r < n
  //   POST Q3: n <= a.Length
  //   POST Q4: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST Q5: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [9, 9];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 5935
    // runtime error: at _module.__default.TestCase__8() in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 6259
    // expect r == 1 || r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= r
  //   POST Q2: r < n
  //   POST Q3: n <= a.Length
  //   POST Q4: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST Q5: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [-8, -10];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 5935
    // runtime error: at _module.__default.TestCase__9() in C:\cygwin64\tmp\DafnyCBT_pvdoegpvjyj\runner.cs:line 6292
    // expect r == 0;
  }

}

method Main()
{
  TestsForfindMax();
  print "TestsForfindMax: all non-failing tests passed!\n";
}
