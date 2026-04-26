// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\ProcessDisjPre.dfy
// Method: Process
// Generated: 2026-04-23 20:31:17

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
    var x := -1;
    var y := 10;
    var r := Process(x, y);
    expect r == 9;
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

  // Test case for combination P{2}/{1}/By=1:
  //   PRE:  x > 0 || y > 0
  //   POST Q1: r == x + y
  {
    var x := -10;
    var y := 1;
    var r := Process(x, y);
    expect r == -9;
  }

  // Test case for combination P{2}/{1}/By=2:
  //   PRE:  x > 0 || y > 0
  //   POST Q1: r == x + y
  {
    var x := -10;
    var y := 2;
    var r := Process(x, y);
    expect r == -8;
  }

  // Test case for combination P{1}/{1}/Oy=0:
  //   PRE:  x > 0 || y > 0
  //   POST Q1: r == x + y
  {
    var x := 10;
    var y := 0;
    var r := Process(x, y);
    expect r == 10;
  }

  // Test case for combination P{1}/{1}/Oy>0:
  //   PRE:  x > 0 || y > 0
  //   POST Q1: r == x + y
  {
    var x := 10;
    var y := 10;
    var r := Process(x, y);
    expect r == 20;
  }

  // Test case for combination P{2}/{1}/Ox=0:
  //   PRE:  x > 0 || y > 0
  //   POST Q1: r == x + y
  {
    var x := 0;
    var y := 10;
    var r := Process(x, y);
    expect r == 10;
  }

  // Test case for combination P{2}/{1}/Or=0:
  //   PRE:  x > 0 || y > 0
  //   POST Q1: r == x + y
  {
    var x := -10;
    var y := 10;
    var r := Process(x, y);
    expect r == 0;
  }

}

method Main()
{
  TestsForProcess();
  print "TestsForProcess: all non-failing tests passed!\n";
}
