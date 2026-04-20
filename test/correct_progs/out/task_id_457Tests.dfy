// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_457.dfy
// Method: MinLengthSublist
// Generated: 2026-04-20 22:11:00

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
  //   POST: minSublist in s
  //   POST: forall sublist: seq<int> :: sublist in s ==> |minSublist| <= |sublist|
  //   ENSURES: minSublist in s
  //   ENSURES: forall sublist: seq<int> :: sublist in s ==> |minSublist| <= |sublist|
  {
    var s: seq<seq<int>> := [[9], [16, 26], [9], [9], [9], [15], [17], [9]];
    var minSublist := MinLengthSublist<int>(s);
    expect minSublist in s;
    expect forall sublist: seq<int> :: sublist in s ==> |minSublist| <= |sublist|;
    expect minSublist == [9]; // observed from implementation
  }

  // Test case for combination {1}/O|s|=1:
  //   PRE:  |s| > 0
  //   POST: minSublist in s
  //   POST: forall sublist: seq<int> :: sublist in s ==> |minSublist| <= |sublist|
  //   ENSURES: minSublist in s
  //   ENSURES: forall sublist: seq<int> :: sublist in s ==> |minSublist| <= |sublist|
  {
    var s: seq<seq<int>> := [[]];
    var minSublist := MinLengthSublist<int>(s);
    expect minSublist == [];
  }

  // Test case for combination {1}/O|minSublist|>=2:
  //   PRE:  |s| > 0
  //   POST: minSublist in s
  //   POST: forall sublist: seq<int> :: sublist in s ==> |minSublist| <= |sublist|
  //   ENSURES: minSublist in s
  //   ENSURES: forall sublist: seq<int> :: sublist in s ==> |minSublist| <= |sublist|
  {
    var s: seq<seq<int>> := [[5, 8], [10, 14]];
    var minSublist := MinLengthSublist<int>(s);
    expect minSublist == [10, 14] || minSublist == [5, 8];
  }

}

method Main()
{
  TestsForMinLengthSublist();
  print "TestsForMinLengthSublist: all non-failing tests passed!\n";
}
