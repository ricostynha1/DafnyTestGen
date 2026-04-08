// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_401.dfy
// Method: DeepElementWiseAddition
// Generated: 2026-04-08 00:07:04

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

method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   PRE:  forall i :: 0 <= i < |a| ==> |a[i]| == |b[i]|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  {
    var a: seq<seq<int>> := [];
    var b: seq<seq<int>> := [];
    var result := DeepElementWiseAddition(a, b);
    expect result == [];
  }

  // Test case for combination {1}/Ba=inner>=1,b=inner>=1:
  //   PRE:  |a| == |b|
  //   PRE:  forall i :: 0 <= i < |a| ==> |a[i]| == |b[i]|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  {
    var a: seq<seq<int>> := [[12]];
    var b: seq<seq<int>> := [[11]];
    var result := DeepElementWiseAddition(a, b);
    expect result == [[23]];
    expect |result| == |a|;
    expect forall i :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i]);
  }

  // Test case for combination {1}/Ba=inner>=1,b=inner>=2:
  //   PRE:  |a| == |b|
  //   PRE:  forall i :: 0 <= i < |a| ==> |a[i]| == |b[i]|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  {
    var a: seq<seq<int>> := [[12, 13], [18, 19]];
    var b: seq<seq<int>> := [[23, 24], [25, 26]];
    var result := DeepElementWiseAddition(a, b);
    expect result == [[35, 37], [43, 45]];
    expect |result| == |a|;
    expect forall i :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i]);
  }

  // Test case for combination {1}/Ba=inner>=1,b=3:
  //   PRE:  |a| == |b|
  //   PRE:  forall i :: 0 <= i < |a| ==> |a[i]| == |b[i]|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  {
    var a: seq<seq<int>> := [[11], [12, 20], [14, 26, 34]];
    var b: seq<seq<int>> := [[18], [19, 25], [21, 31, 37]];
    var result := DeepElementWiseAddition(a, b);
    expect result == [[29], [31, 45], [35, 57, 71]];
    expect |result| == |a|;
    expect forall i :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i]);
  }

  // Test case for combination {1}/O|result|>=3:
  //   PRE:  |a| == |b|
  //   PRE:  forall i :: 0 <= i < |a| ==> |a[i]| == |b[i]|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  {
    var a: seq<seq<int>> := [[], [], [], []];
    var b: seq<seq<int>> := [[], [], [], []];
    var result := DeepElementWiseAddition(a, b);
    expect result == [[], [], [], []];
    expect |result| == |a|;
    expect forall i :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i]);
  }

  // Test case for combination {1}/O|result|>=2:
  //   PRE:  |a| == |b|
  //   PRE:  forall i :: 0 <= i < |a| ==> |a[i]| == |b[i]|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i])
  {
    var a: seq<seq<int>> := [[], [], [], [], []];
    var b: seq<seq<int>> := [[], [], [], [], []];
    var result := DeepElementWiseAddition(a, b);
    expect result == [[], [], [], [], []];
    expect |result| == |a|;
    expect forall i :: 0 <= i < |result| ==> IsElementWiseAddition(a[i], b[i], result[i]);
  }

  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := ElementWiseAddition(a, b);
    expect result == [];
    expect IsElementWiseAddition(a, b, result);
  }

  // Test case for combination {1}/Ba=1,b=1:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [2];
    var b: seq<int> := [3];
    var result := ElementWiseAddition(a, b);
    expect result == [5];
    expect IsElementWiseAddition(a, b, result);
  }

  // Test case for combination {1}/Ba=2,b=2:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [4, 3];
    var b: seq<int> := [6, 5];
    var result := ElementWiseAddition(a, b);
    expect result == [10, 8];
    expect IsElementWiseAddition(a, b, result);
  }

  // Test case for combination {1}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [5, 4, 6];
    var b: seq<int> := [8, 7, 9];
    var result := ElementWiseAddition(a, b);
    expect result == [13, 11, 15];
    expect IsElementWiseAddition(a, b, result);
  }

  // Test case for combination {1}/O|result|>=3:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [7, 8, 9, 10];
    var b: seq<int> := [31, 32, 33, 34];
    var result := ElementWiseAddition(a, b);
    expect result == [38, 40, 42, 44];
    expect IsElementWiseAddition(a, b, result);
  }

  // Test case for combination {1}/O|result|>=2:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [8, 9, 10, 11, 12];
    var b: seq<int> := [34, 35, 36, 37, 38];
    var result := ElementWiseAddition(a, b);
    expect result == [42, 44, 46, 48, 50];
    expect IsElementWiseAddition(a, b, result);
  }

  // Test case for combination {1}/O|result|=1:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [10, 11, 12, 13, 14, 15];
    var b: seq<int> := [39, 40, 41, 42, 43, 44];
    var result := ElementWiseAddition(a, b);
    expect result == [49, 51, 53, 55, 57, 59];
    expect IsElementWiseAddition(a, b, result);
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
