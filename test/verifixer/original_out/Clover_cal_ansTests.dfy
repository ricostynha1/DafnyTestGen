// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Clover_cal_ans.dfy
// Method: CalDiv
// Generated: 2026-04-22 21:26:23

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


method TestsForCalDiv()
{
  // Test case for combination {1}:
  //   POST Q1: x == 191 / 7
  //   POST Q2: y == 191 % 7
  {
    var x, y := CalDiv();
    expect x == 27;
    expect y == 2;
  }

}

method Main()
{
  TestsForCalDiv();
  print "TestsForCalDiv: all non-failing tests passed!\n";
}
