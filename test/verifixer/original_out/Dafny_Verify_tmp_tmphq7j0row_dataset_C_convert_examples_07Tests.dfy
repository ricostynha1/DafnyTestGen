// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_Verify_tmp_tmphq7j0row_dataset_C_convert_examples_07.dfy
// Method: main
// Generated: 2026-03-25 22:37:27

// Dafny_Verify_tmp_tmphq7j0row_dataset_C_convert_examples_07.dfy

method main(n: int) returns (a: int, b: int)
  requires n >= 0
  ensures a + b == 3 * n
  decreases n
{
  var i: int := 0;
  a := 0;
  b := 0;
  while i < n
    invariant 0 <= i <= n
    invariant a + b == 3 * i
    decreases n - i
  {
    if * {
      a := a + 1;
      b := b + 2;
    } else {
      a := a + 2;
      b := b + 1;
    }
    i := i + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: a + b == 3 * n
  {
    var n := 0;
    var a, b := main(n);
    expect a == 0;
    expect b == 0;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: a + b == 3 * n
  {
    var n := 1;
    var a, b := main(n);
    // expect a == 3;
    // expect b == 0;
  }

  // Test case for combination {1}/R3:
  //   PRE:  n >= 0
  //   POST: a + b == 3 * n
  {
    var n := 2;
    var a, b := main(n);
    // expect a == 6;
    // expect b == 0;
  }

}

method Main()
{
  Passing();
  Failing();
}
