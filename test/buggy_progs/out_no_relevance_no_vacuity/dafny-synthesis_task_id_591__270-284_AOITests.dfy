// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_591__270-284_AOI.dfy
// Method: SwapFirstAndLast
// Generated: 2026-04-24 23:55:55

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
    var a := new int[1] [-10];
    SwapFirstAndLast(a);
    expect a[..] == [-10];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[2] [-7, -8];
    SwapFirstAndLast(a);
    // actual runtime state: a=[8, -7]
    // expect a[..] == [-8, -7]; // LHS=[8, -7], RHS=[-8, -7]
  }

  // Test case for combination {1}/R3:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [-6];
    SwapFirstAndLast(a);
    expect a[..] == [-6];
  }

  // Test case for combination {1}/R4:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [-9];
    SwapFirstAndLast(a);
    expect a[..] == [-9];
  }

  // Test case for combination {1}/R5:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [-8];
    SwapFirstAndLast(a);
    expect a[..] == [-8];
  }

  // Test case for combination {1}/R6:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [-7];
    SwapFirstAndLast(a);
    expect a[..] == [-7];
  }

  // Test case for combination {1}/R7:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [-5];
    SwapFirstAndLast(a);
    expect a[..] == [-5];
  }

  // Test case for combination {1}/R8:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [-4];
    SwapFirstAndLast(a);
    expect a[..] == [-4];
  }

  // Test case for combination {1}/R9:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [-3];
    SwapFirstAndLast(a);
    expect a[..] == [-3];
  }

  // Test case for combination {1}/R10:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [-2];
    SwapFirstAndLast(a);
    expect a[..] == [-2];
  }

}

method Main()
{
  TestsForSwapFirstAndLast();
  print "TestsForSwapFirstAndLast: all non-failing tests passed!\n";
}
