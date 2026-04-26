// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\TupleOps.dfy
// Method: SwapTuple
// Generated: 2026-04-23 20:47:21

// --- (int, int) tuples ---

method SwapTuple(t: (int, int)) returns (r: (int, int))
  ensures r.0 == t.1
  ensures r.1 == t.0
{
  r := (t.1, t.0);
}

method ScaleTuple(t: (int, int), k: int) returns (r: (int, int))
  requires k > 0
  ensures r.0 == t.0 * k
  ensures r.1 == t.1 * k
{
  r := (t.0 * k, t.1 * k);
}

method AddTuples(a: (int, int), b: (int, int)) returns (r: (int, int))
  ensures r.0 == a.0 + b.0
  ensures r.1 == a.1 + b.1
{
  r := (a.0 + b.0, a.1 + b.1);
}

method TupleMax(t: (int, int)) returns (r: int)
  ensures r == t.0 || r == t.1
  ensures r >= t.0 && r >= t.1
{
  if t.0 >= t.1 { r := t.0; } else { r := t.1; }
}

// --- (int, real) mixed-type tuples ---

method MixedTuple(x: int, y: real) returns (r: (int, real))
  requires x >= 0
  ensures r.0 == x
  ensures r.1 == y
{
  r := (x, y);
}

// --- (int, bool) tuples ---

method ClassifySign(x: int) returns (r: (int, bool))
  ensures r.0 == x
  ensures r.1 == (x >= 0)
{
  r := (x, x >= 0);
}

// --- 3-tuples ---

method Swap3First(t: (int, int, int)) returns (r: (int, int, int))
  ensures r.0 == t.1
  ensures r.1 == t.0
  ensures r.2 == t.2
{
  r := (t.1, t.0, t.2);
}


method TestsForSwapTuple()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: r.0 == t.1
  //   POST Q2: r.1 == t.0
  {
    var t := (349, 4294966676);
    var r := SwapTuple(t);
    expect r == (4294966676, 349);
  }

}

method TestsForScaleTuple()
{
  // Test case for combination {1}/Rel:
  //   PRE:  k > 0
  //   POST Q1: r.0 == t.0 * k
  //   POST Q2: r.1 == t.1 * k
  {
    var t := (0, 0);
    var k := 10;
    var r := ScaleTuple(t, k);
    expect r == (0, 0);
  }

  // Test case for combination {1}/Bk=1:
  //   PRE:  k > 0
  //   POST Q1: r.0 == t.0 * k
  //   POST Q2: r.1 == t.1 * k
  {
    var t := (0, 0);
    var k := 1;
    var r := ScaleTuple(t, k);
    expect r == (0, 0);
  }

  // Test case for combination {1}/Bk=2:
  //   PRE:  k > 0
  //   POST Q1: r.0 == t.0 * k
  //   POST Q2: r.1 == t.1 * k
  {
    var t := (0, 0);
    var k := 2;
    var r := ScaleTuple(t, k);
    expect r == (0, 0);
  }

  // Test case for combination {1}/R3:
  //   PRE:  k > 0
  //   POST Q1: r.0 == t.0 * k
  //   POST Q2: r.1 == t.1 * k
  {
    var t := (-1, -1);
    var k := 10;
    var r := ScaleTuple(t, k);
    expect r == (-10, -10);
  }

  // Test case for combination {1}/R4:
  //   PRE:  k > 0
  //   POST Q1: r.0 == t.0 * k
  //   POST Q2: r.1 == t.1 * k
  {
    var t := (-2, -2);
    var k := 10;
    var r := ScaleTuple(t, k);
    expect r == (-20, -20);
  }

  // Test case for combination {1}/R5:
  //   PRE:  k > 0
  //   POST Q1: r.0 == t.0 * k
  //   POST Q2: r.1 == t.1 * k
  {
    var t := (-3, -3);
    var k := 10;
    var r := ScaleTuple(t, k);
    expect r == (-30, -30);
  }

  // Test case for combination {1}/R6:
  //   PRE:  k > 0
  //   POST Q1: r.0 == t.0 * k
  //   POST Q2: r.1 == t.1 * k
  {
    var t := (-4, -4);
    var k := 10;
    var r := ScaleTuple(t, k);
    expect r == (-40, -40);
  }

  // Test case for combination {1}/R7:
  //   PRE:  k > 0
  //   POST Q1: r.0 == t.0 * k
  //   POST Q2: r.1 == t.1 * k
  {
    var t := (-5, -5);
    var k := 10;
    var r := ScaleTuple(t, k);
    expect r == (-50, -50);
  }

  // Test case for combination {1}/R8:
  //   PRE:  k > 0
  //   POST Q1: r.0 == t.0 * k
  //   POST Q2: r.1 == t.1 * k
  {
    var t := (-6, -6);
    var k := 10;
    var r := ScaleTuple(t, k);
    expect r == (-60, -60);
  }

  // Test case for combination {1}/R9:
  //   PRE:  k > 0
  //   POST Q1: r.0 == t.0 * k
  //   POST Q2: r.1 == t.1 * k
  {
    var t := (-7, -7);
    var k := 10;
    var r := ScaleTuple(t, k);
    expect r == (-70, -70);
  }

}

method TestsForAddTuples()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: r.0 == a.0 + b.0
  //   POST Q2: r.1 == a.1 + b.1
  {
    var a := (4294966337, 828);
    var b := (0, 0);
    var r := AddTuples(a, b);
    expect r == (4294966337, 828);
  }

}

method TestsForTupleMax()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: r == t.0
  //   POST Q2: r >= t.1
  {
    var t := (23, 23);
    var r := TupleMax(t);
    expect r == 23;
  }

  // Test case for combination {2}/Rel:
  //   POST Q1: r > t.0
  //   POST Q2: r == t.1
  {
    var t := (23, 470);
    var r := TupleMax(t);
    expect r == 470;
  }

  // Test case for combination {1}/Or=0:
  //   POST Q1: r == t.0
  //   POST Q2: r >= t.1
  {
    var t := (0, 0);
    var r := TupleMax(t);
    expect r == 0;
  }

  // Test case for combination {1}/Or<0:
  //   POST Q1: r == t.0
  //   POST Q2: r >= t.1
  {
    var t := (-1, -1);
    var r := TupleMax(t);
    expect r == -1;
  }

  // Test case for combination {2}/Or=0:
  //   POST Q1: r > t.0
  //   POST Q2: r == t.1
  {
    var t := (-1, 0);
    var r := TupleMax(t);
    expect r == 0;
  }

  // Test case for combination {2}/Or<0:
  //   POST Q1: r > t.0
  //   POST Q2: r == t.1
  {
    var t := (-2, -1);
    var r := TupleMax(t);
    expect r == -1;
  }

  // Test case for combination {1}/Or=0/R3:
  //   POST Q1: r == t.0
  //   POST Q2: r >= t.1
  {
    var t := (0, -1);
    var r := TupleMax(t);
    expect r == 0;
  }

  // Test case for combination {1}/Or=0/R4:
  //   POST Q1: r == t.0
  //   POST Q2: r >= t.1
  {
    var t := (0, -2);
    var r := TupleMax(t);
    expect r == 0;
  }

  // Test case for combination {1}/Or=0/R5:
  //   POST Q1: r == t.0
  //   POST Q2: r >= t.1
  {
    var t := (0, -3);
    var r := TupleMax(t);
    expect r == 0;
  }

  // Test case for combination {1}/Or=0/R6:
  //   POST Q1: r == t.0
  //   POST Q2: r >= t.1
  {
    var t := (0, -4);
    var r := TupleMax(t);
    expect r == 0;
  }

}

method TestsForMixedTuple()
{
  // Test case for combination {1}/Rel:
  //   PRE:  x >= 0
  //   POST Q1: r.0 == x
  //   POST Q2: r.1 == y
  {
    var x := 10;
    var y := 3.0;
    var r := MixedTuple(x, y);
    expect r == (10, 3.0);
  }

  // Test case for combination {1}/Ox=0:
  //   PRE:  x >= 0
  //   POST Q1: r.0 == x
  //   POST Q2: r.1 == y
  {
    var x := 0;
    var y := 0.0;
    var r := MixedTuple(x, y);
    expect r == (0, 0.0);
  }

  // Test case for combination {1}/Oy<0:
  //   PRE:  x >= 0
  //   POST Q1: r.0 == x
  //   POST Q2: r.1 == y
  {
    var x := 10;
    var y := -1.0;
    var r := MixedTuple(x, y);
    expect r == (10, -1.0);
  }

  // Test case for combination {1}/Ox=0/R3:
  //   PRE:  x >= 0
  //   POST Q1: r.0 == x
  //   POST Q2: r.1 == y
  {
    var x := 0;
    var y := -1.0;
    var r := MixedTuple(x, y);
    expect r == (0, -1.0);
  }

  // Test case for combination {1}/Ox=0/R4:
  //   PRE:  x >= 0
  //   POST Q1: r.0 == x
  //   POST Q2: r.1 == y
  {
    var x := 0;
    var y := -2.0;
    var r := MixedTuple(x, y);
    expect r == (0, -2.0);
  }

  // Test case for combination {1}/Ox=0/R5:
  //   PRE:  x >= 0
  //   POST Q1: r.0 == x
  //   POST Q2: r.1 == y
  {
    var x := 0;
    var y := -3.0;
    var r := MixedTuple(x, y);
    expect r == (0, -3.0);
  }

  // Test case for combination {1}/Ox=0/R6:
  //   PRE:  x >= 0
  //   POST Q1: r.0 == x
  //   POST Q2: r.1 == y
  {
    var x := 0;
    var y := -4.0;
    var r := MixedTuple(x, y);
    expect r == (0, -4.0);
  }

  // Test case for combination {1}/Ox=0/R7:
  //   PRE:  x >= 0
  //   POST Q1: r.0 == x
  //   POST Q2: r.1 == y
  {
    var x := 0;
    var y := -5.0;
    var r := MixedTuple(x, y);
    expect r == (0, -5.0);
  }

  // Test case for combination {1}/Ox=0/R8:
  //   PRE:  x >= 0
  //   POST Q1: r.0 == x
  //   POST Q2: r.1 == y
  {
    var x := 0;
    var y := -6.0;
    var r := MixedTuple(x, y);
    expect r == (0, -6.0);
  }

  // Test case for combination {1}/Ox=0/R9:
  //   PRE:  x >= 0
  //   POST Q1: r.0 == x
  //   POST Q2: r.1 == y
  {
    var x := 0;
    var y := -7.0;
    var r := MixedTuple(x, y);
    expect r == (0, -7.0);
  }

}

method TestsForClassifySign()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: r.0 == x
  //   POST Q2: r.1 == (x >= 0)
  {
    var x := -10;
    var r := ClassifySign(x);
    expect r == (-10, false);
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: r.0 == x
  //   POST Q2: r.1 == (x >= 0)
  {
    var x := 0;
    var r := ClassifySign(x);
    expect r == (0, true);
  }

  // Test case for combination {1}/Ox>0:
  //   POST Q1: r.0 == x
  //   POST Q2: r.1 == (x >= 0)
  {
    var x := 10;
    var r := ClassifySign(x);
    expect r == (10, true);
  }

}

method TestsForSwap3First()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: r.0 == t.1
  //   POST Q2: r.1 == t.0
  //   POST Q3: r.2 == t.2
  {
    var t := (398, 4294966521, 873);
    var r := Swap3First(t);
    expect r == (4294966521, 398, 873);
  }

}

method Main()
{
  TestsForSwapTuple();
  print "TestsForSwapTuple: all non-failing tests passed!\n";
  TestsForScaleTuple();
  print "TestsForScaleTuple: all non-failing tests passed!\n";
  TestsForAddTuples();
  print "TestsForAddTuples: all non-failing tests passed!\n";
  TestsForTupleMax();
  print "TestsForTupleMax: all non-failing tests passed!\n";
  TestsForMixedTuple();
  print "TestsForMixedTuple: all non-failing tests passed!\n";
  TestsForClassifySign();
  print "TestsForClassifySign: all non-failing tests passed!\n";
  TestsForSwap3First();
  print "TestsForSwap3First: all non-failing tests passed!\n";
}
