// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\SwapTuple.dfy
// Method: SwapTuple
// Generated: 2026-04-17 13:35:27

method SwapTuple(t: (int, int)) returns (r: (int, int))
  ensures r.0 == t.1
  ensures r.1 == t.0
{
  r := (t.1, t.0);
}


method TestsForSwapTuple()
{
  // Test case for combination {1}:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (0, 0);
    var r := SwapTuple(t);
    expect r == (0, 0);
  }

  // Test case for combination {1}/R2:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (1, 0);
    var r := SwapTuple(t);
    expect r == (0, 1);
  }

  // Test case for combination {1}/R3:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (-1, 0);
    var r := SwapTuple(t);
    expect r == (0, -1);
  }

  // Test case for combination {1}/R4:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (-2, 0);
    var r := SwapTuple(t);
    expect r == (0, -2);
  }

}

method Main()
{
  TestsForSwapTuple();
  print "TestsForSwapTuple: all non-failing tests passed!\n";
}
