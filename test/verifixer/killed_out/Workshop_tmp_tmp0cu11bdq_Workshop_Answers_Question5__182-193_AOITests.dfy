// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Workshop_tmp_tmp0cu11bdq_Workshop_Answers_Question5__182-193_AOI.dfy
// Method: rev
// Generated: 2026-04-22 22:00:13

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
  // Test case for combination {1}:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [-9];
    rev(a);
    expect a[..] == [-9];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|=0:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[0] [];
    rev(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.rev(BigInteger[] a) in C:\cygwin64\tmp\DafnyTestGen_qwhqzmla21v\runner.cs:line 5793
    // runtime error: at _module.__default.TestCase__1() in C:\cygwin64\tmp\DafnyTestGen_qwhqzmla21v\runner.cs:line 5844
    // expect a[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[2] [-8, -10];
    rev(a);
    // expect a[..] == [-10, -8]; // LHS=[-8, -10], RHS=[-10, -8]
  }

  // Test case for combination {1}/R4:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [-10];
    rev(a);
    expect a[..] == [-10];
  }

}

method Main()
{
  TestsForrev();
  print "TestsForrev: all non-failing tests passed!\n";
}
