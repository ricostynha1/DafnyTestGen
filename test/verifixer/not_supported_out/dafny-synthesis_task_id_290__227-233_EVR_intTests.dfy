// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\not_supported\dafny-synthesis_task_id_290__227-233_EVR_int.dfy
// Method: MaxLengthList
// Generated: 2026-04-22 21:31:51

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
    var lists: seq<seq<int>> := [[], [], [], [], [], [], [], [6, 5]];
    var maxList := MaxLengthList(lists);
    // actual runtime state: maxList=[]
    // expect maxList == [6, 5]; // got []
  }

}

method Main()
{
  TestsForMaxLengthList();
  print "TestsForMaxLengthList: all non-failing tests passed!\n";
}
