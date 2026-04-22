// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_457.dfy
// Method: MinLengthSublist
// Generated: 2026-04-21 23:41:24

// Find the shortest sublist in a non-empty list of sublists.
method MinLengthSublist<T>(s: seq<seq<T>>) returns (minSublist: seq<T>)
  requires |s| > 0
  ensures minSublist in s
  ensures forall sublist :: sublist in s ==> |minSublist| <= |sublist|
{
  minSublist := s[0];
  for i := 1 to |s|
    invariant minSublist in s[..i]
    invariant forall sublist :: sublist in s[..i] ==> |minSublist| <= |sublist|
  {
    if |s[i]| < |minSublist| {
      minSublist := s[i];
    }
  }
}

method MinLengthSublistTest(){
  var s1: seq<seq<int>> := [[1],[1,2],[1,2,3]];
  var res1 := MinLengthSublist(s1);
  assert res1 == s1[0] == [1];

  var s2: seq<seq<int>> := [[1,1],[1,1,1],[1,2,7,8]];
  var res2 := MinLengthSublist(s2);
  assert res2 == s2[0] == [1,1];

  var s3: seq<seq<int>> := [[1,2,3],[3,4],[11,12,14]];
  var res3 := MinLengthSublist(s3);
  assert res3 == s3[1] == [3,4];
}


method TestsForMinLengthSublist()
{
  // Test case for combination {1}/Rel:
  //   PRE:  |s| > 0
  //   POST Q1: minSublist in s
  //   POST Q2: forall sublist: seq<int> :: sublist in s ==> |minSublist| <= |sublist|
  {
    var s: seq<seq<int>> := [[22, 27], [15], [21], [18], [19]];
    var minSublist := MinLengthSublist<int>(s);
    expect minSublist in s;
    expect forall sublist: seq<int> :: sublist in s ==> |minSublist| <= |sublist|;
    expect minSublist == [15]; // observed from implementation
  }

  // Test case for combination {1}/V1:
  //   PRE:  |s| > 0
  //   POST Q1: minSublist in s  // VACUOUS (forced true by other literals for this ins)
  //   POST Q2: forall sublist: seq<int> :: sublist in s ==> |minSublist| <= |sublist|
  {
    var s: seq<seq<int>> := [[], []];
    var minSublist := MinLengthSublist<int>(s);
    expect minSublist == [];
  }

  // Test case for combination {1}/O|s|=1:
  //   PRE:  |s| > 0
  //   POST Q1: minSublist in s
  //   POST Q2: forall sublist: seq<int> :: sublist in s ==> |minSublist| <= |sublist|
  {
    var s: seq<seq<int>> := [[]];
    var minSublist := MinLengthSublist<int>(s);
    expect minSublist == [];
  }

}

method Main()
{
  TestsForMinLengthSublist();
  print "TestsForMinLengthSublist: all non-failing tests passed!\n";
}
