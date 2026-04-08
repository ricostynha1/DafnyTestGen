// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Exercise3_Increment_Array__593-601_SDL.dfy
// Method: incrementArray
// Generated: 2026-04-08 16:16:24

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


method Passing()
{
  // (no passing tests)
}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  //   ENSURES: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [7718];
    incrementArray(a);
    // expect a[..] == [7719];
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a.Length > 0
  //   POST: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  //   ENSURES: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[2] [-21239, 2437];
    incrementArray(a);
    // expect a[..] == [-21238, 2438];
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  //   ENSURES: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[3] [-8856, 11797, 11798];
    incrementArray(a);
    // expect a[..] == [-8855, 11798, 11799];
  }

}

method Main()
{
  Passing();
  Failing();
}
