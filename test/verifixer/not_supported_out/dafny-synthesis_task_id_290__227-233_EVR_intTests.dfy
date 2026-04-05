// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\not_supported\dafny-synthesis_task_id_290__227-233_EVR_int.dfy
// Method: MaxLengthList
// Generated: 2026-04-05 22:49:26

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |lists| > 0
  //   POST: forall l: seq<int> {:trigger |l|} {:trigger l in lists} :: l in lists ==> |l| <= |maxList|
  //   POST: maxList in lists
  {
    var lists: seq<seq<int>> := [[], [], [], [], [], [], [], []];
    var maxList := MaxLengthList(lists);
    expect maxList == [];
  }

  // Test case for combination {1}/Blists=inner>=1:
  //   PRE:  |lists| > 0
  //   POST: forall l: seq<int> {:trigger |l|} {:trigger l in lists} :: l in lists ==> |l| <= |maxList|
  //   POST: maxList in lists
  {
    var lists: seq<seq<int>> := [[4]];
    var maxList := MaxLengthList(lists);
    expect maxList == [4];
  }

  // Test case for combination {1}/Blists=inner>=2:
  //   PRE:  |lists| > 0
  //   POST: forall l: seq<int> {:trigger |l|} {:trigger l in lists} :: l in lists ==> |l| <= |maxList|
  //   POST: maxList in lists
  {
    var lists: seq<seq<int>> := [[6, 5], [12, 13]];
    var maxList := MaxLengthList(lists);
    // expect maxList == [6, 5]; // (actual runtime value — not uniquely determined by spec)
    expect forall l: seq<int>  :: l in lists ==> |l| <= |maxList|;
    expect maxList in lists;
  }

}

method Failing()
{
  // Test case for combination {1}/Blists=3:
  //   PRE:  |lists| > 0
  //   POST: forall l: seq<int> {:trigger |l|} {:trigger l in lists} :: l in lists ==> |l| <= |maxList|
  //   POST: maxList in lists
  {
    var lists: seq<seq<int>> := [[], [7], [9, 11]];
    var maxList := MaxLengthList(lists);
    // expect maxList == [9, 11];
  }

}

method Main()
{
  Passing();
  Failing();
}
