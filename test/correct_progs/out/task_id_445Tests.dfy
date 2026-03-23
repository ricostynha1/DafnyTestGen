// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\correct_progs\in\task_id_445.dfy
// Method: ElementWiseMultiplication
// Generated: 2026-03-23 00:08:33

// Multiplies the elements of two sequences element-wise.
method ElementWiseMultiplication(a: seq<int>, b: seq<int>) returns (result: seq<int>)
  requires |a| == |b|
  ensures |result| == |a|
  ensures forall i :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
{
  result := [];
  for i := 0 to |a|
    invariant |result| == i
    invariant forall k :: 0 <= k < i ==> result[k] == a[k] * b[k]
  {
    result := result + [a[i] * b[i]];
  }
}

method MultiplyElementsTest(){
  var s1:seq<int> :=[1, 3,4, 5, 2, 9, 1, 10];
  var s2:seq<int> :=[6, 7, 3, 9, 1, 1, 7, 3];
  var res1 := ElementWiseMultiplication(s1,s2);
  assert res1 == [6, 21, 12, 45, 2, 9, 7, 30];
}



method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := ElementWiseMultiplication(a, b);
    expect result == [];
  }

  // Test case for combination {1}/Ba=1,b=1:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [0];
    var b: seq<int> := [0];
    var result := ElementWiseMultiplication(a, b);
    expect result == [0];
  }

  // Test case for combination {1}/Ba=2,b=2:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [-1, 0];
    var b: seq<int> := [0, 1];
    var result := ElementWiseMultiplication(a, b);
    expect result == [0, 0];
  }

  // Test case for combination {1}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [0, 1, 2];
    var b: seq<int> := [-1, 0, 1];
    var result := ElementWiseMultiplication(a, b);
    expect result == [0, 0, 2];
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
