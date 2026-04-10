// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_809.dfy
// Method: IsSmaller
// Generated: 2026-04-10 22:37:24

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

method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   POST: result
  //   POST: forall i :: 0 <= i < |a| ==> a[i] < b[i]
  //   ENSURES: result <==> forall i :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := IsSmaller(a, b);
    expect result == true;
  }

  // Test case for combination {2}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: !(a[0] < b[0])
  //   ENSURES: result <==> forall i :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [10803, 20652];
    var b: seq<int> := [2438, 20653];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {3}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  //   ENSURES: result <==> forall i :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [2436, 0, 10450, -1];
    var b: seq<int> := [2437, -21238, 34, 0];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {4}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  //   ENSURES: result <==> forall i :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [7719, 0];
    var b: seq<int> := [7720, -1];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {1}/Oresult=true:
  //   PRE:  |a| == |b|
  //   POST: result
  //   POST: forall i :: 0 <= i < |a| ==> a[i] < b[i]
  //   ENSURES: result <==> forall i :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [28957];
    var b: seq<int> := [28958];
    var result := IsSmaller(a, b);
    expect result == true;
  }

  // Test case for combination {2}/Oresult=false:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: !(a[0] < b[0])
  //   ENSURES: result <==> forall i :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [33428, 10449, 42779];
    var b: seq<int> := [33427, 10450, 42780];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {3}/Oresult=false:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  //   ENSURES: result <==> forall i :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [8854, 0, 0];
    var b: seq<int> := [8855, -2437, 1];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {4}/Oresult=false:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  //   ENSURES: result <==> forall i :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [11797, 2436, 8854, 0];
    var b: seq<int> := [11798, 2437, 8855, 0];
    var result := IsSmaller(a, b);
    expect result == false;
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
