// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Exercise3_Increment_Array.dfy
// Method: incrementArray
// Generated: 2026-04-22 21:34:06

// Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Exercise3_Increment_Array.dfy

method incrementArray(a: array<int>)
  requires a.Length > 0
  modifies a
  ensures forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  decreases a
{
  var j: int := 0;
  while j < a.Length
    invariant 0 <= j <= a.Length
    invariant forall i: int {:trigger old(a[i])} {:trigger a[i]} :: j <= i < a.Length ==> a[i] == old(a[i])
    invariant forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < j ==> a[i] == old(a[i]) + 1
    decreases a.Length - j
  {
    assert forall i: int {:trigger (a[i])} {:trigger a[i]} :: 0 <= i < j ==> a[i] == (a[i]) + 1;
    assert a[j] == (a[j]);
    a[j] := a[j] + 1;
    assert forall i: int {:trigger (a[i])} {:trigger a[i]} :: 0 <= i < j ==> a[i] == (a[i]) + 1;
    assert a[j] == (a[j]) + 1;
    j := j + 1;
  }
}


method TestsForincrementArray()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [10];
    incrementArray(a);
    expect a[..] == [11];
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[2] [9, -10];
    incrementArray(a);
    expect a[..] == [10, -9];
  }

  // Test case for combination {1}/R3:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [-10];
    incrementArray(a);
    expect a[..] == [-9];
  }

  // Test case for combination {1}/R4:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [8];
    incrementArray(a);
    expect a[..] == [9];
  }

}

method Main()
{
  TestsForincrementArray();
  print "TestsForincrementArray: all non-failing tests passed!\n";
}
