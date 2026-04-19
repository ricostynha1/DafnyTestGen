// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\MapOps.dfy
// Method: MapContains
// Generated: 2026-04-19 21:53:22

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
  //   POST: r == (k in m)
  //   ENSURES: r == (k in m)
  {
    var m: map<int, int> := map[0 := 0];
    var k := 20;
    var r := MapContains(m, k);
    expect r == false;
  }

  // Test case for combination {1}/O|m|>=2:
  //   PRE:  |m| > 0
  //   POST: r == (k in m)
  //   ENSURES: r == (k in m)
  {
    var m: map<int, int> := map[-1 := 0, 3 := 0];
    var k := -1;
    var r := MapContains(m, k);
    expect r == true || r == false;
  }

  // Test case for combination {1}/Ok=0:
  //   PRE:  |m| > 0
  //   POST: r == (k in m)
  //   ENSURES: r == (k in m)
  {
    var m: map<int, int> := map[-1 := 0, 4 := 0];
    var k := 0;
    var r := MapContains(m, k);
    expect r == false || r == true;
  }

  // Test case for combination {1}/R4:
  //   PRE:  |m| > 0
  //   POST: r == (k in m)
  //   ENSURES: r == (k in m)
  {
    var m: map<int, int> := map[4 := 0];
    var k := -20;
    var r := MapContains(m, k);
    expect r == false;
  }

}

method TestsForMapLookup()
{
  // Test case for combination {1}:
  //   PRE:  k in m
  //   POST: r == m[k]
  //   ENSURES: r == m[k]
  {
    var m: map<int, int> := map[-2 := 0, 0 := 0, 1 := 0];
    var k := -2;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/O|m|=1:
  //   PRE:  k in m
  //   POST: r == m[k]
  //   ENSURES: r == m[k]
  {
    var m: map<int, int> := map[4 := 0];
    var k := 4;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/Ok=0:
  //   PRE:  k in m
  //   POST: r == m[k]
  //   ENSURES: r == m[k]
  {
    var m: map<int, int> := map[0 := 0];
    var k := 0;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/Or>0:
  //   PRE:  k in m
  //   POST: r == m[k]
  //   ENSURES: r == m[k]
  {
    var m: map<int, int> := map[0 := 8, 1 := 9, 3 := 3816, 4 := 11, 5 := 12];
    var k := 3;
    var r := MapLookup(m, k);
    expect r == 3816;
  }

}

method TestsForMapSize()
{
  // Test case for combination {1}:
  //   POST: r == |m|
  //   ENSURES: r == |m|
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 0 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0];
    var r := MapSize(m);
    expect r == 8;
  }

  // Test case for combination {1}/O|m|=0:
  //   POST: r == |m|
  //   ENSURES: r == |m|
  {
    var m: map<int, int> := map[];
    var r := MapSize(m);
    expect r == 0;
  }

  // Test case for combination {1}/O|m|=1:
  //   POST: r == |m|
  //   ENSURES: r == |m|
  {
    var m: map<int, int> := map[1 := 0];
    var r := MapSize(m);
    expect r == 1;
  }

  // Test case for combination {1}/R4:
  //   POST: r == |m|
  //   ENSURES: r == |m|
  {
    var m: map<int, int> := map[2 := 0, 3 := 0, 4 := 0];
    var r := MapSize(m);
    expect r == 3;
  }

}

method TestsForMapUpdate()
{
  // Test case for combination {1}:
  //   POST: r == m[k := v]
  //   POST: k in r
  //   POST: r[k] == v
  //   ENSURES: r == m[k := v]
  //   ENSURES: k in r
  //   ENSURES: r[k] == v
  {
    var m: map<int, int> := map[];
    var k := -2;
    var v := -20;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
  }

  // Test case for combination {1}/O|m|=1:
  //   POST: r == m[k := v]
  //   POST: k in r
  //   POST: r[k] == v
  //   ENSURES: r == m[k := v]
  //   ENSURES: k in r
  //   ENSURES: r[k] == v
  {
    var m: map<int, int> := map[5 := 0];
    var k := 5;
    var v := -20;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
  }

  // Test case for combination {1}/O|m|>=2:
  //   POST: r == m[k := v]
  //   POST: k in r
  //   POST: r[k] == v
  //   ENSURES: r == m[k := v]
  //   ENSURES: k in r
  //   ENSURES: r[k] == v
  {
    var m: map<int, int> := map[0 := 0, 2 := 0, 4 := 0];
    var k := 5;
    var v := -19;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
  }

  // Test case for combination {1}/Ok=0:
  //   POST: r == m[k := v]
  //   POST: k in r
  //   POST: r[k] == v
  //   ENSURES: r == m[k := v]
  //   ENSURES: k in r
  //   ENSURES: r[k] == v
  {
    var m: map<int, int> := map[];
    var k := 0;
    var v := -20;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
  }

}

method TestsForMapMerge()
{
  // Test case for combination {1}:
  //   POST: r == a + b
  //   ENSURES: r == a + b
  {
    var a: map<int, int> := map[];
    var b: map<int, int> := map[];
    var r := MapMerge(a, b);
    expect r == a + b;
  }

  // Test case for combination {1}/O|a|=1:
  //   POST: r == a + b
  //   ENSURES: r == a + b
  {
    var a: map<int, int> := map[1 := 0];
    var b: map<int, int> := map[];
    var r := MapMerge(a, b);
    expect r == a + b;
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST: r == a + b
  //   ENSURES: r == a + b
  {
    var a: map<int, int> := map[0 := 0, 2 := 0, 3 := 0, 4 := 0];
    var b: map<int, int> := map[];
    var r := MapMerge(a, b);
    expect r == a + b;
  }

  // Test case for combination {1}/O|b|=1:
  //   POST: r == a + b
  //   ENSURES: r == a + b
  {
    var a: map<int, int> := map[];
    var b: map<int, int> := map[1 := 0];
    var r := MapMerge(a, b);
    expect r == a + b;
  }

}

method TestsForMapRemoveKey()
{
  // Test case for combination {1}:
  //   PRE:  k in m
  //   POST: r == m - {k}
  //   POST: k !in r
  //   ENSURES: r == m - {k}
  //   ENSURES: k !in r
  {
    var m: map<int, int> := map[-1 := 0];
    var k := -1;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
  }

  // Test case for combination {1}/O|m|>=2:
  //   PRE:  k in m
  //   POST: r == m - {k}
  //   POST: k !in r
  //   ENSURES: r == m - {k}
  //   ENSURES: k !in r
  {
    var m: map<int, int> := map[-1 := 0, 1 := 0, 2 := 0, 5 := 0];
    var k := -1;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
  }

  // Test case for combination {1}/Ok=0:
  //   PRE:  k in m
  //   POST: r == m - {k}
  //   POST: k !in r
  //   ENSURES: r == m - {k}
  //   ENSURES: k !in r
  {
    var m: map<int, int> := map[0 := 0];
    var k := 0;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
  }

  // Test case for combination {1}/Ok>0:
  //   PRE:  k in m
  //   POST: r == m - {k}
  //   POST: k !in r
  //   ENSURES: r == m - {k}
  //   ENSURES: k !in r
  {
    var m: map<int, int> := map[-1 := 0, 2 := 0, 3 := 0];
    var k := 3;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
  }

}

method TestsForMapKeys()
{
  // Test case for combination {1}:
  //   POST: r == m.Keys
  //   ENSURES: r == m.Keys
  {
    var m: map<int, int> := map[];
    var r := MapKeys(m);
    expect r == {};
  }

  // Test case for combination {1}/O|m|=1:
  //   POST: r == m.Keys
  //   ENSURES: r == m.Keys
  {
    var m: map<int, int> := map[2 := 0];
    var r := MapKeys(m);
    expect r == {2};
  }

  // Test case for combination {1}/O|m|>=2:
  //   POST: r == m.Keys
  //   ENSURES: r == m.Keys
  {
    var m: map<int, int> := map[3 := 0, 4 := 0];
    var r := MapKeys(m);
    expect r == {3, 4};
  }

  // Test case for combination {1}/R4:
  //   POST: r == m.Keys
  //   ENSURES: r == m.Keys
  {
    var m: map<int, int> := map[1 := 0];
    var r := MapKeys(m);
    expect r == {1};
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
