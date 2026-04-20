// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_743.dfy
// Method: RotateRight
// Generated: 2026-04-20 15:01:46

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

method TestsForRotateRight()
{
  // Test case for combination {1}/Rel:
  //   POST: |r| == |l|
  //   POST: forall i: int :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i: int :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  {
    var l: seq<int> := [-10];
    var n := 2;
    var r := RotateRight(l, n);
    expect r == [-10];
  }

  // Test case for combination {1}/Q|l|>=2:
  //   POST: |r| == |l|
  //   POST: forall i: int :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i: int :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  {
    var l: seq<int> := [-2, -3, -1, 21];
    var n := 10;
    var r := RotateRight(l, n);
    expect r == [-1, 21, -2, -3];
  }

  // Test case for combination {1}/Q|l|=0:
  //   POST: |r| == |l|
  //   POST: forall i: int :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i: int :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  {
    var l: seq<int> := [];
    var n := 10;
    var r := RotateRight(l, n);
    expect r == [];
  }

  // Test case for combination {1}/Bn=0:
  //   POST: |r| == |l|
  //   POST: forall i: int :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i: int :: 0 <= i < |l| ==> r[i] == l[(i - n) % |l|]
  {
    var l: seq<int> := [-10];
    var n := 0;
    var r := RotateRight(l, n);
    expect r == [-10];
  }

}

method Main()
{
  TestsForRotateRight();
  print "TestsForRotateRight: all non-failing tests passed!\n";
}
