// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_canyon_search__1025_VER_b.dfy
// Method: CanyonSearch
// Generated: 2026-04-24 19:27:41

// Clover_canyon_search.dfy

method CanyonSearch(a: array<int>, b: array<int>) returns (d: nat)
  requires a.Length != 0 && b.Length != 0
  requires forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  requires forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  ensures exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  ensures forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  decreases a, b
{
  var m, n := 0, 0;
  d := if a[0] < b[0] then b[0] - a[0] else a[0] - b[0];
  while m < a.Length && n < b.Length
    invariant 0 <= m <= a.Length && 0 <= n <= b.Length
    invariant exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
    invariant forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= (if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]) || (m <= i && n <= j)
    decreases a.Length - m + b.Length - n
  {
    var t := if a[m] < b[n] then b[n] - a[m] else a[m] - b[n];
    d := if t < d then t else d;
    if
    case a[m] <= b[n] =>
      m := m + 1;
    case b[n] <= b[m] =>
      n := n + 1;
  }
}


method TestsForCanyonSearch()
{
  // Test case for combination {1}:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [0];
    var b := new int[1] [0];
    var d := CanyonSearch(a, b);
    expect d == 0;
  }

  // Test case for combination {1}/Bd=1:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-1];
    var b := new int[1] [-2];
    var d := CanyonSearch(a, b);
    expect d == 1;
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[2] [-402, -402];
    var b := new int[1] [-18446];
    var d := CanyonSearch(a, b);
    expect d == 18044;
  }

  // Test case for combination {1}/O|b|>=2:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-177];
    var b := new int[2] [-177, -177];
    var d := CanyonSearch(a, b);
    expect d == 0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-2];
    var b := new int[1] [-3];
    var d := CanyonSearch(a, b);
    expect d == 1;
  }

  // Test case for combination {1}/R6:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-3];
    var b := new int[1] [-4];
    var d := CanyonSearch(a, b);
    expect d == 1;
  }

  // Test case for combination {1}/R7:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-4];
    var b := new int[1] [-5];
    var d := CanyonSearch(a, b);
    expect d == 1;
  }

  // Test case for combination {1}/R8:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-5];
    var b := new int[1] [-6];
    var d := CanyonSearch(a, b);
    expect d == 1;
  }

  // Test case for combination {1}/R9:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-6];
    var b := new int[1] [-7];
    var d := CanyonSearch(a, b);
    expect d == 1;
  }

  // Test case for combination {1}/R10:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-115];
    var b := new int[1] [-183];
    var d := CanyonSearch(a, b);
    expect d == 68;
  }

}

method Main()
{
  TestsForCanyonSearch();
  print "TestsForCanyonSearch: all non-failing tests passed!\n";
}
