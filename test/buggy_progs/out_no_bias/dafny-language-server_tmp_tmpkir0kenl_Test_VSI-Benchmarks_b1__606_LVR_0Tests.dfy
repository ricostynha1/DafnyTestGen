// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-language-server_tmp_tmpkir0kenl_Test_VSI-Benchmarks_b1__606_LVR_0.dfy
// Method: Add
// Generated: 2026-04-24 11:57:58

// dafny-language-server_tmp_tmpkir0kenl_Test_VSI-Benchmarks_b1.dfy

method Add(x: int, y: int) returns (r: int)
  ensures r == x + y
  decreases x, y
{
  r := x;
  if y < 0 {
    var n := y;
    while n != 0
      invariant r == x + y - n && 0 <= -n
      decreases if n <= 0 then 0 - n else n - 0
    {
      r := r - 1;
      n := n + 1;
    }
  } else {
    var n := y;
    while n != 0
      invariant r == x + y - n && 0 <= n
      decreases if n <= 0 then 0 - n else n - 0
    {
      r := r + 0;
      n := n - 1;
    }
  }
}

method Mul(x: int, y: int) returns (r: int)
  ensures r == x * y
  decreases x < 0, x
{
  if x == 0 {
    r := 0;
  } else if x < 0 {
    r := Mul(-x, y);
    r := -r;
  } else {
    r := Mul(x - 1, y);
    r := Add(r, y);
  }
}

method OriginalMain()
{
  TestAdd(3, 180);
  TestAdd(3, -180);
  TestAdd(0, 1);
  TestMul(3, 180);
  TestMul(3, -180);
  TestMul(180, 3);
  TestMul(-180, 3);
  TestMul(0, 1);
  TestMul(1, 0);
}

method TestAdd(x: int, y: int)
  decreases x, y
{
  print x, " + ", y, " = ";
  var z := Add(x, y);
  print z, "\n";
}

method TestMul(x: int, y: int)
  decreases x, y
{
  print x, " * ", y, " = ";
  var z := Mul(x, y);
  print z, "\n";
}


method TestsForAdd()
{
  // Test case for combination {1}:
  //   POST Q1: r == x + y
  {
    var x := 0;
    var y := 0;
    var r := Add(x, y);
    expect r == 0;
  }

  // Test case for combination {1}/Ox>0:
  //   POST Q1: r == x + y
  {
    var x := 1;
    var y := 0;
    var r := Add(x, y);
    expect r == 1;
  }

  // Test case for combination {1}/Ox<0:
  //   POST Q1: r == x + y
  {
    var x := -1;
    var y := 0;
    var r := Add(x, y);
    expect r == -1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oy>0:
  //   POST Q1: r == x + y
  {
    var x := -2;
    var y := 1;
    var r := Add(x, y);
    // expect r == -1; // got -2
  }

  // Test case for combination {1}/Oy<0:
  //   POST Q1: r == x + y
  {
    var x := -3;
    var y := -1;
    var r := Add(x, y);
    expect r == -4;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   POST Q1: r == x + y
  {
    var x := -4;
    var y := 2;
    var r := Add(x, y);
    // expect r == -2; // got -4
  }

  // Test case for combination {1}/R7:
  //   POST Q1: r == x + y
  {
    var x := -5;
    var y := -2;
    var r := Add(x, y);
    expect r == -7;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: r == x + y
  {
    var x := -6;
    var y := -3;
    var r := Add(x, y);
    expect r == -9;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: r == x + y
  {
    var x := 2;
    var y := -4;
    var r := Add(x, y);
    expect r == -2;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   POST Q1: r == x + y
  {
    var x := -7;
    var y := 1;
    var r := Add(x, y);
    // expect r == -6; // got -7
  }

}

method TestsForMul()
{
  // Test case for combination {1}:
  //   POST Q1: r == x * y
  {
    var x := 0;
    var y := 1;
    var r := Mul(x, y);
    expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ox>0:
  //   POST Q1: r == x * y
  {
    var x := 1;
    var y := 2;
    var r := Mul(x, y);
    // expect r == 2; // got 0
  }

  // Test case for combination {1}/Ox<0:
  //   POST Q1: r == x * y
  {
    var x := -1;
    var y := -8;
    var r := Mul(x, y);
    expect r == 8;
  }

  // Test case for combination {1}/Oy=0:
  //   POST Q1: r == x * y
  {
    var x := 0;
    var y := 0;
    var r := Mul(x, y);
    expect r == 0;
  }

  // Test case for combination {1}/Or<0:
  //   POST Q1: r == x * y
  {
    var x := 2;
    var y := -2;
    var r := Mul(x, y);
    expect r == -4;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: r == x * y
  {
    var x := 2;
    var y := 0;
    var r := Mul(x, y);
    expect r == 0;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: r == x * y
  {
    var x := 2;
    var y := -8;
    var r := Mul(x, y);
    expect r == -16;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   POST Q1: r == x * y
  {
    var x := 2;
    var y := 2;
    var r := Mul(x, y);
    // expect r == 4; // got 0
  }

  // Test case for combination {1}/R9:
  //   POST Q1: r == x * y
  {
    var x := -1;
    var y := -2;
    var r := Mul(x, y);
    expect r == 2;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: r == x * y
  {
    var x := 1;
    var y := -2;
    var r := Mul(x, y);
    expect r == -2;
  }

}

method Main()
{
  TestsForAdd();
  print "TestsForAdd: all non-failing tests passed!\n";
  TestsForMul();
  print "TestsForMul: all non-failing tests passed!\n";
}
