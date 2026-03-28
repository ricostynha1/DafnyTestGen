method MapContains(m: map<int, int>, k: int) returns (r: bool)
  requires |m| > 0
  ensures r == (k in m)
{
  r := k in m;
}

method MapLookup(m: map<int, int>, k: int) returns (r: int)
  requires k in m
  ensures r == m[k]
{
  r := m[k];
}

method MapSize(m: map<int, int>) returns (r: nat)
  ensures r == |m|
{
  r := |m|;
}

method MapUpdate(m: map<int, int>, k: int, v: int) returns (r: map<int, int>)
  ensures r == m[k := v]
  ensures k in r
  ensures r[k] == v
{
  r := m[k := v];
}

method MapMerge(a: map<int, int>, b: map<int, int>) returns (r: map<int, int>)
  ensures r == a + b
{
  r := a + b;
}

method MapRemoveKey(m: map<int, int>, k: int) returns (r: map<int, int>)
  requires k in m
  ensures r == m - {k}
  ensures k !in r
{
  r := m - {k};
}

method MapKeys(m: map<int, int>) returns (r: set<int>)
  ensures r == m.Keys
{
  r := m.Keys;
}
