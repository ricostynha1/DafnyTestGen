// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Clover_canyon_search.dfy
// Method: CanyonSearch
// Generated: 2026-03-25 22:36:28

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
  {
    var a := new int[1] [19257];
    var b := new int[1] [9531];
    var d := CanyonSearch(a, b);
    expect d == 9726;
  }

  // Test case for combination {1}:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[1] [-5762];
    var b := new int[2] [-6906, -6905];
    var d := CanyonSearch(a, b);
    expect d == 1143;
  }

  // Test case for combination {1}/Ba=3,b=1:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[3] [-9931, -9930, -3934];
    var b := new int[1] [-6932];
    var d := CanyonSearch(a, b);
    expect d == 2998;
  }

  // Test case for combination {1}/Ba=2,b=3:
  //   PRE:  a.Length != 0 && b.Length != 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   PRE:  forall i: int, j: int {:trigger b[j], b[i]} :: 0 <= i < j < b.Length ==> b[i] <= b[j]
  //   POST: exists i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length && d == if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  //   POST: forall i: int, j: int {:trigger b[j], a[i]} :: 0 <= i < a.Length && 0 <= j < b.Length ==> d <= if a[i] < b[j] then b[j] - a[i] else a[i] - b[j]
  {
    var a := new int[2] [9402, 12907];
    var b := new int[3] [-4517, 5015, 17294];
    var d := CanyonSearch(a, b);
    expect d == 4387;
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
