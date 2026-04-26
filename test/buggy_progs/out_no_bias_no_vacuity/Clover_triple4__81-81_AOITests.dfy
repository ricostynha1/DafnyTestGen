// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_triple4__81-81_AOI.dfy
// Method: Triple
// Generated: 2026-04-24 21:40:20

// Clover_triple4.dfy

method Triple(x: int) returns (r: int)
  ensures r == 3 * x
  decreases x
{
  var y := x * 2;
  r := y + -x;
}


method TestsForTriple()
{
  // Test case for combination {1}:
  //   POST Q1: r == 3 * x
  {
    var x := 0;
    var r := Triple(x);
    expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ox>0:
  //   POST Q1: r == 3 * x
  {
    var x := 1;
    var r := Triple(x);
    // expect r == 3; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ox<0:
  //   POST Q1: r == 3 * x
  {
    var x := -1;
    var r := Triple(x);
    // expect r == -3; // got -1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   POST Q1: r == 3 * x
  {
    var x := 2;
    var r := Triple(x);
    // expect r == 6; // got 2
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   POST Q1: r == 3 * x
  {
    var x := -2;
    var r := Triple(x);
    // expect r == -6; // got -2
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   POST Q1: r == 3 * x
  {
    var x := -3;
    var r := Triple(x);
    // expect r == -9; // got -3
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   POST Q1: r == 3 * x
  {
    var x := -4;
    var r := Triple(x);
    // expect r == -12; // got -4
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   POST Q1: r == 3 * x
  {
    var x := -5;
    var r := Triple(x);
    // expect r == -15; // got -5
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   POST Q1: r == 3 * x
  {
    var x := 3;
    var r := Triple(x);
    // expect r == 9; // got 3
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   POST Q1: r == 3 * x
  {
    var x := 4;
    var r := Triple(x);
    // expect r == 12; // got 4
  }

}

method Main()
{
  TestsForTriple();
  print "TestsForTriple: all non-failing tests passed!\n";
}
