// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_445__431-431_AOI.dfy
// Method: MultiplyElements
// Generated: 2026-03-25 22:52:10

// dafny-synthesis_task_id_445.dfy

method MultiplyElements(a: seq<int>, b: seq<int>) returns (result: seq<int>)
  requires |a| == |b|
  ensures |result| == |a|
  ensures forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  decreases a, b
{
  result := [];
  var i := 0;
  while i < |a|
    invariant 0 <= i <= |a|
    invariant |result| == i
    invariant forall k: int {:trigger b[k]} {:trigger a[k]} {:trigger result[k]} :: 0 <= k < i ==> result[k] == a[k] * b[k]
    decreases |a| - i
  {
    result := result + [a[i] * b[-i]];
    i := i + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := MultiplyElements(a, b);
    expect result == [];
  }

  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [0];
    var b: seq<int> := [0];
    var result := MultiplyElements(a, b);
    expect result == [0];
  }

}

method Failing()
{
  // Test case for combination {1}/Ba=2,b=2:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [-1, 0];
    var b: seq<int> := [0, 1];
    var result := MultiplyElements(a, b);
    // expect result == [0, 0];
  }

  // Test case for combination {1}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [0, 1, 2];
    var b: seq<int> := [-1, 0, 1];
    var result := MultiplyElements(a, b);
    // expect result == [0, 0, 2];
  }

}

method Main()
{
  Passing();
  Failing();
}
