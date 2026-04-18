// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_623.dfy
// Method: PowerOfListElements
// Generated: 2026-04-18 23:48:07

// Returns a list of the elements of the input list raised to the power of n (>=0).
method PowerOfListElements(l: seq<int>, n: nat) returns (result: seq<int>)
  requires n >= 0
  ensures |result| == |l|
  ensures forall i :: 0 <= i < |l| ==> result[i] == Power(l[i], n)
{
  result := [];
  for i := 0 to |l|
    invariant |result| == i
    invariant forall k :: 0 <= k < i ==> result[k] == Power(l[k], n)
  {
    result := result + [Power(l[i], n)];
  }
}

// Returns the base raised to the power of the exponent.
function Power(base: int, exponent: nat): int {
  if exponent == 0 then 1
  else base * Power(base, exponent-1)
}

method PowerOfListElementsTest(){
  var s1: seq<int> := [1, 2, 3, 4];
  var res1:=PowerOfListElements(s1, 2);
  assert res1 == [1, 4, 9, 16];

  var s2: seq<int> := [10, 20, 30];
  var res2:=PowerOfListElements(s2, 3);
  assert res2 == [1000, 8000, 27000];
}


method TestsForPowerOfListElements()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: |result| == |l|
  //   POST: forall i: int :: 0 <= i < |l| ==> result[i] == Power(l[i], n)
  //   ENSURES: |result| == |l|
  //   ENSURES: forall i: int :: 0 <= i < |l| ==> result[i] == Power(l[i], n)
  {
    var l: seq<int> := [2];
    var n := 2;
    var result := PowerOfListElements(l, n);
    expect |result| == |l|;
    expect forall i: int :: 0 <= i < |l| ==> result[i] == Power(l[i], n);
    expect result == [4]; // observed from implementation
  }

  // Test case for combination {1}/Q|l|>=2:
  //   PRE:  n >= 0
  //   POST: |result| == |l|
  //   POST: forall i: int :: 0 <= i < |l| ==> result[i] == Power(l[i], n)
  //   ENSURES: |result| == |l|
  //   ENSURES: forall i: int :: 0 <= i < |l| ==> result[i] == Power(l[i], n)
  {
    var l: seq<int> := [-2, -4];
    var n := 3;
    var result := PowerOfListElements(l, n);
    expect |result| == |l|;
    expect forall i: int :: 0 <= i < |l| ==> result[i] == Power(l[i], n);
    expect result == [-8, -64]; // observed from implementation
  }

  // Test case for combination {1}/Q|l|=0:
  //   PRE:  n >= 0
  //   POST: |result| == |l|
  //   POST: forall i: int :: 0 <= i < |l| ==> result[i] == Power(l[i], n)
  //   ENSURES: |result| == |l|
  //   ENSURES: forall i: int :: 0 <= i < |l| ==> result[i] == Power(l[i], n)
  {
    var l: seq<int> := [];
    var n := 2;
    var result := PowerOfListElements(l, n);
    expect result == [];
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  n >= 0
  //   POST: |result| == |l|
  //   POST: forall i: int :: 0 <= i < |l| ==> result[i] == Power(l[i], n)
  //   ENSURES: |result| == |l|
  //   ENSURES: forall i: int :: 0 <= i < |l| ==> result[i] == Power(l[i], n)
  {
    var l: seq<int> := [25];
    var n := 0;
    var result := PowerOfListElements(l, n);
    expect result == [1];
  }

}

method Main()
{
  TestsForPowerOfListElements();
  print "TestsForPowerOfListElements: all non-failing tests passed!\n";
}
