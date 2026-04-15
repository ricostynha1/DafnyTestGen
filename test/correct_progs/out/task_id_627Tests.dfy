// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_627.dfy
// Method: SmallestMissingNumber
// Generated: 2026-04-15 16:42:22

// Auxiliary predicate that checks if 'v' is the smallest natural number that 
// is not present in a sequence (s) of natural numbers.
predicate IsSmallestMissingNumber(s: seq<nat>, v: nat) {
    v !in s && forall k : nat :: k < v ==> k in s
}

predicate IsSorted(s: seq<nat>) {
    forall i, j :: 0 <= i < j < |s| ==> s[i] <= s[j]
}   

// Given a sorted sequence 's' of natural numbers,
// finds the smallest natural number 'v that is not present in the sequence. 
method SmallestMissingNumber(s: seq<nat>) returns (v: nat)
    requires IsSorted(s)
    ensures IsSmallestMissingNumber(s, v) 
{
    v := 0; 
    for i := 0 to |s|
        invariant IsSmallestMissingNumber(s[..i], v)
    {
        if s[i] == v {
            v := v + 1;
        }
        else if s[i] > v {
            assert s == s[..i] + s[i..]; // helper, ensures: k in s[..i] ==> k in s (to ensure post-cond)
            return;
        }
        assert s[..i+1] == s[..i] + [s[i]]; // helper, ensures: k in s[..i] ==> k in s[..i+1] (to mantain inv)
    }
    assert s == s[..|s|]; // helper, ensures: k in s[..i] ==> k in s (to ensure post-cond)
}


// Test cases checked statically.
method SmallestMissingNumberTest() {
  var a1: seq<int> := [0, 1, 2, 3];
  var out1 := SmallestMissingNumber(a1);
  assert IsSmallestMissingNumber(a1, 4); // proof helper
  assert out1 == 4;

  var a2: seq<int>:= [0, 1, 2, 2, 4, 9];
  var out2 := SmallestMissingNumber(a2);
  assert IsSmallestMissingNumber(a2, 3); // proof helper
  assert out2 == 3;

  var a3: seq<int> := [2, 3, 5, 8, 9];
  var out3 := SmallestMissingNumber(a3);
  assert IsSmallestMissingNumber(a3, 0); // proof helper
  assert out3 == 0;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  IsSorted(s)
  //   POST: IsSmallestMissingNumber(s, v)
  //   ENSURES: IsSmallestMissingNumber(s, v)
  {
    var s: seq<nat> := [];
    var v := SmallestMissingNumber(s);
    expect IsSmallestMissingNumber(s, v);
  }

  // Test case for combination {1}/Q|s|>=2:
  //   PRE:  IsSorted(s)
  //   POST: IsSmallestMissingNumber(s, v)
  //   ENSURES: IsSmallestMissingNumber(s, v)
  {
    var s: seq<nat> := [2438, 4234];
    var v := SmallestMissingNumber(s);
    expect IsSmallestMissingNumber(s, v);
  }

  // Test case for combination {1}/Q|s|=1:
  //   PRE:  IsSorted(s)
  //   POST: IsSmallestMissingNumber(s, v)
  //   ENSURES: IsSmallestMissingNumber(s, v)
  {
    var s: seq<nat> := [1];
    var v := SmallestMissingNumber(s);
    expect IsSmallestMissingNumber(s, v);
  }

  // Test case for combination {1}/Bs=3,s-shape=const:
  //   PRE:  IsSorted(s)
  //   POST: IsSmallestMissingNumber(s, v)
  //   ENSURES: IsSmallestMissingNumber(s, v)
  {
    var s: seq<nat> := [1237, 1237, 1237];
    var v := SmallestMissingNumber(s);
    expect IsSmallestMissingNumber(s, v);
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
