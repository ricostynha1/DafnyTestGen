// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\abs__121-127_COI.dfy
// Method: abs
// Generated: 2026-04-15 18:47:16

// res.dfy

method abs(x: int) returns (y: int)
  ensures x > 0 ==> y == x
  ensures x <= 0 ==> y == -x
  decreases x
{
  if !(x > 0) {
    y := x;
  } else {
    y := -x;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: !(x > 0)
  //   POST: x <= 0
  //   POST: y == -x
  //   ENSURES: x > 0 ==> y == x
  //   ENSURES: x <= 0 ==> y == -x
  {
    var x := 0;
    var y := abs(x);
    expect y == 0;
  }

}

method Failing()
{
  // Test case for combination {2}:
  //   POST: x > 0
  //   POST: y == x
  //   POST: !(x <= 0)
  //   ENSURES: x > 0 ==> y == x
  //   ENSURES: x <= 0 ==> y == -x
  {
    var x := 1;
    var y := abs(x);
    // expect y == 1;
  }

  // Test case for combination {1}/Oy>0:
  //   POST: !(x > 0)
  //   POST: x <= 0
  //   POST: y == -x
  //   ENSURES: x > 0 ==> y == x
  //   ENSURES: x <= 0 ==> y == -x
  {
    var x := -1;
    var y := abs(x);
    // expect y == 1;
  }

  // Test case for combination {1}/R3:
  //   POST: !(x > 0)
  //   POST: x <= 0
  //   POST: y == -x
  //   ENSURES: x > 0 ==> y == x
  //   ENSURES: x <= 0 ==> y == -x
  {
    var x := -2;
    var y := abs(x);
    // expect y == 2;
  }

}

method Main()
{
  Passing();
  Failing();
}
