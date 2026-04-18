// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_290.dfy
// Method: MaxLengthSublist
// Generated: 2026-04-18 23:07:05

// Returns the longest list in a non-empty list of lists.
// If there are multiple lists of the same length, any one can be returned.
method MaxLengthSublist<T>(lists: seq<seq<T>>) returns (maxSublist: seq<T>)
  requires |lists| > 0
  ensures maxSublist in lists
  ensures forall l :: l in lists ==> |l| <= |maxSublist|
{
  maxSublist := lists[0];
  for i := 1 to |lists|
    invariant maxSublist in lists[..i]
    invariant forall l :: l in lists[..i] ==> |l| <= |maxSublist|
  {
    if |lists[i]| > |maxSublist| {
      maxSublist := lists[i];
    }
  }
}

method MaxLengthListTest(){
  // typical case
  var s1: seq<seq<int>> := [[0], [1, 3], [5, 7], [9, 11], [13, 15, 17]];
  var res1 := MaxLengthSublist(s1);
  assert res1 == [13, 15, 17];

  // multiple solutions
  var s2: seq<seq<int>> := [[1], [5, 7], [3, 12]];
  var e2: seq<int> := [10, 12, 14,15];
  var res2 := MaxLengthSublist(s2);
  assert res2 == [5, 7] || res2 == [3, 12]; 
}


method TestsForMaxLengthSublist()
{
  // Test case for combination {1}:
  //   PRE:  |lists| > 0
  //   POST: maxSublist in lists
  //   POST: forall l: seq<int> :: l in lists ==> |l| <= |maxSublist|
  //   ENSURES: maxSublist in lists
  //   ENSURES: forall l: seq<int> :: l in lists ==> |l| <= |maxSublist|
  {
    var lists: seq<seq<int>> := [[4]];
    var maxSublist := MaxLengthSublist<int>(lists);
    expect maxSublist == [4];
  }

  // Test case for combination {1}/Q|lists|>=2:
  //   PRE:  |lists| > 0
  //   POST: maxSublist in lists
  //   POST: forall l: seq<int> :: l in lists ==> |l| <= |maxSublist|
  //   ENSURES: maxSublist in lists
  //   ENSURES: forall l: seq<int> :: l in lists ==> |l| <= |maxSublist|
  {
    var lists: seq<seq<int>> := [[], [], [], [], [], [], []];
    var maxSublist := MaxLengthSublist<int>(lists);
    expect maxSublist == [];
  }

  // Test case for combination {1}/Q|lists[0]|>=2:
  //   PRE:  |lists| > 0
  //   POST: maxSublist in lists
  //   POST: forall l: seq<int> :: l in lists ==> |l| <= |maxSublist|
  //   ENSURES: maxSublist in lists
  //   ENSURES: forall l: seq<int> :: l in lists ==> |l| <= |maxSublist|
  {
    var lists: seq<seq<int>> := [[9, 6], [14], [17], [20], [23], [29, 31], [26], []];
    var maxSublist := MaxLengthSublist<int>(lists);
    expect maxSublist == [29, 31] || maxSublist == [9, 6];
  }

  // Test case for combination {1}/R4:
  //   PRE:  |lists| > 0
  //   POST: maxSublist in lists
  //   POST: forall l: seq<int> :: l in lists ==> |l| <= |maxSublist|
  //   ENSURES: maxSublist in lists
  //   ENSURES: forall l: seq<int> :: l in lists ==> |l| <= |maxSublist|
  {
    var lists: seq<seq<int>> := [[10], [], [], []];
    var maxSublist := MaxLengthSublist<int>(lists);
    expect maxSublist == [10];
  }

}

method Main()
{
  TestsForMaxLengthSublist();
  print "TestsForMaxLengthSublist: all non-failing tests passed!\n";
}
