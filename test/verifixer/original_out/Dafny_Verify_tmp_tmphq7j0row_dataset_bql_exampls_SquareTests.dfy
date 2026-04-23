// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_Verify_tmp_tmphq7j0row_dataset_bql_exampls_Square.dfy
// Method: square
// Generated: 2026-04-22 21:29:00

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
    r := r + x;
    x := x + 2;
    i := i + 1;
  }
}


method TestsForsquare()
{
  // Test case for combination {1}:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 10;
    var r := square(n);
    expect r == 100;
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 0;
    var r := square(n);
    expect r == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 1;
    var r := square(n);
    expect r == 1;
  }

  // Test case for combination {1}/R4:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 9;
    var r := square(n);
    expect r == 81;
  }

}

method Main()
{
  TestsForsquare();
  print "TestsForsquare: all non-failing tests passed!\n";
}
