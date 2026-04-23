// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\se2011_tmp_tmp71eb82zt_ass1_ex4__352-352_AOI.dfy
// Method: Eval
// Generated: 2026-04-22 21:56:21

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
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  x >= 0
  //   POST Q1: r == x * x
  {
    var x := 10;
    var r := Eval(x);
    // expect r == 100;
  }

  // Test case for combination {1}/Bx=0:
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
  // Test case for combination {1}/R4:
  //   PRE:  x >= 0
  //   POST Q1: r == x * x
  {
    var x := 9;
    var r := Eval(x);
    // expect r == 81;
  }

}

method Main()
{
  TestsForEval();
  print "TestsForEval: all non-failing tests passed!\n";
}
