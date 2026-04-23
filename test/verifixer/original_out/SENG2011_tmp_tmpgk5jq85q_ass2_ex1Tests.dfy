// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\SENG2011_tmp_tmpgk5jq85q_ass2_ex1.dfy
// Method: StringSwap
// Generated: 2026-04-22 21:37:43

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
  t := t[i := s[j]];
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
    var s: seq<char> := ['B', 'K', ']', 'K', 'C'];
    var i := 3;
    var j := 4;
    var t := StringSwap(s, i, j);
    expect t == ['B', 'K', ']', 'C', 'K'];
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
    var i := 10;
    var j := 10;
    var t := StringSwap(s, i, j);
    expect t == [];
  }

  // Test case for combination P{1}/{2}/Bi=0:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST Q1: multiset(s[..]) == multiset(t[..])
  //   POST Q2: |s| == |t|
  //   POST Q3: |s| == 0
  //   POST Q4: t == s
  {
    var s: seq<char> := [];
    var i := 0;
    var j := 10;
    var t := StringSwap(s, i, j);
    expect t == [];
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
    var j := 10;
    var t := StringSwap(s, i, j);
    expect t == [];
  }

}

method Main()
{
  TestsForStringSwap();
  print "TestsForStringSwap: all non-failing tests passed!\n";
}
