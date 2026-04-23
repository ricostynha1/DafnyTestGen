// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_591__270-284_AOI.dfy
// Method: SwapFirstAndLast
// Generated: 2026-04-22 21:44:30

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
  // Test case for combination {1}/Rel:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [-3];
    SwapFirstAndLast(a);
    expect a[..] == [-3];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: a[0] == old(a[a.Length - 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  //   POST Q3: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[2] [-9, -8];
    SwapFirstAndLast(a);
    // actual runtime state: a=[8, -9]
    // expect a[..] == [-8, -9]; // LHS=[8, -9], RHS=[-8, -9]
  }

}

method Main()
{
  TestsForSwapFirstAndLast();
  print "TestsForSwapFirstAndLast: all non-failing tests passed!\n";
}
