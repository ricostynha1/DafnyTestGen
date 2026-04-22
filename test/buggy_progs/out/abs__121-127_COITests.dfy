// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\abs__121-127_COI.dfy
// Method: abs
// Generated: 2026-04-22 10:33:45

// res.dfy

method abs(x: int) returns (y: int)
  ensures x > 0 ==> y == x
  ensures x <= 0 ==> y == -x
  decreases x
{
  if !(x > 0) {
    y := x;
  } else {
    y := -x;
  }
}


method TestsForabs()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   POST Q1: x <= 0
  //   POST Q2: y == -x
  {
    var x := -10;
    var y := abs(x);
    // actual runtime state: y=-10
    // expect y == 10; // got -10
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   POST Q1: x > 0
  //   POST Q2: y == x
  {
    var x := 10;
    var y := abs(x);
    // actual runtime state: y=-10
    // expect y == 10; // got -10
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: x <= 0
  //   POST Q2: y == -x
  {
    var x := 0;
    var y := abs(x);
    expect y == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   POST Q1: x <= 0
  //   POST Q2: y == -x
  {
    var x := -9;
    var y := abs(x);
    // actual runtime state: y=-9
    // expect y == 9; // got -9
  }

}

method Main()
{
  TestsForabs();
  print "TestsForabs: all non-failing tests passed!\n";
}
