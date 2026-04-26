// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_399.dfy
// Method: BitwiseXOR
// Generated: 2026-04-23 20:37:44

// Performs the bitwise XOR operation on two sequences of bv32 values (with equal length).
method BitwiseXOR(a: seq<bv32>, b: seq<bv32>) returns (result: seq<bv32>)
  requires |a| == |b|
  ensures |result| == |a|
  ensures forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
{
  result := [];
  for i := 0 to |a|
    invariant |result| == i
    invariant forall k :: 0 <= k < i ==> result[k] == a[k] ^ b[k]
  {
    result := result + [a[i] ^ b[i]];
  }
}

// Test cases checked statically.
method BitwiseXORTest(){
  // Typical case
  var res1 := BitwiseXOR([10, 4, 6, 9], [5, 2, 3, 3]);
  assert res1 == [15, 6, 5, 10];

  // Test with identical arguments
  var res2 := BitwiseXOR([11, 5, 7, 10], [11, 5, 7, 10]);
  assert res2 == [0, 0, 0, 0];
}


method TestsForBitwiseXOR()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [];
    var b: seq<bv32> := [];
    var result := BitwiseXOR(a, b);
    expect result == [];
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [4];
    var b: seq<bv32> := [3];
    var result := BitwiseXOR(a, b);
    expect |result| == |a|;
    expect forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
    expect result == [7]; // observed from implementation
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [8, 9];
    var b: seq<bv32> := [18, 19];
    var result := BitwiseXOR(a, b);
    expect |result| == |a|;
    expect forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
    expect result == [26, 26]; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [13];
    var b: seq<bv32> := [11];
    var result := BitwiseXOR(a, b);
    expect |result| == |a|;
    expect forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
    expect result == [6]; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [14];
    var b: seq<bv32> := [10];
    var result := BitwiseXOR(a, b);
    expect |result| == |a|;
    expect forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
    expect result == [4]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [16];
    var b: seq<bv32> := [12];
    var result := BitwiseXOR(a, b);
    expect |result| == |a|;
    expect forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
    expect result == [28]; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [20];
    var b: seq<bv32> := [15];
    var result := BitwiseXOR(a, b);
    expect |result| == |a|;
    expect forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
    expect result == [27]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [22];
    var b: seq<bv32> := [17];
    var result := BitwiseXOR(a, b);
    expect |result| == |a|;
    expect forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
    expect result == [7]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [24];
    var b: seq<bv32> := [21];
    var result := BitwiseXOR(a, b);
    expect |result| == |a|;
    expect forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
    expect result == [13]; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  |a| == |b|
  //   POST Q1: |result| == |a|
  //   POST Q2: forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [26];
    var b: seq<bv32> := [23];
    var result := BitwiseXOR(a, b);
    expect |result| == |a|;
    expect forall i: int :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
    expect result == [13]; // observed from implementation
  }

}

method Main()
{
  TestsForBitwiseXOR();
  print "TestsForBitwiseXOR: all non-failing tests passed!\n";
}
