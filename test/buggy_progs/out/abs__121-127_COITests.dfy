// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\pass_fail_in\abs__121-127_COI.dfy
// Method: abs
// Generated: 2026-03-20 23:17:43

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
  // Test case for combination {2,4}/Bx=0:
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
  // Test case for combination {3}/Bx=1:
  //   POST: y == x
  //   POST: !(x <= 0)
  {
    var x := 1;
    var y := abs(x);
    // expect y == 1;
  }

}

method Main()
{
  Passing();
  Failing();
}
