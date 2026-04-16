// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_95.dfy
// Method: SmallestListLength
// Generated: 2026-04-15 22:38:45

// Finds the length of the shortest list in a non-empty list of lists.
method SmallestListLength<T>(s: seq<seq<T>>) returns (v: nat)
  requires |s| > 0
  ensures forall i :: 0 <= i < |s| ==> v <= |s[i]|
  ensures exists i :: 0 <= i < |s| && v == |s[i]|
{
  v := |s[0]|;
  for i := 1 to |s|
    invariant forall k :: 0 <= k < i ==> v <= |s[k]|
    invariant exists k :: 0 <= k < i && v == |s[k]|
  {
    if |s[i]| < v {
      v := |s[i]|;
    }
  }
}

method SmallestListLengthTest(){
  var s1:seq<seq<int>> := [[1],[1,2]];
  var res1 := SmallestListLength(s1);
  assert |s1[0]| == 1; // helper
  assert |s1[1]| == 2; // helper
  assert res1 == 1;

  var s2:seq<seq<int>> := [[1,2],[1,2,3],[1,2,3,4]];
  var res2:=SmallestListLength(s2);
  assert |s2[0]| == 2; // proof helper
  assert |s2[1]| == 3; // proof helper
  assert |s2[2]| == 4; // proof helper
  assert res2 == 2;

  var s3:seq<seq<int>> := [[3,3,3],[4,4,4,4]];
  var res3:=SmallestListLength(s3);
  assert |s3[0]| == 3; // proof helper
  assert res3 == 3 ;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |s| > 0
  //   POST: forall i :: 0 <= i < |s| ==> v <= |s[i]|
  //   POST: 0 <= (|s| - 1)
  //   POST: v == |s[0]|
  //   ENSURES: forall i :: 0 <= i < |s| ==> v <= |s[i]|
  //   ENSURES: exists i :: 0 <= i < |s| && v == |s[i]|
  {
    var s: seq<seq<int>> := [[]];
    var v := SmallestListLength<int>(s);
    expect v == 0;
  }

  // Test case for combination {2}:
  //   PRE:  |s| > 0
  //   POST: forall i :: 0 <= i < |s| ==> v <= |s[i]|
  //   POST: exists i :: 1 <= i < (|s| - 1) && v == |s[i]|
  //   ENSURES: forall i :: 0 <= i < |s| ==> v <= |s[i]|
  //   ENSURES: exists i :: 0 <= i < |s| && v == |s[i]|
  {
    var s: seq<seq<int>> := [[], [], [], [], [], [], [], []];
    var v := SmallestListLength<int>(s);
    expect v == 0;
  }

  // Test case for combination {1}/Bs=inner>=1:
  //   PRE:  |s| > 0
  //   POST: forall i :: 0 <= i < |s| ==> v <= |s[i]|
  //   POST: 0 <= (|s| - 1)
  //   POST: v == |s[0]|
  //   ENSURES: forall i :: 0 <= i < |s| ==> v <= |s[i]|
  //   ENSURES: exists i :: 0 <= i < |s| && v == |s[i]|
  {
    var s: seq<seq<int>> := [[11], [14]];
    var v := SmallestListLength<int>(s);
    expect v == 1;
  }

  // Test case for combination {1}/Bs=inner>=2:
  //   PRE:  |s| > 0
  //   POST: forall i :: 0 <= i < |s| ==> v <= |s[i]|
  //   POST: 0 <= (|s| - 1)
  //   POST: v == |s[0]|
  //   ENSURES: forall i :: 0 <= i < |s| ==> v <= |s[i]|
  //   ENSURES: exists i :: 0 <= i < |s| && v == |s[i]|
  {
    var s: seq<seq<int>> := [[12, 13], [18, 19], [24, 25]];
    var v := SmallestListLength<int>(s);
    expect v == 2;
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
