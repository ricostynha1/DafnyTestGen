// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Exercise3_Increment_Array.dfy
// Method: incrementArray
// Generated: 2026-03-26 14:58:22

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
    assert forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < j ==> a[i] == old(a[i]) + 1;
    assert a[j] == old(a[j]);
    a[j] := a[j] + 1;
    assert forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < j ==> a[i] == old(a[i]) + 1;
    assert a[j] == old(a[j]) + 1;
    j := j + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [7718];
    var old_a := a[..];
    incrementArray(a);
    expect forall i: int {:trigger old_a[i]} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old_a[i] + 1;
  }

  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[2] [21237, 2437];
    var old_a := a[..];
    incrementArray(a);
    expect forall i: int {:trigger old_a[i]} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old_a[i] + 1;
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[3] [-8856, 11797, 11798];
    var old_a := a[..];
    incrementArray(a);
    expect forall i: int {:trigger old_a[i]} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old_a[i] + 1;
  }

}

method Failing()
{
  // (no failing tests)
}

method Main()
{
  Passing();
  Failing();
}
