// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\ArrayTupleOps.dfy
// Method: FirstPair
// Generated: 2026-04-20 08:56:29

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


method TestsForFirstPair()
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

  // Test case for combination {1}/R2:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[2] [(5, 10), (6, 11)];
    var r := FirstPair(a);
    expect r == (5, 10);
  }

  // Test case for combination {1}/R3:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[3] [(6, 16), (7, 17), (8, 18)];
    var r := FirstPair(a);
    expect r == (6, 16);
  }

  // Test case for combination {1}/R4:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  //   ENSURES: r == a[0]
  {
    var a := new (int, int)[4] [(7, 21), (8, 22), (9, 23), (10, 24)];
    var r := FirstPair(a);
    expect r == (7, 21);
  }

}

method TestsForSeqHead()
{
  // Test case for combination {1}:
  //   PRE:  |s| > 0
  //   POST: r == s[0]
  //   ENSURES: r == s[0]
  {
    var s: seq<(int, int)> := [(4, 6)];
    var r := SeqHead(s);
    expect r == (4, 6);
  }

}

method TestsForMaxFirst()
{
  // Test case for combination {2}/Rel:
  //   PRE:  a.Length > 0
  //   POST: exists i :: 1 <= i < (a.Length - 1) && r == a[i].0
  //   POST: forall i: int :: 0 <= i < a.Length ==> r >= a[i].0
  //   ENSURES: exists i: int :: 0 <= i < a.Length && r == a[i].0
  //   ENSURES: forall i: int :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[4] [(-19451, 30), (-2, 31), (0, 32), (-1, 33)];
    var r := MaxFirst(a);
    expect r == 0;
  }

  // Test case for combination {1}/Or<0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: r == a[0].0
  //   POST: forall i: int :: 0 <= i < a.Length ==> r >= a[i].0
  //   ENSURES: exists i: int :: 0 <= i < a.Length && r == a[i].0
  //   ENSURES: forall i: int :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[1] [(-1, 11)];
    var r := MaxFirst(a);
    expect r == -1;
  }

  // Test case for combination {2}/Or<0:
  //   PRE:  a.Length > 0
  //   POST: exists i :: 1 <= i < (a.Length - 1) && r == a[i].0
  //   POST: forall i: int :: 0 <= i < a.Length ==> r >= a[i].0
  //   ENSURES: exists i: int :: 0 <= i < a.Length && r == a[i].0
  //   ENSURES: forall i: int :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[3] [(-4732, 24), (-4732, 25), (-4733, 26)];
    var r := MaxFirst(a);
    expect r == -4732;
  }

}

method Main()
{
  TestsForFirstPair();
  print "TestsForFirstPair: all non-failing tests passed!\n";
  TestsForSeqHead();
  print "TestsForSeqHead: all non-failing tests passed!\n";
  TestsForMaxFirst();
  print "TestsForMaxFirst: all non-failing tests passed!\n";
}
