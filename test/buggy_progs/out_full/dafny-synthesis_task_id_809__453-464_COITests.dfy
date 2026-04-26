// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_809__453-464_COI.dfy
// Method: IsSmaller
// Generated: 2026-04-24 10:20:04

// dafny-synthesis_task_id_809.dfy

method IsSmaller(a: seq<int>, b: seq<int>) returns (result: bool)
  requires |a| == |b|
  ensures result <==> forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  ensures !result <==> exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  decreases a, b
{
  result := true;
  for i: int := 0 to |a|
    invariant 0 <= i <= |a|
    invariant result <==> forall k: int {:trigger b[k]} {:trigger a[k]} :: 0 <= k < i ==> a[k] > b[k]
    invariant !result <==> exists k: int {:trigger b[k]} {:trigger a[k]} :: 0 <= k < i && a[k] <= b[k]
  {
    if !(a[i] <= b[i]) {
      result := false;
      break;
    }
  }
}


method TestsForIsSmaller()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   POST Q1: result
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST Q3: !exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [-9];
    var b: seq<int> := [-10];
    var result := IsSmaller(a, b);
    // expect result == true; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  |a| == |b|
  //   POST Q1: !result
  //   POST Q2: 0 <= (|a| - 1)
  //   POST Q3: a[0] <= b[0]
  {
    var a: seq<int> := [-8];
    var b: seq<int> := [-8];
    var result := IsSmaller(a, b);
    // expect result == false; // got true
  }

  // Test case for combination {3}:
  //   PRE:  |a| == |b|
  //   POST Q1: !result
  //   POST Q2: 0 <= (|a| - 1)
  //   POST Q3: a[0] <= b[0]
  //   POST Q4: exists i :: 1 <= i < (|a| - 1) && a[i] <= b[i]
  {
    var a: seq<int> := [-10, -5, -7];
    var b: seq<int> := [-9, -4, -8];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {8}:
  //   PRE:  |a| == |b|
  //   POST Q1: !result
  //   POST Q2: exists i :: 1 <= i < (|a| - 1) && !(a[i] > b[i])
  //   POST Q3: 0 <= (|a| - 1)
  //   POST Q4: a[(|a| - 1)] <= b[(|a| - 1)]
  {
    var a: seq<int> := [-2, -10, 10, 29280];
    var b: seq<int> := [-1, -9, 6, 29281];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {1}/O|a|=0:
  //   PRE:  |a| == |b|
  //   POST Q1: result
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST Q3: !exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := IsSmaller(a, b);
    expect result == true;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  |a| == |b|
  //   POST Q1: result
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST Q3: !exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [-8, -4];
    var b: seq<int> := [-10, -5];
    var result := IsSmaller(a, b);
    // expect result == true; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  |a| == |b|
  //   POST Q1: result
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST Q3: !exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [-8];
    var b: seq<int> := [-9];
    var result := IsSmaller(a, b);
    // expect result == true; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  |a| == |b|
  //   POST Q1: result
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST Q3: !exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [10];
    var b: seq<int> := [-10];
    var result := IsSmaller(a, b);
    // expect result == true; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  |a| == |b|
  //   POST Q1: result
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST Q3: !exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [10];
    var b: seq<int> := [9];
    var result := IsSmaller(a, b);
    // expect result == true; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  |a| == |b|
  //   POST Q1: result
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST Q3: !exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [9];
    var b: seq<int> := [-1];
    var result := IsSmaller(a, b);
    // expect result == true; // got false
  }

}

method Main()
{
  TestsForIsSmaller();
  print "TestsForIsSmaller: all non-failing tests passed!\n";
}
