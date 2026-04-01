// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_142.dfy
// Method: CountIdenticalPositions
// Generated: 2026-04-01 22:27:42

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST: count >= 0
  //   POST: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var c: seq<int> := [];
    expect |a| == |b| && |b| == |c|; // PRE-CHECK
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/Ba=2,b=2,c=2:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST: count >= 0
  //   POST: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [4, 3];
    var b: seq<int> := [6, 5];
    var c: seq<int> := [8, 7];
    expect |a| == |b| && |b| == |c|; // PRE-CHECK
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/Ba=1,b=1,c=1:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST: count >= 0
  //   POST: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [2];
    var b: seq<int> := [3];
    var c: seq<int> := [4];
    expect |a| == |b| && |b| == |c|; // PRE-CHECK
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
  }

  // Test case for combination {1}/Ba=3,b=3,c=3:
  //   PRE:  |a| == |b| && |b| == |c|
  //   POST: count >= 0
  //   POST: count == |set i: int {:trigger c[i]} {:trigger b[i]} {:trigger a[i]} | 0 <= i < |a| && a[i] == b[i] && b[i] == c[i]|
  {
    var a: seq<int> := [5, 4, 6];
    var b: seq<int> := [8, 7, 9];
    var c: seq<int> := [11, 10, 12];
    expect |a| == |b| && |b| == |c|; // PRE-CHECK
    var count := CountIdenticalPositions(a, b, c);
    expect count >= 0;
    expect count == 0;
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
