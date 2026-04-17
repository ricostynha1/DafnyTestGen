// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_106.dfy
// Method: AppendArrayToSeq
// Generated: 2026-04-17 13:35:39

// Appends an array to a sequence and returns the resulting sequence.
method AppendArrayToSeq<T>(s: seq<T>, a: array<T>) returns (r: seq<T>)
  ensures r == s + a[..]
{
  r := s;
  for i := 0 to a.Length
    invariant r == s + a[..i]
  {
    r := r + [a[i]];
  }
}

method AppendArrayToSeqTest(){
  var s1: seq<int> := [9, 10];
  var a1 := new int[] [5, 6, 7];
  var res1 :=AppendArrayToSeq(s1, a1);
  assert res1 == [9, 10, 5, 6, 7];

  var s2: seq<int> := [10, 11];
  var a2 := new int[] [6, 7, 8];
  var res2 := AppendArrayToSeq(s2, a2);
  assert res2 == [10, 11, 6, 7, 8];

  var s3: seq<int> := [11, 12];
  var a3 := new int[] [7, 8, 9];
  var res3 := AppendArrayToSeq(s3, a3);
  assert res3 == [11, 12, 7, 8, 9];
}

method TestsForAppendArrayToSeq()
{
  // Test case for combination {1}:
  //   POST: r == s + a[..]
  //   ENSURES: r == s + a[..]
  {
    var s: seq<int> := [];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [];
  }

  // Test case for combination {1}/O|s|=1:
  //   POST: r == s + a[..]
  //   ENSURES: r == s + a[..]
  {
    var s: seq<int> := [2];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [2];
  }

  // Test case for combination {1}/O|s|>=2:
  //   POST: r == s + a[..]
  //   ENSURES: r == s + a[..]
  {
    var s: seq<int> := [4, 5];
    var a := new int[1] [11];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [4, 5, 11];
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST: r == s + a[..]
  //   ENSURES: r == s + a[..]
  {
    var s: seq<int> := [];
    var a := new int[2] [3, 6];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [3, 6];
  }

}

method Main()
{
  TestsForAppendArrayToSeq();
  print "TestsForAppendArrayToSeq: all non-failing tests passed!\n";
}
