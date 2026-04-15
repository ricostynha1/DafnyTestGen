// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_399.dfy
// Method: BitwiseXOR
// Generated: 2026-04-15 16:38:22

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [];
    var b: seq<bv32> := [];
    var result := BitwiseXOR(a, b);
    expect result == [];
  }

  // Test case for combination {1}/Q|a|>=2:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [6, 7];
    var b: seq<bv32> := [16, 17];
    var result := BitwiseXOR(a, b);
    expect |result| == |a|;
    expect forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
  }

  // Test case for combination {1}/Q|a|=1:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [4];
    var b: seq<bv32> := [3];
    var result := BitwiseXOR(a, b);
    expect |result| == |a|;
    expect forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
  }

  // Test case for combination {1}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: |result| == |a|
  //   POST: forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  //   ENSURES: |result| == |a|
  //   ENSURES: forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i]
  {
    var a: seq<bv32> := [5, 4, 6];
    var b: seq<bv32> := [8, 7, 9];
    var result := BitwiseXOR(a, b);
    expect |result| == |a|;
    expect forall i :: 0 <= i < |result| ==> result[i] == a[i] ^ b[i];
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
