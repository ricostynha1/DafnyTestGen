// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\TupleOps.dfy
// Method: SwapTuple
// Generated: 2026-04-02 13:48:07

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

method GeneratedTests_ScaleTuple()
{
  // Test case for combination {1}:
  //   PRE:  k > 0
  //   POST: r.0 == t.0 * k
  //   POST: r.1 == t.1 * k
  {
    var t := (0, 0);
    var k := 1;
    var r := ScaleTuple(t, k);
    expect r == (0, 0);
  }

  // Test case for combination {1}/Bt.0=0,t.1=0,k=2:
  //   PRE:  k > 0
  //   POST: r.0 == t.0 * k
  //   POST: r.1 == t.1 * k
  {
    var t := (0, 0);
    var k := 2;
    var r := ScaleTuple(t, k);
    expect r == (0, 0);
  }

  // Test case for combination {1}/Bt.0=0,t.1=1,k=1:
  //   PRE:  k > 0
  //   POST: r.0 == t.0 * k
  //   POST: r.1 == t.1 * k
  {
    var t := (0, 1);
    var k := 1;
    var r := ScaleTuple(t, k);
    expect r == (0, 1);
  }

  // Test case for combination {1}/Bt.0=0,t.1=1,k=2:
  //   PRE:  k > 0
  //   POST: r.0 == t.0 * k
  //   POST: r.1 == t.1 * k
  {
    var t := (0, 1);
    var k := 2;
    var r := ScaleTuple(t, k);
    expect r == (0, 2);
  }

}

method GeneratedTests_AddTuples()
{
  // Test case for combination {1}:
  //   POST: r.0 == a.0 + b.0
  //   POST: r.1 == a.1 + b.1
  {
    var a := (0, 0);
    var b := (0, 0);
    var r := AddTuples(a, b);
    expect r == (0, 0);
  }

  // Test case for combination {1}/Ba.0=0,a.1=0,b.0=0,b.1=1:
  //   POST: r.0 == a.0 + b.0
  //   POST: r.1 == a.1 + b.1
  {
    var a := (0, 0);
    var b := (0, 1);
    var r := AddTuples(a, b);
    expect r == (0, 1);
  }

  // Test case for combination {1}/Ba.0=0,a.1=0,b.0=1,b.1=0:
  //   POST: r.0 == a.0 + b.0
  //   POST: r.1 == a.1 + b.1
  {
    var a := (0, 0);
    var b := (1, 0);
    var r := AddTuples(a, b);
    expect r == (1, 0);
  }

  // Test case for combination {1}/Ba.0=0,a.1=0,b.0=1,b.1=1:
  //   POST: r.0 == a.0 + b.0
  //   POST: r.1 == a.1 + b.1
  {
    var a := (0, 0);
    var b := (1, 1);
    var r := AddTuples(a, b);
    expect r == (1, 1);
  }

}

method GeneratedTests_TupleMax()
{
  // Test case for combination {1}:
  //   POST: r == t.0
  //   POST: r >= t.0
  //   POST: r >= t.1
  {
    var t := (0, -1);
    var r := TupleMax(t);
    expect r == 0;
  }

  // Test case for combination {2}:
  //   POST: r == t.1
  //   POST: r >= t.0
  //   POST: r >= t.1
  {
    var t := (-1, 0);
    var r := TupleMax(t);
    expect r == 0;
  }

  // Test case for combination {1,2}:
  //   POST: r == t.0
  //   POST: r >= t.0
  //   POST: r >= t.1
  //   POST: r == t.1
  {
    var t := (0, 0);
    var r := TupleMax(t);
    expect r == 0;
  }

  // Test case for combination {1}/Bt.0=1,t.1=0:
  //   POST: r == t.0
  //   POST: r >= t.0
  //   POST: r >= t.1
  {
    var t := (1, 0);
    var r := TupleMax(t);
    expect r == 1;
  }

}

method GeneratedTests_MixedTuple()
{
  // Test case for combination {1}:
  //   PRE:  x >= 0
  //   POST: r.0 == x
  //   POST: r.1 == y
  {
    var x := 0;
    var y := 0.0;
    var r := MixedTuple(x, y);
    expect r == (0, 0.0);
  }

  // Test case for combination {1}/Bx=0,y=1.0:
  //   PRE:  x >= 0
  //   POST: r.0 == x
  //   POST: r.1 == y
  {
    var x := 0;
    var y := 1.0;
    var r := MixedTuple(x, y);
    expect r == (0, 1.0);
  }

  // Test case for combination {1}/Bx=0,y=-1.0:
  //   PRE:  x >= 0
  //   POST: r.0 == x
  //   POST: r.1 == y
  {
    var x := 0;
    var y := -1.0;
    var r := MixedTuple(x, y);
    expect r == (0, -1.0);
  }

  // Test case for combination {1}/Bx=0,y=0.5:
  //   PRE:  x >= 0
  //   POST: r.0 == x
  //   POST: r.1 == y
  {
    var x := 0;
    var y := 0.5;
    var r := MixedTuple(x, y);
    expect r == (0, 0.5);
  }

}

method GeneratedTests_ClassifySign()
{
  // Test case for combination {1}:
  //   POST: r.0 == x
  //   POST: r.1 == (x >= 0)
  {
    var x := 0;
    var r := ClassifySign(x);
    expect r == (0, true);
  }

  // Test case for combination {1}/Bx=1:
  //   POST: r.0 == x
  //   POST: r.1 == (x >= 0)
  {
    var x := 1;
    var r := ClassifySign(x);
    expect r == (1, true);
  }

  // Test case for combination {1}/R3:
  //   POST: r.0 == x
  //   POST: r.1 == (x >= 0)
  {
    var x := -1;
    var r := ClassifySign(x);
    expect r == (-1, false);
  }

}

method GeneratedTests_Swap3First()
{
  // Test case for combination {1}:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   POST: r.2 == t.2
  {
    var t := (0, 0, 0);
    var r := Swap3First(t);
    expect r == (0, 0, 0);
  }

  // Test case for combination {1}/Bt.0=0,t.1=0,t.2=1:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   POST: r.2 == t.2
  {
    var t := (0, 0, 1);
    var r := Swap3First(t);
    expect r == (0, 0, 1);
  }

  // Test case for combination {1}/Bt.0=0,t.1=1,t.2=0:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   POST: r.2 == t.2
  {
    var t := (0, 1, 0);
    var r := Swap3First(t);
    expect r == (1, 0, 0);
  }

  // Test case for combination {1}/Bt.0=0,t.1=1,t.2=1:
  //   POST: r.0 == t.1
  //   POST: r.1 == t.0
  //   POST: r.2 == t.2
  {
    var t := (0, 1, 1);
    var r := Swap3First(t);
    expect r == (1, 0, 1);
  }

}

method Main()
{
  GeneratedTests_SwapTuple();
  print "GeneratedTests_SwapTuple: all tests passed!\n";
  GeneratedTests_ScaleTuple();
  print "GeneratedTests_ScaleTuple: all tests passed!\n";
  GeneratedTests_AddTuples();
  print "GeneratedTests_AddTuples: all tests passed!\n";
  GeneratedTests_TupleMax();
  print "GeneratedTests_TupleMax: all tests passed!\n";
  GeneratedTests_MixedTuple();
  print "GeneratedTests_MixedTuple: all tests passed!\n";
  GeneratedTests_ClassifySign();
  print "GeneratedTests_ClassifySign: all tests passed!\n";
  GeneratedTests_Swap3First();
  print "GeneratedTests_Swap3First: all tests passed!\n";
}
