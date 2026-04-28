// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\DatatypeOps.dfy
// Method: Swap
// Generated: 2026-04-28 22:56:38

// Non-recursive algebraic-datatype smoke tests for DafnyCBT.
// Exercises: constructor application, destructors, discriminators,
// match expressions, and ADT-typed inputs / outputs.

datatype Pair = Mk(fst: int, snd: int)

datatype Shape =
    Circle(radius: int)
  | Rectangle(width: int, height: int)
  | Square(side: int)

datatype Option =
    None
  | Some(value: int)

// --- record-style (single ctor with formals) ---

method Swap(p: Pair) returns (q: Pair)
  ensures q.fst == p.snd && q.snd == p.fst
{
  q := Mk(p.snd, p.fst);
}

method MakePair(a: int, b: int) returns (p: Pair)
  ensures p.fst == a && p.snd == b
{
  p := Mk(a, b);
}

// --- multi-ctor with formals ---

method ShapeArea(s: Shape) returns (a: int)
  requires (s.Circle? ==> s.radius >= 0)
       && (s.Rectangle? ==> s.width >= 0 && s.height >= 0)
       && (s.Square? ==> s.side >= 0)
  ensures s.Circle? ==> a == 3 * s.radius * s.radius
  ensures s.Rectangle? ==> a == s.width * s.height
  ensures s.Square? ==> a == s.side * s.side
{
  match s {
    case Circle(r) => a := 3 * r * r;
    case Rectangle(w, h) => a := w * h;
    case Square(d) => a := d * d;
  }
}

// --- mixed nullary + with-formals ctors (Option-style) ---

method UnwrapOr(o: Option, dflt: int) returns (v: int)
  ensures o.Some? ==> v == o.value
  ensures o.None? ==> v == dflt
{
  match o {
    case Some(x) => v := x;
    case None => v := dflt;
  }
}

method MakeSome(x: int) returns (o: Option)
  ensures o.Some? && o.value == x
{
  o := Some(x);
}


method TestsForSwap()
{
  // Test case for combination {1}:
  //   POST Q1: q.fst == p.snd
  //   POST Q2: q.snd == p.fst
  {
    var p := Mk(3, 2);
    var q := Swap(p);
    expect q == Mk(2, 3);
  }

  // Test case for combination {1}/R2:
  //   POST Q1: q.fst == p.snd
  //   POST Q2: q.snd == p.fst
  {
    var p := Mk(5, 4);
    var q := Swap(p);
    expect q == Mk(4, 5);
  }

  // Test case for combination {1}/R3:
  //   POST Q1: q.fst == p.snd
  //   POST Q2: q.snd == p.fst
  {
    var p := Mk(7, 6);
    var q := Swap(p);
    expect q == Mk(6, 7);
  }

  // Test case for combination {1}/R4:
  //   POST Q1: q.fst == p.snd
  //   POST Q2: q.snd == p.fst
  {
    var p := Mk(9, 8);
    var q := Swap(p);
    expect q == Mk(8, 9);
  }

}

method TestsForMakePair()
{
  // Test case for combination {1}:
  //   POST Q1: p.fst == a
  //   POST Q2: p.snd == b
  {
    var a := -1;
    var b := 2;
    var p := MakePair(a, b);
    expect p == Mk(-1, 2);
  }

  // Test case for combination {1}/Oa=0:
  //   POST Q1: p.fst == a
  //   POST Q2: p.snd == b
  {
    var a := 0;
    var b := -10;
    var p := MakePair(a, b);
    expect p == Mk(0, -10);
  }

  // Test case for combination {1}/Oa>0:
  //   POST Q1: p.fst == a
  //   POST Q2: p.snd == b
  {
    var a := 10;
    var b := -9;
    var p := MakePair(a, b);
    expect p == Mk(10, -9);
  }

  // Test case for combination {1}/Ob=0:
  //   POST Q1: p.fst == a
  //   POST Q2: p.snd == b
  {
    var a := -10;
    var b := 0;
    var p := MakePair(a, b);
    expect p == Mk(-10, 0);
  }

}

method TestsForShapeArea()
{
  // Test case for combination P{2}/{2}:
  //   PRE:  (s.Circle? ==> s.radius >= 0) && (s.Rectangle? ==> s.width >= 0 && s.height >= 0) && (s.Square? ==> s.side >= 0)
  //   POST Q1: !s.Circle?
  //   POST Q2: !s.Rectangle?
  //   POST Q3: s.Square?
  //   POST Q4: a == s.side * s.side
  {
    var s := Square(0);
    var a := ShapeArea(s);
    expect a == 0;
  }

  // Test case for combination P{3}/{3}:
  //   PRE:  (s.Circle? ==> s.radius >= 0) && (s.Rectangle? ==> s.width >= 0 && s.height >= 0) && (s.Square? ==> s.side >= 0)
  //   POST Q1: !s.Circle?
  //   POST Q2: s.Rectangle?
  //   POST Q3: a == s.width * s.height
  //   POST Q4: !s.Square?
  {
    var s := Rectangle(0, 29396);
    var a := ShapeArea(s);
    expect a == 0;
  }

  // Test case for combination P{5}/{5}:
  //   PRE:  (s.Circle? ==> s.radius >= 0) && (s.Rectangle? ==> s.width >= 0 && s.height >= 0) && (s.Square? ==> s.side >= 0)
  //   POST Q1: s.Circle?
  //   POST Q2: a == 3 * s.radius * s.radius
  //   POST Q3: !s.Rectangle?
  //   POST Q4: !s.Square?
  {
    var s := Circle(0);
    var a := ShapeArea(s);
    expect a == 0;
  }

  // Test case for combination P{2}/{2}/Oa>0:
  //   PRE:  (s.Circle? ==> s.radius >= 0) && (s.Rectangle? ==> s.width >= 0 && s.height >= 0) && (s.Square? ==> s.side >= 0)
  //   POST Q1: !s.Circle?
  //   POST Q2: !s.Rectangle?
  //   POST Q3: s.Square?
  //   POST Q4: a == s.side * s.side
  {
    var s := Square(1);
    var a := ShapeArea(s);
    expect a == 1;
  }

}

method TestsForUnwrapOr()
{
  // Test case for combination {2}:
  //   POST Q1: !o.Some?
  //   POST Q2: o.None?
  //   POST Q3: v == dflt
  {
    var o := None;
    var dflt := 2;
    var v := UnwrapOr(o, dflt);
    expect v == 2;
  }

  // Test case for combination {3}:
  //   POST Q1: o.Some?
  //   POST Q2: v == o.value
  //   POST Q3: !o.None?
  {
    var o := Some(3);
    var dflt := 2;
    var v := UnwrapOr(o, dflt);
    expect v == 3;
  }

  // Test case for combination {2}/Odflt=0:
  //   POST Q1: !o.Some?
  //   POST Q2: o.None?
  //   POST Q3: v == dflt
  {
    var o := None;
    var dflt := 0;
    var v := UnwrapOr(o, dflt);
    expect v == 0;
  }

  // Test case for combination {2}/Odflt<0:
  //   POST Q1: !o.Some?
  //   POST Q2: o.None?
  //   POST Q3: v == dflt
  {
    var o := None;
    var dflt := -10;
    var v := UnwrapOr(o, dflt);
    expect v == -10;
  }

}

method TestsForMakeSome()
{
  // Test case for combination {1}:
  //   POST Q1: o.Some?
  //   POST Q2: o.value == x
  {
    var x := 2;
    var o := MakeSome(x);
    expect o == Some(2);
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: o.Some?
  //   POST Q2: o.value == x
  {
    var x := 0;
    var o := MakeSome(x);
    expect o == Some(0);
  }

  // Test case for combination {1}/Ox<0:
  //   POST Q1: o.Some?
  //   POST Q2: o.value == x
  {
    var x := -10;
    var o := MakeSome(x);
    expect o == Some(-10);
  }

  // Test case for combination {1}/R4:
  //   POST Q1: o.Some?
  //   POST Q2: o.value == x
  {
    var x := -9;
    var o := MakeSome(x);
    expect o == Some(-9);
  }

}

method Main()
{
  TestsForSwap();
  print "TestsForSwap: all non-failing tests passed!\n";
  TestsForMakePair();
  print "TestsForMakePair: all non-failing tests passed!\n";
  TestsForShapeArea();
  print "TestsForShapeArea: all non-failing tests passed!\n";
  TestsForUnwrapOr();
  print "TestsForUnwrapOr: all non-failing tests passed!\n";
  TestsForMakeSome();
  print "TestsForMakeSome: all non-failing tests passed!\n";
}
