// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\MapOps.dfy
// Method: MapContains
// Generated: 2026-04-08 00:05:15

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |m| > 0
  //   POST: r == (k in m)
  {
    var m: map<int, int> := map[5 := 0];
    var k := 0;
    var r := MapContains(m, k);
    expect r == false;
  }

  // Test case for combination {1}/Bm=1,k=0:
  //   PRE:  |m| > 0
  //   POST: r == (k in m)
  {
    var m: map<int, int> := map[1 := 0];
    var k := 0;
    var r := MapContains(m, k);
    expect r == false;
  }

  // Test case for combination {1}/Bm=1,k=1:
  //   PRE:  |m| > 0
  //   POST: r == (k in m)
  {
    var m: map<int, int> := map[2 := 0];
    var k := 1;
    var r := MapContains(m, k);
    expect r == false;
  }

  // Test case for combination {1}/Bm=2,k=0:
  //   PRE:  |m| > 0
  //   POST: r == (k in m)
  {
    var m: map<int, int> := map[2 := 0, 5 := 0];
    var k := 0;
    var r := MapContains(m, k);
    expect r == false;
  }

  // Test case for combination {1}/Or=true:
  //   PRE:  |m| > 0
  //   POST: r == (k in m)
  {
    var m: map<int, int> := map[-1 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0];
    var k := 5;
    var r := MapContains(m, k);
    expect r == true;
  }

  // Test case for combination {1}/Or=false:
  //   PRE:  |m| > 0
  //   POST: r == (k in m)
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 1 := 0, 2 := 0, 3 := 0, 5 := 0];
    var k := 7;
    var r := MapContains(m, k);
    expect r == false;
  }

  // Test case for combination {1}:
  //   PRE:  k in m
  //   POST: r == m[k]
  {
    var m: map<int, int> := map[5 := 0];
    var k := 5;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/Bm=1,k=0:
  //   PRE:  k in m
  //   POST: r == m[k]
  {
    var m: map<int, int> := map[0 := 0];
    var k := 0;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/Bm=1,k=1:
  //   PRE:  k in m
  //   POST: r == m[k]
  {
    var m: map<int, int> := map[1 := 0];
    var k := 1;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/Bm=2,k=0:
  //   PRE:  k in m
  //   POST: r == m[k]
  {
    var m: map<int, int> := map[0 := 0, 2 := 0];
    var k := 0;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}/Or>0:
  //   PRE:  k in m
  //   POST: r == m[k]
  {
    var m: map<int, int> := map[0 := 8, 2 := 282];
    var k := 2;
    var r := MapLookup(m, k);
    expect r == 282;
  }

  // Test case for combination {1}/Or<0:
  //   PRE:  k in m
  //   POST: r == m[k]
  {
    var m: map<int, int> := map[0 := 8, 3 := -2998];
    var k := 3;
    var r := MapLookup(m, k);
    expect r == -2998;
  }

  // Test case for combination {1}/Or=0:
  //   PRE:  k in m
  //   POST: r == m[k]
  {
    var m: map<int, int> := map[-1 := 0, 0 := 7];
    var k := -1;
    var r := MapLookup(m, k);
    expect r == 0;
  }

  // Test case for combination {1}:
  //   POST: r == |m|
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 0 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0];
    var r := MapSize(m);
    expect r == 8;
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

  // Test case for combination {1}/Or>=2:
  //   POST: r == |m|
  {
    var m: map<int, int> := map[0 := 0, 2 := 0, 3 := 0, 4 := 0];
    var r := MapSize(m);
    expect r == 4;
  }

  // Test case for combination {1}/Or=1:
  //   POST: r == |m|
  {
    var m: map<int, int> := map[-1 := 0];
    var r := MapSize(m);
    expect r == 1;
  }

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

  // Test case for combination {1}/O|r|>=3:
  //   POST: r == m[k := v]
  //   POST: k in r
  //   POST: r[k] == v
  {
    var m: map<int, int> := map[];
    var k := 4;
    var v := 13;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect k in r;
    expect r[k] == v;
  }

  // Test case for combination {1}/O|r|>=2:
  //   POST: r == m[k := v]
  //   POST: k in r
  //   POST: r[k] == v
  {
    var m: map<int, int> := map[];
    var k := 2;
    var v := 15;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect k in r;
    expect r[k] == v;
  }

  // Test case for combination {1}/O|r|>=1:
  //   POST: r == m[k := v]
  //   POST: k in r
  //   POST: r[k] == v
  {
    var m: map<int, int> := map[];
    var k := 5;
    var v := 16;
    var r := MapUpdate(m, k, v);
    expect r == m[k := v];
    expect k in r;
    expect r[k] == v;
  }

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

  // Test case for combination {1}/O|r|>=3:
  //   POST: r == a + b
  {
    var a: map<int, int> := map[0 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := 0];
    var b: map<int, int> := map[];
    var r := MapMerge(a, b);
    expect r == a + b;
  }

  // Test case for combination {1}/O|r|>=2:
  //   POST: r == a + b
  {
    var a: map<int, int> := map[-2 := 0, 1 := 0, 2 := 0, 3 := 0, 4 := 0, 5 := 0];
    var b: map<int, int> := map[];
    var r := MapMerge(a, b);
    expect r == a + b;
  }

  // Test case for combination {1}/O|r|>=1:
  //   POST: r == a + b
  {
    var a: map<int, int> := map[-1 := 0, 0 := 0];
    var b: map<int, int> := map[-1 := 0, 0 := 0, 2 := 0];
    var r := MapMerge(a, b);
    expect r == a + b;
  }

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

  // Test case for combination {1}/O|r|>=3:
  //   PRE:  k in m
  //   POST: r == m - {k}
  //   POST: k !in r
  {
    var m: map<int, int> := map[-1 := 0, 2 := 0, 3 := 0];
    var k := 3;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect k !in r;
  }

  // Test case for combination {1}/O|r|>=2:
  //   PRE:  k in m
  //   POST: r == m - {k}
  //   POST: k !in r
  {
    var m: map<int, int> := map[-1 := 0, 0 := 0, 5 := 0];
    var k := 0;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect k !in r;
  }

  // Test case for combination {1}/O|r|>=1:
  //   PRE:  k in m
  //   POST: r == m - {k}
  //   POST: k !in r
  {
    var m: map<int, int> := map[-2 := 0, -1 := 0, 1 := 0, 2 := 0];
    var k := 2;
    var r := MapRemoveKey(m, k);
    expect r == m - {k};
    expect k !in r;
  }

  // Test case for combination {1}:
  //   POST: r == m.Keys
  {
    var m: map<int, int> := map[];
    var r := MapKeys(m);
    expect r == {};
  }

  // Test case for combination {1}/Bm=1:
  //   POST: r == m.Keys
  {
    var m: map<int, int> := map[-2 := 0];
    var r := MapKeys(m);
    expect r == {-2};
  }

  // Test case for combination {1}/Bm=2:
  //   POST: r == m.Keys
  {
    var m: map<int, int> := map[4 := 0, 5 := 0];
    var r := MapKeys(m);
    expect r == {4, 5};
  }

  // Test case for combination {1}/Bm=3:
  //   POST: r == m.Keys
  {
    var m: map<int, int> := map[3 := 0, 4 := 0, 5 := 0];
    var r := MapKeys(m);
    expect r == {3, 4, 5};
  }

  // Test case for combination {1}/O|r|>=3:
  //   POST: r == m.Keys
  {
    var m: map<int, int> := map[0 := 0, 5 := 0];
    var r := MapKeys(m);
    expect r == {0, 5};
  }

  // Test case for combination {1}/O|r|>=2:
  //   POST: r == m.Keys
  {
    var m: map<int, int> := map[-2 := 0, 0 := 0, 4 := 0, 5 := 0];
    var r := MapKeys(m);
    expect r == {-2, 0, 4, 5};
  }

  // Test case for combination {1}/O|r|>=1:
  //   POST: r == m.Keys
  {
    var m: map<int, int> := map[-2 := 0, 0 := 0, 4 := 0];
    var r := MapKeys(m);
    expect r == {-2, 0, 4};
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
