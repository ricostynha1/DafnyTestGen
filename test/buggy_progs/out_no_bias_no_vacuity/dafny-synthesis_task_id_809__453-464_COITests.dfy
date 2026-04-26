// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_809__453-464_COI.dfy
// Method: IsSmaller
// Generated: 2026-04-24 22:21:32

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
  // Test case for combination {1}:
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
  // Test case for combination {2}:
  //   PRE:  |a| == |b|
  //   POST Q1: !result
  //   POST Q2: 0 <= (|a| - 1)
  //   POST Q3: a[0] <= b[0]
  {
    var a: seq<int> := [175];
    var b: seq<int> := [175];
    var result := IsSmaller(a, b);
    // expect result == false; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}:
  //   PRE:  |a| == |b|
  //   POST Q1: !result
  //   POST Q2: 0 <= (|a| - 1)
  //   POST Q3: a[0] <= b[0]
  //   POST Q4: exists i :: 1 <= i < (|a| - 1) && a[i] <= b[i]
  {
    var a: seq<int> := [175, 17869, 26];
    var b: seq<int> := [175, 17869, 26];
    var result := IsSmaller(a, b);
    // expect result == false; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|=1:
  //   PRE:  |a| == |b|
  //   POST Q1: result
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST Q3: !exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [401];
    var b: seq<int> := [400];
    var result := IsSmaller(a, b);
    // expect result == true; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  |a| == |b|
  //   POST Q1: result
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST Q3: !exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [17870, 30056];
    var b: seq<int> := [17869, 30055];
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
    var a: seq<int> := [402];
    var b: seq<int> := [401];
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
    var a: seq<int> := [-399];
    var b: seq<int> := [-400];
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
    var a: seq<int> := [-400];
    var b: seq<int> := [-401];
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
    var a: seq<int> := [-401];
    var b: seq<int> := [-402];
    var result := IsSmaller(a, b);
    // expect result == true; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  |a| == |b|
  //   POST Q1: result
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST Q3: !exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [-402];
    var b: seq<int> := [-403];
    var result := IsSmaller(a, b);
    // expect result == true; // got false
  }

}

method Main()
{
  TestsForIsSmaller();
  print "TestsForIsSmaller: all non-failing tests passed!\n";
}
