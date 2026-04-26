// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_290__227-233_EVR_int.dfy
// Method: MaxLengthList
// Generated: 2026-04-24 13:37:53

// dafny-synthesis_task_id_290.dfy

method MaxLengthList(lists: seq<seq<int>>) returns (maxList: seq<int>)
  requires |lists| > 0
  ensures forall l: seq<int> {:trigger |l|} {:trigger l in lists} :: l in lists ==> |l| <= |maxList|
  ensures maxList in lists
  decreases lists
{
  maxList := lists[0];
  for i: int := 1 to 0
    invariant 1 <= i <= |lists|
    invariant forall l: seq<int> {:trigger |l|} {:trigger l in lists[..i]} :: l in lists[..i] ==> |l| <= |maxList|
    invariant maxList in lists[..i]
  {
    if |lists[i]| > |maxList| {
      maxList := lists[i];
    }
  }
}


method TestsForMaxLengthList()
{
  // Test case for combination {1}:
  //   PRE:  |lists| > 0
  //   POST Q1: forall l: seq<int> {:trigger |l|} {:trigger l in lists} :: l in lists ==> |l| <= |maxList|
  //   POST Q2: maxList in lists
  {
    var lists: seq<seq<int>> := [[], [], [], [], [], [], [], []];
    var maxList := MaxLengthList(lists);
    expect maxList == [];
  }

  // Test case for combination {1}/O|lists|=1:
  //   PRE:  |lists| > 0
  //   POST Q1: forall l: seq<int> {:trigger |l|} {:trigger l in lists} :: l in lists ==> |l| <= |maxList|
  //   POST Q2: maxList in lists
  {
    var lists: seq<seq<int>> := [[]];
    var maxList := MaxLengthList(lists);
    expect maxList == [];
  }

  // Test case for combination {1}/O|maxList|=1:
  //   PRE:  |lists| > 0
  //   POST Q1: forall l: seq<int> {:trigger |l|} {:trigger l in lists} :: l in lists ==> |l| <= |maxList|
  //   POST Q2: maxList in lists
  {
    var lists: seq<seq<int>> := [[3], [4], [5], [6], [9], [2], [10]];
    var maxList := MaxLengthList(lists);
    expect forall l: seq<int>  :: l in lists ==> |l| <= |maxList|;
    expect maxList in lists;
    expect maxList == [3]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  |lists| > 0
  //   POST Q1: forall l: seq<int> {:trigger |l|} {:trigger l in lists} :: l in lists ==> |l| <= |maxList|
  //   POST Q2: maxList in lists
  {
    var lists: seq<seq<int>> := [[], [], [], [], [], []];
    var maxList := MaxLengthList(lists);
    expect maxList == [];
  }

  // Test case for combination {1}/R7:
  //   PRE:  |lists| > 0
  //   POST Q1: forall l: seq<int> {:trigger |l|} {:trigger l in lists} :: l in lists ==> |l| <= |maxList|
  //   POST Q2: maxList in lists
  {
    var lists: seq<seq<int>> := [[], [], []];
    var maxList := MaxLengthList(lists);
    expect maxList == [];
  }

}

method Main()
{
  TestsForMaxLengthList();
  print "TestsForMaxLengthList: all non-failing tests passed!\n";
}
