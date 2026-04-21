// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_755__1419-1432_SDL.dfy
// Method: SecondSmallest
// Generated: 2026-04-08 16:56:27

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  //   ENSURES: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   ENSURES: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[2] [7718, 7719];
    var secondSmallest := SecondSmallest(s);
    expect secondSmallest == 7719;
  }

  // Test case for combination {1}/Bs=3:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  //   ENSURES: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   ENSURES: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[3] [28957, 28958, 28959];
    var secondSmallest := SecondSmallest(s);
    expect secondSmallest == 28958;
  }

  // Test case for combination {1}/OsecondSmallest>0:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  //   ENSURES: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   ENSURES: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[4] [7758, 7759, 7760, 7761];
    var secondSmallest := SecondSmallest(s);
    expect secondSmallest == 7759;
  }

  // Test case for combination {1}/OsecondSmallest<0:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  //   ENSURES: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   ENSURES: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[8] [-7720, -7719, -7718, -7717, -7716, -7715, -7714, -7713];
    var secondSmallest := SecondSmallest(s);
    expect secondSmallest == -7719;
  }

  // Test case for combination {1}/OsecondSmallest=0:
  //   PRE:  s.Length >= 2
  //   PRE:  exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] != s[i]
  //   POST: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   POST: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  //   ENSURES: exists i: int, j: int {:trigger s[j], s[i]} :: 0 <= i < s.Length && 0 <= j < s.Length && i != j && s[i] == min(s[..]) && s[j] == secondSmallest
  //   ENSURES: forall k: int {:trigger s[k]} :: 0 <= k < s.Length && s[k] != min(s[..]) ==> s[k] >= secondSmallest
  {
    var s := new int[7] [7762, 0, 7720, 7721, 7722, 7723, 7763];
    var secondSmallest := SecondSmallest(s);
    expect secondSmallest == 7720;
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
