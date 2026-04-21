// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_728.dfy
// Method: ElementWiseAddition
// Generated: 2026-04-21 22:56:10

// Adds two lists element wise and returns the resulting list.
method ElementWiseAddition(a: seq<int>, b: seq<int>) returns (result: seq<int>)
  requires |a| == |b|
  ensures |result| == |a|
  ensures forall i :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
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
method AddListsTest(){
  var a1: seq<int>:=[10, 20, 30];
  var a2: seq<int>:= [15, 25, 35];
  var res1 := ElementWiseAddition(a1, a2);
  assert res1 == [25, 45, 65];

  var a3: seq<int>:= [1, 2, 3];
  var a4: seq<int>:= [5, 6, 7];
  var res2 := ElementWiseAddition(a3, a4);
  assert res2 == [6, 8, 10];
}

method TestsForElementWiseAddition()
{
  // Test case for combination {1}/Rel:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  {
    var a: seq<int> := [6];
    var b: seq<int> := [-9];
    var result := ElementWiseAddition(a, b);
    expect result == [-3];
  }

  // Test case for combination {1}/O|a|=0:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := ElementWiseAddition(a, b);
    expect result == [];
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  {
    var a: seq<int> := [-1, -7];
    var b: seq<int> := [-10, 6];
    var result := ElementWiseAddition(a, b);
    expect result == [-11, -1];
  }

}

method Main()
{
  TestsForElementWiseAddition();
  print "TestsForElementWiseAddition: all non-failing tests passed!\n";
}
