// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\se2011_tmp_tmp71eb82zt_ass1_ex4__352-352_AOI.dfy
// Method: Eval
// Generated: 2026-03-25 22:57:47

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  x >= 0
  //   POST: r == x * x
  {
    var x := 0;
    var r := Eval(x);
    expect r == 0;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  x >= 0
  //   POST: r == x * x
  {
    var x := 1;
    var r := Eval(x);
    // expect r == 1;
  }

  // Test case for combination {1}/R3:
  //   PRE:  x >= 0
  //   POST: r == x * x
  {
    var x := 4;
    var r := Eval(x);
    // expect r == 16;
  }

}

method Main()
{
  Passing();
  Failing();
}
