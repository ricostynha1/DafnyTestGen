// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_230__423_VER_s'.dfy
// Method: ReplaceBlanksWithChar
// Generated: 2026-04-24 20:01:27

// dafny-synthesis_task_id_230.dfy

method ReplaceBlanksWithChar(s: string, ch: char) returns (v: string)
  ensures |v| == |s|
  ensures forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> s[i] == ' ' ==> v[i] == ch) && (0 <= i < |s| ==> s[i] != ' ' ==> v[i] == s[i])
  decreases s, ch
{
  var s': string := [];
  for i: int := 0 to |s|
    invariant 0 <= i <= |s|
    invariant |s'| == i
    invariant forall k: int {:trigger s'[k]} {:trigger s[k]} :: (0 <= k < i ==> s[k] == ' ' ==> s'[k] == ch) && (0 <= k < i ==> s[k] != ' ' ==> s'[k] == s[k])
  {
    if s'[i] == ' ' {
      s' := s' + [ch];
    } else {
      s' := s' + [s[i]];
    }
  }
  return s';
}


method TestsForReplaceBlanksWithChar()
{
  // Test case for combination {1}:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> s[i] == ' ' ==> v[i] == ch) && (0 <= i < |s| ==> s[i] != ' ' ==> v[i] == s[i])
  {
    var s: seq<char> := [];
    var ch := ' ';
    var v := ReplaceBlanksWithChar(s, ch);
    expect v == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|s|=1:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> s[i] == ' ' ==> v[i] == ch) && (0 <= i < |s| ==> s[i] != ' ' ==> v[i] == s[i])
  {
    var s: seq<char> := ['!'];
    var ch := '!';
    var v := ReplaceBlanksWithChar(s, ch);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyCBT_sraxe0xjjfs\runner.cs:line 1542
    // expect v == ['!'];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|s|>=2:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> s[i] == ' ' ==> v[i] == ch) && (0 <= i < |s| ==> s[i] != ' ' ==> v[i] == s[i])
  {
    var s: seq<char> := ['!', 'j'];
    var ch := ' ';
    var v := ReplaceBlanksWithChar(s, ch);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at System.Collections.Immutable.ImmutableArray`1.get_Item(Int32 index)
    // runtime error: at Dafny.Sequence`1.Select(BigInteger index) in C:\cygwin64\tmp\DafnyCBT_sraxe0xjjfs\runner.cs:line 1542
    // expect v == ['!', 'j'];
  }

  // Test case for combination {1}/R4:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> s[i] == ' ' ==> v[i] == ch) && (0 <= i < |s| ==> s[i] != ' ' ==> v[i] == s[i])
  {
    var s: seq<char> := [];
    var ch := '!';
    var v := ReplaceBlanksWithChar(s, ch);
    expect v == [];
  }

  // Test case for combination {1}/R5:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> s[i] == ' ' ==> v[i] == ch) && (0 <= i < |s| ==> s[i] != ' ' ==> v[i] == s[i])
  {
    var s: seq<char> := [];
    var ch := '"';
    var v := ReplaceBlanksWithChar(s, ch);
    expect v == [];
    expect ch == '\"'; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> s[i] == ' ' ==> v[i] == ch) && (0 <= i < |s| ==> s[i] != ' ' ==> v[i] == s[i])
  {
    var s: seq<char> := [];
    var ch := '#';
    var v := ReplaceBlanksWithChar(s, ch);
    expect v == [];
  }

  // Test case for combination {1}/R7:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> s[i] == ' ' ==> v[i] == ch) && (0 <= i < |s| ==> s[i] != ' ' ==> v[i] == s[i])
  {
    var s: seq<char> := [];
    var ch := '$';
    var v := ReplaceBlanksWithChar(s, ch);
    expect v == [];
  }

  // Test case for combination {1}/R8:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> s[i] == ' ' ==> v[i] == ch) && (0 <= i < |s| ==> s[i] != ' ' ==> v[i] == s[i])
  {
    var s: seq<char> := [];
    var ch := '%';
    var v := ReplaceBlanksWithChar(s, ch);
    expect v == [];
  }

  // Test case for combination {1}/R9:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> s[i] == ' ' ==> v[i] == ch) && (0 <= i < |s| ==> s[i] != ' ' ==> v[i] == s[i])
  {
    var s: seq<char> := [];
    var ch := '&';
    var v := ReplaceBlanksWithChar(s, ch);
    expect v == [];
  }

  // Test case for combination {1}/R10:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> s[i] == ' ' ==> v[i] == ch) && (0 <= i < |s| ==> s[i] != ' ' ==> v[i] == s[i])
  {
    var s: seq<char> := [];
    var ch := '\U{0027}';
    var v := ReplaceBlanksWithChar(s, ch);
    expect v == [];
    expect ch == '\''; // observed from implementation
  }

}

method Main()
{
  TestsForReplaceBlanksWithChar();
  print "TestsForReplaceBlanksWithChar: all non-failing tests passed!\n";
}
