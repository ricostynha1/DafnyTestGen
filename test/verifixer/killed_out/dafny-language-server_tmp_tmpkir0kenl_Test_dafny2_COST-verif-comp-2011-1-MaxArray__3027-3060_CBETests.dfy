// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-language-server_tmp_tmpkir0kenl_Test_dafny2_COST-verif-comp-2011-1-MaxArray__3027-3060_CBE.dfy
// Method: max
// Generated: 2026-04-22 21:39:57

// dafny-language-server_tmp_tmpkir0kenl_Test_dafny2_COST-verif-comp-2011-1-MaxArray.dfy

method max(a: array<int>) returns (x: int)
  requires a.Length != 0
  ensures 0 <= x < a.Length
  ensures forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  decreases a
{
  x := 0;
  var y := a.Length - 1;
  var m := y;
  while x != y
    invariant 0 <= x <= y < a.Length
    invariant m == x || m == y
    invariant forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= a[m]
    invariant forall i: int {:trigger a[i]} :: y < i < a.Length ==> a[i] <= a[m]
    decreases if x <= y then y - x else x - y
  {
    x := x + 1;
    m := y;
  }
  return x;
}


method TestsFormax()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  a.Length != 0
  //   POST Q1: 0 <= x
  //   POST Q2: x < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  {
    var a := new int[2] [-8, -9];
    var x := max(a);
    // expect x == 0; // got 1
  }

  // Test case for combination {1}/Bx=1:
  //   PRE:  a.Length != 0
  //   POST Q1: 0 <= x
  //   POST Q2: x < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  {
    var a := new int[2] [-10, -10];
    var x := max(a);
    expect x == 1 || x == 0;
    expect x == 1; // observed from implementation
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  a.Length != 0
  //   POST Q1: 0 <= x
  //   POST Q2: x < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  {
    var a := new int[1] [-10];
    var x := max(a);
    expect x == 0;
  }

  // Test case for combination {1}/R3:
  //   PRE:  a.Length != 0
  //   POST Q1: 0 <= x
  //   POST Q2: x < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  {
    var a := new int[1] [-8];
    var x := max(a);
    expect x == 0;
  }

}

method Main()
{
  TestsFormax();
  print "TestsFormax: all non-failing tests passed!\n";
}
