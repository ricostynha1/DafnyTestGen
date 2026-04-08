// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_743.dfy
// Method: RotateRight
// Generated: 2026-04-08 10:25:07

// Rotates a list to the right by n positions.
method RotateRight(l: seq<int>, n: nat) returns (r: seq<int>)
    ensures |r| == |l|
    ensures forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
{
    r := [];
    for i := 0 to |l|
        invariant |r| == i
        invariant forall k :: 0 <= k < i ==> r[k] == l[(k - n) % |l|]
    {
        r := r + [l[(i - n) % |l|]];
    }
}

// Test cases checked statically.
method RotateRightTest(){
    var res1 := RotateRight([1, 2, 3, 4, 5], 3);
    assert res1 == [3, 4, 5, 1, 2];

    var res2 := RotateRight([1 , 2, 3, 4, 5], 5);
    assert res2 == [1, 2, 3, 4, 5];

    var res3 := RotateRight([1], 100);
    assert res3 == [1];

    var res4 := RotateRight([], 100);
    assert res4 == [];
}

method Passing()
{
  // Test case for combination {1}:
  //   POST: |r| == |l|
  //   POST: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  {
    var l: seq<int> := [];
    var n := 8;
    var r := RotateRight(l, n);
    expect r == [];
  }

  // Test case for combination {1}/Bl=0,n=0:
  //   POST: |r| == |l|
  //   POST: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  {
    var l: seq<int> := [];
    var n := 0;
    var r := RotateRight(l, n);
    expect r == [];
  }

  // Test case for combination {1}/Bl=0,n=1:
  //   POST: |r| == |l|
  //   POST: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  {
    var l: seq<int> := [];
    var n := 1;
    var r := RotateRight(l, n);
    expect r == [];
  }

  // Test case for combination {1}/Bl=1,n=0:
  //   POST: |r| == |l|
  //   POST: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  {
    var l: seq<int> := [2];
    var n := 0;
    var r := RotateRight(l, n);
    expect r == [2];
  }

  // Test case for combination {1}/O|r|>=3:
  //   POST: |r| == |l|
  //   POST: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  {
    var l: seq<int> := [9, 17, 23];
    var n := 0;
    var r := RotateRight(l, n);
    expect r == [9, 17, 23];
  }

  // Test case for combination {1}/O|r|>=2:
  //   POST: |r| == |l|
  //   POST: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  {
    var l: seq<int> := [9, 17];
    var n := 0;
    var r := RotateRight(l, n);
    expect r == [9, 17];
  }

  // Test case for combination {1}/O|r|=1:
  //   POST: |r| == |l|
  //   POST: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  {
    var l: seq<int> := [2];
    var n := 1;
    var r := RotateRight(l, n);
    expect r == [2];
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
