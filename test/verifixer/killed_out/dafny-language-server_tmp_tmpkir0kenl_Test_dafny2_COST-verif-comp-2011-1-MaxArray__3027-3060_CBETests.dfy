// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-language-server_tmp_tmpkir0kenl_Test_dafny2_COST-verif-comp-2011-1-MaxArray__3027-3060_CBE.dfy
// Method: max
// Generated: 2026-03-25 22:50:37

// dafny-language-server_tmp_tmpkir0kenl_Test_dafny2_COST-verif-comp-2011-1-MaxArray.dfy

method max(a: array<int>) returns (x: int)
  requires a.Length != 0
  ensures 0 <= x < a.Length
  ensures forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  decreases a
{
  x := 0;
  var y := a.Length - 1;
  ghost var m := y;
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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  a.Length != 0
  //   POST: 0 <= x < a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  {
    var a := new int[1] [38];
    var x := max(a);
    expect x == 0;
  }

  // Test case for combination {1}:
  //   PRE:  a.Length != 0
  //   POST: 0 <= x < a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  {
    var a := new int[2] [-7719, 38];
    var x := max(a);
    expect x == 1;
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length != 0
  //   POST: 0 <= x < a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  {
    var a := new int[3] [23675, 23674, 23676];
    var x := max(a);
    expect x == 2;
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
