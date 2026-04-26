// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\se2011_tmp_tmp71eb82zt_ass1_ex4__352-352_AOI.dfy
// Method: Eval
// Generated: 2026-04-24 22:47:52

// se2011_tmp_tmp71eb82zt_ass1_ex4.dfy

method Eval(x: int) returns (r: int)
  requires x >= 0
  ensures r == x * x
  decreases x
{
  var y: int := x;
  var z: int := 0;
  while y > 0
    invariant 0 <= y <= x && z == x * (x - y)
    decreases y
  {
    z := z + x;
    y := y - -1;
  }
  return z;
}


method TestsForEval()
{
  // Test case for combination {1}:
  //   PRE:  x >= 0
  //   POST Q1: r == x * x
  {
    var x := 0;
    var r := Eval(x);
    expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bx=1:
  //   PRE:  x >= 0
  //   POST Q1: r == x * x
  {
    var x := 1;
    var r := Eval(x);
    // expect r == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   PRE:  x >= 0
  //   POST Q1: r == x * x
  {
    var x := 3;
    var r := Eval(x);
    // expect r == 9;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  x >= 0
  //   POST Q1: r == x * x
  {
    var x := 2;
    var r := Eval(x);
    // expect r == 4;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  x >= 0
  //   POST Q1: r == x * x
  {
    var x := 8;
    var r := Eval(x);
    // expect r == 64;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  x >= 0
  //   POST Q1: r == x * x
  {
    var x := 10;
    var r := Eval(x);
    // expect r == 100;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  x >= 0
  //   POST Q1: r == x * x
  {
    var x := 4;
    var r := Eval(x);
    // expect r == 16;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  x >= 0
  //   POST Q1: r == x * x
  {
    var x := 6;
    var r := Eval(x);
    // expect r == 36;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  x >= 0
  //   POST Q1: r == x * x
  {
    var x := 5;
    var r := Eval(x);
    // expect r == 25;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  x >= 0
  //   POST Q1: r == x * x
  {
    var x := 7;
    var r := Eval(x);
    // expect r == 49;
  }

}

method Main()
{
  TestsForEval();
  print "TestsForEval: all non-failing tests passed!\n";
}
