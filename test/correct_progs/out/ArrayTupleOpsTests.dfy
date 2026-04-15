// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\ArrayTupleOps.dfy
// Method: FirstPair
// Generated: 2026-04-15 11:02:42

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
    expect r == a[0];
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[2] [(6, 4), (5, 3)];
    var r := FirstPair(a);
    expect r == a[0];
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[3] [(7, 4), (9, 6), (8, 5)];
    var r := FirstPair(a);
    expect r == a[0];
  }

  // Test case for combination {1}/Or.0>0:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[4] [(39, 16), (9, 17), (10, 18), (8, 19)];
    var r := FirstPair(a);
    expect r == a[0];
  }

  // Test case for combination {1}:
  //   PRE:  |s| > 0
  //   POST: r == s[0]
  //   ENSURES: r == s[0]
  {
    var s: seq<(int, int)> := [(4, 6)];
    var r := SeqHead(s);
    expect r == s[0];
  }

  // Test case for combination {1}/Bs=2:
  //   PRE:  |s| > 0
  //   POST: r == s[0]
  //   ENSURES: r == s[0]
  {
    var s: seq<(int, int)> := [(6, 4), (5, 3)];
    var r := SeqHead(s);
    expect r == s[0];
  }

  // Test case for combination {1}/Bs=3:
  //   PRE:  |s| > 0
  //   POST: r == s[0]
  //   ENSURES: r == s[0]
  {
    var s: seq<(int, int)> := [(7, 4), (9, 6), (8, 5)];
    var r := SeqHead(s);
    expect r == s[0];
  }

  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: r == a[0].0
  //   POST: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  //   ENSURES: exists i :: 0 <= i < a.Length && r == a[i].0
  //   ENSURES: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[1] [(38, 11)];
    var r := MaxFirst(a);
    expect r == 38;
  }

  // Test case for combination {1}/Q|a|=1:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: r == a[0].0
  //   POST: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  //   ENSURES: exists i :: 0 <= i < a.Length && r == a[i].0
  //   ENSURES: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[3] [(7719, 18), (-38, 19), (-21238, 20)];
    var r := MaxFirst(a);
    expect r == 7719;
  }

  // Test case for combination {1}/Q|a|>=2:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: r == a[0].0
  //   POST: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  //   ENSURES: exists i :: 0 <= i < a.Length && r == a[i].0
  //   ENSURES: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[2] [(7719, 14), (-38, 15)];
    var r := MaxFirst(a);
    expect r == 7719;
  }

  // Test case for combination {1}/Q|a|=0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: r == a[0].0
  //   POST: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  //   ENSURES: exists i :: 0 <= i < a.Length && r == a[i].0
  //   ENSURES: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[4] [(7719, 21), (-38, 22), (-21238, 23), (-2437, 24)];
    var r := MaxFirst(a);
    expect r == 7719;
  }

  // Test case for combination {2}/Q|a|=1:
  //   PRE:  a.Length > 0
  //   POST: exists i :: 1 <= i < (a.Length - 1) && r == a[i].0
  //   POST: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  //   ENSURES: exists i :: 0 <= i < a.Length && r == a[i].0
  //   ENSURES: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[5] [(-38, 35), (-10450, 36), (32285, 37), (-21238, 38), (-2437, 39)];
    var r := MaxFirst(a);
    expect r == 32285;
  }

  // Test case for combination {2}/Q|a|=0:
  //   PRE:  a.Length > 0
  //   POST: exists i :: 1 <= i < (a.Length - 1) && r == a[i].0
  //   POST: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  //   ENSURES: exists i :: 0 <= i < a.Length && r == a[i].0
  //   ENSURES: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[8] [(-38, 26), (-10450, 48), (32285, 49), (-21238, 50), (-2437, 51), (-8855, 53), (-11797, 52), (-8365, 54)];
    var r := MaxFirst(a);
    expect r == 32285;
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
