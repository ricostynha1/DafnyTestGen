// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Clover_binary_search__556_BBR_false.dfy
// Method: BinarySearch
// Generated: 2026-03-26 14:55:10

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
    if false {
      lo := mid + 1;
    } else {
      hi := mid;
    }
  }
  n := lo;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= n <= a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST: !(n == a.Length)
  //   POST: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[1] [1236];
    var key := 0;
    var n := BinarySearch(a, key);
    expect n == 0;
  }

  // Test case for combination {1}:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= n <= a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST: !(n == a.Length)
  //   POST: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[1] [-1];
    var key := -1;
    var n := BinarySearch(a, key);
    expect n == 0;
  }

  // Test case for combination {2}:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= n <= a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] < key
  //   POST: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[0] [];
    var key := -1;
    var n := BinarySearch(a, key);
    expect n == 0;
  }

}

method Failing()
{
  // Test case for combination {2}:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= n <= a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] < key
  //   POST: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[1] [-1];
    var key := 0;
    var n := BinarySearch(a, key);
    // expect n == 1;
  }

}

method Main()
{
  Passing();
  Failing();
}
