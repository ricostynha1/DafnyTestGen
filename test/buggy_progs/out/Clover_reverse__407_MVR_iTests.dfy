// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_reverse__407_MVR_i.dfy
// Method: reverse
// Generated: 2026-04-17 19:30:44

// Clover_reverse.dfy

method reverse(a: array<int>)
  modifies a
  ensures forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  decreases a
{
  var i := 0;
  while i < a.Length / 2
    invariant 0 <= i <= a.Length / 2
    invariant forall k: int {:trigger a[k]} :: 0 <= k < i || a.Length - 1 - i < k <= a.Length - 1 ==> a[k] == old(a[a.Length - 1 - k])
    invariant forall k: int {:trigger old(a[k])} {:trigger a[k]} :: i <= k <= a.Length - 1 - i ==> a[k] == old(a[k])
    decreases a.Length / 2 - i
  {
    a[i], a[a.Length - 1 - i] := a[i - 1 - i], a[i];
    i := i + 1;
  }
}


method TestsForreverse()
{
  // Test case for combination {1}:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[0] [];
    reverse(a);
    expect a[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oa≠old:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[2] [11, 8];
    reverse(a);
    // expect a[..] == [8, 11];
  }

  // Test case for combination {1}/R3:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[1] [9];
    reverse(a);
    expect a[..] == [9];
  }

}

method Main()
{
  TestsForreverse();
  print "TestsForreverse: all non-failing tests passed!\n";
}
