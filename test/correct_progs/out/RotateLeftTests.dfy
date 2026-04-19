// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\RotateLeft.dfy
// Method: RotateLeft
// Generated: 2026-04-19 21:31:18

// Rotates left the elements of a non-empty array by one position.
method RotateLeft(a: array<int>) 
 modifies a
 requires a.Length > 0
 ensures forall k :: 0 <= k < a.Length - 1 ==> a[k] == old(a[k + 1])
 ensures a[a.Length - 1] == old(a[0])
{
    var tmp := a[0];
    for i := 0 to a.Length - 1
        invariant forall k :: 0 <= k < i ==> a[k] == old(a[k + 1])
        invariant forall k :: i <= k < a.Length ==> a[k] == old(a[k])
    {
        a[i] := a[i + 1];
    } 
    a[a.Length - 1] := tmp;
}



method TestsForRotateLeft()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: forall k: int :: 0 <= k < a.Length - 1 ==> a[k] == old(a[k + 1])
  //   POST: a[a.Length - 1] == old(a[0])
  //   ENSURES: forall k: int :: 0 <= k < a.Length - 1 ==> a[k] == old(a[k + 1])
  //   ENSURES: a[a.Length - 1] == old(a[0])
  {
    var a := new int[1] [17];
    RotateLeft(a);
    expect a[..] == [17];
  }

  // Test case for combination {1}/Rel:
  //   PRE:  a.Length > 0
  //   POST: forall k: int :: 0 <= k < a.Length - 1 ==> a[k] == old(a[k + 1])
  //   POST: a[a.Length - 1] == old(a[0])
  //   ENSURES: forall k: int :: 0 <= k < a.Length - 1 ==> a[k] == old(a[k + 1])
  //   ENSURES: a[a.Length - 1] == old(a[0])
  {
    var a := new int[1] [16];
    RotateLeft(a);
    expect a[..] == [16];
  }

  // Test case for combination {1}/Oa≠old:
  //   PRE:  a.Length > 0
  //   POST: forall k: int :: 0 <= k < a.Length - 1 ==> a[k] == old(a[k + 1])
  //   POST: a[a.Length - 1] == old(a[0])
  //   ENSURES: forall k: int :: 0 <= k < a.Length - 1 ==> a[k] == old(a[k + 1])
  //   ENSURES: a[a.Length - 1] == old(a[0])
  {
    var a := new int[2] [22, 24];
    RotateLeft(a);
    expect a[..] == [24, 22];
  }

  // Test case for combination {1}/R3:
  //   PRE:  a.Length > 0
  //   POST: forall k: int :: 0 <= k < a.Length - 1 ==> a[k] == old(a[k + 1])
  //   POST: a[a.Length - 1] == old(a[0])
  //   ENSURES: forall k: int :: 0 <= k < a.Length - 1 ==> a[k] == old(a[k + 1])
  //   ENSURES: a[a.Length - 1] == old(a[0])
  {
    var a := new int[1] [18];
    RotateLeft(a);
    expect a[..] == [18];
  }

}

method Main()
{
  TestsForRotateLeft();
  print "TestsForRotateLeft: all non-failing tests passed!\n";
}
