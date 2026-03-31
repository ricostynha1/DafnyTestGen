// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_610.dfy
// Method: RemoveElementAt
// Generated: 2026-03-31 21:30:13

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

method GeneratedTests_RemoveElementAt()
{
  // Test case for combination {1}:
  //   PRE:  0 <= k < s.Length
  //   POST: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[1] [4];
    var k := 0;
    expect 0 <= k < s.Length; // PRE-CHECK
    var v := RemoveElementAt(s, k);
    expect v[..] == s[..k] + s[k + 1..];
  }

  // Test case for combination {1}/Bs=2,k=0:
  //   PRE:  0 <= k < s.Length
  //   POST: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[2] [4, 3];
    var k := 0;
    expect 0 <= k < s.Length; // PRE-CHECK
    var v := RemoveElementAt(s, k);
    expect v[..] == s[..k] + s[k + 1..];
  }

  // Test case for combination {1}/Bs=2,k=1:
  //   PRE:  0 <= k < s.Length
  //   POST: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[2] [4, 3];
    var k := 1;
    expect 0 <= k < s.Length; // PRE-CHECK
    var v := RemoveElementAt(s, k);
    expect v[..] == s[..k] + s[k + 1..];
  }

  // Test case for combination {1}/Bs=3,k=0:
  //   PRE:  0 <= k < s.Length
  //   POST: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[3] [5, 4, 6];
    var k := 0;
    expect 0 <= k < s.Length; // PRE-CHECK
    var v := RemoveElementAt(s, k);
    expect v[..] == s[..k] + s[k + 1..];
  }

}

method Main()
{
  GeneratedTests_RemoveElementAt();
  print "GeneratedTests_RemoveElementAt: all tests passed!\n";
}
