// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Workshop_tmp_tmp0cu11bdq_Workshop_Answers_Question5__182-193_AOI.dfy
// Method: rev
// Generated: 2026-04-24 23:01:42

// Workshop_tmp_tmp0cu11bdq_Workshop_Answers_Question5.dfy

method rev(a: array<int>)
  requires a != null
  modifies a
  ensures forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  decreases a
{
  var i := 0;
  while i < -(a.Length - 1) - i
    invariant 0 <= i <= a.Length / 2
    invariant forall k: int {:trigger a[k]} :: 0 <= k < i || a.Length - 1 - i < k <= a.Length - 1 ==> a[k] == old(a[a.Length - 1 - k])
    invariant forall k: int {:trigger old(a[k])} {:trigger a[k]} :: i <= k <= a.Length - 1 - i ==> a[k] == old(a[k])
    decreases -(a.Length - 1) - i - i
  {
    a[i], a[a.Length - 1 - i] := a[a.Length - 1 - i], a[i];
    i := i + 1;
  }
}


method TestsForrev()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[0] [];
    rev(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.rev(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_sazxegl35jy\runner.cs:line 5877
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_sazxegl35jy\runner.cs:line 5909
    // expect a[..] == [];
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [2];
    rev(a);
    expect a[..] == [2];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[2] [12, 8];
    rev(a);
    // expect a[..] == [8, 12]; // LHS=[12, 8], RHS=[8, 12]
  }

  // Test case for combination {1}/R4:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [9];
    rev(a);
    expect a[..] == [9];
  }

  // Test case for combination {1}/R5:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [10];
    rev(a);
    expect a[..] == [10];
  }

  // Test case for combination {1}/R6:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [11];
    rev(a);
    expect a[..] == [11];
  }

  // Test case for combination {1}/R7:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [13];
    rev(a);
    expect a[..] == [13];
  }

  // Test case for combination {1}/R8:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [14];
    rev(a);
    expect a[..] == [14];
  }

  // Test case for combination {1}/R9:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [15];
    rev(a);
    expect a[..] == [15];
  }

  // Test case for combination {1}/R10:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [16];
    rev(a);
    expect a[..] == [16];
  }

}

method Main()
{
  TestsForrev();
  print "TestsForrev: all non-failing tests passed!\n";
}
