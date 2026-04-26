// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_tmp_tmpmvs2dmry_examples1__675_VER_y.dfy
// Method: Abs
// Generated: 2026-04-24 13:17:05

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


method TestsForAbs()
{
  // Test case for combination {1}:
  //   POST Q1: y >= 0
  //   POST Q2: x < 0
  //   POST Q3: -x == y
  //   POST Q4: y == abs(x)
  {
    var x := -10;
    var y := Abs(x);
    expect y == 10;
  }

  // Test case for combination {2}:
  //   POST Q1: y >= 0
  //   POST Q2: x >= 0
  //   POST Q3: x == y
  //   POST Q4: y == abs(x)
  {
    var x := 10;
    var y := Abs(x);
    expect y == 10;
  }

  // Test case for combination {3}:
  //   POST Q1: y >= 0
  //   POST Q2: x >= 0
  //   POST Q3: x == y
  //   POST Q4: x <= 0
  //   POST Q5: y == abs(x)
  {
    var x := 0;
    var y := Abs(x);
    expect y == 0;
  }

  // Test case for combination {1}/R2:
  //   POST Q1: y >= 0
  //   POST Q2: x < 0
  //   POST Q3: -x == y
  //   POST Q4: y == abs(x)
  {
    var x := -9;
    var y := Abs(x);
    expect y == 9;
  }

  // Test case for combination {1}/R3:
  //   POST Q1: y >= 0
  //   POST Q2: x < 0
  //   POST Q3: -x == y
  //   POST Q4: y == abs(x)
  {
    var x := -8;
    var y := Abs(x);
    expect y == 8;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: y >= 0
  //   POST Q2: x < 0
  //   POST Q3: -x == y
  //   POST Q4: y == abs(x)
  {
    var x := -7;
    var y := Abs(x);
    expect y == 7;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: y >= 0
  //   POST Q2: x < 0
  //   POST Q3: -x == y
  //   POST Q4: y == abs(x)
  {
    var x := -6;
    var y := Abs(x);
    expect y == 6;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: y >= 0
  //   POST Q2: x < 0
  //   POST Q3: -x == y
  //   POST Q4: y == abs(x)
  {
    var x := -5;
    var y := Abs(x);
    expect y == 5;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: y >= 0
  //   POST Q2: x < 0
  //   POST Q3: -x == y
  //   POST Q4: y == abs(x)
  {
    var x := -4;
    var y := Abs(x);
    expect y == 4;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: y >= 0
  //   POST Q2: x < 0
  //   POST Q3: -x == y
  //   POST Q4: y == abs(x)
  {
    var x := -3;
    var y := Abs(x);
    expect y == 3;
  }

}

method TestsForMultiReturn()
{
  // Test case for combination {1}:
  //   PRE:  y >= 0
  //   POST Q1: less <= x <= more
  {
    var x := -10;
    var y := 2;
    var more, less := MultiReturn(x, y);
    expect less <= x <= more;
    expect more == -8; // observed from implementation
    expect less == -12; // observed from implementation
  }

  // Test case for combination {1}/By=0:
  //   PRE:  y >= 0
  //   POST Q1: less <= x <= more
  {
    var x := -1;
    var y := 0;
    var more, less := MultiReturn(x, y);
    expect less <= x <= more;
    expect more == -1; // observed from implementation
    expect less == -1; // observed from implementation
  }

  // Test case for combination {1}/By=1:
  //   PRE:  y >= 0
  //   POST Q1: less <= x <= more
  {
    var x := -1;
    var y := 1;
    var more, less := MultiReturn(x, y);
    expect less <= x <= more;
    expect more == 0; // observed from implementation
    expect less == -2; // observed from implementation
  }

  // Test case for combination {1}/Bmore=x+1:
  //   PRE:  y >= 0
  //   POST Q1: less <= x <= more
  {
    var x := -10;
    var y := 10;
    var more, less := MultiReturn(x, y);
    expect less <= x <= more;
    expect more == 0; // observed from implementation
    expect less == -20; // observed from implementation
  }

  // Test case for combination {1}/Bless=x-1:
  //   PRE:  y >= 0
  //   POST Q1: less <= x <= more
  {
    var x := 2;
    var y := 10;
    var more, less := MultiReturn(x, y);
    expect less <= x <= more;
    expect more == 12; // observed from implementation
    expect less == -8; // observed from implementation
  }

  // Test case for combination {1}/Ox=0:
  //   PRE:  y >= 0
  //   POST Q1: less <= x <= more
  {
    var x := 0;
    var y := 2;
    var more, less := MultiReturn(x, y);
    expect less <= x <= more;
    expect more == 2; // observed from implementation
    expect less == -2; // observed from implementation
  }

  // Test case for combination {1}/Omore=0:
  //   PRE:  y >= 0
  //   POST Q1: less <= x <= more
  {
    var x := -10;
    var y := 9;
    var more, less := MultiReturn(x, y);
    expect less <= x <= more;
    expect more == -1; // observed from implementation
    expect less == -19; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  y >= 0
  //   POST Q1: less <= x <= more
  {
    var x := -10;
    var y := 3;
    var more, less := MultiReturn(x, y);
    expect less <= x <= more;
    expect more == -7; // observed from implementation
    expect less == -13; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  y >= 0
  //   POST Q1: less <= x <= more
  {
    var x := -9;
    var y := 10;
    var more, less := MultiReturn(x, y);
    expect less <= x <= more;
    expect more == 1; // observed from implementation
    expect less == -19; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  y >= 0
  //   POST Q1: less <= x <= more
  {
    var x := 10;
    var y := 10;
    var more, less := MultiReturn(x, y);
    expect less <= x <= more;
    expect more == 20; // observed from implementation
    expect less == 0; // observed from implementation
  }

}

method TestsForMax()
{
  // Test case for combination {1}:
  //   POST Q1: a == x
  //   POST Q2: x <= y
  //   POST Q3: a == y
  {
    var x := 2;
    var y := 2;
    var a := Max(x, y);
    expect a == 2;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   POST Q1: a == x
  //   POST Q2: x > y
  {
    var x := 10;
    var y := -10;
    var a := Max(x, y);
    // expect a == 10; // got -10
  }

  // Test case for combination {3}:
  //   POST Q1: a != x
  //   POST Q2: a == y
  //   POST Q3: x <= y
  {
    var x := -10;
    var y := 2;
    var a := Max(x, y);
    expect a == 2;
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: a == x
  //   POST Q2: x <= y
  //   POST Q3: a == y
  {
    var x := 0;
    var y := 0;
    var a := Max(x, y);
    expect a == 0;
  }

  // Test case for combination {1}/Ox<0:
  //   POST Q1: a == x
  //   POST Q2: x <= y
  //   POST Q3: a == y
  {
    var x := -10;
    var y := -10;
    var a := Max(x, y);
    expect a == -10;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Ox=0:
  //   POST Q1: a == x
  //   POST Q2: x > y
  {
    var x := 0;
    var y := -10;
    var a := Max(x, y);
    // expect a == 0; // got -10
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Ox<0:
  //   POST Q1: a == x
  //   POST Q2: x > y
  {
    var x := -9;
    var y := -10;
    var a := Max(x, y);
    // expect a == -9; // got -10
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Oy=0:
  //   POST Q1: a == x
  //   POST Q2: x > y
  {
    var x := 10;
    var y := 0;
    var a := Max(x, y);
    // expect a == 10; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Oy>0:
  //   POST Q1: a == x
  //   POST Q2: x > y
  {
    var x := 10;
    var y := 9;
    var a := Max(x, y);
    // expect a == 10; // got 9
  }

  // Test case for combination {3}/Ox=0:
  //   POST Q1: a != x
  //   POST Q2: a == y
  //   POST Q3: x <= y
  {
    var x := 0;
    var y := 10;
    var a := Max(x, y);
    expect a == 10;
  }

}

method Main()
{
  TestsForAbs();
  print "TestsForAbs: all non-failing tests passed!\n";
  TestsForMultiReturn();
  print "TestsForMultiReturn: all non-failing tests passed!\n";
  TestsForMax();
  print "TestsForMax: all non-failing tests passed!\n";
}
