// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\SENG2011_tmp_tmpgk5jq85q_ass2_ex1__451-451_EVR_string.dfy
// Method: StringSwap
// Generated: 2026-04-24 12:36:38

// SENG2011_tmp_tmpgk5jq85q_ass2_ex1.dfy

method StringSwap(s: string, i: nat, j: nat)
    returns (t: string)
  requires i >= 0 && j >= 0 && |s| >= 0
  requires |s| > 0 ==> i < |s| && j < |s|
  ensures multiset(s[..]) == multiset(t[..])
  ensures |s| == |t|
  ensures |s| > 0 ==> forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  ensures |s| > 0 ==> t[i] == s[j] && t[j] == s[i]
  ensures |s| == 0 ==> t == s
  decreases s, i, j
{
  t := s;
  if |s| == 0 {
    return t;
  }
  t := ""[i := s[j]];
  t := t[j := s[i]];
}

method check()
{
  var a: string := "1scow2";
  var b: string := StringSwap(a, 1, 5);
  assert b == "12cows";
  var c: string := "";
  var d: string := StringSwap(c, 1, 2);
  assert c == d;
}


method TestsForStringSwap()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{2}/{3}/Rel:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST Q1: multiset(s[..]) == multiset(t[..])
  //   POST Q2: |s| == |t|
  //   POST Q3: |s| > 0
  //   POST Q4: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST Q5: t[i] == s[j]
  //   POST Q6: t[j] == s[i]
  {
    var s: seq<char> := ['G', ' '];
    var i := 0;
    var j := 1;
    var t := StringSwap(s, i, j);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at Dafny.Sequence`1.Update(ISequence`1 sequence, Int64 index, T t) in C:\cygwin64\tmp\DafnyCBT_letceulbp3e\runner.cs:line 1493
    // runtime error: at Dafny.Sequence`1.Update(ISequence`1 sequence, BigInteger index, T t) in C:\cygwin64\tmp\DafnyCBT_letceulbp3e\runner.cs:line 1500
    // expect t == [' ', 'G'];
  }

  // Test case for combination P{1}/{2}:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST Q1: multiset(s[..]) == multiset(t[..])
  //   POST Q2: |s| == |t|
  //   POST Q3: |s| == 0
  //   POST Q4: t == s
  {
    var s: seq<char> := [];
    var i := 0;
    var j := 0;
    var t := StringSwap(s, i, j);
    expect t == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{2}/{3}/V5:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST Q1: multiset(s[..]) == multiset(t[..])
  //   POST Q2: |s| == |t|
  //   POST Q3: |s| > 0
  //   POST Q4: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST Q5: t[i] == s[j]  // VACUOUS (forced true by other literals for this ins)
  //   POST Q6: t[j] == s[i]
  {
    var s: seq<char> := [' '];
    var i := 0;
    var j := 0;
    var t := StringSwap(s, i, j);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at Dafny.Sequence`1.Update(ISequence`1 sequence, Int64 index, T t) in C:\cygwin64\tmp\DafnyCBT_letceulbp3e\runner.cs:line 1493
    // runtime error: at Dafny.Sequence`1.Update(ISequence`1 sequence, BigInteger index, T t) in C:\cygwin64\tmp\DafnyCBT_letceulbp3e\runner.cs:line 1500
    // expect t == [' '];
  }

  // Test case for combination P{1}/{2}/Bi=1:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST Q1: multiset(s[..]) == multiset(t[..])
  //   POST Q2: |s| == |t|
  //   POST Q3: |s| == 0
  //   POST Q4: t == s
  {
    var s: seq<char> := [];
    var i := 1;
    var j := 0;
    var t := StringSwap(s, i, j);
    expect t == [];
  }

  // Test case for combination P{1}/{2}/Bj=1:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST Q1: multiset(s[..]) == multiset(t[..])
  //   POST Q2: |s| == |t|
  //   POST Q3: |s| == 0
  //   POST Q4: t == s
  {
    var s: seq<char> := [];
    var i := 0;
    var j := 1;
    var t := StringSwap(s, i, j);
    expect t == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{2}/{3}/Bi=1:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST Q1: multiset(s[..]) == multiset(t[..])
  //   POST Q2: |s| == |t|
  //   POST Q3: |s| > 0
  //   POST Q4: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST Q5: t[i] == s[j]
  //   POST Q6: t[j] == s[i]
  {
    var s: seq<char> := ['&', '\U{0027}'];
    var i := 1;
    var j := 0;
    var t := StringSwap(s, i, j);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at Dafny.Sequence`1.Update(ISequence`1 sequence, Int64 index, T t) in C:\cygwin64\tmp\DafnyCBT_letceulbp3e\runner.cs:line 1493
    // runtime error: at Dafny.Sequence`1.Update(ISequence`1 sequence, BigInteger index, T t) in C:\cygwin64\tmp\DafnyCBT_letceulbp3e\runner.cs:line 1500
    // expect t == ['\U{0027}', '&'];
  }

  // Test case for combination P{1}/{2}/Oi>=2:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST Q1: multiset(s[..]) == multiset(t[..])
  //   POST Q2: |s| == |t|
  //   POST Q3: |s| == 0
  //   POST Q4: t == s
  {
    var s: seq<char> := [];
    var i := 2;
    var j := 0;
    var t := StringSwap(s, i, j);
    expect t == [];
  }

  // Test case for combination P{1}/{2}/Oj>=2:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST Q1: multiset(s[..]) == multiset(t[..])
  //   POST Q2: |s| == |t|
  //   POST Q3: |s| == 0
  //   POST Q4: t == s
  {
    var s: seq<char> := [];
    var i := 0;
    var j := 2;
    var t := StringSwap(s, i, j);
    expect t == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{2}/{3}/Oi>=2:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST Q1: multiset(s[..]) == multiset(t[..])
  //   POST Q2: |s| == |t|
  //   POST Q3: |s| > 0
  //   POST Q4: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST Q5: t[i] == s[j]
  //   POST Q6: t[j] == s[i]
  {
    var s: seq<char> := [' ', 'b', 'b'];
    var i := 2;
    var j := 1;
    var t := StringSwap(s, i, j);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at Dafny.Sequence`1.Update(ISequence`1 sequence, Int64 index, T t) in C:\cygwin64\tmp\DafnyCBT_letceulbp3e\runner.cs:line 1493
    // runtime error: at Dafny.Sequence`1.Update(ISequence`1 sequence, BigInteger index, T t) in C:\cygwin64\tmp\DafnyCBT_letceulbp3e\runner.cs:line 1500
    // expect t == [' ', 'b', 'b'];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{2}/{3}/Oj>=2:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST Q1: multiset(s[..]) == multiset(t[..])
  //   POST Q2: |s| == |t|
  //   POST Q3: |s| > 0
  //   POST Q4: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST Q5: t[i] == s[j]
  //   POST Q6: t[j] == s[i]
  {
    var s: seq<char> := [' ', 'b', 'b'];
    var i := 1;
    var j := 2;
    var t := StringSwap(s, i, j);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at Dafny.Sequence`1.Update(ISequence`1 sequence, Int64 index, T t) in C:\cygwin64\tmp\DafnyCBT_letceulbp3e\runner.cs:line 1493
    // runtime error: at Dafny.Sequence`1.Update(ISequence`1 sequence, BigInteger index, T t) in C:\cygwin64\tmp\DafnyCBT_letceulbp3e\runner.cs:line 1500
    // expect t == [' ', 'b', 'b'];
  }

}

method Main()
{
  TestsForStringSwap();
  print "TestsForStringSwap: all non-failing tests passed!\n";
}
