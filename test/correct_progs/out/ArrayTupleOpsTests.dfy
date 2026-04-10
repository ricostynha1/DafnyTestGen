// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\ArrayTupleOps.dfy
// Method: FirstPair
// Generated: 2026-04-08 22:04:14

// Simple methods with array<(int, int)> and seq<(int, int)> parameters

method FirstPair(a: array<(int, int)>) returns (r: (int, int))
  requires a.Length > 0
  ensures r == a[0]
{
  r := a[0];
}

method SeqHead(s: seq<(int, int)>) returns (r: (int, int))
  requires |s| > 0
  ensures r == s[0]
{
  r := s[0];
}

method MaxFirst(a: array<(int, int)>) returns (r: int)
  requires a.Length > 0
  ensures exists i :: 0 <= i < a.Length && r == a[i].0
  ensures forall i :: 0 <= i < a.Length ==> r >= a[i].0
{
  r := a[0].0;
  for i := 1 to a.Length
    invariant exists j :: 0 <= j < i && r == a[j].0
    invariant forall j :: 0 <= j < i ==> r >= a[j].0
  {
    if a[i].0 > r { r := a[i].0; }
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[1] [(4, 6)];
    var r := FirstPair(a);
    expect r == (4, 6);
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[2] [(6, 4), (5, 3)];
    var r := FirstPair(a);
    expect r == (6, 4);
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[3] [(7, 4), (9, 6), (8, 5)];
    var r := FirstPair(a);
    expect r == (7, 4);
  }

  // Test case for combination {1}/Or.0>0:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[4] [(39, 16), (9, 17), (10, 18), (8, 19)];
    var r := FirstPair(a);
    expect r == (39, 16);
  }

  // Test case for combination {1}/Or.0<0:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[5] [(-1, 13), (9, 14), (10, 15), (11, 16), (12, 17)];
    var r := FirstPair(a);
    expect r == (-1, 13);
  }

  // Test case for combination {1}/Or.0=0:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[6] [(0, 10), (35, 11), (36, 12), (37, 13), (38, 14), (39, 15)];
    var r := FirstPair(a);
    expect r == (0, 10);
  }

  // Test case for combination {1}/Or.1>0:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[7] [(12, 39), (13, 49), (14, 52), (15, 53), (16, 54), (17, 55), (18, 56)];
    var r := FirstPair(a);
    expect r == (12, 39);
  }

  // Test case for combination {1}/Or.1<0:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[8] [(13, -1), (14, 57), (15, 58), (16, 59), (17, 60), (18, 61), (20, 62), (19, 63)];
    var r := FirstPair(a);
    expect r == (13, -1);
  }

  // Test case for combination {1}:
  //   PRE:  |s| > 0
  //   POST: r == s[0]
  //   ENSURES: r == s[0]
  {
    var s: seq<(int, int)> := [(4, 6)];
    var r := SeqHead(s);
    expect r == (4, 6);
  }

  // Test case for combination {1}/Bs=2:
  //   PRE:  |s| > 0
  //   POST: r == s[0]
  //   ENSURES: r == s[0]
  {
    var s: seq<(int, int)> := [(6, 4), (5, 3)];
    var r := SeqHead(s);
    expect r == (6, 4);
  }

  // Test case for combination {1}/Bs=3:
  //   PRE:  |s| > 0
  //   POST: r == s[0]
  //   ENSURES: r == s[0]
  {
    var s: seq<(int, int)> := [(7, 4), (9, 6), (8, 5)];
    var r := SeqHead(s);
    expect r == (7, 4);
  }

  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: 0 < a.Length
  //   POST: r == a[0].0
  //   POST: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  //   ENSURES: exists i :: 0 <= i < a.Length && r == a[i].0
  //   ENSURES: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[1] [(38, 11)];
    var r := MaxFirst(a);
    expect r == 38;
  }

  // Test case for combination {2}:
  //   PRE:  a.Length > 0
  //   POST: exists i :: 1 <= i < (a.Length - 1) && r == a[i].0
  //   POST: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  //   ENSURES: exists i :: 0 <= i < a.Length && r == a[i].0
  //   ENSURES: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[4] [(-1, 29), (0, 30), (0, 31), (0, 32)];
    var r := MaxFirst(a);
    expect r == 0;
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a.Length > 0
  //   POST: 0 < a.Length
  //   POST: r == a[0].0
  //   POST: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  //   ENSURES: exists i :: 0 <= i < a.Length && r == a[i].0
  //   ENSURES: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[2] [(7719, 8), (-38, 9)];
    var r := MaxFirst(a);
    expect r == 7719;
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
