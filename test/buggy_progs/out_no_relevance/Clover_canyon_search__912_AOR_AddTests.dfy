// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_canyon_search__912_AOR_Add.dfy
// Method: CanyonSearch
// Generated: 2026-04-24 12:55:37

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
    var t := if a[m] < b[n] then b[n] + a[m] else a[m] - b[n];
    d := if t < d then t else d;
    if
    case a[m] <= b[n] =>
      m := m + 1;
    case b[n] <= a[m] =>
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
    var a := new int[1] [-1];
    var b := new int[1] [-10];
    var d := CanyonSearch(a, b);
    expect d == 9;
  }

  // Test case for combination {1}/Bd=0:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [10];
    var b := new int[1] [10];
    var d := CanyonSearch(a, b);
    expect d == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bd=1:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-10];
    var b := new int[1] [-9];
    var d := CanyonSearch(a, b);
    // expect d == 1; // got -19
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[2] [-10, 2];
    var b := new int[1] [8];
    var d := CanyonSearch(a, b);
    // expect d == 6; // got -2
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|b|>=2:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-2];
    var b := new int[2] [-10, 4];
    var d := CanyonSearch(a, b);
    // expect d == 6; // got 2
  }

  // Test case for combination {1}/R6:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [9];
    var b := new int[1] [-10];
    var d := CanyonSearch(a, b);
    expect d == 19;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-9];
    var b := new int[1] [3];
    var d := CanyonSearch(a, b);
    // expect d == 12; // got -6
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-4];
    var b := new int[1] [9];
    var d := CanyonSearch(a, b);
    // expect d == 13; // got 5
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-10];
    var b := new int[1] [7];
    var d := CanyonSearch(a, b);
    // expect d == 17; // got -3
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST Q1: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST Q2: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-10];
    var b := new int[1] [2];
    var d := CanyonSearch(a, b);
    // expect d == 12; // got -8
  }

}

method Main()
{
  TestsForCanyonSearch();
  print "TestsForCanyonSearch: all non-failing tests passed!\n";
}
