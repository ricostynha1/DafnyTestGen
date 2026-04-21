// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafl_tmp_tmp_r3_8w3y_dafny_examples_uiowa_modifying-arrays__1114_LVR_1.dfy
// Method: InitArray
// Generated: 2026-04-20 23:31:18

// dafl_tmp_tmp_r3_8w3y_dafny_examples_uiowa_modifying-arrays.dfy

method SetEndPoints(a: array<int>, left: int, right: int)
  requires a.Length != 0
  modifies a
  decreases a, left, right
{
  a[0] := left;
  a[a.Length - 1] := right;
}

method Aliases(a: array<int>, b: array<int>)
  requires a.Length >= b.Length > 100
  modifies a
  decreases a, b
{
  a[0] := 10;
  var c := a;
  if b == a {
    b[10] := b[0] + 1;
  }
  c[20] := a[14] + 2;
}

method NewArray() returns (a: array<int>)
  ensures a.Length == 20
  ensures fresh(a)
{
  a := new int[20];
  var b := new int[30];
  a[6] := 216;
  b[7] := 343;
}

method Caller()
{
  var a := NewArray();
  a[8] := 512;
}

method InitArray<T>(a: array<T>, d: T)
  modifies a
  ensures forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == d
  decreases a
{
  var n := 1;
  while n != a.Length
    invariant 0 <= n <= a.Length
    invariant forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] == d
    decreases if n <= a.Length then a.Length - n else n - a.Length
  {
    a[n] := d;
    n := n + 1;
  }
}

method UpdateElements(a: array<int>)
  requires a.Length == 10
  modifies a
  ensures old(a[4]) < a[4]
  ensures a[6] <= old(a[6])
  ensures a[8] == old(a[8])
  decreases a
{
  a[4] := a[4] + 3;
  a[8] := a[8] + 1;
  a[7] := 516;
  a[8] := a[8] - 1;
}

method IncrementArray(a: array<int>)
  modifies a
  ensures forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  decreases a
{
  var n := 0;
  while n != a.Length
    invariant 0 <= n <= a.Length
    invariant forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < n ==> a[i] == old(a[i]) + 1
    invariant forall i: int {:trigger old(a[i])} {:trigger a[i]} :: n <= i < a.Length ==> a[i] == old(a[i])
    decreases if n <= a.Length then a.Length - n else n - a.Length
  {
    a[n] := a[n] + 1;
    n := n + 1;
  }
}

method CopyArray<T>(a: array<T>, b: array<T>)
  requires a.Length == b.Length
  modifies b
  ensures forall i: int {:trigger old(a[i])} {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == old(a[i])
  decreases a, b
{
  var n := 0;
  while n != a.Length
    invariant 0 <= n <= a.Length
    invariant forall i: int {:trigger old(a[i])} {:trigger b[i]} :: 0 <= i < n ==> b[i] == old(a[i])
    invariant forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i])
    decreases if n <= a.Length then a.Length - n else n - a.Length
  {
    b[n] := a[n];
    n := n + 1;
  }
}


method TestsForInitArray()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == d
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == d
  {
    var a := new int[0] [];
    var d := 0;
    InitArray<int>(a, d);
    // expect a[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|=1:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == d
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == d
  {
    var a := new int[1] [3];
    var d := 2;
    InitArray<int>(a, d);
    // expect a[..] == [2];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == d
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == d
  {
    var a := new int[2] [15, 14];
    var d := 8;
    InitArray<int>(a, d);
    // expect a[..] == [8, 8];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Od=1:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == d
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == d
  {
    var a := new int[0] [];
    var d := 1;
    InitArray<int>(a, d);
    // expect a[..] == [];
  }

}

method TestsForIncrementArray()
{
  // Test case for combination {1}:
  //   POST: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  //   ENSURES: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [-10];
    IncrementArray(a);
    expect a[..] == [-9];
  }

  // Test case for combination {1}/O|a|=0:
  //   POST: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  //   ENSURES: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[0] [];
    IncrementArray(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  //   ENSURES: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[2] [-9, -4];
    IncrementArray(a);
    expect a[..] == [-8, -3];
  }

  // Test case for combination {1}/R4:
  //   POST: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  //   ENSURES: forall i: int {:trigger old(a[i])} {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] == old(a[i]) + 1
  {
    var a := new int[1] [10];
    IncrementArray(a);
    expect a[..] == [11];
  }

}

method TestsForCopyArray()
{
  // Test case for combination {1}:
  //   PRE:  a.Length == b.Length
  //   POST: forall i: int {:trigger old(a[i])} {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == old(a[i])
  //   ENSURES: forall i: int {:trigger old(a[i])} {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == old(a[i])
  {
    var a := new int[0] [];
    var b := new int[0] [];
    var old_a := a[..];
    CopyArray<int>(a, b);
    expect b[..] == [];
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  a.Length == b.Length
  //   POST: forall i: int {:trigger old(a[i])} {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == old(a[i])
  //   ENSURES: forall i: int {:trigger old(a[i])} {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == old(a[i])
  {
    var a := new int[1] [2];
    var b := new int[1] [6];
    var old_a := a[..];
    CopyArray<int>(a, b);
    expect b[..] == [2];
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length == b.Length
  //   POST: forall i: int {:trigger old(a[i])} {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == old(a[i])
  //   ENSURES: forall i: int {:trigger old(a[i])} {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == old(a[i])
  {
    var a := new int[2] [9, 11];
    var b := new int[2] [26, 27];
    var old_a := a[..];
    CopyArray<int>(a, b);
    expect b[..] == [9, 11];
  }

  // Test case for combination {1}/R4:
  //   PRE:  a.Length == b.Length
  //   POST: forall i: int {:trigger old(a[i])} {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == old(a[i])
  //   ENSURES: forall i: int {:trigger old(a[i])} {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == old(a[i])
  {
    var a := new int[1] [10];
    var b := new int[1] [23];
    var old_a := a[..];
    CopyArray<int>(a, b);
    expect b[..] == [10];
  }

}

method Main()
{
  TestsForInitArray();
  print "TestsForInitArray: all non-failing tests passed!\n";
  TestsForIncrementArray();
  print "TestsForIncrementArray: all non-failing tests passed!\n";
  TestsForCopyArray();
  print "TestsForCopyArray: all non-failing tests passed!\n";
}
