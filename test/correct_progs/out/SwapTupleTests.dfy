// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\SwapTuple.dfy
// Method: SwapTuple
// Generated: 2026-04-02 11:16:02

method SwapTuple(t: (int, int)) returns (r: (int, int))
  ensures r.0 == t.1
  ensures r.1 == t.0
{
  r := (t.1, t.0);
}


method GeneratedTests_SwapTuple()
{
  // Test case for combination {1}:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  {
    var t := (0, 0);
    var r := SwapTuple(t);
    expect r == (0, 0);
  }

  // Test case for combination {1}/Bt.0=0,t.1=1:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  {
    var t := (0, 1);
    var r := SwapTuple(t);
    expect r == (1, 0);
  }

  // Test case for combination {1}/Bt.0=1,t.1=0:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  {
    var t := (1, 0);
    var r := SwapTuple(t);
    expect r == (0, 1);
  }

  // Test case for combination {1}/Bt.0=1,t.1=1:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  {
    var t := (1, 1);
    var r := SwapTuple(t);
    expect r == (1, 1);
  }

}

method Main()
{
  GeneratedTests_SwapTuple();
  print "GeneratedTests_SwapTuple: all tests passed!\n";
}
