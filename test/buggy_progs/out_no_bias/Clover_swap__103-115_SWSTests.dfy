// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_swap__103-115_SWS.dfy
// Method: Swap
// Generated: 2026-04-24 11:21:13

// Clover_swap.dfy

method Swap(X: int, Y: int)
    returns (x: int, y: int)
  ensures x == Y
  ensures y == X
  decreases X, Y
{
  var tmp := x;
  x, y := X, Y;
  x := y;
  y := tmp;
  assert x == Y && y == X;
}


method TestsForSwap()
{
  // Test case for combination {1}:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := 0;
    var Y := 0;
    var x, y := Swap(X, Y);
    expect x == 0;
    expect y == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/OX>0:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := 1;
    var Y := 0;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == 0; // LHS=0, RHS=0
    // expect y == 1; // LHS=0, RHS=1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/OX<0:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := -1;
    var Y := 0;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == 0; // LHS=0, RHS=0
    // expect y == -1; // LHS=0, RHS=-1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/OY>0:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := -2;
    var Y := 1;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == 1; // LHS=1, RHS=1
    // expect y == -2; // LHS=0, RHS=-2
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/OY<0:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := -3;
    var Y := -1;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == -1; // LHS=-1, RHS=-1
    // expect y == -3; // LHS=0, RHS=-3
  }

  // Test case for combination {1}/R6:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := 0;
    var Y := -2;
    var x, y := Swap(X, Y);
    expect x == -2;
    expect y == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := 2;
    var Y := -3;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == -3; // LHS=-3, RHS=-3
    // expect y == 2; // LHS=0, RHS=2
  }

  // Test case for combination {1}/R8:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := 0;
    var Y := -4;
    var x, y := Swap(X, Y);
    expect x == -4;
    expect y == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := -4;
    var Y := -5;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == -5; // LHS=-5, RHS=-5
    // expect y == -4; // LHS=0, RHS=-4
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := -5;
    var Y := 0;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == 0; // LHS=0, RHS=0
    // expect y == -5; // LHS=0, RHS=-5
  }

}

method Main()
{
  TestsForSwap();
  print "TestsForSwap: all non-failing tests passed!\n";
}
