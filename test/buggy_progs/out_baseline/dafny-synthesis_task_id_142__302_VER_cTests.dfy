// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_142__302_VER_c.dfy
// Method: CountIdenticalPositions
// Generated: 2026-04-24 20:01:21

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
    var a: seq<int> := [];
    var b: seq<int> := [];
    var c: seq<int> := [];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [4];
    var b: seq<int> := [2];
    var c: seq<int> := [3];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [8, 9];
    var b: seq<int> := [13, 14];
    var c: seq<int> := [18, 19];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/Ocount>0:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [10];
    var b: seq<int> := [16];
    var c: seq<int> := [12];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [17];
    var b: seq<int> := [21];
    var c: seq<int> := [11];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/R6:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [22];
    var b: seq<int> := [24];
    var c: seq<int> := [15];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/R7:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [25];
    var b: seq<int> := [27];
    var c: seq<int> := [20];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [28];
    var b: seq<int> := [30];
    var c: seq<int> := [23];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/R9:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [26];
    var b: seq<int> := [33];
    var c: seq<int> := [31];
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/R10:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST Q1: count >= 0
  //   POST Q2: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [36];
    var b: seq<int> := [35];
    var c: seq<int> := [29];
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
