// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_106.dfy
// Method: AppendArrayToSeq
// Generated: 2026-04-23 20:34:33

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
  //   POST Q1: r == s + a[..]
  {
    var s: seq<int> := [];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [];
  }

  // Test case for combination {1}/O|s|=1:
  //   POST Q1: r == s + a[..]
  {
    var s: seq<int> := [2];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [2];
  }

  // Test case for combination {1}/O|s|>=2:
  //   POST Q1: r == s + a[..]
  {
    var s: seq<int> := [4, 5];
    var a := new int[1] [11];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [4, 5, 11];
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: r == s + a[..]
  {
    var s: seq<int> := [];
    var a := new int[2] [3, 6];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [3, 6];
  }

  // Test case for combination {1}/R5:
  //   POST Q1: r == s + a[..]
  {
    var s: seq<int> := [9];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [9];
  }

  // Test case for combination {1}/R6:
  //   POST Q1: r == s + a[..]
  {
    var s: seq<int> := [7];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [7];
  }

  // Test case for combination {1}/R7:
  //   POST Q1: r == s + a[..]
  {
    var s: seq<int> := [8];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [8];
  }

  // Test case for combination {1}/R8:
  //   POST Q1: r == s + a[..]
  {
    var s: seq<int> := [10];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [10];
  }

  // Test case for combination {1}/R9:
  //   POST Q1: r == s + a[..]
  {
    var s: seq<int> := [12];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [12];
  }

  // Test case for combination {1}/R10:
  //   POST Q1: r == s + a[..]
  {
    var s: seq<int> := [13];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [13];
  }

}

method Main()
{
  TestsForAppendArrayToSeq();
  print "TestsForAppendArrayToSeq: all non-failing tests passed!\n";
}
