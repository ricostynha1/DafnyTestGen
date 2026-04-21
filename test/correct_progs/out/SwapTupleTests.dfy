// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\SwapTuple.dfy
// Method: SwapTuple
// Generated: 2026-04-21 23:38:31

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
    var t := (4294966581, 321);
    var r := SwapTuple(t);
    expect r == (321, 4294966581);
  }

}

method Main()
{
  TestsForSwapTuple();
  print "TestsForSwapTuple: all non-failing tests passed!\n";
}
