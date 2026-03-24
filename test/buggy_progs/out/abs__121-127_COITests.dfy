// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\abs__121-127_COI.dfy
// Method: abs
// Generated: 2026-03-24 22:17:36

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
  // Test case for combination {2,4}:
  //   POST: !(x > 0)
  //   POST: y == -x
  //   POST: y == x
  {
    var x := 0;
    var y := abs(x);
    expect y == 0;
  }

}

method Failing()
{
  // Test case for combination {2}:
  //   POST: !(x > 0)
  //   POST: y == -x
  {
    var x := -1;
    var y := abs(x);
    // expect y == 1;
  }

  // Test case for combination {3}:
  //   POST: y == x
  //   POST: !(x <= 0)
  {
    var x := 1;
    var y := abs(x);
    // expect y == 1;
  }

  // Test case for combination {2}/R2:
  //   POST: !(x > 0)
  //   POST: y == -x
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
