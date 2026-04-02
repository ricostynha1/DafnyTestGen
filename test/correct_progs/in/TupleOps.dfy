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
