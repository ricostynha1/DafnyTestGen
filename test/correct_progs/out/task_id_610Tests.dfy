// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_610.dfy
// Method: RemoveElementAt
// Generated: 2026-04-17 13:40:32

// Removes the k-th element from the array s and returns a new array with the result.
method RemoveElementAt(s: array<int>, k: nat) returns (v: array<int>)
    requires 0 <= k < s.Length
    ensures fresh(v)
    ensures v[..] == s[..k] + s[k+1..]
{
    v := new int[s.Length - 1];
    for i := 0 to k
        invariant v[..i] == s[..i]
    {
        v[i] := s[i];
    }
    for i := k to s.Length - 1
        invariant v[..i] == s[..k] + s[k+1..i+1]
    {
        v[i] := s[i + 1];
    }
}

// Test cases checked statically.
method RemoveElementTest(){
    // Remove middle element
    var a1 := new int[] [1, 1, 2, 3, 4, 4, 5, 1];
    var res1 := RemoveElementAt(a1, 3);
    assert res1[..] == [1, 1, 2, 4, 4, 5, 1];

    // Remove first element
    var res2 := RemoveElementAt(a1, 0);
    assert res2[..] == [1, 2, 3, 4, 4, 5, 1];

    // Remove last element
    var res3 := RemoveElementAt(a1, 7);
    assert res3[..] == [1, 1, 2, 3, 4, 4, 5];
}

method TestsForRemoveElementAt()
{
  // Test case for combination {1}:
  //   PRE:  0 <= k < s.Length
  //   POST: v[..] == s[..k] + s[k + 1..]
  //   ENSURES: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[1] [9];
    var k := 0;
    var v := RemoveElementAt(s, k);
    expect v[..] == [];
  }

  // Test case for combination {1}/Bk=1:
  //   PRE:  0 <= k < s.Length
  //   POST: v[..] == s[..k] + s[k + 1..]
  //   ENSURES: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[2] [4, 9];
    var k := 1;
    var v := RemoveElementAt(s, k);
    expect v[..] == [4];
  }

  // Test case for combination {1}/Ok>=2:
  //   PRE:  0 <= k < s.Length
  //   POST: v[..] == s[..k] + s[k + 1..]
  //   ENSURES: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[3] [15, 17, 16];
    var k := 2;
    var v := RemoveElementAt(s, k);
    expect v[..] == [15, 17];
  }

}

method Main()
{
  TestsForRemoveElementAt();
  print "TestsForRemoveElementAt: all non-failing tests passed!\n";
}
