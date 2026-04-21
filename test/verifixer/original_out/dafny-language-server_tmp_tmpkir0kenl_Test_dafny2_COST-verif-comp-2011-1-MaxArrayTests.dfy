// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-language-server_tmp_tmpkir0kenl_Test_dafny2_COST-verif-comp-2011-1-MaxArray.dfy
// Method: max
// Generated: 2026-04-08 19:09:14

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
    if a[x] <= a[y] {
      x := x + 1;
      m := y;
    } else {
      y := y - 1;
      m := x;
    }
  }
  return x;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  a.Length != 0
  //   POST: 0 <= x < a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  //   ENSURES: 0 <= x < a.Length
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  {
    var a := new int[1] [38];
    var x := max(a);
    expect x == 0;
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a.Length != 0
  //   POST: 0 <= x < a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  //   ENSURES: 0 <= x < a.Length
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  {
    var a := new int[2] [35472, 35473];
    var x := max(a);
    expect x == 1;
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length != 0
  //   POST: 0 <= x < a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  //   ENSURES: 0 <= x < a.Length
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  {
    var a := new int[3] [23675, 23674, 23676];
    var x := max(a);
    expect x == 2;
  }

  // Test case for combination {1}/Ox>0:
  //   PRE:  a.Length != 0
  //   POST: 0 <= x < a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  //   ENSURES: 0 <= x < a.Length
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  {
    var a := new int[4] [-7719, -21238, -2437, 38];
    var x := max(a);
    expect x == 3;
  }

  // Test case for combination {1}/Ox=0:
  //   PRE:  a.Length != 0
  //   POST: 0 <= x < a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  //   ENSURES: 0 <= x < a.Length
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= a[x]
  {
    var a := new int[5] [7719, -38, -21238, -2437, -8855];
    var x := max(a);
    expect x == 0;
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
