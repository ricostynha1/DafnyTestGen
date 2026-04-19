// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_578.dfy
// Method: Interleave
// Generated: 2026-04-19 21:58:14

// Interleaves the elements of three sequences (of equal length) into a single sequence.
// The result will have s1[0], s2[0], s3[0], s1[1], s2[1], s3[1], ...
method Interleave<T>(s1: seq<T>, s2: seq<T>, s3: seq<T>) returns (r: seq<T>)
  requires |s1| == |s2| == |s3|
  ensures |r| == 3 * |s1|
  ensures forall i :: 0 <= i < |s1| ==> r[3*i] == s1[i] && r[3*i + 1] == s2[i] && r[3*i + 2] == s3[i]
{
  r := [];
  for i := 0 to |s1|
    invariant |r| == 3 * i
    invariant forall k :: 0 <= k < i ==> r[3*k] == s1[k] && r[3*k + 1] == s2[k] && r[3*k + 2] == s3[k]
  {
    r := r + [s1[i], s2[i], s3[i]];
  }
}

method InterleaveTest(){
  var s1: seq<int> := [1, 2, 3];
  var s2: seq<int> := [10, 20, 30];
  var s3: seq<int> := [100, 200, 300];
  var res1 := Interleave(s1, s2, s3);
  assert res1[3*0] == s1[0];  // Proof helper
  assert res1[3*1] == s1[1]; // helper
  assert res1[3*2] == s1[2]; // helper
  assert res1 == [1, 10, 100, 2, 20, 200, 3, 30, 300];
}

method TestsForInterleave()
{
  // Test case for combination {1}:
  //   PRE:  |s1| == |s2| == |s3|
  //   POST: |r| == 3 * |s1|
  //   POST: forall i: int :: 0 <= i < |s1| ==> r[3 * i] == s1[i] && r[3 * i + 1] == s2[i] && r[3 * i + 2] == s3[i]
  //   ENSURES: |r| == 3 * |s1|
  //   ENSURES: forall i: int :: 0 <= i < |s1| ==> r[3 * i] == s1[i] && r[3 * i + 1] == s2[i] && r[3 * i + 2] == s3[i]
  {
    var s1: seq<int> := [];
    var s2: seq<int> := [];
    var s3: seq<int> := [];
    var r := Interleave<int>(s1, s2, s3);
    expect r == [];
  }

  // Test case for combination {1}/Q|s1|>=2:
  //   PRE:  |s1| == |s2| == |s3|
  //   POST: |r| == 3 * |s1|
  //   POST: forall i: int :: 0 <= i < |s1| ==> r[3 * i] == s1[i] && r[3 * i + 1] == s2[i] && r[3 * i + 2] == s3[i]
  //   ENSURES: |r| == 3 * |s1|
  //   ENSURES: forall i: int :: 0 <= i < |s1| ==> r[3 * i] == s1[i] && r[3 * i + 1] == s2[i] && r[3 * i + 2] == s3[i]
  {
    var s1: seq<int> := [28, 34];
    var s2: seq<int> := [30, 36];
    var s3: seq<int> := [30, 36];
    var r := Interleave<int>(s1, s2, s3);
    expect r == [28, 30, 30, 34, 36, 36];
  }

  // Test case for combination {1}/Q|s1|=1:
  //   PRE:  |s1| == |s2| == |s3|
  //   POST: |r| == 3 * |s1|
  //   POST: forall i: int :: 0 <= i < |s1| ==> r[3 * i] == s1[i] && r[3 * i + 1] == s2[i] && r[3 * i + 2] == s3[i]
  //   ENSURES: |r| == 3 * |s1|
  //   ENSURES: forall i: int :: 0 <= i < |s1| ==> r[3 * i] == s1[i] && r[3 * i + 1] == s2[i] && r[3 * i + 2] == s3[i]
  {
    var s1: seq<int> := [4];
    var s2: seq<int> := [5];
    var s3: seq<int> := [6];
    var r := Interleave<int>(s1, s2, s3);
    expect r == [4, 5, 6];
  }

  // Test case for combination {1}/Rel:
  //   PRE:  |s1| == |s2| == |s3|
  //   POST: |r| == 3 * |s1|
  //   POST: forall i: int :: 0 <= i < |s1| ==> r[3 * i] == s1[i] && r[3 * i + 1] == s2[i] && r[3 * i + 2] == s3[i]
  //   ENSURES: |r| == 3 * |s1|
  //   ENSURES: forall i: int :: 0 <= i < |s1| ==> r[3 * i] == s1[i] && r[3 * i + 1] == s2[i] && r[3 * i + 2] == s3[i]
  {
    var s1: seq<int> := [88];
    var s2: seq<int> := [30];
    var s3: seq<int> := [30];
    var r := Interleave<int>(s1, s2, s3);
    expect r == [88, 30, 30];
  }

}

method Main()
{
  TestsForInterleave();
  print "TestsForInterleave: all non-failing tests passed!\n";
}
