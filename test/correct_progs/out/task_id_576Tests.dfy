// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_576.dfy
// Method: IsSublist
// Generated: 2026-04-17 19:33:29

// Interesting example that previously had a bug for empty lists.
// Checks if a sequence 's' is contained (as a subsequence) in another sequence 't'.
method IsSublist<T(==)>(s: seq<T>, t: seq<T>) returns (result: bool)
  ensures result <==> exists i, j :: 0 <= i <= j <= |t| && s == t[i..j] 
{
    var n := |t| - |s|;
    if n >= 0 {
        for i := 0 to n + 1
            invariant ! exists j, k :: 0 <= j <= k <= |t| && j < i && s == t[j..k]
        {
            if s == t[i.. i+|s|] {
                return true;
            }
        }
    }
    return false;
}


// Test cases checked statically.
method IsSublistTest(){
    var a0: seq<int> := [1, 0, 2, 2];
    var a1: seq<int> := [1, 2];
    var a2: seq<int> :=  [0, 2, 2];
    var a3: seq<int> := [];

    assert a0[0] == a1[0] && a0[1] != a1[1]; // proof helper
    var r1 := IsSublist(a1, a0);
    assert !r1; 

    var r2 := IsSublist(a2, a0);
    assert a2 <= a0[1..]; // proof helper (example)
    assert a2 == a0[1..4]; // proof helper (example)
    assert r2; 

    assert a3 == a0[0..0]; // proof helper (example)
    var r3 := IsSublist(a3, a0);
    assert r3;

    assert a3 == a3[0..0]; // proof helper (example)
    var r4 := IsSublist(a3, a3);
    assert r4;
}

method TestsForIsSublist()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: exists i: int, j: int :: 0 <= i <= j <= |t| && s == t[i .. j]
  //   ENSURES: result <==> exists i: int, j: int :: 0 <= i <= j <= |t| && s == t[i .. j]
  {
    var s: seq<int> := [11];
    var t: seq<int> := [11];
    var result := IsSublist<int>(s, t);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: !exists i: int, j: int :: 0 <= i <= j <= |t| && s == t[i .. j]
  //   ENSURES: result <==> exists i: int, j: int :: 0 <= i <= j <= |t| && s == t[i .. j]
  {
    var s: seq<int> := [2];
    var t: seq<int> := [];
    var result := IsSublist<int>(s, t);
    expect result == false;
  }

  // Test case for combination {1}/O|s|=0:
  //   POST: result
  //   POST: exists i: int, j: int :: 0 <= i <= j <= |t| && s == t[i .. j]
  //   ENSURES: result <==> exists i: int, j: int :: 0 <= i <= j <= |t| && s == t[i .. j]
  {
    var s: seq<int> := [];
    var t: seq<int> := [11];
    var result := IsSublist<int>(s, t);
    expect result == true;
  }

  // Test case for combination {1}/O|s|>=2:
  //   POST: result
  //   POST: exists i: int, j: int :: 0 <= i <= j <= |t| && s == t[i .. j]
  //   ENSURES: result <==> exists i: int, j: int :: 0 <= i <= j <= |t| && s == t[i .. j]
  {
    var s: seq<int> := [10, 9];
    var t: seq<int> := [10, 9];
    var result := IsSublist<int>(s, t);
    expect result == true;
  }

}

method Main()
{
  TestsForIsSublist();
  print "TestsForIsSublist: all non-failing tests passed!\n";
}
