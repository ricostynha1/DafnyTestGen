// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_reverse__407_MVR_i.dfy
// Method: reverse
// Generated: 2026-03-24 21:10:56

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


method Passing()
{
  // Test case for combination {1}:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[0] [];
    var old_a := a[..];
    reverse(a);
    expect forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old_a[a.Length - 1 - i];
  }

  // Test case for combination {1}/Ba=1:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[1] [2];
    var old_a := a[..];
    reverse(a);
    expect forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old_a[a.Length - 1 - i];
  }

}

method Failing()
{
  // Test case for combination {1}/Ba=2:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[2] [4, 3];
    var old_a := a[..];
    reverse(a);
    // expect forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old_a[a.Length - 1 - i];
  }

  // Test case for combination {1}/Ba=3:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[3] [6, 5, 4];
    var old_a := a[..];
    reverse(a);
    // expect forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old_a[a.Length - 1 - i];
  }

}

method Main()
{
  Passing();
  Failing();
}
