// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_591__270-284_AOI.dfy
// Method: SwapFirstAndLast
// Generated: 2026-03-26 15:01:28

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  a != null && a.Length > 0
  //   POST: a[0] == old(a[a.Length - 1])
  //   POST: a[a.Length - 1] == old(a[0])
  //   POST: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[1] [8];
    var old_a := a[..];
    SwapFirstAndLast(a);
    expect a[0] == old_a[a.Length - 1];
    expect a[a.Length - 1] == old_a[0];
    expect forall k: int {:trigger old_a[k]} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old_a[k];
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  a != null && a.Length > 0
  //   POST: a[0] == old(a[a.Length - 1])
  //   POST: a[a.Length - 1] == old(a[0])
  //   POST: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[2] [8, 8];
    var old_a := a[..];
    SwapFirstAndLast(a);
    // expect a[0] == old_a[a.Length - 1];
    // expect a[a.Length - 1] == old_a[0];
    // expect forall k: int {:trigger old_a[k]} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old_a[k];
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a != null && a.Length > 0
  //   POST: a[0] == old(a[a.Length - 1])
  //   POST: a[a.Length - 1] == old(a[0])
  //   POST: forall k: int {:trigger old(a[k])} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old(a[k])
  {
    var a := new int[3] [5, 6, 4];
    var old_a := a[..];
    SwapFirstAndLast(a);
    // expect a[0] == old_a[a.Length - 1];
    // expect a[a.Length - 1] == old_a[0];
    // expect forall k: int {:trigger old_a[k]} {:trigger a[k]} :: 1 <= k < a.Length - 1 ==> a[k] == old_a[k];
  }

}

method Main()
{
  Passing();
  Failing();
}
