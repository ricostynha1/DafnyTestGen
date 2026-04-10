// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Clover_cal_ans.dfy
// Method: CalDiv
// Generated: 2026-04-08 19:03:59

// Clover_cal_ans.dfy

method CalDiv() returns (x: int, y: int)
  ensures x == 191 / 7
  ensures y == 191 % 7
{
  x, y := 0, 191;
  while 7 <= y
    invariant 0 <= y && 7 * x + y == 191
    decreases y - 7
  {
    x := x + 1;
    y := 191 - 7 * x;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: x == 191 / 7
  //   POST: y == 191 % 7
  //   ENSURES: x == 191 / 7
  //   ENSURES: y == 191 % 7
  {
    var x, y := CalDiv();
    expect x == 27;
    expect y == 2;
  }

}

method Failing()
{
  // (no failing tests)
}

method Main()
{
  Passing();
  Failing();
}
