// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_728.dfy
// Method: ElementWiseAddition
// Generated: 2026-04-20 09:15:05

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
  //   POST: |result| == |a|
  //   POST: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  {
    var a: seq<int> := [-1];
    var b: seq<int> := [-2];
    var result := ElementWiseAddition(a, b);
    expect result == [-3];
  }

  // Test case for combination {1}/Q|a|>=2:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  {
    var a: seq<int> := [8, -4];
    var b: seq<int> := [5, 10];
    var result := ElementWiseAddition(a, b);
    expect result == [13, 6];
  }

  // Test case for combination {1}/Q|a|=0:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := ElementWiseAddition(a, b);
    expect result == [];
  }

  // Test case for combination {1}/Q|a|>=2/R3:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  {
    var a: seq<int> := [-1];
    var b: seq<int> := [9];
    var result := ElementWiseAddition(a, b);
    expect result == [8];
  }

}

method Main()
{
  TestsForElementWiseAddition();
  print "TestsForElementWiseAddition: all non-failing tests passed!\n";
}
