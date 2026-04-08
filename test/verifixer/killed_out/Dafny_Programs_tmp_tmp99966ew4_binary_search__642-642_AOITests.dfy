// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_Programs_tmp_tmp99966ew4_binary_search__642-642_AOI.dfy
// Method: BinarySearch
// Generated: 2026-04-08 16:45:58

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
    var mid := (low + high) / -2;
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
  // Test case for combination {6}:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST: 0 <= index
  //   POST: a[index] == value
  //   POST: !(index < 0)
  //   POST: !(index < 0)
  //   POST: 0 < a.Length
  //   POST: !(a[0] != value)
  //   ENSURES: 0 <= index ==> index < a.Length && a[index] == value
  //   ENSURES: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[1] [4];
    var value := 4;
    var index := BinarySearch(a, value);
    expect index == 0;
  }

  // Test case for combination {6}/Ba=1,value=0:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST: 0 <= index
  //   POST: a[index] == value
  //   POST: !(index < 0)
  //   POST: !(index < 0)
  //   POST: 0 < a.Length
  //   POST: !(a[0] != value)
  //   ENSURES: 0 <= index ==> index < a.Length && a[index] == value
  //   ENSURES: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[1] [0];
    var value := 0;
    var index := BinarySearch(a, value);
    expect index == 0;
  }

}

method Failing()
{
  // Test case for combination {7}:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST: 0 <= index
  //   POST: a[index] == value
  //   POST: !(index < 0)
  //   POST: !(index < 0)
  //   POST: exists k :: 1 <= k < (a.Length - 1) && !(a[k] != value)
  //   ENSURES: 0 <= index ==> index < a.Length && a[index] == value
  //   ENSURES: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[3] [17, 10, 25];
    var value := 10;
    var index := BinarySearch(a, value);
    // expect index == 1;
  }

  // Test case for combination {6}/Oindex=0:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST: 0 <= index
  //   POST: a[index] == value
  //   POST: !(index < 0)
  //   POST: !(index < 0)
  //   POST: 0 < a.Length
  //   POST: !(a[0] != value)
  //   ENSURES: 0 <= index ==> index < a.Length && a[index] == value
  //   ENSURES: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[2] [15, 13];
    var value := 15;
    var index := BinarySearch(a, value);
    // expect index == 0;
  }

  // Test case for combination {7}/Oindex>0:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST: 0 <= index
  //   POST: a[index] == value
  //   POST: !(index < 0)
  //   POST: !(index < 0)
  //   POST: exists k :: 1 <= k < (a.Length - 1) && !(a[k] != value)
  //   ENSURES: 0 <= index ==> index < a.Length && a[index] == value
  //   ENSURES: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[4] [19, 18, 18, 16];
    var value := 18;
    var index := BinarySearch(a, value);
    // expect 0 <= index;
    // expect a[index] == value;
    // expect !(index < 0);
    // expect !(index < 0);
    // expect exists k :: 1 <= k < (a.Length - 1) && !(a[k] != value);
  }

  // Test case for combination {8}/Oindex>0:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST: 0 <= index
  //   POST: a[index] == value
  //   POST: !(index < 0)
  //   POST: !(index < 0)
  //   POST: 0 < a.Length
  //   POST: !(a[(a.Length - 1)] != value)
  //   ENSURES: 0 <= index ==> index < a.Length && a[index] == value
  //   ENSURES: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[2] [18, 10];
    var value := 10;
    var index := BinarySearch(a, value);
    // expect index == 1;
  }

}

method Main()
{
  Passing();
  Failing();
}
