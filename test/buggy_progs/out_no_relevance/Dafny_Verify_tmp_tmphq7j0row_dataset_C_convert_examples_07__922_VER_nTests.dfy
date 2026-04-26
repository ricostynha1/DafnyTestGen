// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Verify_tmp_tmphq7j0row_dataset_C_convert_examples_07__922_VER_n.dfy
// Method: main
// Generated: 2026-04-24 13:18:20

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
    var n := 2;
    var a, b := main(n);
    // actual runtime state: a=3, b=4
    // expect a + b == 3 * n; // LHS=7, RHS=6
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ob<0:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 9;
    var a, b := main(n);
    // actual runtime state: a=10, b=18
    // expect a + b == 3 * n; // LHS=28, RHS=27
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 8;
    var a, b := main(n);
    // actual runtime state: a=9, b=16
    // expect a + b == 3 * n; // LHS=25, RHS=24
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 7;
    var a, b := main(n);
    // actual runtime state: a=8, b=14
    // expect a + b == 3 * n; // LHS=22, RHS=21
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 6;
    var a, b := main(n);
    // actual runtime state: a=7, b=12
    // expect a + b == 3 * n; // LHS=19, RHS=18
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 5;
    var a, b := main(n);
    // actual runtime state: a=6, b=10
    // expect a + b == 3 * n; // LHS=16, RHS=15
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 4;
    var a, b := main(n);
    // actual runtime state: a=5, b=8
    // expect a + b == 3 * n; // LHS=13, RHS=12
  }

}

method Main()
{
  TestsFormain();
  print "TestsFormain: all non-failing tests passed!\n";
}
