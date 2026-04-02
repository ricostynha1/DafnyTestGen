// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\MapOps.dfy
// Method: MapContains
// Generated: 2026-04-02 18:12:14

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


method GeneratedTests_MapContains()
{
  // Test case for combination {1}:
  //   PRE:  |m| > 0
  //   POST: r == (k in m)
  {
    var m: map<int, int> := map[5 := 0];
    var k := 0;
    var r := MapContains(m, k);
    expect r == (k in m);
  }

  // Test case for combination {1}/Bm=1,k=0:
  //   PRE:  |m| > 0
  //   POST: r == (k in m)
  {
    var m: map<int, int> := map[1 := 0];
    var k := 0;
    var r := MapContains(m, k);
    expect r == (k in m);
  }

  // Test case for combination {1}/Bm=1,k=1:
  //   PRE:  |m| > 0
  //   POST: r == (k in m)
  {
    var m: map<int, int> := map[2 := 0];
    var k := 1;
    var r := MapContains(m, k);
    expect r == (k in m);
  }

  // Test case for combination {1}/Bm=2,k=0:
  //   PRE:  |m| > 0
  //   POST: r == (k in m)
  {
    var m: map<int, int> := map[2 := 0, 5 := 0];
    var k := 0;
    var r := MapContains(m, k);
    expect r == (k in m);
  }

}

method GeneratedTests_MapLookup()
{
  // Test case for combination {1}:
  //   PRE:  k in m
  //   POST: r == m[k]
  {
    var m: map<int, int> := map[5 := 0];
    var k := 5;
    var r := MapLookup(m, k);
    expect r == m[k];
  }

  // Test case for combination {1}/Bm=1,k=0:
  //   PRE:  k in m
  //   POST: r == m[k]
  {
    var m: map<int, int> := map[0 := 0];
    var k := 0;
    var r := MapLookup(m, k);
    expect r == m[k];
  }

  // Test case for combination {1}/Bm=1,k=1:
  //   PRE:  k in m
  //   POST: r == m[k]
  {
    var m: map<int, int> := map[1 := 0];
    var k := 1;
    var r := MapLookup(m, k);
    expect r == m[k];
  }

  // Test case for combination {1}/Bm=2,k=0:
  //   PRE:  k in m
  //   POST: r == m[k]
  {
    var m: map<int, int> := map[0 := 0, 2 := 0];
    var k := 0;
    var r := MapLookup(m, k);
    expect r == m[k];
  }

}

method GeneratedTests_MapSize()
{
  // Test case for combination {1}:
  //   POST: r == |m|
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 0 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0];
    var r := MapSize(m);
    expect r == |m|;
  }

  // Test case for combination {1}/Bm=0:
  //   POST: r == |m|
  {
    var m: map<int, int> := map[];
    var r := MapSize(m);
    expect r == 0;
  }

  // Test case for combination {1}/Bm=1:
  //   POST: r == |m|
  {
    var m: map<int, int> := map[1 := 0];
    var r := MapSize(m);
    expect r == 1;
  }

  // Test case for combination {1}/Bm=2:
  //   POST: r == |m|
  {
    var m: map<int, int> := map[0 := 0, 1 := 0];
    var r := MapSize(m);
    expect r == 2;
  }

}

method GeneratedTests_MapUpdate()
{
  // Test case for combination {1}:
  //   POST: r == m[k := v]
  //   POST: k in r
  //   POST: r[k] == v
  {
    var m: map<int, int> := map[];
    var k := 5;
    var v := 0;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect k in r;
    expect r[k] == v;
  }

  // Test case for combination {1}/Bm=0,k=0,v=0:
  //   POST: r == m[k := v]
  //   POST: k in r
  //   POST: r[k] == v
  {
    var m: map<int, int> := map[];
    var k := 0;
    var v := 0;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect k in r;
    expect r[k] == v;
  }

  // Test case for combination {1}/Bm=0,k=0,v=1:
  //   POST: r == m[k := v]
  //   POST: k in r
  //   POST: r[k] == v
  {
    var m: map<int, int> := map[];
    var k := 0;
    var v := 1;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect k in r;
    expect r[k] == v;
  }

  // Test case for combination {1}/Bm=0,k=1,v=0:
  //   POST: r == m[k := v]
  //   POST: k in r
  //   POST: r[k] == v
  {
    var m: map<int, int> := map[];
    var k := 1;
    var v := 0;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect k in r;
    expect r[k] == v;
  }

}

method GeneratedTests_MapMerge()
{
  // Test case for combination {1}:
  //   POST: r == a + b
  {
    var a: map<int, int> := map[];
    var b: map<int, int> := map[];
    var r := MapMerge(a, b);
    expect r == a + b;
  }

  // Test case for combination {1}/Ba=0,b=1:
  //   POST: r == a + b
  {
    var a: map<int, int> := map[];
    var b: map<int, int> := map[1 := 0];
    var r := MapMerge(a, b);
    expect r == a + b;
  }

  // Test case for combination {1}/Ba=0,b=2:
  //   POST: r == a + b
  {
    var a: map<int, int> := map[];
    var b: map<int, int> := map[1 := 0, 4 := 0];
    var r := MapMerge(a, b);
    expect r == a + b;
  }

  // Test case for combination {1}/Ba=0,b=3:
  //   POST: r == a + b
  {
    var a: map<int, int> := map[];
    var b: map<int, int> := map[1 := 0, 2 := 0, 4 := 0];
    var r := MapMerge(a, b);
    expect r == a + b;
  }

}

method GeneratedTests_MapRemoveKey()
{
  // Test case for combination {1}:
  //   PRE:  k in m
  //   POST: r == m - {k}
  //   POST: k !in r
  {
    var m: map<int, int> := map[-1 := 0];
    var k := -1;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect k !in r;
  }

  // Test case for combination {1}/Bm=1,k=0:
  //   PRE:  k in m
  //   POST: r == m - {k}
  //   POST: k !in r
  {
    var m: map<int, int> := map[0 := 0];
    var k := 0;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect k !in r;
  }

  // Test case for combination {1}/Bm=1,k=1:
  //   PRE:  k in m
  //   POST: r == m - {k}
  //   POST: k !in r
  {
    var m: map<int, int> := map[1 := 0];
    var k := 1;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect k !in r;
  }

  // Test case for combination {1}/Bm=2,k=0:
  //   PRE:  k in m
  //   POST: r == m - {k}
  //   POST: k !in r
  {
    var m: map<int, int> := map[0 := 0, 2 := 0];
    var k := 0;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect k !in r;
  }

}

method GeneratedTests_MapKeys()
{
  // Test case for combination {1}:
  //   POST: r == m.Keys
  {
    var m: map<int, int> := map[];
    var r := MapKeys(m);
    expect r == m.Keys;
  }

  // Test case for combination {1}/Bm=1:
  //   POST: r == m.Keys
  {
    var m: map<int, int> := map[-2 := 0];
    var r := MapKeys(m);
    expect r == m.Keys;
  }

  // Test case for combination {1}/Bm=2:
  //   POST: r == m.Keys
  {
    var m: map<int, int> := map[4 := 0, 5 := 0];
    var r := MapKeys(m);
    expect r == m.Keys;
  }

  // Test case for combination {1}/Bm=3:
  //   POST: r == m.Keys
  {
    var m: map<int, int> := map[3 := 0, 4 := 0, 5 := 0];
    var r := MapKeys(m);
    expect r == m.Keys;
  }

}

method Main()
{
  GeneratedTests_MapContains();
  print "GeneratedTests_MapContains: all tests passed!\n";
  GeneratedTests_MapLookup();
  print "GeneratedTests_MapLookup: all tests passed!\n";
  GeneratedTests_MapSize();
  print "GeneratedTests_MapSize: all tests passed!\n";
  GeneratedTests_MapUpdate();
  print "GeneratedTests_MapUpdate: all tests passed!\n";
  GeneratedTests_MapMerge();
  print "GeneratedTests_MapMerge: all tests passed!\n";
  GeneratedTests_MapRemoveKey();
  print "GeneratedTests_MapRemoveKey: all tests passed!\n";
  GeneratedTests_MapKeys();
  print "GeneratedTests_MapKeys: all tests passed!\n";
}
