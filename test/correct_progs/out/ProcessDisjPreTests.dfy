// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\correct_progs\in\ProcessDisjPre.dfy
// Method: Process
// Generated: 2026-03-21 12:21:59

// Method with disjunctive precondition.
method Process(x: int, y: int) returns (r: int)
  requires x > 0 || y > 0
  ensures r == x + y
{
  r := x + y;
}


method GeneratedTests_Process()
{
  // Test case for combination P{1}/{1}/Bx=1,y=0:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 1;
    var y := 0;
    var r := Process(x, y);
    expect r == 1;
  }

  // Test case for combination P{1}/{1}/Bx=2,y=0:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 2;
    var y := 0;
    var r := Process(x, y);
    expect r == 2;
  }

  // Test case for combination P{2}/{1}/Bx=0,y=1:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 0;
    var y := 1;
    var r := Process(x, y);
    expect r == 1;
  }

  // Test case for combination P{2}/{1}/Bx=0,y=2:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 0;
    var y := 2;
    var r := Process(x, y);
    expect r == 2;
  }

  // Test case for combination P{1,2}/{1}/Bx=1,y=1:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 1;
    var y := 1;
    var r := Process(x, y);
    expect r == 2;
  }

  // Test case for combination P{1,2}/{1}/Bx=1,y=2:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 1;
    var y := 2;
    var r := Process(x, y);
    expect r == 3;
  }

  // Test case for combination P{1,2}/{1}/Bx=2,y=1:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 2;
    var y := 1;
    var r := Process(x, y);
    expect r == 3;
  }

  // Test case for combination P{1,2}/{1}/Bx=2,y=2:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 2;
    var y := 2;
    var r := Process(x, y);
    expect r == 4;
  }

  // Test case for combination P{1}/{1}/R3:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 1;
    var y := -1;
    var r := Process(x, y);
    expect r == 0;
  }

  // Test case for combination P{2}/{1}/R3:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := -1;
    var y := 1;
    var r := Process(x, y);
    expect r == 0;
  }

}

method Main()
{
  GeneratedTests_Process();
  print "GeneratedTests_Process: all tests passed!\n";
}
