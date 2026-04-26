// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_reverse__435-435_AOI.dfy
// Method: reverse
// Generated: 2026-04-24 12:56:18

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
    a[i], a[a.Length - 1 - i] := a[a.Length - 1 - i], a[i];
    i := -i + 1;
  }
}


method TestsForreverse()
{
  // Test case for combination {1}:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[1] [-10];
    reverse(a);
    expect a[..] == [-10];
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[0] [];
    reverse(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[2] [-9, -10];
    reverse(a);
    expect a[..] == [-10, -9];
  }

  // Test case for combination {1}/R4:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[1] [-8];
    reverse(a);
    expect a[..] == [-8];
  }

  // Test case for combination {1}/R5:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[1] [-9];
    reverse(a);
    expect a[..] == [-9];
  }

  // Test case for combination {1}/R6:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[1] [-6];
    reverse(a);
    expect a[..] == [-6];
  }

  // Test case for combination {1}/R7:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[1] [-2];
    reverse(a);
    expect a[..] == [-2];
  }

  // Test case for combination {1}/R8:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[1] [-7];
    reverse(a);
    expect a[..] == [-7];
  }

  // Test case for combination {1}/R9:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[1] [-5];
    reverse(a);
    expect a[..] == [-5];
  }

  // Test case for combination {1}/R10:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[a.Length - 1 - i])
  {
    var a := new int[1] [-3];
    reverse(a);
    expect a[..] == [-3];
  }

}

method Main()
{
  TestsForreverse();
  print "TestsForreverse: all non-failing tests passed!\n";
}
