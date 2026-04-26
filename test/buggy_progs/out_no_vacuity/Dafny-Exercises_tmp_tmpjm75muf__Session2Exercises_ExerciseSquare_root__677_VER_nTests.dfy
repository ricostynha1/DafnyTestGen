// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny-Exercises_tmp_tmpjm75muf__Session2Exercises_ExerciseSquare_root__677_VER_n.dfy
// Method: mroot1
// Generated: 2026-04-24 16:06:53

// Dafny-Exercises_tmp_tmpjm75muf__Session2Exercises_ExerciseSquare_root.dfy

method mroot1(n: int) returns (r: int)
  requires n >= 0
  ensures r >= 0 && r * r <= n < (r + 1) * (r + 1)
  decreases n
{
  r := 0;
  while (r + 1) * (r + 1) <= n
    invariant r >= 0 && r * r <= n
    decreases n - r * r
  {
    r := r + 1;
  }
}

method mroot2(n: int) returns (r: int)
  requires n >= 0
  ensures r >= 0 && r * r <= n < (r + 1) * (r + 1)
  decreases n
{
  r := n;
  while n < r * r
    invariant 0 <= r <= n && n < (r + 1) * (r + 1)
    invariant r * r <= n ==> n < (r + 1) * (r + 1)
    decreases r
  {
    r := r - 1;
  }
}

method mroot3(n: int) returns (r: int)
  requires n >= 0
  ensures r >= 0 && r * r <= n < (r + 1) * (r + 1)
  decreases n
{
  var y: int;
  var h: int;
  r := 0;
  y := n + 1;
  while n != r + 1
    invariant r >= 0 && r * r <= n < y * y && y >= r + 1
    decreases y - r
  {
    h := (r + y) / 2;
    if h * h <= n {
      r := h;
    } else {
      y := h;
    }
  }
}


method TestsFormroot1()
{
  // Test case for combination {1}/Rel:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 9;
    var r := mroot1(n);
    expect r == 3;
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 0;
    var r := mroot1(n);
    expect r == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 1;
    var r := mroot1(n);
    expect r == 1;
  }

  // Test case for combination {1}/Br=n-1:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 2;
    var r := mroot1(n);
    expect r == 1;
  }

  // Test case for combination {1}/R4:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 3;
    var r := mroot1(n);
    expect r == 1;
  }

  // Test case for combination {1}/R5:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 8;
    var r := mroot1(n);
    expect r == 2;
  }

  // Test case for combination {1}/R7:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 7;
    var r := mroot1(n);
    expect r == 2;
  }

  // Test case for combination {1}/R8:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 10;
    var r := mroot1(n);
    expect r == 3;
  }

  // Test case for combination {1}/R9:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 6;
    var r := mroot1(n);
    expect r == 2;
  }

}

method TestsFormroot2()
{
  // Test case for combination {1}/Rel:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 9;
    var r := mroot2(n);
    expect r == 3;
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 0;
    var r := mroot2(n);
    expect r == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 1;
    var r := mroot2(n);
    expect r == 1;
  }

  // Test case for combination {1}/Br=n-1:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 2;
    var r := mroot2(n);
    expect r == 1;
  }

  // Test case for combination {1}/R4:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 3;
    var r := mroot2(n);
    expect r == 1;
  }

  // Test case for combination {1}/R5:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 8;
    var r := mroot2(n);
    expect r == 2;
  }

  // Test case for combination {1}/R7:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 7;
    var r := mroot2(n);
    expect r == 2;
  }

  // Test case for combination {1}/R8:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 10;
    var r := mroot2(n);
    expect r == 3;
  }

  // Test case for combination {1}/R9:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 6;
    var r := mroot2(n);
    expect r == 2;
  }

}

method TestsFormroot3()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 9;
    var r := mroot3(n);
    // expect r == 3;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bn=0:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 0;
    var r := mroot3(n);
    // expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 1;
    var r := mroot3(n);
    // expect r == 1; // got 0
  }

  // Test case for combination {1}/Br=n-1:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 2;
    var r := mroot3(n);
    expect r == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 3;
    var r := mroot3(n);
    // expect r == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 8;
    var r := mroot3(n);
    // expect r == 2;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 7;
    var r := mroot3(n);
    // expect r == 2;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 10;
    var r := mroot3(n);
    // expect r == 3;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  n >= 0
  //   POST Q1: r >= 0
  //   POST Q2: r * r <= n
  //   POST Q3: n < (r + 1) * (r + 1)
  {
    var n := 6;
    var r := mroot3(n);
    // expect r == 2;
  }

}

method Main()
{
  TestsFormroot1();
  print "TestsFormroot1: all non-failing tests passed!\n";
  TestsFormroot2();
  print "TestsFormroot2: all non-failing tests passed!\n";
  TestsFormroot3();
  print "TestsFormroot3: all non-failing tests passed!\n";
}
