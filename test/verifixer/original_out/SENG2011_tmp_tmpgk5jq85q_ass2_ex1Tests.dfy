// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\SENG2011_tmp_tmpgk5jq85q_ass2_ex1.dfy
// Method: StringSwap
// Generated: 2026-04-08 19:18:09

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


method Passing()
{
  // Test case for combination P{2}/{25}:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST: multiset(s[..]) == multiset(t[..])
  //   POST: |s| == |t|
  //   POST: |s| > 0
  //   POST: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST: |s| > 0
  //   POST: t[i] == s[j]
  //   POST: t[j] == s[i]
  //   POST: !(|s| == 0)
  //   POST: t == s
  //   ENSURES: multiset(s[..]) == multiset(t[..])
  //   ENSURES: |s| == |t|
  //   ENSURES: |s| > 0 ==> forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   ENSURES: |s| > 0 ==> t[i] == s[j] && t[j] == s[i]
  //   ENSURES: |s| == 0 ==> t == s
  {
    var s: seq<char> := [' '];
    var i := 0;
    var j := 0;
    var t := StringSwap(s, i, j);
    expect t == [' '];
  }

  // Test case for combination P{2}/{26}:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST: multiset(s[..]) == multiset(t[..])
  //   POST: |s| == |t|
  //   POST: |s| > 0
  //   POST: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST: |s| > 0
  //   POST: t[i] == s[j]
  //   POST: t[j] == s[i]
  //   POST: !(|s| == 0)
  //   POST: !(t == s)
  //   ENSURES: multiset(s[..]) == multiset(t[..])
  //   ENSURES: |s| == |t|
  //   ENSURES: |s| > 0 ==> forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   ENSURES: |s| > 0 ==> t[i] == s[j] && t[j] == s[i]
  //   ENSURES: |s| == 0 ==> t == s
  {
    var s: seq<char> := [' ', 'G'];
    var i := 0;
    var j := 1;
    var t := StringSwap(s, i, j);
    expect t == ['G', ' '];
  }

  // Test case for combination P{2}/{25}/O|t|>=3:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST: multiset(s[..]) == multiset(t[..])
  //   POST: |s| == |t|
  //   POST: |s| > 0
  //   POST: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST: |s| > 0
  //   POST: t[i] == s[j]
  //   POST: t[j] == s[i]
  //   POST: !(|s| == 0)
  //   POST: t == s
  //   ENSURES: multiset(s[..]) == multiset(t[..])
  //   ENSURES: |s| == |t|
  //   ENSURES: |s| > 0 ==> forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   ENSURES: |s| > 0 ==> t[i] == s[j] && t[j] == s[i]
  //   ENSURES: |s| == 0 ==> t == s
  {
    var s: seq<char> := [' ', '1', ' '];
    var i := 0;
    var j := 2;
    var t := StringSwap(s, i, j);
    expect t == [' ', '1', ' '];
  }

  // Test case for combination P{2}/{25}/O|t|>=2:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST: multiset(s[..]) == multiset(t[..])
  //   POST: |s| == |t|
  //   POST: |s| > 0
  //   POST: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST: |s| > 0
  //   POST: t[i] == s[j]
  //   POST: t[j] == s[i]
  //   POST: !(|s| == 0)
  //   POST: t == s
  //   ENSURES: multiset(s[..]) == multiset(t[..])
  //   ENSURES: |s| == |t|
  //   ENSURES: |s| > 0 ==> forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   ENSURES: |s| > 0 ==> t[i] == s[j] && t[j] == s[i]
  //   ENSURES: |s| == 0 ==> t == s
  {
    var s: seq<char> := [' ', ' '];
    var i := 1;
    var j := 0;
    var t := StringSwap(s, i, j);
    expect t == [' ', ' '];
  }

  // Test case for combination P{2}/{26}/O|t|>=3:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST: multiset(s[..]) == multiset(t[..])
  //   POST: |s| == |t|
  //   POST: |s| > 0
  //   POST: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST: |s| > 0
  //   POST: t[i] == s[j]
  //   POST: t[j] == s[i]
  //   POST: !(|s| == 0)
  //   POST: !(t == s)
  //   ENSURES: multiset(s[..]) == multiset(t[..])
  //   ENSURES: |s| == |t|
  //   ENSURES: |s| > 0 ==> forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   ENSURES: |s| > 0 ==> t[i] == s[j] && t[j] == s[i]
  //   ENSURES: |s| == 0 ==> t == s
  {
    var s: seq<char> := [' ', 'z', '!'];
    var i := 2;
    var j := 1;
    var t := StringSwap(s, i, j);
    expect t == [' ', '!', 'z'];
  }

  // Test case for combination P{2}/{26}/O|t|>=2:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST: multiset(s[..]) == multiset(t[..])
  //   POST: |s| == |t|
  //   POST: |s| > 0
  //   POST: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST: |s| > 0
  //   POST: t[i] == s[j]
  //   POST: t[j] == s[i]
  //   POST: !(|s| == 0)
  //   POST: !(t == s)
  //   ENSURES: multiset(s[..]) == multiset(t[..])
  //   ENSURES: |s| == |t|
  //   ENSURES: |s| > 0 ==> forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   ENSURES: |s| > 0 ==> t[i] == s[j] && t[j] == s[i]
  //   ENSURES: |s| == 0 ==> t == s
  {
    var s: seq<char> := [' ', '!'];
    var i := 1;
    var j := 0;
    var t := StringSwap(s, i, j);
    expect t == ['!', ' '];
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
