// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Verify_tmp_tmphq7j0row_Fine_Tune_Examples_error_data_completion_07__372-376_AOI.dfy
// Method: main
// Generated: 2026-04-24 11:42:58

// Dafny_Verify_tmp_tmphq7j0row_Fine_Tune_Examples_error_data_completion_07.dfy

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
      b := -(b + 1);
    }
    i := i + 1;
  }
}


method TestsFormain()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 0;
    var a, b := main(n);
    expect a + b == 3 * n;
    expect a == 0; // observed from implementation
    expect b == 0; // observed from implementation
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 1;
    var a, b := main(n);
    expect a + b == 3 * n;
    expect a == 1; // observed from implementation
    expect b == 2; // observed from implementation
  }

  // Test case for combination {1}/Oa<0:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 2;
    var a, b := main(n);
    expect a + b == 3 * n;
    expect a == 2; // observed from implementation
    expect b == 4; // observed from implementation
  }

  // Test case for combination {1}/Ob<0:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 3;
    var a, b := main(n);
    expect a + b == 3 * n;
    expect a == 3; // observed from implementation
    expect b == 6; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 4;
    var a, b := main(n);
    expect a + b == 3 * n;
    expect a == 4; // observed from implementation
    expect b == 8; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 5;
    var a, b := main(n);
    expect a + b == 3 * n;
    expect a == 5; // observed from implementation
    expect b == 10; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 6;
    var a, b := main(n);
    expect a + b == 3 * n;
    expect a == 6; // observed from implementation
    expect b == 12; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 7;
    var a, b := main(n);
    expect a + b == 3 * n;
    expect a == 7; // observed from implementation
    expect b == 14; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 8;
    var a, b := main(n);
    expect a + b == 3 * n;
    expect a == 8; // observed from implementation
    expect b == 16; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  n >= 0
  //   POST Q1: a + b == 3 * n
  {
    var n := 9;
    var a, b := main(n);
    expect a + b == 3 * n;
    expect a == 9; // observed from implementation
    expect b == 18; // observed from implementation
  }

}

method Main()
{
  TestsFormain();
  print "TestsFormain: all non-failing tests passed!\n";
}
