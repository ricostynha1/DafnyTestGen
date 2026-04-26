// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Exercise3_Increment_Array__593-601_SDL.dfy
// Method: incrementArray
// Generated: 2026-04-24 16:37:57

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
  }
}


method TestsForincrementArray()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [10];
    incrementArray(a);
    // expect a[..] == [11];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[2] [10, -10];
    incrementArray(a);
    // expect a[..] == [11, -9];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [9];
    incrementArray(a);
    // expect a[..] == [10];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [-10];
    incrementArray(a);
    // expect a[..] == [-9];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [8];
    incrementArray(a);
    // expect a[..] == [9];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [-9];
    incrementArray(a);
    // expect a[..] == [-8];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [3];
    incrementArray(a);
    // expect a[..] == [4];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [6];
    incrementArray(a);
    // expect a[..] == [7];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [-8];
    incrementArray(a);
    // expect a[..] == [-7];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [7];
    incrementArray(a);
    // expect a[..] == [8];
  }

}

method Main()
{
  TestsForincrementArray();
  print "TestsForincrementArray: all non-failing tests passed!\n";
}
