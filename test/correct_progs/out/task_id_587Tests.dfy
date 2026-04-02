// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_587.dfy
// Method: ArrayToSeq
// Generated: 2026-04-02 18:21:26

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


method GeneratedTests_ArrayToSeq()
{
  // Test case for combination {1}:
  //   POST: s == a[..]
  {
    var a := new int[0] [];
    var s := ArrayToSeq<int>(a);
    expect s == [];
  }

  // Test case for combination {1}/Ba=1:
  //   POST: s == a[..]
  {
    var a := new int[1] [2];
    var s := ArrayToSeq<int>(a);
    expect s == [2];
  }

  // Test case for combination {1}/Ba=2:
  //   POST: s == a[..]
  {
    var a := new int[2] [4, 3];
    var s := ArrayToSeq<int>(a);
    expect s == [4, 3];
  }

  // Test case for combination {1}/Ba=3:
  //   POST: s == a[..]
  {
    var a := new int[3] [5, 4, 6];
    var s := ArrayToSeq<int>(a);
    expect s == [5, 4, 6];
  }

}

method Main()
{
  GeneratedTests_ArrayToSeq();
  print "GeneratedTests_ArrayToSeq: all tests passed!\n";
}
