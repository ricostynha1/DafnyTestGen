// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_tmp_tmpmvs2dmry_pancakesort_findmax__583-583_AOI.dfy
// Method: findMax
// Generated: 2026-04-22 21:32:31

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
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyTestGen_hl4ej3dcpft\runner.cs:line 5823
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyTestGen_hl4ej3dcpft\runner.cs:line 5861
    // expect r == 0;
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
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyTestGen_hl4ej3dcpft\runner.cs:line 5823
    // runtime error: at _module.__default.TestCase__1() in C:\cygwin64\tmp\DafnyTestGen_hl4ej3dcpft\runner.cs:line 5896
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
    var a := new int[3] [-10, -6, -7];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyTestGen_hl4ej3dcpft\runner.cs:line 5823
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyTestGen_hl4ej3dcpft\runner.cs:line 5933
    // expect r == 1;
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
    var a := new int[2] [9, 9];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyTestGen_hl4ej3dcpft\runner.cs:line 5823
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyTestGen_hl4ej3dcpft\runner.cs:line 5969
    // expect r == 1 || r == 0;
  }

}

method Main()
{
  TestsForfindMax();
  print "TestsForfindMax: all non-failing tests passed!\n";
}
