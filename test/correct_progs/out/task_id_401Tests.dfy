// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_401.dfy
// Method: DeepElementWiseAddition
// Generated: 2026-04-20 09:10:54

method DeepElementWiseAddition(a: seq<seq<int>>, b: seq<seq<int>>) returns (result: seq<seq<int>>)
  requires |a| == |b| 
  requires forall i :: 0 <= i < |a| ==> |a[i]| == |b[i]|
  ensures |result| == |a|
  ensures forall i :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
{
  result := [];
  for i := 0 to |a|
    invariant |result| == i
    invariant forall k :: 0 <= k < i ==> IsElementWiseAddition(a[k], b[k], result[k])
  {
    var subResult := ElementWiseAddition(a[i], b[i]);
    result := result + [subResult];
  }
}

// Auxiliary predicate to check if the third sequence (c) if the pairwise 
// addition of the first two sequences of equal size (a and b).
predicate IsElementWiseAddition(a: seq<int>, b: seq<int>, c: seq<int>)
  requires |a| == |b|
{
  |c| == |a| == |b| && forall i :: 0 <= i < |a| ==> c[i] == a[i] + b[i]
}

// Auxiliary method to compute the element wise addition of two sequences of equal size.
method ElementWiseAddition(a: seq<int>, b: seq<int>) returns (result: seq<int>)
  requires |a| == |b| 
  ensures IsElementWiseAddition(a, b, result)
{
  result := [];
  for i := 0 to |a|
    invariant |result| == i
    invariant forall k :: 0 <= k < i ==> result[k] == a[k] + b[k]
  {
      result := result + [a[i] + b[i]];
  }
}

// Test cases checked statically
method IndexWiseAdditionTest(){
  var s1:seq<seq<int>> :=[[4], [1, 3], [2, 9, 1], []];
  var s2:seq<seq<int>> :=[[2], [6, 7], [1, 1, 8], []];
  var res1 := DeepElementWiseAddition(s1,s2);
  // proof helpers
  assert res1[0] == [6]; // helper
  assert res1[1] == [7, 10]; // helper
  assert res1[2] == [3, 10, 9]; // helper
  assert res1[3] == []; // helper
  // now the full assertion
  assert res1 == [[6], [7, 10], [3, 10, 9], []];
}

method TestsForDeepElementWiseAddition()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   PRE:  forall i: int :: 0 <= i < |a| ==> |a[i]| == |b[i]|
  //   POST: |result| == |a|
  //   POST: forall i: int :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i: int :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  {
    var a: seq<seq<int>> := [];
    var b: seq<seq<int>> := [];
    var result := DeepElementWiseAddition(a, b);
    expect result == [];
  }

  // Test case for combination {1}/Q|a|>=2:
  //   PRE:  |a| == |b|
  //   PRE:  forall i: int :: 0 <= i < |a| ==> |a[i]| == |b[i]|
  //   POST: |result| == |a|
  //   POST: forall i: int :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i: int :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  {
    var a: seq<seq<int>> := [[], []];
    var b: seq<seq<int>> := [[], []];
    var result := DeepElementWiseAddition(a, b);
    expect result == [[], []];
  }

  // Test case for combination {1}/Q|a|=1:
  //   PRE:  |a| == |b|
  //   PRE:  forall i: int :: 0 <= i < |a| ==> |a[i]| == |b[i]|
  //   POST: |result| == |a|
  //   POST: forall i: int :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i: int :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  {
    var a: seq<seq<int>> := [[]];
    var b: seq<seq<int>> := [[]];
    var result := DeepElementWiseAddition(a, b);
    expect result == [[]];
  }

  // Test case for combination {1}/Q|a[0]|>=2:
  //   PRE:  |a| == |b|
  //   PRE:  forall i: int :: 0 <= i < |a| ==> |a[i]| == |b[i]|
  //   POST: |result| == |a|
  //   POST: forall i: int :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i: int :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  {
    var a: seq<seq<int>> := [[0, 37], [38], []];
    var b: seq<seq<int>> := [[0, 39], [48], []];
    var result := DeepElementWiseAddition(a, b);
    expect |result| == |a|;
    expect forall i: int :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i]);
    expect result == [[0, 76], [86], []]; // observed from implementation
  }

}

method TestsForElementWiseAddition()
{
  // Test case for combination {1}/Rel:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  //   POST: |a| == |b|
  //   POST: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i && i < |a| ==> result[i] == a[i] + b[i]
  //   ENSURES: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [9];
    var b: seq<int> := [10];
    var result := ElementWiseAddition(a, b);
    expect result == [19];
  }

  // Test case for combination {1}/Q|a|>=2:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  //   POST: |a| == |b|
  //   POST: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i && i < |a| ==> result[i] == a[i] + b[i]
  //   ENSURES: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [-1, -1];
    var b: seq<int> := [10, 7];
    var result := ElementWiseAddition(a, b);
    expect result == [9, 6];
  }

  // Test case for combination {1}/Q|a|=0:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  //   POST: |a| == |b|
  //   POST: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i && i < |a| ==> result[i] == a[i] + b[i]
  //   ENSURES: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := ElementWiseAddition(a, b);
    expect result == [];
  }

  // Test case for combination {1}/Q|a|>=2/R3:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  //   POST: |a| == |b|
  //   POST: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i && i < |a| ==> result[i] == a[i] + b[i]
  //   ENSURES: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [10];
    var b: seq<int> := [4];
    var result := ElementWiseAddition(a, b);
    expect result == [14];
  }

}

method Main()
{
  TestsForDeepElementWiseAddition();
  print "TestsForDeepElementWiseAddition: all non-failing tests passed!\n";
  TestsForElementWiseAddition();
  print "TestsForElementWiseAddition: all non-failing tests passed!\n";
}
