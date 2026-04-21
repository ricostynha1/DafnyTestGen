// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\SwapTuple.dfy
// Method: SwapTuple
// Generated: 2026-04-21 22:51:42

method SwapTuple(t: (int, int)) returns (r: (int, int))
  ensures r.0 == t.1
  ensures r.1 == t.0
{
  r := (t.1, t.0);
}


method TestsForSwapTuple()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: r.0 == t.1
  //   POST Q2: r.1 == t.0
  {
    var t := (4294966436, 4294966459);
    var r := SwapTuple(t);
    expect r == (4294966459, 4294966436);
  }

}

method Main()
{
  TestsForSwapTuple();
  print "TestsForSwapTuple: all non-failing tests passed!\n";
}
