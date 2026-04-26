// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_triple4__81-81_AOI.dfy
// Method: Triple
// Generated: 2026-04-24 15:41:24

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
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   POST Q1: r == 3 * x
  {
    var x := 10;
    var r := Triple(x);
    // expect r == 30; // got 10
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: r == 3 * x
  {
    var x := 0;
    var r := Triple(x);
    expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ox<0:
  //   POST Q1: r == 3 * x
  {
    var x := -10;
    var r := Triple(x);
    // expect r == -30; // got -10
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
    var x := -9;
    var r := Triple(x);
    // expect r == -27; // got -9
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   POST Q1: r == 3 * x
  {
    var x := 9;
    var r := Triple(x);
    // expect r == 27; // got 9
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   POST Q1: r == 3 * x
  {
    var x := 8;
    var r := Triple(x);
    // expect r == 24; // got 8
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   POST Q1: r == 3 * x
  {
    var x := 7;
    var r := Triple(x);
    // expect r == 21; // got 7
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   POST Q1: r == 3 * x
  {
    var x := 6;
    var r := Triple(x);
    // expect r == 18; // got 6
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   POST Q1: r == 3 * x
  {
    var x := -8;
    var r := Triple(x);
    // expect r == -24; // got -8
  }

}

method Main()
{
  TestsForTriple();
  print "TestsForTriple: all non-failing tests passed!\n";
}
