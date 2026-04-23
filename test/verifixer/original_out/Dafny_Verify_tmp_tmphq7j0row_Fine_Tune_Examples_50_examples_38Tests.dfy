// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_Verify_tmp_tmphq7j0row_Fine_Tune_Examples_50_examples_38.dfy
// Method: main
// Generated: 2026-04-22 21:29:10

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
    if i % 2 == 0 {
      y := y + 1;
    } else {
    }
  }
}


method TestsFormain()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST Q1: i % 2 != 0 || x == 2 * y
  {
    var n := 10;
    var i, x, y := main(n);
    expect i % 2 != 0 || x == 2 * y;
    expect i == 10; // observed from implementation
    expect x == 10; // observed from implementation
    expect y == 5; // observed from implementation
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

}

method Main()
{
  TestsFormain();
  print "TestsFormain: all non-failing tests passed!\n";
}
