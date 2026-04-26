// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_755__1419-1432_SDL.dfy
// Method: SecondSmallest
// Generated: 2026-04-24 20:08:13

// dafny-synthesis_task_id_755.dfy

function MinPair(s: seq<int>): (r: int)
  requires |s| == 2
  ensures s[0] <= s[1] <==> r == s[0]
  ensures s[0] > s[1] ==> r == s[1]
  decreases s
{
  if s[0] <= s[1] then
    s[0]
  else
    s[1]
}

function min(s: seq<int>): (r: int)
  requires |s| >= 2
  ensures forall i: int {:trigger s[i]} :: 0 <= i < |s| ==> r <= s[i]
  decreases s
{
  if |s| == 2 then
    MinPair(s)
  else
    MinPair([s[0], min(s[1..])])
}

method SecondSmallest(s: array<int>) returns (secondSmallest: int)
  requires s.Length >= 2
  requires exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  ensures exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  ensures forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  decreases s
{
  var minIndex := 0;
  var secondMinIndex := 1;
  if s[1] < s[0] {
    minIndex := 1;
    secondMinIndex := 0;
  }
  for i: int := 2 to s.Length
    invariant 0 <= i <= s.Length
    invariant 0 <= minIndex < i
    invariant 0 <= secondMinIndex < i
    invariant minIndex != secondMinIndex
    invariant forall k: int {:trigger s[k]} :: 0 <= k < i ==> s[k] >= s[minIndex]
    invariant forall k: int {:trigger s[k]} :: 0 <= k < i && k != minIndex ==> s[k] >= s[secondMinIndex]
  {
    if s[i] < s[minIndex] {
      secondMinIndex := minIndex;
    } else if s[i] < s[secondMinIndex] {
      secondMinIndex := i;
    }
  }
  secondSmallest := s[secondMinIndex];
}


method TestsForSecondSmallest()
{
  // Test case for combination {1}:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [9, 8];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == 9; // observed from implementation
  }

  // Test case for combination {1}/R2:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [11, 10];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == 11; // observed from implementation
  }

  // Test case for combination {1}/R3:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [13, 12];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == 13; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [15, 14];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == 15; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [16, 19];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == 19; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [18, 17];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == 18; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [20, 23];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == 23; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [22, 21];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == 22; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [25, 24];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == 25; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [27, 26];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == 27; // observed from implementation
  }

}

method Main()
{
  TestsForSecondSmallest();
  print "TestsForSecondSmallest: all non-failing tests passed!\n";
}
