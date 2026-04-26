// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_591__270-284_AOI.dfy
// Method: SwapFirstAndLast
// Generated: 2026-04-24 20:07:46

// dafny-synthesis_task_id_591.dfy

method SwapFirstAndLast(a: array<int>)
  requires a != null && a.Length > 0
  modifies a
  ensures a[0] == old(a[a.Length - 1]) && a[a.Length - 1] == old(a[0])
  ensures forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  decreases a
{
  var temp := a[0];
  a[0] := -a[a.Length - 1];
  a[a.Length - 1] := temp;
}


method TestsForSwapFirstAndLast()
{
  // Test case for combination {1}:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [9];
    SwapFirstAndLast(a);
    expect a[..] == [9];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[2] [8, 8];
    SwapFirstAndLast(a);
    // actual runtime state: a=[-8, 8]
    // expect a[..] == [8, 8]; // LHS=[-8, 8], RHS=[8, 8]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oa≠old:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[2] [11, 7];
    SwapFirstAndLast(a);
    // actual runtime state: a=[-7, 11]
    // expect a[..] == [7, 11]; // LHS=[-7, 11], RHS=[7, 11]
  }

  // Test case for combination {1}/R4:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [13];
    SwapFirstAndLast(a);
    expect a[..] == [13];
  }

  // Test case for combination {1}/R5:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [14];
    SwapFirstAndLast(a);
    expect a[..] == [14];
  }

  // Test case for combination {1}/R6:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [15];
    SwapFirstAndLast(a);
    expect a[..] == [15];
  }

  // Test case for combination {1}/R7:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [16];
    SwapFirstAndLast(a);
    expect a[..] == [16];
  }

  // Test case for combination {1}/R8:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [17];
    SwapFirstAndLast(a);
    expect a[..] == [17];
  }

  // Test case for combination {1}/R9:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [18];
    SwapFirstAndLast(a);
    expect a[..] == [18];
  }

  // Test case for combination {1}/R10:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [19];
    SwapFirstAndLast(a);
    expect a[..] == [19];
  }

}

method Main()
{
  TestsForSwapFirstAndLast();
  print "TestsForSwapFirstAndLast: all non-failing tests passed!\n";
}
