// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\RotateLeft.dfy
// Method: RotateLeft
// Generated: 2026-04-21 22:51:06

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
  // Test case for combination {1}/Rel:
  //   PRE:  a.Length > 0
  //   POST Q1: forall k: int :: 0 <= k < a.Length - 1 ==> a[k] == old(a[k + 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  {
    var a := new int[1] [8];
    RotateLeft(a);
    expect a[..] == [8];
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: forall k: int :: 0 <= k < a.Length - 1 ==> a[k] == old(a[k + 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  {
    var a := new int[2] [8, 7];
    RotateLeft(a);
    expect a[..] == [7, 8];
  }

}

method Main()
{
  TestsForRotateLeft();
  print "TestsForRotateLeft: all non-failing tests passed!\n";
}
