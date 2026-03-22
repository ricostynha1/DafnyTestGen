// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs\in\task_id_106.dfy
// Method: AppendArrayToSeq
// Generated: 2026-03-22 20:26:22

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

method Passing()
{
  // Test case for combination {1}/Bs=0,a=0:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [];
  }

  // Test case for combination {1}/Bs=0,a=1:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [];
    var a := new int[1] [2];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [2];
  }

  // Test case for combination {1}/Bs=0,a=2:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [];
    var a := new int[2] [4, 3];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [4, 3];
  }

  // Test case for combination {1}/Bs=0,a=3:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [];
    var a := new int[3] [5, 4, 6];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [5, 4, 6];
  }

  // Test case for combination {1}/Bs=1,a=0:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [2];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [2];
  }

  // Test case for combination {1}/Bs=1,a=1:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [2];
    var a := new int[1] [3];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [2, 3];
  }

  // Test case for combination {1}/Bs=1,a=2:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [9];
    var a := new int[2] [4, 3];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [9, 4, 3];
  }

  // Test case for combination {1}/Bs=1,a=3:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [14];
    var a := new int[3] [5, 4, 6];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [14, 5, 4, 6];
  }

  // Test case for combination {1}/Bs=2,a=0:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [4, 3];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [4, 3];
  }

  // Test case for combination {1}/Bs=2,a=1:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [4, 3];
    var a := new int[1] [9];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [4, 3, 9];
  }

  // Test case for combination {1}/Bs=2,a=2:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [4, 3];
    var a := new int[2] [6, 5];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [4, 3, 6, 5];
  }

  // Test case for combination {1}/Bs=2,a=3:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [5, 4];
    var a := new int[3] [7, 6, 8];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [5, 4, 7, 6, 8];
  }

  // Test case for combination {1}/Bs=3,a=0:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [5, 4, 6];
    var a := new int[0] [];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [5, 4, 6];
  }

  // Test case for combination {1}/Bs=3,a=1:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [5, 4, 6];
    var a := new int[1] [14];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [5, 4, 6, 14];
  }

  // Test case for combination {1}/Bs=3,a=2:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [5, 4, 6];
    var a := new int[2] [8, 7];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [5, 4, 6, 8, 7];
  }

  // Test case for combination {1}/Bs=3,a=3:
  //   POST: r == s + a[..]
  {
    var s: seq<int> := [5, 4, 6];
    var a := new int[3] [8, 7, 9];
    var r := AppendArrayToSeq<int>(s, a);
    expect r == [5, 4, 6, 8, 7, 9];
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
