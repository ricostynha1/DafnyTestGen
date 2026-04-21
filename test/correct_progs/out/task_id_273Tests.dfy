// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_273.dfy
// Method: ElementWiseSubtraction
// Generated: 2026-04-21 22:52:40

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

method TestsForElementWiseSubtraction()
{
  // Test case for combination {1}/Rel:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] - b[i]
  {
    var a: seq<int> := [-7];
    var b: seq<int> := [-10];
    var result := ElementWiseSubtraction(a, b);
    expect result == [3];
  }

  // Test case for combination {1}/O|a|=0:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] - b[i]
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := ElementWiseSubtraction(a, b);
    expect result == [];
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] - b[i]
  {
    var a: seq<int> := [-1, -9];
    var b: seq<int> := [9, -5];
    var result := ElementWiseSubtraction(a, b);
    expect result == [-10, -4];
  }

}

method Main()
{
  TestsForElementWiseSubtraction();
  print "TestsForElementWiseSubtraction: all non-failing tests passed!\n";
}
