// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_273.dfy
// Method: ElementWiseSubtraction
// Generated: 2026-03-21 23:02:13

// Sutracts two sequences of integers element by element.
method ElementWiseSubtraction(a: seq<int>, b: seq<int>) returns (result: seq<int>)
  requires |a| == |b|
  ensures |result| == |a|
  ensures forall i :: 0 <= i < |result| ==> result[i] == a[i] - b[i]
{
  result := [];
  for i := 0 to |a|
    invariant |result| == i
    invariant forall k :: 0 <= k < i ==> result[k] == a[k] - b[k]
  {
    result := result + [a[i] - b[i]];
  }
}

method SubtractSequencesTest(){
  var s1: seq<int> := [10, 4, 5];
  var s2: seq<int> := [2, 5, 18];
  var res1 := ElementWiseSubtraction(s1,s2);
  assert res1 == [8, -1, -13];

  var s3: seq<int> := [11, 2, 3];
  var s4: seq<int> := [24, 45 ,16];
  var res2:=ElementWiseSubtraction(s3,s4);
  assert res2 == [-13, -43, -13];

  var s5: seq<int> := [7, 18, 9];
  var s6: seq<int> := [10, 11, 12];
  var res3:=ElementWiseSubtraction(s5,s6);
  assert res3 == [-3, 7, -3];
}

method Passing()
{
  // Test case for combination {1}/Ba=1,b=1:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] - b[i]
  {
    var a: seq<int> := [7719];
    var b: seq<int> := [1236];
    var result := ElementWiseSubtraction(a, b);
    expect result == [6483];
  }

  // Test case for combination {1}/Ba=2,b=2:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] - b[i]
  {
    var a: seq<int> := [4233, 13089];
    var b: seq<int> := [1796, 10162];
    var result := ElementWiseSubtraction(a, b);
    expect result == [2437, 2927];
  }

  // Test case for combination {1}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] - b[i]
  {
    var a: seq<int> := [4077, 4078, 12444];
    var b: seq<int> := [1045, 2282, 2732];
    var result := ElementWiseSubtraction(a, b);
    expect result == [3032, 1796, 9712];
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
