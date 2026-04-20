// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_424.dfy
// Method: ExtractRearChars
// Generated: 2026-04-20 22:10:32

// Returns a sequence with the last character of each string in the input list.
method ExtractRearChars(l: seq<string>) returns (r: seq<char>)
  requires forall i :: 0 <= i < |l| ==> |l[i]| > 0
  ensures |r| == |l|
  ensures forall i :: 0 <= i < |l| ==> r[i] == Last(l[i])
{
  r := [];
  for i := 0 to |l|
    invariant |r| == i
    invariant forall k :: 0 <= k < i ==> r[k] == Last(l[k])
  {
    r := r + [Last(l[i])];
  }
}

// Auxiliary function to get the last element of a non-empty sequence.
function Last<T>(s: seq<T>): T
  requires |s| > 0
{
  s[|s| - 1]
}

// Test cases checked statically.
method ExtractRearCharsTest(){
  var s1: seq<string> := ["Mers", "for", "Vers"];
  var res1 := ExtractRearChars(s1);
  assert res1 == ['s', 'r', 's'];

  var s2: seq<string> := ["Avenge", "for", "People"];
  var res2:=ExtractRearChars(s2);
  assert res2 == ['e', 'r', 'e'];

  var s3: seq<string> := ["a", "b", "c"];
  var res3 := ExtractRearChars(s3);
  assert res3 == ['a', 'b', 'c'];
}

method TestsForExtractRearChars()
{
  // Test case for combination {1}/Rel:
  //   PRE:  forall i: int :: 0 <= i < |l| ==> |l[i]| > 0
  //   POST: |r| == |l|
  //   POST: forall i: int :: 0 <= i < |l| ==> r[i] == Last(l[i])
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i: int :: 0 <= i < |l| ==> r[i] == Last(l[i])
  {
    var l: seq<string> := ["~"];
    var r := ExtractRearChars(l);
    expect r == ['~'];
  }

  // Test case for combination {1}/O|l|=0:
  //   PRE:  forall i: int :: 0 <= i < |l| ==> |l[i]| > 0
  //   POST: |r| == |l|
  //   POST: forall i: int :: 0 <= i < |l| ==> r[i] == Last(l[i])
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i: int :: 0 <= i < |l| ==> r[i] == Last(l[i])
  {
    var l: seq<string> := [];
    var r := ExtractRearChars(l);
    expect r == [];
  }

  // Test case for combination {1}/O|l|>=2:
  //   PRE:  forall i: int :: 0 <= i < |l| ==> |l[i]| > 0
  //   POST: |r| == |l|
  //   POST: forall i: int :: 0 <= i < |l| ==> r[i] == Last(l[i])
  //   ENSURES: |r| == |l|
  //   ENSURES: forall i: int :: 0 <= i < |l| ==> r[i] == Last(l[i])
  {
    var l: seq<string> := ["~", "~"];
    var r := ExtractRearChars(l);
    expect r == ['~', '~'];
  }

}

method Main()
{
  TestsForExtractRearChars();
  print "TestsForExtractRearChars: all non-failing tests passed!\n";
}
