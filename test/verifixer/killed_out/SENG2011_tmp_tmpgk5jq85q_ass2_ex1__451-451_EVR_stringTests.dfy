// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\SENG2011_tmp_tmpgk5jq85q_ass2_ex1__451-451_EVR_string.dfy
// Method: StringSwap
// Generated: 2026-04-05 23:59:15

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


method Passing()
{
  // Test case for combination P{1}/{6}:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST: multiset(s[..]) == multiset(t[..])
  //   POST: |s| == |t|
  //   POST: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST: !(|s| > 0)
  //   POST: t == s
  {
    var s: seq<char> := [];
    var i := 0;
    var j := 0;
    expect i >= 0 && j >= 0 && |s| >= 0; // PRE-CHECK
    expect |s| > 0 ==> i < |s| && j < |s|; // PRE-CHECK
    var t := StringSwap(s, i, j);
    expect t == [];
  }

}

method Failing()
{
  // Test case for combination P{2}/{7}:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST: multiset(s[..]) == multiset(t[..])
  //   POST: |s| == |t|
  //   POST: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST: t[i] == s[j]
  //   POST: t[j] == s[i]
  //   POST: !(|s| == 0)
  {
    var s: seq<char> := ['\U{0027}', '&'];
    var i := 0;
    var j := 1;
    // expect i >= 0 && j >= 0 && |s| >= 0; // PRE-CHECK
    // expect |s| > 0 ==> i < |s| && j < |s|; // PRE-CHECK
    var t := StringSwap(s, i, j);
    // expect t == ['&', '\U{0027}'];
  }

  // Test case for combination P{2}/{7,8}:
  //   PRE:  i >= 0 && j >= 0 && |s| >= 0
  //   PRE:  |s| > 0 ==> i < |s| && j < |s|
  //   POST: multiset(s[..]) == multiset(t[..])
  //   POST: |s| == |t|
  //   POST: forall k: nat {:trigger s[k]} {:trigger t[k]} :: k != i && k != j && k < |s| ==> t[k] == s[k]
  //   POST: t[i] == s[j]
  //   POST: t[j] == s[i]
  //   POST: !(|s| == 0)
  //   POST: t == s
  {
    var s: seq<char> := [' '];
    var i := 0;
    var j := 0;
    // expect i >= 0 && j >= 0 && |s| >= 0; // PRE-CHECK
    // expect |s| > 0 ==> i < |s| && j < |s|; // PRE-CHECK
    var t := StringSwap(s, i, j);
    // expect t == [' '];
  }

}

method Main()
{
  Passing();
  Failing();
}
