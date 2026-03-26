// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_Programs_tmp_tmp99966ew4_binary_search.dfy
// Method: BinarySearch
// Generated: 2026-03-26 14:55:48

// Dafny_Programs_tmp_tmp99966ew4_binary_search.dfy

predicate sorted(a: array<int>)
  requires a != null
  reads a
  decreases {a}, a
{
  forall j: int, k: int {:trigger a[k], a[j]} :: 
    0 <= j < k < a.Length ==>
      a[j] <= a[k]
}

method BinarySearch(a: array<int>, value: int) returns (index: int)
  requires a != null && 0 <= a.Length && sorted(a)
  ensures 0 <= index ==> index < a.Length && a[index] == value
  ensures index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  decreases a, value
{
  var low, high := 0, a.Length;
  while low < high
    invariant 0 <= low <= high <= a.Length
    invariant forall i: int {:trigger a[i]} :: 0 <= i < a.Length && !(low <= i < high) ==> a[i] != value
    decreases high - low
  {
    var mid := (low + high) / 2;
    if a[mid] < value {
      low := mid + 1;
    } else if value < a[mid] {
      high := mid;
    } else {
      return mid;
    }
  }
  return -1;
}


method Passing()
{
  // Test case for combination {2}:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST: !(0 <= index)
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[1] [11];
    var value := 9;
    var index := BinarySearch(a, value);
    expect index == -1;
  }

  // Test case for combination {3}:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST: index < a.Length
  //   POST: a[index] == value
  //   POST: !(index < 0)
  {
    var a := new int[1] [10];
    var value := 10;
    var index := BinarySearch(a, value);
    expect index == 0;
  }

  // Test case for combination {2}:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST: !(0 <= index)
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[0] [];
    var value := 10;
    var index := BinarySearch(a, value);
    expect index == -1;
  }

  // Test case for combination {3}:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST: index < a.Length
  //   POST: a[index] == value
  //   POST: !(index < 0)
  {
    var a := new int[1] [12];
    var value := 12;
    var index := BinarySearch(a, value);
    expect index == 0;
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
