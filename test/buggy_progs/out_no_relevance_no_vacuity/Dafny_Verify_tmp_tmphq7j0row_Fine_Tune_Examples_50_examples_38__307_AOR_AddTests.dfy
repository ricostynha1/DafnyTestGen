// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Verify_tmp_tmphq7j0row_Fine_Tune_Examples_50_examples_38__307_AOR_Add.dfy
// Method: main
// Generated: 2026-04-24 23:31:04

// Dafny_Verify_tmp_tmphq7j0row_Fine_Tune_Examples_50_examples_38.dfy

method main(n: int)
    returns (i: int, x: int, y: int)
  requires n >= 0
  ensures i % 2 != 0 || x == 2 * y
  decreases n
{
  i := 0;
  x := 0;
  y := 0;
  while i < n
    invariant 0 <= i <= n
    invariant x == i
    invariant y == i / 2
    decreases n - i
  {
    i := i + 1;
    x := x + 1;
    if i + 2 == 0 {
      y := y + 1;
    } else {
    }
  }
}


method TestsFormain()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST Q1: i % 2 != 0 || x == 2 * y
  {
    var n := 10;
    var i, x, y := main(n);
    // actual runtime state: i=10, x=10, y=0
    // expect i % 2 != 0 || x == 2 * y; // got false
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  n >= 0
  //   POST Q1: i % 2 != 0 || x == 2 * y
  {
    var n := 0;
    var i, x, y := main(n);
    expect i % 2 != 0 || x == 2 * y;
    expect i == 0; // observed from implementation
    expect x == 0; // observed from implementation
    expect y == 0; // observed from implementation
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST Q1: i % 2 != 0 || x == 2 * y
  {
    var n := 1;
    var i, x, y := main(n);
    expect i % 2 != 0 || x == 2 * y;
    expect i == 1; // observed from implementation
    expect x == 1; // observed from implementation
    expect y == 0; // observed from implementation
  }

  // Test case for combination {1}/Oi<0:
  //   PRE:  n >= 0
  //   POST Q1: i % 2 != 0 || x == 2 * y
  {
    var n := 9;
    var i, x, y := main(n);
    expect i % 2 != 0 || x == 2 * y;
    expect i == 9; // observed from implementation
    expect x == 9; // observed from implementation
    expect y == 0; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ox>0:
  //   PRE:  n >= 0
  //   POST Q1: i % 2 != 0 || x == 2 * y
  {
    var n := 8;
    var i, x, y := main(n);
    // actual runtime state: i=8, x=8, y=0
    // expect i % 2 != 0 || x == 2 * y; // got false
  }

  // Test case for combination {1}/Ox<0:
  //   PRE:  n >= 0
  //   POST Q1: i % 2 != 0 || x == 2 * y
  {
    var n := 7;
    var i, x, y := main(n);
    expect i % 2 != 0 || x == 2 * y;
    expect i == 7; // observed from implementation
    expect x == 7; // observed from implementation
    expect y == 0; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oy>0:
  //   PRE:  n >= 0
  //   POST Q1: i % 2 != 0 || x == 2 * y
  {
    var n := 6;
    var i, x, y := main(n);
    // actual runtime state: i=6, x=6, y=0
    // expect i % 2 != 0 || x == 2 * y; // got false
  }

}

method Main()
{
  TestsFormain();
  print "TestsFormain: all non-failing tests passed!\n";
}
