// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\abs__121-127_COI.dfy
// Method: abs
// Generated: 2026-04-17 13:53:04

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
  // Test case for combination {1}:
  //   POST: !(x > 0)
  //   POST: x <= 0
  //   POST: y == -x
  //   ENSURES: x > 0 ==> y == x
  //   ENSURES: x <= 0 ==> y == -x
  {
    var x := 0;
    var y := abs(x);
    expect y == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   POST: x > 0
  //   POST: y == x
  //   POST: !(x <= 0)
  //   ENSURES: x > 0 ==> y == x
  //   ENSURES: x <= 0 ==> y == -x
  {
    var x := 1;
    var y := abs(x);
    // expect y == 1; // got -1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ox<0:
  //   POST: !(x > 0)
  //   POST: x <= 0
  //   POST: y == -x
  //   ENSURES: x > 0 ==> y == x
  //   ENSURES: x <= 0 ==> y == -x
  {
    var x := -1;
    var y := abs(x);
    // expect y == 1; // got -1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   POST: !(x > 0)
  //   POST: x <= 0
  //   POST: y == -x
  //   ENSURES: x > 0 ==> y == x
  //   ENSURES: x <= 0 ==> y == -x
  {
    var x := -2;
    var y := abs(x);
    // expect y == 2; // got -2
  }

}

method Main()
{
  TestsForabs();
  print "TestsForabs: all non-failing tests passed!\n";
}
