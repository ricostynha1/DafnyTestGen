// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_587.dfy
// Method: ArrayToSeq
// Generated: 2026-04-20 14:59:57

// Converts an array to a sequence
method ArrayToSeq<T>(a: array<T>) returns (s: seq<T>)
  ensures s == a[..]
{
  s := [];
  for i := 0 to a.Length
    invariant s == a[..i]
  {
    s := s + [a[i]];
  }
}

method ArrayToSeqTest(){
  var a1 := new int[] [5, 10, 7, 4, 15, 3];
  var res1 := ArrayToSeq(a1);
  assert res1 == [5, 10, 7, 4, 15, 3];
}


method TestsForArrayToSeq()
{
  // Test case for combination {1}:
  //   POST: s == a[..]
  //   ENSURES: s == a[..]
  {
    var a := new int[0] [];
    var s := ArrayToSeq<int>(a);
    expect s == [];
  }

  // Test case for combination {1}/O|a|=1:
  //   POST: s == a[..]
  //   ENSURES: s == a[..]
  {
    var a := new int[1] [2];
    var s := ArrayToSeq<int>(a);
    expect s == [2];
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST: s == a[..]
  //   ENSURES: s == a[..]
  {
    var a := new int[2] [3, 4];
    var s := ArrayToSeq<int>(a);
    expect s == [3, 4];
  }

  // Test case for combination {1}/R4:
  //   POST: s == a[..]
  //   ENSURES: s == a[..]
  {
    var a := new int[1] [6];
    var s := ArrayToSeq<int>(a);
    expect s == [6];
  }

}

method Main()
{
  TestsForArrayToSeq();
  print "TestsForArrayToSeq: all non-failing tests passed!\n";
}
