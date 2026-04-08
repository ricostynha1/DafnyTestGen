// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\ProcessDisjPre.dfy
// Method: Process
// Generated: 2026-04-08 09:42:41

// Method with disjunctive precondition.
method Process(x: int, y: int) returns (r: int)
  requires x > 0 || y > 0
  ensures r == x + y
{
  r := x + y;
}


method Passing()
{
  // Test case for combination P{1}/{1}:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 1;
    var y := 0;
    var r := Process(x, y);
    expect r == 1;
  }

  // Test case for combination P{2}/{1}:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 0;
    var y := 1;
    var r := Process(x, y);
    expect r == 1;
  }

  // Test case for combination P{1,2}/{1}:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 1;
    var y := 1;
    var r := Process(x, y);
    expect r == 2;
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

  // Test case for combination P{1}/{1}/Or>0:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 2;
    var y := -1;
    var r := Process(x, y);
    expect r == 1;
  }

  // Test case for combination P{1}/{1}/Or<0:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 1;
    var y := -2;
    var r := Process(x, y);
    expect r == -1;
  }

  // Test case for combination P{1}/{1}/Or=0:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 1;
    var y := -1;
    var r := Process(x, y);
    expect r == 0;
  }

  // Test case for combination P{2}/{1}/Or>0:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := -1;
    var y := 2;
    var r := Process(x, y);
    expect r == 1;
  }

  // Test case for combination P{2}/{1}/Or<0:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := -2;
    var y := 1;
    var r := Process(x, y);
    expect r == -1;
  }

  // Test case for combination P{2}/{1}/Or=0:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := -3;
    var y := 3;
    var r := Process(x, y);
    expect r == 0;
  }

  // Test case for combination P{1,2}/{1}/Or>0:
  //   PRE:  x > 0 || y > 0
  //   POST: r == x + y
  {
    var x := 2;
    var y := 2;
    var r := Process(x, y);
    expect r == 4;
  }

}

method Failing()
{
  // (no failing tests)
}

method Main()
{
  Passing();
  Failing();
}
