// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Workshop_tmp_tmp0cu11bdq_Workshop_Answers_Question5.dfy
// Method: rev
// Generated: 2026-04-22 21:38:51

// Workshop_tmp_tmp0cu11bdq_Workshop_Answers_Question5.dfy

method rev(a: array<int>)
  requires a != null
  modifies a
  ensures forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  decreases a
{
  var i := 0;
  while i < a.Length - 1 - i
    invariant 0 <= i <= a.Length / 2
    invariant forall k: int {:trigger a[k]} :: 0 <= k < i || a.Length - 1 - i < k <= a.Length - 1 ==> a[k] == old(a[a.Length - 1 - k])
    invariant forall k: int {:trigger old(a[k])} {:trigger a[k]} :: i <= k <= a.Length - 1 - i ==> a[k] == old(a[k])
    decreases a.Length - 1 - i - i
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

  // Test case for combination {1}/O|a|=0:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[0] [];
    rev(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a != null
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[2] [-5, -1];
    rev(a);
    expect a[..] == [-1, -5];
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
