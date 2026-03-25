// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_tmp_tmpmvs2dmry_examples1__675_VER_y.dfy
// Method: Abs
// Generated: 2026-03-25 22:48:08

// Dafny_tmp_tmpmvs2dmry_examples1.dfy

method Abs(x: int) returns (y: int)
  ensures y >= 0
  ensures x >= 0 ==> x == y
  ensures x < 0 ==> -x == y
  ensures y == abs(x)
  decreases x
{
  if x < 0 {
    return -x;
  } else {
    return x;
  }
}

function abs(x: int): int
  decreases x
{
  if x > 0 then
    x
  else
    -x
}

method Testing()
{
  var v := Abs(-3);
  assert v >= 0;
  assert v == 3;
}

method MultiReturn(x: int, y: int)
    returns (more: int, less: int)
  requires y >= 0
  ensures less <= x <= more
  decreases x, y
{
  more := x + y;
  less := x - y;
}

method Max(x: int, y: int) returns (a: int)
  ensures a == x || a == y
  ensures x > y ==> a == x
  ensures x <= y ==> a == y
  decreases x, y
{
  if x > y {
    a := y;
  } else {
    a := y;
  }
}


method Passing()
{
  // Test case for combination {2}:
  //   POST: y >= 0
  //   POST: !(x >= 0)
  //   POST: -x == y
  //   POST: y == abs(x)
  {
    var x := -1;
    var y := Abs(x);
    expect y == 1;
  }

  // Test case for combination {3}:
  //   POST: y >= 0
  //   POST: x == y
  //   POST: !(x < 0)
  //   POST: y == abs(x)
  {
    var x := 1;
    var y := Abs(x);
    expect y == 1;
  }

  // Test case for combination {3,4}:
  //   POST: y >= 0
  //   POST: x == y
  //   POST: !(x < 0)
  //   POST: y == abs(x)
  //   POST: -x == y
  {
    var x := 0;
    var y := Abs(x);
    expect y == 0;
  }

  // Test case for combination {2}:
  //   POST: y >= 0
  //   POST: !(x >= 0)
  //   POST: -x == y
  //   POST: y == abs(x)
  {
    var x := -2;
    var y := Abs(x);
    expect y == 2;
  }

  // Test case for combination {1}:
  //   PRE:  y >= 0
  //   POST: less <= x <= more
  {
    var x := 0;
    var y := 0;
    var more, less := MultiReturn(x, y);
    expect more == 0;
    expect less == 0;
  }

  // Test case for combination {1}/Bx=1,y=0:
  //   PRE:  y >= 0
  //   POST: less <= x <= more
  {
    var x := 1;
    var y := 0;
    var more, less := MultiReturn(x, y);
    expect more == 1;
    expect less == 1;
  }

  // Test case for combination {2}:
  //   POST: a == x
  //   POST: !(x > y)
  //   POST: a == y
  {
    var x := 0;
    var y := 0;
    var a := Max(x, y);
    expect a == 0;
  }

  // Test case for combination {6}:
  //   POST: a == y
  //   POST: !(x > y)
  {
    var x := -1;
    var y := 0;
    var a := Max(x, y);
    expect a == 0;
  }

  // Test case for combination {2,4}:
  //   POST: a == x
  //   POST: !(x > y)
  //   POST: a == y
  {
    var x := 1;
    var y := 1;
    var a := Max(x, y);
    expect a == 1;
  }

  // Test case for combination {2,6}:
  //   POST: a == x
  //   POST: !(x > y)
  //   POST: a == y
  {
    var x := -1;
    var y := -1;
    var a := Max(x, y);
    expect a == -1;
  }

  // Test case for combination {2,8}:
  //   POST: a == x
  //   POST: !(x > y)
  //   POST: a == y
  {
    var x := 2;
    var y := 2;
    var a := Max(x, y);
    expect a == 2;
  }

  // Test case for combination {2,4,6}:
  //   POST: a == x
  //   POST: !(x > y)
  //   POST: a == y
  {
    var x := -2;
    var y := -2;
    var a := Max(x, y);
    expect a == -2;
  }

  // Test case for combination {2,4,8}:
  //   POST: a == x
  //   POST: !(x > y)
  //   POST: a == y
  {
    var x := -3;
    var y := -3;
    var a := Max(x, y);
    expect a == -3;
  }

  // Test case for combination {2,6,8}:
  //   POST: a == x
  //   POST: !(x > y)
  //   POST: a == y
  {
    var x := -4;
    var y := -4;
    var a := Max(x, y);
    expect a == -4;
  }

  // Test case for combination {2,4,6,8}:
  //   POST: a == x
  //   POST: !(x > y)
  //   POST: a == y
  {
    var x := 3;
    var y := 3;
    var a := Max(x, y);
    expect a == 3;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  y >= 0
  //   POST: less <= x <= more
  {
    var x := 0;
    var y := 1;
    var more, less := MultiReturn(x, y);
    // expect more == 0;
    // expect less == 0;
  }

  // Test case for combination {1}/Bx=1,y=1:
  //   PRE:  y >= 0
  //   POST: less <= x <= more
  {
    var x := 1;
    var y := 1;
    var more, less := MultiReturn(x, y);
    // expect more == 1;
    // expect less == 1;
  }

  // Test case for combination {3}:
  //   POST: a == x
  //   POST: !(x <= y)
  {
    var x := 0;
    var y := -1;
    var a := Max(x, y);
    // expect a == 0;
  }

}

method Main()
{
  Passing();
  Failing();
}
