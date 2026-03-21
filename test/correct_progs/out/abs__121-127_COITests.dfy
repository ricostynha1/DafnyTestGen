// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\DafnyTestGen\test\in\abs__121-127_COI.dfy
// Method: abs
// Generated: 2026-03-20 12:27:52

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


method GeneratedTests_abs()
{
  // Test case for combination {2}:
  //   POST: !(x > 0)
  //   POST: y == -x
  {
    var x := 0;
    var y := abs(x);
    expect y == 1;
  }

  // Test case for combination {3}:
  //   POST: y == x
  //   POST: !(x <= 0)
  {
    var x := 1;
    var y := abs(x);
    expect y == 1;
  }

}

method Main()
{
  GeneratedTests_abs();
  print "GeneratedTests_abs: all tests passed!\n";
}
