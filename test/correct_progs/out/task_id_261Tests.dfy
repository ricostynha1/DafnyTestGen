// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_261.dfy
// Method: ElementWiseDivision
// Generated: 2026-04-16 22:33:38

// Calculates the element-wise division of two sequences of integers of equal length.
method ElementWiseDivision(a: seq<int>, b: seq<int>) returns (result: seq<int>)
  requires |a| == |b|
  requires 0 !in b
  ensures |result| == |a|
  ensures forall i :: 0 <= i < |result| ==> result[i] == a[i] / b[i]
{
  result := [];
  for i := 0 to |a|
    invariant |result| == i
    invariant forall k :: 0 <= k < i ==> result[k] == a[k] / b[k]
  {
    result := result + [a[i] / b[i]];
  }
}


method ElementWiseDivisionTest(){
  var s1: seq<int> := [10, 4, 6, 9];
  var s2: seq<int> := [5, 2, 3, 3];
  var res1 := ElementWiseDivision(s1,s2);
  assert res1 == [2, 2, 2, 3];

  var s3: seq<int> := [12, 6, 8, 16];
  var s4: seq<int> := [6, 3, 4, 4];
  var res2 := ElementWiseDivision(s3,s4);
  assert res2 == [2, 2, 2, 4];

  var s5: seq<int> := [20, 14, 36, 18];
  var s6: seq<int> := [5, 7, 6, 9];
  var res3:=ElementWiseDivision(s5,s6);
  assert res3 == [4, 2, 6, 2];
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   PRE:  0 !in b
  //   POST: |result| == |a|
  //   POST: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] / b[i]
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] / b[i]
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := ElementWiseDivision(a, b);
    expect result == [];
  }

  // Test case for combination {1}/Q|a|>=2:
  //   PRE:  |a| == |b|
  //   PRE:  0 !in b
  //   POST: |result| == |a|
  //   POST: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] / b[i]
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] / b[i]
  {
    var a: seq<int> := [1, 1];
    var b: seq<int> := [1, 1];
    var result := ElementWiseDivision(a, b);
    expect result == [1, 1];
  }

  // Test case for combination {1}/Q|a|=1:
  //   PRE:  |a| == |b|
  //   PRE:  0 !in b
  //   POST: |result| == |a|
  //   POST: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] / b[i]
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] / b[i]
  {
    var a: seq<int> := [0];
    var b: seq<int> := [1];
    var result := ElementWiseDivision(a, b);
    expect result == [0];
  }

  // Test case for combination {1}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   PRE:  0 !in b
  //   POST: |result| == |a|
  //   POST: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] / b[i]
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] / b[i]
  {
    var a: seq<int> := [0, 4, 6];
    var b: seq<int> := [1, 2, 3];
    var result := ElementWiseDivision(a, b);
    expect result == [0, 2, 2];
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
