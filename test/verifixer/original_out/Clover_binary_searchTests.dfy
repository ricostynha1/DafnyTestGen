// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Clover_binary_search.dfy
// Method: BinarySearch
// Generated: 2026-04-22 21:26:17

// Clover_binary_search.dfy

method BinarySearch(a: array<int>, key: int) returns (n: int)
  requires forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  ensures 0 <= n <= a.Length
  ensures forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  ensures n == a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] < key
  ensures forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  decreases a, key
{
  var lo, hi := 0, a.Length;
  while lo < hi
    invariant 0 <= lo <= hi <= a.Length
    invariant forall i: int {:trigger a[i]} :: 0 <= i < lo ==> a[i] < key
    invariant forall i: int {:trigger a[i]} :: hi <= i < a.Length ==> a[i] >= key
    decreases hi - lo
  {
    var mid := (lo + hi) / 2;
    if a[mid] < key {
      lo := mid + 1;
    } else {
      hi := mid;
    }
  }
  n := lo;
}


method TestsForBinarySearch()
{
  // Test case for combination {1}/Rel:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q1: 0 <= n
  //   POST Q2: n < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST Q4: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[4] [-10, -10, -9, 16442];
    var key := -9;
    var n := BinarySearch(a, key);
    expect n == 2;
  }

  // Test case for combination {2}/Rel:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q1: 0 <= n
  //   POST Q2: n == a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST Q4: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] < key
  //   POST Q5: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[1] [9];
    var key := 10;
    var n := BinarySearch(a, key);
    expect n == 1;
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q1: 0 <= n
  //   POST Q2: n < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST Q4: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[1] [-10];
    var key := -10;
    var n := BinarySearch(a, key);
    expect n == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q1: 0 <= n
  //   POST Q2: n < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST Q4: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[2] [-10, 10];
    var key := -9;
    var n := BinarySearch(a, key);
    expect n == 1;
  }

}

method Main()
{
  TestsForBinarySearch();
  print "TestsForBinarySearch: all non-failing tests passed!\n";
}
