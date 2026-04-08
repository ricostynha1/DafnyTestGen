// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\nested_seqs\in\task_id_457.dfy
// Method: MinLengthSublist
// Generated: 2026-04-08 10:40:07

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |s| > 0
  //   POST: minSublist in s
  //   POST: forall sublist :: sublist in s ==> |minSublist| <= |sublist|
  //   ENSURES: minSublist in s
  //   ENSURES: forall sublist :: sublist in s ==> |minSublist| <= |sublist|
  {
    var s: seq<seq<int>> := [[4]];
    var minSublist := MinLengthSublist<int>(s);
    expect minSublist == [4];
  }

  // Test case for combination {1}/Bs=inner>=1:
  //   PRE:  |s| > 0
  //   POST: minSublist in s
  //   POST: forall sublist :: sublist in s ==> |minSublist| <= |sublist|
  //   ENSURES: minSublist in s
  //   ENSURES: forall sublist :: sublist in s ==> |minSublist| <= |sublist|
  {
    var s: seq<seq<int>> := [[5], [8]];
    var minSublist := MinLengthSublist<int>(s);
    expect minSublist in s;
    expect forall sublist :: sublist in s ==> |minSublist| <= |sublist|;
  }

  // Test case for combination {1}/Bs=inner>=2:
  //   PRE:  |s| > 0
  //   POST: minSublist in s
  //   POST: forall sublist :: sublist in s ==> |minSublist| <= |sublist|
  //   ENSURES: minSublist in s
  //   ENSURES: forall sublist :: sublist in s ==> |minSublist| <= |sublist|
  {
    var s: seq<seq<int>> := [[7, 6], [18, 19], [12, 13]];
    var minSublist := MinLengthSublist<int>(s);
    expect minSublist in s;
    expect forall sublist :: sublist in s ==> |minSublist| <= |sublist|;
  }

  // Test case for combination {1}/O|minSublist|>=3:
  //   PRE:  |s| > 0
  //   POST: minSublist in s
  //   POST: forall sublist :: sublist in s ==> |minSublist| <= |sublist|
  //   ENSURES: minSublist in s
  //   ENSURES: forall sublist :: sublist in s ==> |minSublist| <= |sublist|
  {
    var s: seq<seq<int>> := [[22, 21, 23], [8, 25, 34], [11, 12, 13], [7, 31, 39]];
    var minSublist := MinLengthSublist<int>(s);
    expect minSublist in s;
    expect forall sublist :: sublist in s ==> |minSublist| <= |sublist|;
  }

  // Test case for combination {1}/O|minSublist|>=2:
  //   PRE:  |s| > 0
  //   POST: minSublist in s
  //   POST: forall sublist :: sublist in s ==> |minSublist| <= |sublist|
  //   ENSURES: minSublist in s
  //   ENSURES: forall sublist :: sublist in s ==> |minSublist| <= |sublist|
  {
    var s: seq<seq<int>> := [[9, 10], [11, 12], [13, 14], [15, 16], [9, 10]];
    var minSublist := MinLengthSublist<int>(s);
    expect minSublist in s;
    expect forall sublist :: sublist in s ==> |minSublist| <= |sublist|;
  }

  // Test case for combination {1}/O|minSublist|=1:
  //   PRE:  |s| > 0
  //   POST: minSublist in s
  //   POST: forall sublist :: sublist in s ==> |minSublist| <= |sublist|
  //   ENSURES: minSublist in s
  //   ENSURES: forall sublist :: sublist in s ==> |minSublist| <= |sublist|
  {
    var s: seq<seq<int>> := [[7], [11], [14], [17], [20], [23]];
    var minSublist := MinLengthSublist<int>(s);
    expect minSublist in s;
    expect forall sublist :: sublist in s ==> |minSublist| <= |sublist|;
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
