// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Clover_swap.dfy
// Method: Swap
// Generated: 2026-04-08 19:04:17

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


method Passing()
{
  // Test case for combination {1}:
  //   POST: x == Y
  //   POST: y == X
  //   ENSURES: x == Y
  //   ENSURES: y == X
  {
    var X := 0;
    var Y := 0;
    var x, y := Swap(X, Y);
    expect x == 0;
    expect y == 0;
  }

  // Test case for combination {1}/BX=0,Y=1:
  //   POST: x == Y
  //   POST: y == X
  //   ENSURES: x == Y
  //   ENSURES: y == X
  {
    var X := 0;
    var Y := 1;
    var x, y := Swap(X, Y);
    expect x == 1;
    expect y == 0;
  }

  // Test case for combination {1}/BX=1,Y=0:
  //   POST: x == Y
  //   POST: y == X
  //   ENSURES: x == Y
  //   ENSURES: y == X
  {
    var X := 1;
    var Y := 0;
    var x, y := Swap(X, Y);
    expect x == 0;
    expect y == 1;
  }

  // Test case for combination {1}/BX=1,Y=1:
  //   POST: x == Y
  //   POST: y == X
  //   ENSURES: x == Y
  //   ENSURES: y == X
  {
    var X := 1;
    var Y := 1;
    var x, y := Swap(X, Y);
    expect x == 1;
    expect y == 1;
  }

  // Test case for combination {1}/Ox>0:
  //   POST: x == Y
  //   POST: y == X
  //   ENSURES: x == Y
  //   ENSURES: y == X
  {
    var X := -1;
    var Y := 2;
    var x, y := Swap(X, Y);
    expect x == 2;
    expect y == -1;
  }

  // Test case for combination {1}/Ox<0:
  //   POST: x == Y
  //   POST: y == X
  //   ENSURES: x == Y
  //   ENSURES: y == X
  {
    var X := -2;
    var Y := -1;
    var x, y := Swap(X, Y);
    expect x == -1;
    expect y == -2;
  }

  // Test case for combination {1}/Ox=0:
  //   POST: x == Y
  //   POST: y == X
  //   ENSURES: x == Y
  //   ENSURES: y == X
  {
    var X := -1;
    var Y := 0;
    var x, y := Swap(X, Y);
    expect x == 0;
    expect y == -1;
  }

  // Test case for combination {1}/Oy>0:
  //   POST: x == Y
  //   POST: y == X
  //   ENSURES: x == Y
  //   ENSURES: y == X
  {
    var X := 2;
    var Y := -2;
    var x, y := Swap(X, Y);
    expect x == -2;
    expect y == 2;
  }

  // Test case for combination {1}/Oy<0:
  //   POST: x == Y
  //   POST: y == X
  //   ENSURES: x == Y
  //   ENSURES: y == X
  {
    var X := -3;
    var Y := -3;
    var x, y := Swap(X, Y);
    expect x == -3;
    expect y == -3;
  }

  // Test case for combination {1}/Oy=0:
  //   POST: x == Y
  //   POST: y == X
  //   ENSURES: x == Y
  //   ENSURES: y == X
  {
    var X := 0;
    var Y := -1;
    var x, y := Swap(X, Y);
    expect x == -1;
    expect y == 0;
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
