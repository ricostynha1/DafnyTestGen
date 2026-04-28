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
