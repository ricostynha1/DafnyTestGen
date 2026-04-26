// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_290__227-233_EVR_int.dfy
// Method: MaxLengthList
// Generated: 2026-04-24 11:58:44

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
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  |lists| > 0
  //   POST Q1: forall l: seq<int> {:trigger |l|} {:trigger l in lists} :: l in lists ==> |l| <= |maxList|
  //   POST Q2: maxList in lists
  {
    var lists: seq<seq<int>> := [[], [8]];
    var maxList := MaxLengthList(lists);
    // actual runtime state: maxList=[]
    // expect maxList == [8]; // got []
  }

  // Test case for combination {1}/V1:
  //   PRE:  |lists| > 0
  //   POST Q1: forall l: seq<int> {:trigger |l|} {:trigger l in lists} :: l in lists ==> |l| <= |maxList|  // VACUOUS (forced true by other literals for this ins)
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

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|maxList|>=2:
  //   PRE:  |lists| > 0
  //   POST Q1: forall l: seq<int> {:trigger |l|} {:trigger l in lists} :: l in lists ==> |l| <= |maxList|
  //   POST Q2: maxList in lists
  {
    var lists: seq<seq<int>> := [[], [11, 12], [], [], [], [11, 12]];
    var maxList := MaxLengthList(lists);
    // actual runtime state: maxList=[]
    // expect maxList == [11, 12]; // got []
  }

}

method Main()
{
  TestsForMaxLengthList();
  print "TestsForMaxLengthList: all non-failing tests passed!\n";
}
