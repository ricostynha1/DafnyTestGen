// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Clover_binary_search__556_BBR_false.dfy
// Method: BinarySearch
// Generated: 2026-04-08 16:42:01

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
  // Test case for combination {2}:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= n <= a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST: !(n == a.Length)
  //   POST: 0 < a.Length
  //   POST: !(a[0] < key)
  //   POST: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  //   ENSURES: 0 <= n <= a.Length
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   ENSURES: n == a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] < key
  //   ENSURES: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[1] [38];
    var key := 0;
    var n := BinarySearch(a, key);
    expect n == 0;
  }

  // Test case for combination {4}:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= n <= a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST: !(n == a.Length)
  //   POST: 0 < a.Length
  //   POST: !(a[(a.Length - 1)] < key)
  //   POST: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  //   ENSURES: 0 <= n <= a.Length
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   ENSURES: n == a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] < key
  //   ENSURES: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[1] [0];
    var key := 0;
    var n := BinarySearch(a, key);
    expect n == 0;
  }

  // Test case for combination {5}/On=0:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= n <= a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST: n == a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] < key
  //   POST: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  //   ENSURES: 0 <= n <= a.Length
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   ENSURES: n == a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] < key
  //   ENSURES: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[0] [];
    var key := 0;
    var n := BinarySearch(a, key);
    expect n == 0;
  }

}

method Failing()
{
  // Test case for combination {3}:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= n <= a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST: !(n == a.Length)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(a[i] < key)
  //   POST: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  //   ENSURES: 0 <= n <= a.Length
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   ENSURES: n == a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] < key
  //   ENSURES: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[3] [-1, 0, 0];
    var key := 0;
    var n := BinarySearch(a, key);
    // expect n == 1;
  }

  // Test case for combination {5}:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= n <= a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST: n == a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] < key
  //   POST: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  //   ENSURES: 0 <= n <= a.Length
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   ENSURES: n == a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] < key
  //   ENSURES: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[1] [-1];
    var key := 0;
    var n := BinarySearch(a, key);
    // expect n == 1;
  }

  // Test case for combination {4}/On>0:
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= n <= a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   POST: !(n == a.Length)
  //   POST: 0 < a.Length
  //   POST: !(a[(a.Length - 1)] < key)
  //   POST: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  //   ENSURES: 0 <= n <= a.Length
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] < key
  //   ENSURES: n == a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] < key
  //   ENSURES: forall i: int {:trigger a[i]} :: n <= i < a.Length ==> a[i] >= key
  {
    var a := new int[2] [-1, 0];
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
