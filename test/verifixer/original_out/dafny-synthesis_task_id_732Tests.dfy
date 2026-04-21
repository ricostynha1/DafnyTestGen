// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_732.dfy
// Method: ReplaceWithColon
// Generated: 2026-04-08 19:10:53

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
      s' := s' + [s[i]];
    }
  }
  return s';
}


method GeneratedTests_ReplaceWithColon()
{
  // Test case for combination {1}:
  //   POST: |v| == |s|
  //   POST: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  //   ENSURES: |v| == |s|
  //   ENSURES: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := [];
    var v := ReplaceWithColon(s);
    expect v == [];
  }

  // Test case for combination {1}/Bs=1:
  //   POST: |v| == |s|
  //   POST: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  //   ENSURES: |v| == |s|
  //   ENSURES: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := [' '];
    var v := ReplaceWithColon(s);
    expect |v| == |s|;
    expect forall i: int  :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i]);
  }

  // Test case for combination {1}/Bs=2:
  //   POST: |v| == |s|
  //   POST: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  //   ENSURES: |v| == |s|
  //   ENSURES: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := [' ', ','];
    var v := ReplaceWithColon(s);
    expect |v| == |s|;
    expect forall i: int  :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i]);
  }

  // Test case for combination {1}/Bs=3:
  //   POST: |v| == |s|
  //   POST: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  //   ENSURES: |v| == |s|
  //   ENSURES: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := [',', '-', '.'];
    var v := ReplaceWithColon(s);
    expect |v| == |s|;
    expect forall i: int  :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i]);
  }

  // Test case for combination {1}/O|v|>=3:
  //   POST: |v| == |s|
  //   POST: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  //   ENSURES: |v| == |s|
  //   ENSURES: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := ['.', ' ', ' ', ' '];
    var v := ReplaceWithColon(s);
    expect |v| == |s|;
    expect forall i: int  :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i]);
  }

  // Test case for combination {1}/O|v|>=2:
  //   POST: |v| == |s|
  //   POST: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  //   ENSURES: |v| == |s|
  //   ENSURES: forall i: int {:trigger v[i]} {:trigger s[i]} :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i])
  {
    var s: seq<char> := ['.', ' ', ' ', ' ', ' '];
    var v := ReplaceWithColon(s);
    expect |v| == |s|;
    expect forall i: int  :: (0 <= i < |s| ==> IsSpaceCommaDot(s[i]) ==> v[i] == ':') && (0 <= i < |s| ==> !IsSpaceCommaDot(s[i]) ==> v[i] == s[i]);
  }

}

method Main()
{
  GeneratedTests_ReplaceWithColon();
  print "GeneratedTests_ReplaceWithColon: all tests passed!\n";
}
