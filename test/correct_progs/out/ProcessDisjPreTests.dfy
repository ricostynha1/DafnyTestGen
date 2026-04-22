// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\ProcessDisjPre.dfy
// Method: Process
// Generated: 2026-04-21 23:37:23

// Method with disjunctive precondition.
method Process(x: int, y: int) returns (r: int)
  requires x > 0 || y > 0
  ensures r == x + y
{
  r := x + y;
}


method TestsForProcess()
{
  // Test case for combination P{1}/{1}:
  //   PRE:  x > 0 || y > 0
  //   POST Q1: r == x + y
  {
    var x := 10;
    var y := -10;
    var r := Process(x, y);
    expect r == 0;
  }

  // Test case for combination P{2}/{1}:
  //   PRE:  x > 0 || y > 0
  //   POST Q1: r == x + y
  {
    var x := -10;
    var y := 10;
    var r := Process(x, y);
    expect r == 0;
  }

  // Test case for combination P{1}/{1}/Bx=1:
  //   PRE:  x > 0 || y > 0
  //   POST Q1: r == x + y
  {
    var x := 1;
    var y := -10;
    var r := Process(x, y);
    expect r == -9;
  }

  // Test case for combination P{1}/{1}/Bx=2:
  //   PRE:  x > 0 || y > 0
  //   POST Q1: r == x + y
  {
    var x := 2;
    var y := -10;
    var r := Process(x, y);
    expect r == -8;
  }

}

method Main()
{
  TestsForProcess();
  print "TestsForProcess: all non-failing tests passed!\n";
}
