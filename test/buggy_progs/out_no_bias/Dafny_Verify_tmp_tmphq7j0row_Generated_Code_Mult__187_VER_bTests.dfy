// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Verify_tmp_tmphq7j0row_Generated_Code_Mult__187_VER_b.dfy
// Method: mult
// Generated: 2026-04-24 11:43:23

// Dafny_Verify_tmp_tmphq7j0row_Generated_Code_Mult.dfy

method mult(a: int, b: int) returns (x: int)
  requires a >= 0 && b >= 0
  ensures x == a * b
  decreases a, b
{
  x := 0;
  var y := a;
  while y > 0
    invariant x == (a - y) * b
    decreases y - 0
  {
    x := x + b;
    y := b - 1;
  }
}


method TestsFormult()
{
  // Test case for combination {1}:
  //   PRE:  a >= 0 && b >= 0
  //   POST Q1: x == a * b
  {
    var a := 0;
    var b := 0;
    var x := mult(a, b);
    expect x == 0;
  }

  // Test case for combination {1}/Ba=1:
  //   PRE:  a >= 0 && b >= 0
  //   POST Q1: x == a * b
  {
    var a := 1;
    var b := 0;
    var x := mult(a, b);
    expect x == 0;
  }

  // Test case for combination {1}/Bb=1:
  //   PRE:  a >= 0 && b >= 0
  //   POST Q1: x == a * b
  {
    var a := 0;
    var b := 1;
    var x := mult(a, b);
    expect x == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ox>0:
  //   PRE:  a >= 0 && b >= 0
  //   POST Q1: x == a * b
  {
    var a := 2;
    var b := 1;
    var x := mult(a, b);
    // expect x == 2; // got 1
  }

  // Test case for combination {1}/R5:
  //   PRE:  a >= 0 && b >= 0
  //   POST Q1: x == a * b
  {
    var a := 2;
    var b := 0;
    var x := mult(a, b);
    expect x == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  a >= 0 && b >= 0
  //   POST Q1: x == a * b
  {
    var a := 2;
    var b := 3;
    var x := mult(a, b);
    // expect x == 6;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  a >= 0 && b >= 0
  //   POST Q1: x == a * b
  {
    var a := 1;
    var b := 3;
    var x := mult(a, b);
    // expect x == 3;
  }

  // Test case for combination {1}/R8:
  //   PRE:  a >= 0 && b >= 0
  //   POST Q1: x == a * b
  {
    var a := 0;
    var b := 3;
    var x := mult(a, b);
    expect x == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  a >= 0 && b >= 0
  //   POST Q1: x == a * b
  {
    var a := 3;
    var b := 3;
    var x := mult(a, b);
    // expect x == 9;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  a >= 0 && b >= 0
  //   POST Q1: x == a * b
  {
    var a := 3;
    var b := 1;
    var x := mult(a, b);
    // expect x == 3; // got 1
  }

}

method Main()
{
  TestsFormult();
  print "TestsFormult: all non-failing tests passed!\n";
}
