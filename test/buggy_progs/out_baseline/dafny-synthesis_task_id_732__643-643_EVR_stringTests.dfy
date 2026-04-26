// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_732__643-643_EVR_string.dfy
// Method: ReplaceWithColon
// Generated: 2026-04-24 20:08:09

// dafny-synthesis_task_id_732.dfy

predicate IsSpaceCommaDot(c: char)
  decreases c
{
  c == ' ' || c == ',' || c == '.'
}

method ReplaceWithColon(s: string) returns (v: string)
  ensures |v| == |s|
  ensures forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  decreases s
{
  var s': string := [];
  for i: int := 0 to |s|
    invariant 0 <= i <= |s|
    invariant |s'| == i
    invariant forall k: int {:trigger s'[k]} {:trigger s[k]} :: (0 <= k < i ==> IsSpaceCommaDot(s[k]) ==> s'[k] == ':') && (0 <= k < i ==> !IsSpaceCommaDot(s[k]) ==> s'[k] == s[k])
  {
    if IsSpaceCommaDot(s[i]) {
      s' := s' + [':'];
    } else {
      s' := "" + [s[i]];
    }
  }
  return s';
}


method TestsForReplaceWithColon()
{
  // Test case for combination {1}:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := [];
    var v := ReplaceWithColon(s);
    expect v == [];
  }

  // Test case for combination {1}/O|s|=1:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := [' '];
    var v := ReplaceWithColon(s);
    expect v == [':'];
  }

  // Test case for combination {1}/O|s|>=2:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := ['.', '.'];
    var v := ReplaceWithColon(s);
    expect v == [':', ':'];
  }

  // Test case for combination {1}/R4:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := ['.'];
    var v := ReplaceWithColon(s);
    expect v == [':'];
  }

  // Test case for combination {1}/R5:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := [','];
    var v := ReplaceWithColon(s);
    expect v == [':'];
  }

  // Test case for combination {1}/R6:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := ['/'];
    var v := ReplaceWithColon(s);
    expect v == ['/'];
  }

  // Test case for combination {1}/R7:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := ['0'];
    var v := ReplaceWithColon(s);
    expect v == ['0'];
  }

  // Test case for combination {1}/R8:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := ['1'];
    var v := ReplaceWithColon(s);
    expect v == ['1'];
  }

  // Test case for combination {1}/R9:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := ['2'];
    var v := ReplaceWithColon(s);
    expect v == ['2'];
  }

  // Test case for combination {1}/R10:
  //   POST Q1: |v| == |s|
  //   POST Q2: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := ['3'];
    var v := ReplaceWithColon(s);
    expect v == ['3'];
  }

}

method Main()
{
  TestsForReplaceWithColon();
  print "TestsForReplaceWithColon: all non-failing tests passed!\n";
}
