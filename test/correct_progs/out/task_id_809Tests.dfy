// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_809.dfy
// Method: IsSmaller
// Generated: 2026-04-20 09:17:53

// Given two sequences of integers of equal length, checks if the 
// elements in the first sequence are smaller than the elements in the
// second sequence.
method IsSmaller(a: seq<int>, b: seq<int>) returns (result: bool)
  requires |a| == |b|
  ensures result <==> forall i :: 0 <= i < |a| ==> a[i] < b[i]
{
  for i := 0 to |a|
    invariant forall k :: 0 <= k < i ==> a[k] < b[k]
  {
    if a[i] >= b[i] {
      return false;
    }
  }
  return true;
}

method TestIsSmaller(){
  var s1: seq<int> := [2, 3, 4];
  var s2: seq<int> := [1, 2, 3];
  var res1 := IsSmaller(s1, s2);
  assert s1[0] > s2[0]; // helper
  assert res1 == false;

  var s3: seq<int> := [3, 4, 5];
  var s4: seq<int> := [4, 5, 6];
  var res2 := IsSmaller(s3, s4);
  assert res2 == true;

  var s5: seq<int> := [1, 2, 4];
  var s6: seq<int> := [2, 3, 4];
  var res3 := IsSmaller(s5, s6);
  assert s5[2] <= s6[2]; // helper
  assert res3 == false;
}

method TestsForIsSmaller()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   POST: result
  //   POST: forall i: int :: 0 <= i < |a| ==> a[i] < b[i]
  //   ENSURES: result <==> forall i: int :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [-10];
    var b: seq<int> := [-9];
    var result := IsSmaller(a, b);
    expect result == true;
  }

  // Test case for combination {2}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: 0 <= (|a| - 1)
  //   POST: !(a[0] < b[0])
  //   ENSURES: result <==> forall i: int :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [-8];
    var b: seq<int> := [-8];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {3}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  //   ENSURES: result <==> forall i: int :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [-2, 10, -1, 9237];
    var b: seq<int> := [3, 8, -10, 9238];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {1}/Q|a|>=2:
  //   PRE:  |a| == |b|
  //   POST: result
  //   POST: forall i: int :: 0 <= i < |a| ==> a[i] < b[i]
  //   ENSURES: result <==> forall i: int :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [-10, -7];
    var b: seq<int> := [-8, -6];
    var result := IsSmaller(a, b);
    expect result == true;
  }

  // Test case for combination {1}/Q|a|=0:
  //   PRE:  |a| == |b|
  //   POST: result
  //   POST: forall i: int :: 0 <= i < |a| ==> a[i] < b[i]
  //   ENSURES: result <==> forall i: int :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := IsSmaller(a, b);
    expect result == true;
  }

}

method Main()
{
  TestsForIsSmaller();
  print "TestsForIsSmaller: all non-failing tests passed!\n";
}
