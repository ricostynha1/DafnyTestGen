// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Clover_triple4__81-81_AOI.dfy
// Method: Triple
// Generated: 2026-04-22 21:28:28

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
    var x := -10;
    var r := Triple(x);
    // expect r == -30; // got -10
  }

  // Test case for combination {1}/Ox=0:
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
    var x := 10;
    var r := Triple(x);
    // expect r == 30; // got 10
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   POST Q1: r == 3 * x
  {
    var x := -9;
    var r := Triple(x);
    // expect r == -27; // got -9
  }

}

method Main()
{
  TestsForTriple();
  print "TestsForTriple: all non-failing tests passed!\n";
}
