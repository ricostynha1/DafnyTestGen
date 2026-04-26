// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_142__302_VER_c.dfy
// Method: CountIdenticalPositions
// Generated: 2026-04-24 23:49:36

// dafny-synthesis_task_id_142.dfy

method CountIdenticalPositions(a: seq<int>, b: seq<int>, c: seq<int>)
    returns (count: int)
  requires |a| == |b| && |b| == |c|
  ensures count >= 0
  ensures count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  decreases a, b, c
{
  var identical := set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && c[i] == c[i];
  count := |identical|;
}


method TestsForCountIdenticalPositions()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [-9];
    var b: seq<int> := [-10];
    var c: seq<int> := [-8];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
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
    var a: seq<int> := [-1, -5];
    var b: seq<int> := [-9, -6];
    var c: seq<int> := [8, -4];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/Ocount>0:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [-7];
    var b: seq<int> := [-8];
    var c: seq<int> := [-9];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [-10];
    var b: seq<int> := [-6];
    var c: seq<int> := [-7];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/R6:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [-6];
    var b: seq<int> := [-9];
    var c: seq<int> := [-8];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/R7:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [-2];
    var b: seq<int> := [-4];
    var c: seq<int> := [-3];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [-10];
    var b: seq<int> := [-7];
    var c: seq<int> := [-10];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/R9:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [-8];
    var b: seq<int> := [-10];
    var c: seq<int> := [-2];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/R10:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [-5];
    var b: seq<int> := [4];
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
