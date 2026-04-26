// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_swap__103-115_SWS.dfy
// Method: Swap
// Generated: 2026-04-24 09:29:18

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
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := -10;
    var Y := -10;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == -10; // LHS=-10, RHS=-10
    // expect y == -10; // LHS=0, RHS=-10
  }

  // Test case for combination {1}/OX=0:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := 0;
    var Y := 10;
    var x, y := Swap(X, Y);
    expect x == 10;
    expect y == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/OX>0:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := 10;
    var Y := -10;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == -10; // LHS=-10, RHS=-10
    // expect y == 10; // LHS=0, RHS=10
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/OY=0:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := 10;
    var Y := 0;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == 0; // LHS=0, RHS=0
    // expect y == 10; // LHS=0, RHS=10
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := -10;
    var Y := 10;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == 10; // LHS=10, RHS=10
    // expect y == -10; // LHS=0, RHS=-10
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := -9;
    var Y := 10;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == 10; // LHS=10, RHS=10
    // expect y == -9; // LHS=0, RHS=-9
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := -10;
    var Y := 2;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == 2; // LHS=2, RHS=2
    // expect y == -10; // LHS=0, RHS=-10
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := -9;
    var Y := -10;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == -10; // LHS=-10, RHS=-10
    // expect y == -9; // LHS=0, RHS=-9
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := -8;
    var Y := -10;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == -10; // LHS=-10, RHS=-10
    // expect y == -8; // LHS=0, RHS=-8
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := -8;
    var Y := 10;
    var x, y := Swap(X, Y);
    // actual runtime state: y=0
    // expect x == 10; // LHS=10, RHS=10
    // expect y == -8; // LHS=0, RHS=-8
  }

}

method Main()
{
  TestsForSwap();
  print "TestsForSwap: all non-failing tests passed!\n";
}
