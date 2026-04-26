// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\ArrayTupleOps.dfy
// Method: FirstPair
// Generated: 2026-04-23 19:31:24

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
  //   POST Q1: r == a[0]
  {
    var a := new (int, int)[1] [(4, 6)];
    var r := FirstPair(a);
    expect r == (4, 6);
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
  }

  // Test case for combination {1}/R2:
  //   PRE:  a.Length > 0
  //   POST Q1: r == a[0]
  {
    var a := new (int, int)[2] [(5, 10), (6, 11)];
    var r := FirstPair(a);
    expect r == (5, 10);
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
  }

  // Test case for combination {1}/R3:
  //   PRE:  a.Length > 0
  //   POST Q1: r == a[0]
  {
    var a := new (int, int)[3] [(6, 16), (7, 17), (8, 18)];
    var r := FirstPair(a);
    expect r == (6, 16);
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  a.Length > 0
  //   POST Q1: r == a[0]
  {
    var a := new (int, int)[4] [(7, 21), (8, 22), (9, 23), (10, 24)];
    var r := FirstPair(a);
    expect r == (7, 21);
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  a.Length > 0
  //   POST Q1: r == a[0]
  {
    var a := new (int, int)[5] [(8, 28), (9, 29), (10, 30), (11, 31), (12, 32)];
    var r := FirstPair(a);
    expect r == (8, 28);
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  a.Length > 0
  //   POST Q1: r == a[0]
  {
    var a := new (int, int)[6] [(9, 37), (10, 38), (11, 39), (12, 40), (13, 41), (14, 42)];
    var r := FirstPair(a);
    expect r == (9, 37);
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  a.Length > 0
  //   POST Q1: r == a[0]
  {
    var a := new (int, int)[7] [(10, 46), (11, 47), (12, 48), (13, 49), (14, 50), (15, 51), (16, 52)];
    var r := FirstPair(a);
    expect r == (10, 46);
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  a.Length > 0
  //   POST Q1: r == a[0]
  {
    var a := new (int, int)[8] [(11, 55), (12, 56), (13, 57), (14, 58), (15, 59), (16, 60), (18, 61), (17, 62)];
    var r := FirstPair(a);
    expect r == (11, 55);
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
  }

}

method TestsForSeqHead()
{
  // Test case for combination {1}:
  //   PRE:  |s| > 0
  //   POST Q1: r == s[0]
  {
    var s: seq<(int, int)> := [(4, 6)];
    var r := SeqHead(s);
    expect r == (4, 6);
  }

}

method TestsForMaxFirst()
{
  // Test case for combination {1}/Rel:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: r == a[0].0
  //   POST Q3: forall i: int :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[1] [(-1, 12)];
    var r := MaxFirst(a);
    expect r == -1;
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R4:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: r == a[0].0
  //   POST Q3: forall i: int :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[4] [(21620, 21), (-31673, 22), (-25028, 23), (-16832, 24)];
    var r := MaxFirst(a);
    expect r == 21620;
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R3:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: r == a[0].0
  //   POST Q3: forall i: int :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[3] [(21620, 18), (-31673, 19), (-25028, 20)];
    var r := MaxFirst(a);
    expect r == 21620;
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R2:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: r == a[0].0
  //   POST Q3: forall i: int :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[2] [(21620, 14), (-31673, 15)];
    var r := MaxFirst(a);
    expect r == 21620;
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R5:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: r == a[0].0
  //   POST Q3: forall i: int :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[5] [(21620, 25), (-31673, 26), (-25028, 27), (-16832, 28), (-24243, 29)];
    var r := MaxFirst(a);
    expect r == 21620;
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0/R6:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: r == a[0].0
  //   POST Q3: forall i: int :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[6] [(21620, 30), (-31673, 31), (-25028, 32), (-16832, 33), (-24243, 34), (-4883, 35)];
    var r := MaxFirst(a);
    expect r == 21620;
    expect a == _System._ITuple2`2[System.Numerics.BigInteger,System.Numerics.BigInteger][]; // observed from implementation
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
