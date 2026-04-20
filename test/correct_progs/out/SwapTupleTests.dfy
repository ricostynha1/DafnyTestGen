// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\SwapTuple.dfy
// Method: SwapTuple
// Generated: 2026-04-20 22:08:44

method SwapTuple(t: (int, int)) returns (r: (int, int))
  ensures r.0 == t.1
  ensures r.1 == t.0
{
  r := (t.1, t.0);
}


method TestsForSwapTuple()
{
  // Test case for combination {1}/Rel:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (146, 4294966792);
    var r := SwapTuple(t);
    expect r == (4294966792, 146);
  }

}

method Main()
{
  TestsForSwapTuple();
  print "TestsForSwapTuple: all non-failing tests passed!\n";
}
