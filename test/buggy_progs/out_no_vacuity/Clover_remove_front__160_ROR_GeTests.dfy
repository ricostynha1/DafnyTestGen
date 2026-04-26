// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_remove_front__160_ROR_Ge.dfy
// Method: remove_front
// Generated: 2026-04-24 15:41:08

// Clover_remove_front.dfy

method remove_front(a: array<int>) returns (c: array<int>)
  requires a.Length > 0
  ensures a[1..] == c[..]
  decreases a
{
  c := new int[a.Length - 1];
  var i := 1;
  while i >= a.Length
    invariant 1 <= i <= a.Length
    invariant forall ii: int {:trigger a[ii]} :: 1 <= ii < i ==> c[ii - 1] == a[ii]
    decreases i - a.Length
  {
    c[i - 1] := a[i];
    i := i + 1;
  }
}


method TestsForremove_front()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST Q1: a[1..] == c[..]
  {
    var a := new int[1] [-1];
    var c := remove_front(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.remove__front(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 5892
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 5921
    // expect c[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: a[1..] == c[..]
  {
    var a := new int[2] [-10, 6];
    var c := remove_front(a);
    // actual runtime state: c=[0]
    // expect c[..] == [6]; // LHS=[0], RHS=[6]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|c|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: a[1..] == c[..]
  {
    var a := new int[3] [-9, -1, -10];
    var c := remove_front(a);
    // actual runtime state: c=[0, 0]
    // expect c[..] == [-1, -10]; // LHS=[0, 0], RHS=[-1, -10]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  a.Length > 0
  //   POST Q1: a[1..] == c[..]
  {
    var a := new int[1] [-8];
    var c := remove_front(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.remove__front(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 5892
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 6005
    // expect c[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  a.Length > 0
  //   POST Q1: a[1..] == c[..]
  {
    var a := new int[1] [-7];
    var c := remove_front(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.remove__front(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 5892
    // runtime error: at _module.__default.TestCase__4() in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 6030
    // expect c[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  a.Length > 0
  //   POST Q1: a[1..] == c[..]
  {
    var a := new int[1] [-6];
    var c := remove_front(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.remove__front(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 5892
    // runtime error: at _module.__default.TestCase__5() in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 6055
    // expect c[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  a.Length > 0
  //   POST Q1: a[1..] == c[..]
  {
    var a := new int[1] [-5];
    var c := remove_front(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.remove__front(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 5892
    // runtime error: at _module.__default.TestCase__6() in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 6080
    // expect c[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  a.Length > 0
  //   POST Q1: a[1..] == c[..]
  {
    var a := new int[1] [-2];
    var c := remove_front(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.remove__front(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 5892
    // runtime error: at _module.__default.TestCase__7() in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 6105
    // expect c[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  a.Length > 0
  //   POST Q1: a[1..] == c[..]
  {
    var a := new int[1] [-3];
    var c := remove_front(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.remove__front(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 5892
    // runtime error: at _module.__default.TestCase__8() in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 6130
    // expect c[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  a.Length > 0
  //   POST Q1: a[1..] == c[..]
  {
    var a := new int[1] [6];
    var c := remove_front(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.remove__front(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 5892
    // runtime error: at _module.__default.TestCase__9() in C:\cygwin64\tmp\DafnyCBT_3awsjtt5z2s\runner.cs:line 6155
    // expect c[..] == [];
  }

}

method Main()
{
  TestsForremove_front();
  print "TestsForremove_front: all non-failing tests passed!\n";
}
