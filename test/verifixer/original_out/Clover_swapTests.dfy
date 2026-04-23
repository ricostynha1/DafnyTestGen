// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Clover_swap.dfy
// Method: Swap
// Generated: 2026-04-22 21:26:49

// Clover_swap.dfy

method Swap(X: int, Y: int)
    returns (x: int, y: int)
  ensures x == Y
  ensures y == X
  decreases X, Y
{
  x, y := X, Y;
  var tmp := x;
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
    var X := -10;
    var Y := -10;
    var x, y := Swap(X, Y);
    expect x == -10;
    expect y == -10;
  }

  // Test case for combination {1}/OX=0:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := 0;
    var Y := -10;
    var x, y := Swap(X, Y);
    expect x == -10;
    expect y == 0;
  }

  // Test case for combination {1}/OX>0:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := 10;
    var Y := -10;
    var x, y := Swap(X, Y);
    expect x == -10;
    expect y == 10;
  }

  // Test case for combination {1}/OY=0:
  //   POST Q1: x == Y
  //   POST Q2: y == X
  {
    var X := -10;
    var Y := 0;
    var x, y := Swap(X, Y);
    expect x == 0;
    expect y == -10;
  }

}

method Main()
{
  TestsForSwap();
  print "TestsForSwap: all non-failing tests passed!\n";
}
