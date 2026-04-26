// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_tmp_tmpmvs2dmry_pancakesort_findmax__583-583_AOI.dfy
// Method: findMax
// Generated: 2026-04-24 11:41:54

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
    var a := new int[2] [-13279, -13280];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 5919
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 5957
    // expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/V4:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= r
  //   POST Q2: r < n
  //   POST Q3: n <= a.Length
  //   POST Q4: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]  // VACUOUS (forced true by other literals for this ins)
  //   POST Q5: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [175];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 5919
    // runtime error: at _module.__default.TestCase__1() in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 5992
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
    var a := new int[2] [175, 17869];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 5919
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 6028
    // expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Br=1:
  //   PRE:  a.Length > 0
  //   PRE:  0 < n <= a.Length
  //   POST Q1: 0 <= r
  //   POST Q2: r < n
  //   POST Q3: n <= a.Length
  //   POST Q4: forall k: int {:trigger a[k]} :: 0 <= k < n <= a.Length ==> a[r] >= a[k]
  //   POST Q5: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [-400, 175];
    var n := 2;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 5919
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 6064
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
    var a := new int[1] [174];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 5919
    // runtime error: at _module.__default.TestCase__4() in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 6099
    // expect r == 0;
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
    var a := new int[1] [173];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 5919
    // runtime error: at _module.__default.TestCase__5() in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 6134
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
    var a := new int[1] [172];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 5919
    // runtime error: at _module.__default.TestCase__6() in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 6169
    // expect r == 0;
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
    var a := new int[1] [171];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 5919
    // runtime error: at _module.__default.TestCase__7() in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 6204
    // expect r == 0;
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
    var a := new int[1] [170];
    var n := 1;
    var old_a := a[..];
    var r := findMax(a, n);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.findMax(BigInteger[] a, BigInteger n) in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 5919
    // runtime error: at _module.__default.TestCase__8() in C:\cygwin64\tmp\DafnyCBT_akiry0xabxe\runner.cs:line 6239
    // expect r == 0;
  }

}

method Main()
{
  TestsForfindMax();
  print "TestsForfindMax: all non-failing tests passed!\n";
}
