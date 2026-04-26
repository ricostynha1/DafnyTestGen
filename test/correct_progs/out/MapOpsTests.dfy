// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\MapOps.dfy
// Method: MapContains
// Generated: 2026-04-23 20:27:51

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


method TestsForMapContains()
{
  // Test case for combination {1}:
  //   PRE:  |m| > 0
  //   POST Q1: r == (k in m)
  {
    var m: map<int, int> := map[0 := 0];
    var k := 10;
    var r := MapContains(m, k);
    expect r == false;
  }

  // Test case for combination {1}/O|m|>=2:
  //   PRE:  |m| > 0
  //   POST Q1: r == (k in m)
  {
    var m: map<int, int> := map[-1 := 0, 3 := 0];
    var k := -1;
    var r := MapContains(m, k);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/Ok=0:
  //   PRE:  |m| > 0
  //   POST Q1: r == (k in m)
  {
    var m: map<int, int> := map[-1 := 0, 4 := 0];
    var k := 0;
    var r := MapContains(m, k);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  |m| > 0
  //   POST Q1: r == (k in m)
  {
    var m: map<int, int> := map[4 := 0];
    var k := -10;
    var r := MapContains(m, k);
    expect r == false;
  }

  // Test case for combination {1}/R5:
  //   PRE:  |m| > 0
  //   POST Q1: r == (k in m)
  {
    var m: map<int, int> := map[-2 := 0];
    var k := -10;
    var r := MapContains(m, k);
    expect r == false;
  }

  // Test case for combination {1}/R6:
  //   PRE:  |m| > 0
  //   POST Q1: r == (k in m)
  {
    var m: map<int, int> := map[4 := 0];
    var k := 10;
    var r := MapContains(m, k);
    expect r == false;
  }

  // Test case for combination {1}/R7:
  //   PRE:  |m| > 0
  //   POST Q1: r == (k in m)
  {
    var m: map<int, int> := map[4 := 0];
    var k := 9;
    var r := MapContains(m, k);
    expect r == false;
  }

  // Test case for combination {1}/R8:
  //   PRE:  |m| > 0
  //   POST Q1: r == (k in m)
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0];
    var k := -10;
    var r := MapContains(m, k);
    expect r == false;
  }

  // Test case for combination {1}/R9:
  //   PRE:  |m| > 0
  //   POST Q1: r == (k in m)
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0];
    var k := -9;
    var r := MapContains(m, k);
    expect r == false;
  }

  // Test case for combination {1}/R10:
  //   PRE:  |m| > 0
  //   POST Q1: r == (k in m)
  {
    var m: map<int, int> := map[-1 := 0];
    var k := -10;
    var r := MapContains(m, k);
    expect r == false;
  }

}

method TestsForMapLookup()
{
  // Test case for combination {1}:
  //   PRE:  k in m
  //   POST Q1: r == m[k]
  {
    var m: map<int, int> := map[5 := 0];
    var k := 5;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/O|m|>=2:
  //   PRE:  k in m
  //   POST Q1: r == m[k]
  {
    var m: map<int, int> := map[0 := 0, 2 := 0, 4 := 0, 5 := 0];
    var k := 5;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/Ok=0:
  //   PRE:  k in m
  //   POST Q1: r == m[k]
  {
    var m: map<int, int> := map[0 := 0];
    var k := 0;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/Ok<0:
  //   PRE:  k in m
  //   POST Q1: r == m[k]
  {
    var m: map<int, int> := map[-2 := 0, 0 := 0, 1 := 0, 3 := 0];
    var k := -2;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/Or>0:
  //   PRE:  k in m
  //   POST Q1: r == m[k]
  {
    var m: map<int, int> := map[-2 := 6, -1 := 7, 0 := 8, 2 := 10, 5 := 20625];
    var k := 5;
    var r := MapLookup(m, k);
    expect r == 20625;
  }

  // Test case for combination {1}/Or<0:
  //   PRE:  k in m
  //   POST Q1: r == m[k]
  {
    var m: map<int, int> := map[-2 := -14126, -1 := 7, 0 := 8, 1 := 9, 4 := 12, 5 := 13];
    var k := -2;
    var r := MapLookup(m, k);
    expect r == -14126;
  }

  // Test case for combination {1}/R7:
  //   PRE:  k in m
  //   POST Q1: r == m[k]
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0];
    var k := 5;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  k in m
  //   POST Q1: r == m[k]
  {
    var m: map<int, int> := map[-2 := 0, 2 := 0, 4 := 0];
    var k := 2;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/R9:
  //   PRE:  k in m
  //   POST Q1: r == m[k]
  {
    var m: map<int, int> := map[0 := 0, 4 := 0];
    var k := 4;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/R10:
  //   PRE:  k in m
  //   POST Q1: r == m[k]
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 1 := 0, 2 := 0, 4 := 0];
    var k := 2;
    var r := MapLookup(m, k);
    expect r == 0;
  }

}

method TestsForMapSize()
{
  // Test case for combination {1}:
  //   POST Q1: r == |m|
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 0 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0];
    var r := MapSize(m);
    expect r == 8;
  }

  // Test case for combination {1}/O|m|=0:
  //   POST Q1: r == |m|
  {
    var m: map<int, int> := map[];
    var r := MapSize(m);
    expect r == 0;
  }

  // Test case for combination {1}/O|m|=1:
  //   POST Q1: r == |m|
  {
    var m: map<int, int> := map[1 := 0];
    var r := MapSize(m);
    expect r == 1;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: r == |m|
  {
    var m: map<int, int> := map[2 := 0, 3 := 0, 4 := 0];
    var r := MapSize(m);
    expect r == 3;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: r == |m|
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 2 := 0, 3 := 0, 4 := 0];
    var r := MapSize(m);
    expect r == 5;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: r == |m|
  {
    var m: map<int, int> := map[-1 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0];
    var r := MapSize(m);
    expect r == 5;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: r == |m|
  {
    var m: map<int, int> := map[1 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0];
    var r := MapSize(m);
    expect r == 5;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: r == |m|
  {
    var m: map<int, int> := map[-2 := 0, 1 := 0, 3 := 0, 4 := 0, 5 := 0];
    var r := MapSize(m);
    expect r == 5;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: r == |m|
  {
    var m: map<int, int> := map[-1 := 0, 1 := 0, 3 := 0, 4 := 0, 5 := 0];
    var r := MapSize(m);
    expect r == 5;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: r == |m|
  {
    var m: map<int, int> := map[-1 := 0, 1 := 0, 4 := 0, 5 := 0];
    var r := MapSize(m);
    expect r == 4;
  }

}

method TestsForMapUpdate()
{
  // Test case for combination {1}:
  //   POST Q1: r == m[k := v]
  //   POST Q2: k in r
  //   POST Q3: r[k] == v
  {
    var m: map<int, int> := map[];
    var k := 5;
    var v := -10;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect r == map[5 := -10]; // observed from implementation
  }

  // Test case for combination {1}/O|m|=1:
  //   POST Q1: r == m[k := v]
  //   POST Q2: k in r
  //   POST Q3: r[k] == v
  {
    var m: map<int, int> := map[-1 := 0];
    var k := 4;
    var v := -10;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect r == map[-1 := 0, 4 := -10]; // observed from implementation
  }

  // Test case for combination {1}/O|m|>=2:
  //   POST Q1: r == m[k := v]
  //   POST Q2: k in r
  //   POST Q3: r[k] == v
  {
    var m: map<int, int> := map[-1 := 0, 2 := 0, 4 := 0];
    var k := 4;
    var v := -9;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect r == map[-1 := 0, 2 := 0, 4 := -9]; // observed from implementation
  }

  // Test case for combination {1}/Ok=0:
  //   POST Q1: r == m[k := v]
  //   POST Q2: k in r
  //   POST Q3: r[k] == v
  {
    var m: map<int, int> := map[];
    var k := 0;
    var v := -10;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect r == map[0 := -10]; // observed from implementation
  }

  // Test case for combination {1}/Ok<0:
  //   POST Q1: r == m[k := v]
  //   POST Q2: k in r
  //   POST Q3: r[k] == v
  {
    var m: map<int, int> := map[-2 := 0, 1 := 0];
    var k := -1;
    var v := -10;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect r == map[-2 := 0, -1 := -10, 1 := 0]; // observed from implementation
  }

  // Test case for combination {1}/Ov=0:
  //   POST Q1: r == m[k := v]
  //   POST Q2: k in r
  //   POST Q3: r[k] == v
  {
    var m: map<int, int> := map[];
    var k := 4;
    var v := 0;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect r == map[4 := 0]; // observed from implementation
  }

  // Test case for combination {1}/Ov>0:
  //   POST Q1: r == m[k := v]
  //   POST Q2: k in r
  //   POST Q3: r[k] == v
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 1 := 0, 2 := 0, 5 := 0];
    var k := 4;
    var v := 10;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect r == map[-2 := 0, -1 := 0, 1 := 0, 2 := 0, 4 := 10, 5 := 0]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   POST Q1: r == m[k := v]
  //   POST Q2: k in r
  //   POST Q3: r[k] == v
  {
    var m: map<int, int> := map[-1 := 0, 0 := 0, 1 := 0, 3 := 0];
    var k := 4;
    var v := -8;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect r == map[-1 := 0, 0 := 0, 1 := 0, 3 := 0, 4 := -8]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   POST Q1: r == m[k := v]
  //   POST Q2: k in r
  //   POST Q3: r[k] == v
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 0 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0];
    var k := 4;
    var v := -7;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect r == map[-2 := 0, -1 := 0, 0 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := -7, 5 := 0]; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   POST Q1: r == m[k := v]
  //   POST Q2: k in r
  //   POST Q3: r[k] == v
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 1 := 0, 2 := 0, 3 := 0, 5 := 0];
    var k := 4;
    var v := -6;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect r == map[-2 := 0, -1 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := -6, 5 := 0]; // observed from implementation
  }

}

method TestsForMapMerge()
{
  // Test case for combination {1}:
  //   POST Q1: r == a + b
  {
    var a: map<int, int> := map[];
    var b: map<int, int> := map[];
    var r := MapMerge(a, b);
    expect r == a + b;
    expect r == map[]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=1:
  //   POST Q1: r == a + b
  {
    var a: map<int, int> := map[1 := 0];
    var b: map<int, int> := map[];
    var r := MapMerge(a, b);
    expect r == a + b;
    expect r == map[1 := 0]; // observed from implementation
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: r == a + b
  {
    var a: map<int, int> := map[0 := 0, 2 := 0, 3 := 0, 4 := 0];
    var b: map<int, int> := map[];
    var r := MapMerge(a, b);
    expect r == a + b;
    expect r == map[0 := 0, 2 := 0, 3 := 0, 4 := 0]; // observed from implementation
  }

  // Test case for combination {1}/O|b|=1:
  //   POST Q1: r == a + b
  {
    var a: map<int, int> := map[];
    var b: map<int, int> := map[1 := 0];
    var r := MapMerge(a, b);
    expect r == a + b;
    expect r == map[1 := 0]; // observed from implementation
  }

  // Test case for combination {1}/O|b|>=2:
  //   POST Q1: r == a + b
  {
    var a: map<int, int> := map[];
    var b: map<int, int> := map[0 := 0, 2 := 0, 3 := 0, 4 := 0];
    var r := MapMerge(a, b);
    expect r == a + b;
    expect r == map[0 := 0, 2 := 0, 3 := 0, 4 := 0]; // observed from implementation
  }

  // Test case for combination {1}/O|r|=1:
  //   POST Q1: r == a + b
  {
    var a: map<int, int> := map[2 := 0, 3 := 0, 5 := 0];
    var b: map<int, int> := map[];
    var r := MapMerge(a, b);
    expect r == a + b;
    expect r == map[2 := 0, 3 := 0, 5 := 0]; // observed from implementation
  }

  // Test case for combination {1}/O|r|>=2:
  //   POST Q1: r == a + b
  {
    var a: map<int, int> := map[-1 := 0];
    var b: map<int, int> := map[-1 := 0];
    var r := MapMerge(a, b);
    expect r == a + b;
    expect r == map[-1 := 0]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   POST Q1: r == a + b
  {
    var a: map<int, int> := map[-2 := 0, -1 := 0, 0 := 0, 3 := 0];
    var b: map<int, int> := map[];
    var r := MapMerge(a, b);
    expect r == a + b;
    expect r == map[-2 := 0, -1 := 0, 0 := 0, 3 := 0]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   POST Q1: r == a + b
  {
    var a: map<int, int> := map[-2 := 0, 3 := 0, 5 := 0];
    var b: map<int, int> := map[-2 := 0];
    var r := MapMerge(a, b);
    expect r == a + b;
    expect r == map[-2 := 0, 3 := 0, 5 := 0]; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   POST Q1: r == a + b
  {
    var a: map<int, int> := map[0 := 0, 5 := 0];
    var b: map<int, int> := map[];
    var r := MapMerge(a, b);
    expect r == a + b;
    expect r == map[0 := 0, 5 := 0]; // observed from implementation
  }

}

method TestsForMapRemoveKey()
{
  // Test case for combination {1}:
  //   PRE:  k in m
  //   POST Q1: r == m - {k}
  //   POST Q2: k !in r
  {
    var m: map<int, int> := map[-1 := 0, 1 := 0];
    var k := -1;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect r == map[1 := 0]; // observed from implementation
  }

  // Test case for combination {1}/O|m|=1:
  //   PRE:  k in m
  //   POST Q1: r == m - {k}
  //   POST Q2: k !in r
  {
    var m: map<int, int> := map[5 := 0];
    var k := 5;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect r == map[]; // observed from implementation
  }

  // Test case for combination {1}/Ok=0:
  //   PRE:  k in m
  //   POST Q1: r == m - {k}
  //   POST Q2: k !in r
  {
    var m: map<int, int> := map[0 := 0];
    var k := 0;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect r == map[]; // observed from implementation
  }

  // Test case for combination {1}/O|r|=1:
  //   PRE:  k in m
  //   POST Q1: r == m - {k}
  //   POST Q2: k !in r
  {
    var m: map<int, int> := map[-2 := 0, 0 := 0, 1 := 0, 3 := 0, 5 := 0];
    var k := 3;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect r == map[-2 := 0, 0 := 0, 1 := 0, 5 := 0]; // observed from implementation
  }

  // Test case for combination {1}/O|r|>=2:
  //   PRE:  k in m
  //   POST Q1: r == m - {k}
  //   POST Q2: k !in r
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 1 := 0, 2 := 0, 4 := 0, 5 := 0];
    var k := -1;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect r == map[-2 := 0, 1 := 0, 2 := 0, 4 := 0, 5 := 0]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  k in m
  //   POST Q1: r == m - {k}
  //   POST Q2: k !in r
  {
    var m: map<int, int> := map[-1 := 0, 0 := 0, 1 := 0, 4 := 0];
    var k := -1;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect r == map[0 := 0, 1 := 0, 4 := 0]; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  k in m
  //   POST Q1: r == m - {k}
  //   POST Q2: k !in r
  {
    var m: map<int, int> := map[0 := 0, 1 := 0, 5 := 0];
    var k := 5;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect r == map[0 := 0, 1 := 0]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  k in m
  //   POST Q1: r == m - {k}
  //   POST Q2: k !in r
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 0 := 0, 1 := 0, 2 := 0, 3 := 0, 5 := 0];
    var k := -1;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect r == map[-2 := 0, 0 := 0, 1 := 0, 2 := 0, 3 := 0, 5 := 0]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  k in m
  //   POST Q1: r == m - {k}
  //   POST Q2: k !in r
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 0 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0];
    var k := -1;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect r == map[-2 := 0, 0 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0]; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  k in m
  //   POST Q1: r == m - {k}
  //   POST Q2: k !in r
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 0 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0];
    var k := -1;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect r == map[-2 := 0, 0 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0]; // observed from implementation
  }

}

method TestsForMapKeys()
{
  // Test case for combination {1}:
  //   POST Q1: r == m.Keys
  {
    var m: map<int, int> := map[];
    var r := MapKeys(m);
    expect r == {};
  }

  // Test case for combination {1}/O|m|=1:
  //   POST Q1: r == m.Keys
  {
    var m: map<int, int> := map[2 := 0];
    var r := MapKeys(m);
    expect r == {2};
  }

  // Test case for combination {1}/O|m|>=2:
  //   POST Q1: r == m.Keys
  {
    var m: map<int, int> := map[3 := 0, 4 := 0];
    var r := MapKeys(m);
    expect r == {3, 4};
  }

  // Test case for combination {1}/R4:
  //   POST Q1: r == m.Keys
  {
    var m: map<int, int> := map[1 := 0];
    var r := MapKeys(m);
    expect r == {1};
  }

  // Test case for combination {1}/R5:
  //   POST Q1: r == m.Keys
  {
    var m: map<int, int> := map[3 := 0];
    var r := MapKeys(m);
    expect r == {3};
  }

  // Test case for combination {1}/R6:
  //   POST Q1: r == m.Keys
  {
    var m: map<int, int> := map[4 := 0];
    var r := MapKeys(m);
    expect r == {4};
  }

  // Test case for combination {1}/R7:
  //   POST Q1: r == m.Keys
  {
    var m: map<int, int> := map[5 := 0];
    var r := MapKeys(m);
    expect r == {5};
  }

  // Test case for combination {1}/R8:
  //   POST Q1: r == m.Keys
  {
    var m: map<int, int> := map[2 := 0, 5 := 0];
    var r := MapKeys(m);
    expect r == {2, 5};
  }

  // Test case for combination {1}/R9:
  //   POST Q1: r == m.Keys
  {
    var m: map<int, int> := map[3 := 0, 5 := 0];
    var r := MapKeys(m);
    expect r == {3, 5};
  }

  // Test case for combination {1}/R10:
  //   POST Q1: r == m.Keys
  {
    var m: map<int, int> := map[0 := 0, 3 := 0];
    var r := MapKeys(m);
    expect r == {0, 3};
  }

}

method Main()
{
  TestsForMapContains();
  print "TestsForMapContains: all non-failing tests passed!\n";
  TestsForMapLookup();
  print "TestsForMapLookup: all non-failing tests passed!\n";
  TestsForMapSize();
  print "TestsForMapSize: all non-failing tests passed!\n";
  TestsForMapUpdate();
  print "TestsForMapUpdate: all non-failing tests passed!\n";
  TestsForMapMerge();
  print "TestsForMapMerge: all non-failing tests passed!\n";
  TestsForMapRemoveKey();
  print "TestsForMapRemoveKey: all non-failing tests passed!\n";
  TestsForMapKeys();
  print "TestsForMapKeys: all non-failing tests passed!\n";
}
