// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_Verify_tmp_tmphq7j0row_dataset_bql_exampls_Square__222-232_SDL.dfy
// Method: square
// Generated: 2026-04-08 16:47:00

// Dafny_Verify_tmp_tmphq7j0row_dataset_bql_exampls_Square.dfy

method square(n: int) returns (r: int)
  requires 0 <= n
  ensures r == n * n
  decreases n
{
  var x: int;
  var i: int;
  r := 0;
  i := 0;
  x := 1;
  while i < n
    invariant i <= n
    invariant r == i * i
    invariant x == 2 * i + 1
    decreases n - i
  {
    x := x + 2;
    i := i + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  0 <= n
  //   POST: r == n * n
  //   ENSURES: r == n * n
  {
    var n := 0;
    var r := square(n);
    expect r == 0;
  }

}

method Failing()
{
  // Test case for combination {1}/Bn=1:
  //   PRE:  0 <= n
  //   POST: r == n * n
  //   ENSURES: r == n * n
  {
    var n := 1;
    var r := square(n);
    // expect r == 1;
  }

  // Test case for combination {1}/Or>0:
  //   PRE:  0 <= n
  //   POST: r == n * n
  //   ENSURES: r == n * n
  {
    var n := 3;
    var r := square(n);
    // expect r == 9;
  }

}

method Main()
{
  Passing();
  Failing();
}
