// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Clover_canyon_search.dfy
// Method: CanyonSearch
// Generated: 2026-04-08 19:04:04

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
    case b[n] <= a[m] =>
      n := n + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [0];
    var b := new int[1] [0];
    var d := CanyonSearch(a, b);
    expect d == 0;
  }

  // Test case for combination {1}/Ba=1,b=2:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [7718];
    var b := new int[2] [7719, 7720];
    var d := CanyonSearch(a, b);
    expect d == 1;
  }

  // Test case for combination {1}/Ba=1,b=3:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [7719];
    var b := new int[3] [7719, 7720, 7721];
    var d := CanyonSearch(a, b);
    expect d == 0;
  }

  // Test case for combination {1}/Ba=2,b=1:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[2] [7718, 7719];
    var b := new int[1] [7720];
    var d := CanyonSearch(a, b);
    expect d == 1;
  }

  // Test case for combination {1}/Od>=2:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[2] [0, 0];
    var b := new int[2] [-11294, -11294];
    var d := CanyonSearch(a, b);
    expect d == 11294;
  }

  // Test case for combination {1}/Od=1:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[3] [7717, 7717, 7717];
    var b := new int[2] [7716, 7718];
    var d := CanyonSearch(a, b);
    expect d == 1;
  }

  // Test case for combination {1}/Od=0:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   ENSURES: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[4] [0, 0, 0, 0];
    var b := new int[2] [0, 0];
    var d := CanyonSearch(a, b);
    expect d == 0;
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
