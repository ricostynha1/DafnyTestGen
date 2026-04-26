// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_445__431-431_AOI.dfy
// Method: MultiplyElements
// Generated: 2026-04-24 10:16:29

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


method TestsForMultiplyElements()
{
  // Test case for combination {1}/Rel:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [-7];
    var b: seq<int> := [-10];
    var result := MultiplyElements(a, b);
    expect result == [70];
  }

  // Test case for combination {1}/O|a|=0:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := MultiplyElements(a, b);
    expect result == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] * b[i]
  {
    var a: seq<int> := [-10, -1];
    var b: seq<int> := [-9, 2];
    var result := MultiplyElements(a, b);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyCBT_5zhvxzpffxl\runner.cs:line 1240
    // expect result == [90, -2];
  }

}

method Main()
{
  TestsForMultiplyElements();
  print "TestsForMultiplyElements: all non-failing tests passed!\n";
}
