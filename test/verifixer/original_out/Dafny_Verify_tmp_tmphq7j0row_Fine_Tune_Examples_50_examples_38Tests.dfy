// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_Verify_tmp_tmphq7j0row_Fine_Tune_Examples_50_examples_38.dfy
// Method: main
// Generated: 2026-04-01 13:49:53

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


method Passing()
{
  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST: i % 2 != 0
  {
    var n := 1;
    expect n >= 0; // PRE-CHECK
    var i, x, y := main(n);
    expect i % 2 != 0;
  }

}

method Failing()
{
  // Test case for combination {1,2}:
  //   PRE:  n >= 0
  //   POST: i % 2 != 0
  //   POST: x == 2 * y
  {
    var n := 0;
    // expect n >= 0; // PRE-CHECK
    var i, x, y := main(n);
    // expect i % 2 != 0;
    // expect x == 2 * y;
  }

}

method Main()
{
  Passing();
  Failing();
}
