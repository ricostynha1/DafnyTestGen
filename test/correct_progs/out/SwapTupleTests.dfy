// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\SwapTuple.dfy
// Method: SwapTuple
// Generated: 2026-04-10 23:34:48

method SwapTuple(t: (int, int)) returns (r: (int, int))
  ensures r.0 == t.1
  ensures r.1 == t.0
{
  r := (t.1, t.0);
}


method Passing()
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

  // Test case for combination {1}/Bt.0=0,t.1=1:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (0, 1);
    var r := SwapTuple(t);
    expect r == (1, 0);
  }

  // Test case for combination {1}/Bt.0=1,t.1=0:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (1, 0);
    var r := SwapTuple(t);
    expect r == (0, 1);
  }

  // Test case for combination {1}/Bt.0=1,t.1=1:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (1, 1);
    var r := SwapTuple(t);
    expect r == (1, 1);
  }

  // Test case for combination {1}/Or.0>0:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (-1, 2);
    var r := SwapTuple(t);
    expect r == (2, -1);
  }

  // Test case for combination {1}/Or.0<0:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (-2, -1);
    var r := SwapTuple(t);
    expect r == (-1, -2);
  }

  // Test case for combination {1}/Or.0=0:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (-1, 0);
    var r := SwapTuple(t);
    expect r == (0, -1);
  }

  // Test case for combination {1}/Or.1>0:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (2, -2);
    var r := SwapTuple(t);
    expect r == (-2, 2);
  }

  // Test case for combination {1}/Or.1<0:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (-3, -3);
    var r := SwapTuple(t);
    expect r == (-3, -3);
  }

  // Test case for combination {1}/Or.1=0:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   ENSURES: r.0 == t.1
  //   ENSURES: r.1 == t.0
  {
    var t := (0, -1);
    var r := SwapTuple(t);
    expect r == (-1, 0);
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
