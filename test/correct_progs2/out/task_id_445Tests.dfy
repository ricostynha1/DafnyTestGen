// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_445.dfy
// Method: ElementWiseMultiplication
// Generated: 2026-03-21 23:08:03

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
  // Test case for combination {1}/Ba=1,b=1:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [-1];
    var b: seq<int> := [-2437];
    var result := ElementWiseMultiplication(a, b);
    expect result == [2437];
  }

  // Test case for combination {1}/Ba=2,b=2:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [-1, 0];
    var b: seq<int> := [2282, 2283];
    var result := ElementWiseMultiplication(a, b);
    expect result == [-2282, 0];
  }

  // Test case for combination {1}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [-2, -1, 0];
    var b: seq<int> := [-1, 0, 1];
    var result := ElementWiseMultiplication(a, b);
    expect result == [2, 0, 0];
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
