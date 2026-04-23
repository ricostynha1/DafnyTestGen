// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_Verify_tmp_tmphq7j0row_dataset_C_convert_examples_07__922_VER_n.dfy
// Method: main
// Generated: 2026-04-22 21:32:56

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


method TestsFormain()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 10;
    var a, b := main(n);
    // actual runtime state: a=11, b=20
    // expect a + b == 3 * n; // LHS=31, RHS=30
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 0;
    var a, b := main(n);
    expect a + b == 3 * n;
    expect a == 0; // observed from implementation
    expect b == 0; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 1;
    var a, b := main(n);
    // actual runtime state: a=2, b=2
    // expect a + b == 3 * n; // LHS=4, RHS=3
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oa<0:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 9;
    var a, b := main(n);
    // actual runtime state: a=10, b=18
    // expect a + b == 3 * n; // LHS=28, RHS=27
  }

}

method Main()
{
  TestsFormain();
  print "TestsFormain: all non-failing tests passed!\n";
}
