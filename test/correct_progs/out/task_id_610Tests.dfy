// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_610.dfy
// Method: RemoveElementAt
// Generated: 2026-04-23 20:42:52

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
  // Test case for combination {1}/Rel:
  //   PRE:  0 <= k < s.Length
  //   POST Q2: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[3] [-1, -10, -4];
    var k := 2;
    var v := RemoveElementAt(s, k);
    expect v[..] == [-1, -10];
  }

  // Test case for combination {1}/Bk=0:
  //   PRE:  0 <= k < s.Length
  //   POST Q2: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[1] [-1];
    var k := 0;
    var v := RemoveElementAt(s, k);
    expect v[..] == [];
  }

  // Test case for combination {1}/Bk=1:
  //   PRE:  0 <= k < s.Length
  //   POST Q2: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[2] [9, -10];
    var k := 1;
    var v := RemoveElementAt(s, k);
    expect v[..] == [9];
  }

  // Test case for combination {1}/R3:
  //   PRE:  0 <= k < s.Length
  //   POST Q2: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[3] [-10, -1, 10];
    var k := 2;
    var v := RemoveElementAt(s, k);
    expect v[..] == [-10, -1];
  }

  // Test case for combination {1}/R4:
  //   PRE:  0 <= k < s.Length
  //   POST Q2: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[4] [-9, -2, -10, 22];
    var k := 2;
    var v := RemoveElementAt(s, k);
    expect v[..] == [-9, -2, 22];
  }

  // Test case for combination {1}/R5:
  //   PRE:  0 <= k < s.Length
  //   POST Q2: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[3] [-8, -9, -1];
    var k := 2;
    var v := RemoveElementAt(s, k);
    expect v[..] == [-8, -9];
  }

  // Test case for combination {1}/R6:
  //   PRE:  0 <= k < s.Length
  //   POST Q2: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[3] [-10, 10, -9];
    var k := 2;
    var v := RemoveElementAt(s, k);
    expect v[..] == [-10, 10];
  }

  // Test case for combination {1}/R7:
  //   PRE:  0 <= k < s.Length
  //   POST Q2: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[3] [-2, 8, 3];
    var k := 2;
    var v := RemoveElementAt(s, k);
    expect v[..] == [-2, 8];
  }

  // Test case for combination {1}/R8:
  //   PRE:  0 <= k < s.Length
  //   POST Q2: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[3] [-10, 9, 4];
    var k := 2;
    var v := RemoveElementAt(s, k);
    expect v[..] == [-10, 9];
  }

  // Test case for combination {1}/R9:
  //   PRE:  0 <= k < s.Length
  //   POST Q2: v[..] == s[..k] + s[k + 1..]
  {
    var s := new int[3] [-7, -3, -8];
    var k := 2;
    var v := RemoveElementAt(s, k);
    expect v[..] == [-7, -3];
  }

}

method Main()
{
  TestsForRemoveElementAt();
  print "TestsForRemoveElementAt: all non-failing tests passed!\n";
}
