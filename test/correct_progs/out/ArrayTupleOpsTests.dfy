// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\ArrayTupleOps.dfy
// Method: FirstPair
// Generated: 2026-04-02 18:11:58

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
  requires a.Length <= 3
  ensures forall i :: 0 <= i < a.Length ==> r >= a[i].0
{
  r := a[0].0;
  for i := 1 to a.Length
    invariant forall j :: 0 <= j < i ==> r >= a[j].0
  {
    if a[i].0 > r { r := a[i].0; }
  }
}


method GeneratedTests_FirstPair()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  {
    var a := new (int, int)[1] [(4, 6)];
    var r := FirstPair(a);
    expect r == a[0];
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  {
    var a := new (int, int)[2] [(6, 4), (5, 3)];
    var r := FirstPair(a);
    expect r == a[0];
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: r == a[0]
  {
    var a := new (int, int)[3] [(7, 4), (9, 6), (8, 5)];
    var r := FirstPair(a);
    expect r == a[0];
  }

}

method GeneratedTests_SeqHead()
{
  // Test case for combination {1}:
  //   PRE:  |s| > 0
  //   POST: r == s[0]
  {
    var s: seq<(int, int)> := [(4, 6)];
    var r := SeqHead(s);
    expect r == s[0];
  }

  // Test case for combination {1}/Bs=2:
  //   PRE:  |s| > 0
  //   POST: r == s[0]
  {
    var s: seq<(int, int)> := [(6, 4), (5, 3)];
    var r := SeqHead(s);
    expect r == s[0];
  }

  // Test case for combination {1}/Bs=3:
  //   PRE:  |s| > 0
  //   POST: r == s[0]
  {
    var s: seq<(int, int)> := [(7, 4), (9, 6), (8, 5)];
    var r := SeqHead(s);
    expect r == s[0];
  }

}

method GeneratedTests_MaxFirst()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   PRE:  a.Length <= 3
  //   POST: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[1] [(-38, 11)];
    var r := MaxFirst(a);
    expect forall i :: 0 <= i < a.Length ==> r >= a[i].0;
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a.Length > 0
  //   PRE:  a.Length <= 3
  //   POST: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[2] [(-38, 9), (-7719, 10)];
    var r := MaxFirst(a);
    expect forall i :: 0 <= i < a.Length ==> r >= a[i].0;
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   PRE:  a.Length <= 3
  //   POST: forall i :: 0 <= i < a.Length ==> r >= a[i].0
  {
    var a := new (int, int)[3] [(-38, 15), (-7719, 16), (-21238, 14)];
    var r := MaxFirst(a);
    expect forall i :: 0 <= i < a.Length ==> r >= a[i].0;
  }

}

method Main()
{
  GeneratedTests_FirstPair();
  print "GeneratedTests_FirstPair: all tests passed!\n";
  GeneratedTests_SeqHead();
  print "GeneratedTests_SeqHead: all tests passed!\n";
  GeneratedTests_MaxFirst();
  print "GeneratedTests_MaxFirst: all tests passed!\n";
}
