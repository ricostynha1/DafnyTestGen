// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_142.dfy
// Method: CountIdenticalPositions
// Generated: 2026-04-22 21:32:02

// dafny-synthesis_task_id_142.dfy

method CountIdenticalPositions(a: seq<int>, b: seq<int>, c: seq<int>)
    returns (count: int)
  requires |a| == |b| && |b| == |c|
  ensures count >= 0
  ensures count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  decreases a, b, c
{
  var identical := set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i];
  count := |identical|;
}


method TestsForCountIdenticalPositions()
{
  // Test case for combination {1}/Rel:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [5];
    var b: seq<int> := [5];
    var c: seq<int> := [5];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 1;
  }

  // Test case for combination {1}/O|a|=0:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var c: seq<int> := [];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [-3, 6];
    var b: seq<int> := [-2, -5];
    var c: seq<int> := [2, 7];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/Ocount>0:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [-4];
    var b: seq<int> := [-1];
    var c: seq<int> := [-4];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

}

method Main()
{
  TestsForCountIdenticalPositions();
  print "TestsForCountIdenticalPositions: all non-failing tests passed!\n";
}
