// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_Verify_tmp_tmphq7j0row_dataset_C_convert_examples_07__922_VER_n.dfy
// Method: main
// Generated: 2026-04-08 16:47:06

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
      a := n + 1;
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
  //   ENSURES: a + b == 3 * n
  {
    var n := 0;
    var a, b := main(n);
    expect a + b == 3 * n;
  }

}

method Failing()
{
  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST: a + b == 3 * n
  //   ENSURES: a + b == 3 * n
  {
    var n := 1;
    var a, b := main(n);
    // expect a + b == 3 * n;
  }

  // Test case for combination {1}/Oa>0:
  //   PRE:  n >= 0
  //   POST: a + b == 3 * n
  //   ENSURES: a + b == 3 * n
  {
    var n := 2;
    var a, b := main(n);
    // expect a + b == 3 * n;
  }

  // Test case for combination {1}/Oa<0:
  //   PRE:  n >= 0
  //   POST: a + b == 3 * n
  //   ENSURES: a + b == 3 * n
  {
    var n := 3;
    var a, b := main(n);
    // expect a + b == 3 * n;
  }

  // Test case for combination {1}/Oa=0:
  //   PRE:  n >= 0
  //   POST: a + b == 3 * n
  //   ENSURES: a + b == 3 * n
  {
    var n := 4;
    var a, b := main(n);
    // expect a == 0;
    // expect b == 12;
  }

  // Test case for combination {1}/Ob>0:
  //   PRE:  n >= 0
  //   POST: a + b == 3 * n
  //   ENSURES: a + b == 3 * n
  {
    var n := 5;
    var a, b := main(n);
    // expect a + b == 3 * n;
  }

  // Test case for combination {1}/Ob<0:
  //   PRE:  n >= 0
  //   POST: a + b == 3 * n
  //   ENSURES: a + b == 3 * n
  {
    var n := 6;
    var a, b := main(n);
    // expect a + b == 3 * n;
  }

  // Test case for combination {1}/Ob=0:
  //   PRE:  n >= 0
  //   POST: a + b == 3 * n
  //   ENSURES: a + b == 3 * n
  {
    var n := 7;
    var a, b := main(n);
    // expect a == 21;
    // expect b == 0;
  }

}

method Main()
{
  Passing();
  Failing();
}
