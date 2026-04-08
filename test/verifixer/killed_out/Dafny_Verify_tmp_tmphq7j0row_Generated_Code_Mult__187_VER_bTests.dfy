// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_Verify_tmp_tmphq7j0row_Generated_Code_Mult__187_VER_b.dfy
// Method: mult
// Generated: 2026-04-08 16:47:34

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  a >= 0 && b >= 0
  //   POST: x == a * b
  //   ENSURES: x == a * b
  {
    var a := 0;
    var b := 0;
    var x := mult(a, b);
    expect x == 0;
  }

  // Test case for combination {1}/Ba=0,b=1:
  //   PRE:  a >= 0 && b >= 0
  //   POST: x == a * b
  //   ENSURES: x == a * b
  {
    var a := 0;
    var b := 1;
    var x := mult(a, b);
    expect x == 0;
  }

  // Test case for combination {1}/Ba=1,b=0:
  //   PRE:  a >= 0 && b >= 0
  //   POST: x == a * b
  //   ENSURES: x == a * b
  {
    var a := 1;
    var b := 0;
    var x := mult(a, b);
    expect x == 0;
  }

  // Test case for combination {1}/Ba=1,b=1:
  //   PRE:  a >= 0 && b >= 0
  //   POST: x == a * b
  //   ENSURES: x == a * b
  {
    var a := 1;
    var b := 1;
    var x := mult(a, b);
    expect x == 1;
  }

  // Test case for combination {1}/Ox=0:
  //   PRE:  a >= 0 && b >= 0
  //   POST: x == a * b
  //   ENSURES: x == a * b
  {
    var a := 0;
    var b := 14;
    var x := mult(a, b);
    expect x == 0;
  }

}

method Failing()
{
  // Test case for combination {1}/Ox>0:
  //   PRE:  a >= 0 && b >= 0
  //   POST: x == a * b
  //   ENSURES: x == a * b
  {
    var a := 1;
    var b := 7;
    var x := mult(a, b);
    // expect x == 7;
  }

}

method Main()
{
  Passing();
  Failing();
}
