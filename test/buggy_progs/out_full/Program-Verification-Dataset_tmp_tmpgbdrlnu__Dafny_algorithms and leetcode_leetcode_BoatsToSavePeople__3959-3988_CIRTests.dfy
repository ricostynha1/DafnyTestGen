// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_algorithms and leetcode_leetcode_BoatsToSavePeople__3959-3988_CIR.dfy
// Method: numRescueBoats
// Generated: 2026-04-24 10:45:52

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_algorithms and leetcode_leetcode_BoatsToSavePeople.dfy

function sumBoat(s: seq<nat>): nat
  requires 1 <= |s| <= 2
  decreases s
{
  if |s| == 1 then
    s[0]
  else
    s[0] + s[1]
}

predicate isSafeBoat(boat: seq<nat>, limit: nat)
  decreases boat, limit
{
  1 <= |boat| <= 2 &&
  sumBoat(boat) <= limit
}

function multisetAdd(ss: seq<seq<nat>>): multiset<nat>
  decreases ss
{
  if ss == [] then
    multiset{}
  else
    multiset(ss[0]) + multisetAdd(ss[1..])
}

predicate multisetEqual(ss: seq<seq<nat>>, xs: seq<nat>)
  decreases ss, xs
{
  multiset(xs) == multisetAdd(ss)
}

predicate allSafe(boats: seq<seq<nat>>, limit: nat)
  decreases boats, limit
{
  forall boat: seq<nat> {:trigger isSafeBoat(boat, limit)} {:trigger boat in boats} :: 
    boat in boats ==>
      isSafeBoat(boat, limit)
}

predicate sorted(list: seq<int>)
  decreases list
{
  forall i: int, j: int {:trigger list[j], list[i]} :: 
    0 <= i < j < |list| ==>
      list[i] <= list[j]
}

method numRescueBoats(people: seq<nat>, limit: nat) returns (boats: nat)
  requires |people| >= 1
  requires sorted(people)
  requires forall i: nat {:trigger people[i]} :: (i < |people| ==> 1 <= people[i]) && (i < |people| ==> people[i] <= limit)
  ensures exists boatConfig: seq<seq<nat>> {:trigger |boatConfig|} {:trigger allSafe(boatConfig, limit)} {:trigger multisetEqual(boatConfig, people)} :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|
  decreases people, limit
{
  boats := 0;
  var lower: nat := 0;
  var upper: int := |people| - 1;
  var visitedUpper: multiset<nat> := multiset{};
  var visitedLower: multiset<nat> := multiset{};
  var remaining: multiset<nat> := multiset(people);
  var safeBoats: seq<seq<nat>> := [];
  while lower <= upper
    invariant 0 <= lower <= |people|
    invariant lower - 1 <= upper < |people|
    invariant visitedUpper == multiset(people[upper + 1..])
    invariant visitedLower == multiset(people[..lower])
    invariant allSafe(safeBoats, limit)
    invariant multisetAdd(safeBoats) == visitedLower + visitedUpper
    invariant |safeBoats| == boats
    decreases upper - lower
  {
    if people[upper] == limit || people[upper] + people[lower] > limit {
      boats := boats + 1;
      assert isSafeBoat([people[upper]], limit);
      safeBoats := [[people[upper]]] + safeBoats;
      assert visitedUpper == multiset(people[upper + 1..]);
      var gu := people[upper + 1..];
      assert multiset(gu) == visitedUpper;
      assert people[upper..] == [people[upper]] + gu;
      visitedUpper := visitedUpper + multiset{people[upper]};
      upper := upper - 1;
      assert people[upper + 1..] == [people[upper + 1]] + gu;
    } else {
      var gl := people[..lower];
      boats := boats + 1;
      if lower == upper {
        visitedLower := visitedLower + multiset{people[lower]};
        assert isSafeBoat([people[lower]], limit);
        safeBoats := [[people[lower]]] + safeBoats;
      } else {
        var gu := people[upper + 1..];
        assert multiset(gu) == visitedUpper;
        visitedUpper := visitedUpper + multiset{people[upper]};
        visitedLower := visitedLower + multiset{people[lower]};
        assert isSafeBoat([people[upper], people[lower]], limit);
        safeBoats := [[]] + safeBoats;
        upper := upper - 1;
        assert people[upper + 1..] == [people[upper + 1]] + gu;
      }
      lower := lower + 1;
      assert people[..lower] == gl + [people[lower - 1]];
    }
  }
  assert visitedLower == multiset(people[..lower]);
  assert visitedUpper == multiset(people[upper + 1..]);
  assert upper + 1 == lower;
  assert people == people[..lower] + people[upper + 1..];
  assert visitedLower + visitedUpper == multiset(people);
}


method TestsFornumRescueBoats()
{
  // Test case for combination {1}:
  //   PRE:  |people| >= 1
  //   PRE:  sorted(people)
  //   PRE:  forall i: nat {:trigger people[i]} :: (i < |people| ==> 1 <= people[i]) && (i < |people| ==> people[i] <= limit)
  //   POST Q1: exists boatConfig: seq<seq<nat>> {:trigger |boatConfig|} {:trigger allSafe(boatConfig, limit)} {:trigger multisetEqual(boatConfig, people)} :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|
  {
    var people: seq<nat> := [10];
    var limit := 10;
    var boats := numRescueBoats(people, limit);
    expect exists boatConfig: seq<seq<nat>>  :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|;
  }

  // Test case for combination {1}/Blimit=1:
  //   PRE:  |people| >= 1
  //   PRE:  sorted(people)
  //   PRE:  forall i: nat {:trigger people[i]} :: (i < |people| ==> 1 <= people[i]) && (i < |people| ==> people[i] <= limit)
  //   POST Q1: exists boatConfig: seq<seq<nat>> {:trigger |boatConfig|} {:trigger allSafe(boatConfig, limit)} {:trigger multisetEqual(boatConfig, people)} :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|
  {
    var people: seq<nat> := [1];
    var limit := 1;
    var boats := numRescueBoats(people, limit);
    expect exists boatConfig: seq<seq<nat>>  :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|;
  }

  // Test case for combination {1}/O|people|>=2:
  //   PRE:  |people| >= 1
  //   PRE:  sorted(people)
  //   PRE:  forall i: nat {:trigger people[i]} :: (i < |people| ==> 1 <= people[i]) && (i < |people| ==> people[i] <= limit)
  //   POST Q1: exists boatConfig: seq<seq<nat>> {:trigger |boatConfig|} {:trigger allSafe(boatConfig, limit)} {:trigger multisetEqual(boatConfig, people)} :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|
  {
    var people: seq<nat> := [3, 3];
    var limit := 3;
    var boats := numRescueBoats(people, limit);
    expect exists boatConfig: seq<seq<nat>>  :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|;
  }

  // Test case for combination {1}/R4:
  //   PRE:  |people| >= 1
  //   PRE:  sorted(people)
  //   PRE:  forall i: nat {:trigger people[i]} :: (i < |people| ==> 1 <= people[i]) && (i < |people| ==> people[i] <= limit)
  //   POST Q1: exists boatConfig: seq<seq<nat>> {:trigger |boatConfig|} {:trigger allSafe(boatConfig, limit)} {:trigger multisetEqual(boatConfig, people)} :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|
  {
    var people: seq<nat> := [2];
    var limit := 2;
    var boats := numRescueBoats(people, limit);
    expect exists boatConfig: seq<seq<nat>>  :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|;
  }

  // Test case for combination {1}/R5:
  //   PRE:  |people| >= 1
  //   PRE:  sorted(people)
  //   PRE:  forall i: nat {:trigger people[i]} :: (i < |people| ==> 1 <= people[i]) && (i < |people| ==> people[i] <= limit)
  //   POST Q1: exists boatConfig: seq<seq<nat>> {:trigger |boatConfig|} {:trigger allSafe(boatConfig, limit)} {:trigger multisetEqual(boatConfig, people)} :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|
  {
    var people: seq<nat> := [8];
    var limit := 8;
    var boats := numRescueBoats(people, limit);
    expect exists boatConfig: seq<seq<nat>>  :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|;
  }

  // Test case for combination {1}/R6:
  //   PRE:  |people| >= 1
  //   PRE:  sorted(people)
  //   PRE:  forall i: nat {:trigger people[i]} :: (i < |people| ==> 1 <= people[i]) && (i < |people| ==> people[i] <= limit)
  //   POST Q1: exists boatConfig: seq<seq<nat>> {:trigger |boatConfig|} {:trigger allSafe(boatConfig, limit)} {:trigger multisetEqual(boatConfig, people)} :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|
  {
    var people: seq<nat> := [4];
    var limit := 4;
    var boats := numRescueBoats(people, limit);
    expect exists boatConfig: seq<seq<nat>>  :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|;
  }

  // Test case for combination {1}/R7:
  //   PRE:  |people| >= 1
  //   PRE:  sorted(people)
  //   PRE:  forall i: nat {:trigger people[i]} :: (i < |people| ==> 1 <= people[i]) && (i < |people| ==> people[i] <= limit)
  //   POST Q1: exists boatConfig: seq<seq<nat>> {:trigger |boatConfig|} {:trigger allSafe(boatConfig, limit)} {:trigger multisetEqual(boatConfig, people)} :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|
  {
    var people: seq<nat> := [2];
    var limit := 7;
    var boats := numRescueBoats(people, limit);
    expect exists boatConfig: seq<seq<nat>>  :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|;
  }

  // Test case for combination {1}/R8:
  //   PRE:  |people| >= 1
  //   PRE:  sorted(people)
  //   PRE:  forall i: nat {:trigger people[i]} :: (i < |people| ==> 1 <= people[i]) && (i < |people| ==> people[i] <= limit)
  //   POST Q1: exists boatConfig: seq<seq<nat>> {:trigger |boatConfig|} {:trigger allSafe(boatConfig, limit)} {:trigger multisetEqual(boatConfig, people)} :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|
  {
    var people: seq<nat> := [2];
    var limit := 6;
    var boats := numRescueBoats(people, limit);
    expect exists boatConfig: seq<seq<nat>>  :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|;
  }

  // Test case for combination {1}/R9:
  //   PRE:  |people| >= 1
  //   PRE:  sorted(people)
  //   PRE:  forall i: nat {:trigger people[i]} :: (i < |people| ==> 1 <= people[i]) && (i < |people| ==> people[i] <= limit)
  //   POST Q1: exists boatConfig: seq<seq<nat>> {:trigger |boatConfig|} {:trigger allSafe(boatConfig, limit)} {:trigger multisetEqual(boatConfig, people)} :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|
  {
    var people: seq<nat> := [2];
    var limit := 5;
    var boats := numRescueBoats(people, limit);
    expect exists boatConfig: seq<seq<nat>>  :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|;
  }

  // Test case for combination {1}/R10:
  //   PRE:  |people| >= 1
  //   PRE:  sorted(people)
  //   PRE:  forall i: nat {:trigger people[i]} :: (i < |people| ==> 1 <= people[i]) && (i < |people| ==> people[i] <= limit)
  //   POST Q1: exists boatConfig: seq<seq<nat>> {:trigger |boatConfig|} {:trigger allSafe(boatConfig, limit)} {:trigger multisetEqual(boatConfig, people)} :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|
  {
    var people: seq<nat> := [6];
    var limit := 9;
    var boats := numRescueBoats(people, limit);
    expect exists boatConfig: seq<seq<nat>>  :: multisetEqual(boatConfig, people) && allSafe(boatConfig, limit) && boats == |boatConfig|;
  }

}

method Main()
{
  TestsFornumRescueBoats();
  print "TestsFornumRescueBoats: all tests passed!\n";
}
