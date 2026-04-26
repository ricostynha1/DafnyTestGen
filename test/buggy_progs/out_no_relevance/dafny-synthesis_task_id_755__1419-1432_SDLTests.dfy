// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_755__1419-1432_SDL.dfy
// Method: SecondSmallest
// Generated: 2026-04-24 13:44:27

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
    var s := new int[2] [-10, -9];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == -9; // observed from implementation
  }

  // Test case for combination {1}/R2:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [-9, -8];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == -8; // observed from implementation
  }

  // Test case for combination {1}/R3:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [-2, -7];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == -2; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [-3, -10];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == -3; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [-1, -6];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == -1; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [-8, -1];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == -1; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [-6, -5];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == -5; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [-7, -8];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == -7; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [-10, -8];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == -8; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST Q1: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST Q2: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [-10, -6];
    var secondSmallest := SecondSmallest(s);
    expect exists i: int, j: int :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest;
    expect forall k: int :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest;
    expect secondSmallest == -6; // observed from implementation
  }

}

method Main()
{
  TestsForSecondSmallest();
  print "TestsForSecondSmallest: all non-failing tests passed!\n";
}
