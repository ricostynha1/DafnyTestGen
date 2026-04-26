// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Verify_tmp_tmphq7j0row_dataset_bql_exampls_Square__222-232_SDL.dfy
// Method: square
// Generated: 2026-04-24 16:01:53

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


method TestsForsquare()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 10;
    var r := square(n);
    // expect r == 100; // got 0
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 0;
    var r := square(n);
    expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bn=1:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 1;
    var r := square(n);
    // expect r == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 9;
    var r := square(n);
    // expect r == 81; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 8;
    var r := square(n);
    // expect r == 64; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 7;
    var r := square(n);
    // expect r == 49; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 6;
    var r := square(n);
    // expect r == 36; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 5;
    var r := square(n);
    // expect r == 25; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 4;
    var r := square(n);
    // expect r == 16; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  0 <= n
  //   POST Q1: r == n * n
  {
    var n := 3;
    var r := square(n);
    // expect r == 9; // got 0
  }

}

method Main()
{
  TestsForsquare();
  print "TestsForsquare: all non-failing tests passed!\n";
}
