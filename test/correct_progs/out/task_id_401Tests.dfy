// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_401.dfy
// Method: ElementWiseAddition
// Generated: 2026-03-31 21:29:52

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

method GeneratedTests_ElementWiseAddition()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [0];
    var b: seq<int> := [0];
    expect |a| == |b|; // PRE-CHECK
    var result := ElementWiseAddition(a, b);
    expect result == [0];
  }

  // Test case for combination {1}/Ba=0,b=0:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    expect |a| == |b|; // PRE-CHECK
    var result := ElementWiseAddition(a, b);
    expect result == [];
  }

  // Test case for combination {1}/Ba=2,b=2:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [0, 21239];
    var b: seq<int> := [0, 7720];
    expect |a| == |b|; // PRE-CHECK
    var result := ElementWiseAddition(a, b);
    expect result == [0, 28959];
  }

  // Test case for combination {1}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: IsElementWiseAddition(a, b, result)
  {
    var a: seq<int> := [-10158, -2438, 0];
    var b: seq<int> := [-21240, -21239, 0];
    expect |a| == |b|; // PRE-CHECK
    var result := ElementWiseAddition(a, b);
    expect result == [-31398, -23677, 0];
  }

}

method Main()
{
  GeneratedTests_ElementWiseAddition();
  print "GeneratedTests_ElementWiseAddition: all tests passed!\n";
}
