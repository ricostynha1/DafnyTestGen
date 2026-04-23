// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Clover_triple4.dfy
// Method: Triple
// Generated: 2026-04-22 21:26:54

// Clover_triple4.dfy

method Triple(x: int) returns (r: int)
  ensures r == 3 * x
  decreases x
{
  var y := x * 2;
  r := y + x;
}


method TestsForTriple()
{
  // Test case for combination {1}:
  //   POST Q1: r == 3 * x
  {
    var x := -10;
    var r := Triple(x);
    expect r == -30;
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: r == 3 * x
  {
    var x := 0;
    var r := Triple(x);
    expect r == 0;
  }

  // Test case for combination {1}/Ox>0:
  //   POST Q1: r == 3 * x
  {
    var x := 10;
    var r := Triple(x);
    expect r == 30;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: r == 3 * x
  {
    var x := -9;
    var r := Triple(x);
    expect r == -27;
  }

}

method Main()
{
  TestsForTriple();
  print "TestsForTriple: all non-failing tests passed!\n";
}
