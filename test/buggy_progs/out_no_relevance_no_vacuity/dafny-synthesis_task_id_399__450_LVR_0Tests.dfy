// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_399__450_LVR_0.dfy
// Method: BitwiseXOR
// Generated: 2026-04-24 23:50:17

// dafny-synthesis_task_id_399.dfy

method BitwiseXOR(a: seq<bv32>, b: seq<bv32>) returns (result: seq<bv32>)
  requires |a| == |b|
  ensures |result| == |a|
  ensures forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  decreases a, b
{
  result := [];
  var i := 0;
  while i < |a|
    invariant 0 <= i <= |a|
    invariant |result| == i
    invariant forall k: int {:trigger b[k]} {:trigger a[k]} {:trigger result[k]} :: 0 <= k < i ==> result[k] == a[k] ^ b[k]
    decreases |a| - i
  {
    result := result + [a[i] ^ b[i]];
    i := i + 0;
  }
}


method TestsForBitwiseXOR()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [];
    var b: seq<bv32> := [];
    var result := BitwiseXOR(a, b);
    expect result == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|=1:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [4];
    var b: seq<bv32> := [3];
    var result := BitwiseXOR(a, b);
    // expect |result| == |a|;
    // expect forall i: int  :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [8, 9];
    var b: seq<bv32> := [18, 19];
    var result := BitwiseXOR(a, b);
    // expect |result| == |a|;
    // expect forall i: int  :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [13];
    var b: seq<bv32> := [11];
    var result := BitwiseXOR(a, b);
    // expect |result| == |a|;
    // expect forall i: int  :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [14];
    var b: seq<bv32> := [10];
    var result := BitwiseXOR(a, b);
    // expect |result| == |a|;
    // expect forall i: int  :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [16];
    var b: seq<bv32> := [12];
    var result := BitwiseXOR(a, b);
    // expect |result| == |a|;
    // expect forall i: int  :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [20];
    var b: seq<bv32> := [15];
    var result := BitwiseXOR(a, b);
    // expect |result| == |a|;
    // expect forall i: int  :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [17];
    var b: seq<bv32> := [22];
    var result := BitwiseXOR(a, b);
    // expect |result| == |a|;
    // expect forall i: int  :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [24];
    var b: seq<bv32> := [21];
    var result := BitwiseXOR(a, b);
    // expect |result| == |a|;
    // expect forall i: int  :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int {:trigger b[i]} {:trigger a[i]} {:trigger result[i]} :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [23];
    var b: seq<bv32> := [26];
    var result := BitwiseXOR(a, b);
    // expect |result| == |a|;
    // expect forall i: int  :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
  }

}

method Main()
{
  TestsForBitwiseXOR();
  print "TestsForBitwiseXOR: all non-failing tests passed!\n";
}
