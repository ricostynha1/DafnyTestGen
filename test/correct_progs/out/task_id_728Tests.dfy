// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\correct_progs\in\task_id_728.dfy
// Method: ElementWiseAddition
// Generated: 2026-03-23 00:14:57

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

method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := ElementWiseAddition(a, b);
    expect result == [];
  }

  // Test case for combination {1}/Ba=1,b=1:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  {
    var a: seq<int> := [0];
    var b: seq<int> := [0];
    var result := ElementWiseAddition(a, b);
    expect result == [0];
  }

  // Test case for combination {1}/Ba=2,b=2:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  {
    var a: seq<int> := [0, 21239];
    var b: seq<int> := [0, 7720];
    var result := ElementWiseAddition(a, b);
    expect result == [0, 28959];
  }

  // Test case for combination {1}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] + b[i]
  {
    var a: seq<int> := [-10158, -2438, 0];
    var b: seq<int> := [-21240, -21239, 0];
    var result := ElementWiseAddition(a, b);
    expect result == [-31398, -23677, 0];
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
