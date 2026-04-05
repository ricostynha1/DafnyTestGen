// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\MIEIC_mfes_tmp_tmpq3ho7nve_TP3_binary_search__842_ROR_Neq.dfy
// Method: binarySearch
// Generated: 2026-04-05 23:55:03

// MIEIC_mfes_tmp_tmpq3ho7nve_TP3_binary_search.dfy

predicate isSorted(a: array<int>)
  reads a
  decreases {a}, a
{
  forall i: int, j: int {:trigger a[j], a[i]} :: 
    0 <= i < j < a.Length ==>
      a[i] <= a[j]
}

method binarySearch(a: array<int>, x: int) returns (index: int)
  requires isSorted(a)
  ensures -1 <= index < a.Length
  ensures if index != -1 then a[index] == x else x !in a[..]
  decreases a, x
{
  var low, high := 0, a.Length;
  while low < high
    invariant 0 <= low <= high <= a.Length && x !in a[..low] && x !in a[high..]
    decreases high - low
  {
    var mid := low + (high - low) / 2;
    if {
      case a[mid] < x =>
        low := mid + 1;
      case a[mid] > x =>
        high := mid;
      case a[mid] != x =>
        return mid;
    }
  }
  return -1;
}

method testBinarySearch()
{
  var a := new int[] [1, 4, 4, 6, 8];
  assert a[..] == [1, 4, 4, 6, 8];
  var id1 := binarySearch(a, 6);
  assert a[3] == 6;
  assert id1 == 3;
  var id2 := binarySearch(a, 3);
  assert id2 == -1;
  var id3 := binarySearch(a, 4);
  assert a[1] == 4 && a[2] == 4;
  assert id3 in {1, 2};
}


method Passing()
{
  // Test case for combination {2}:
  //   PRE:  isSorted(a)
  //   POST: -1 <= index < a.Length
  //   POST: !(index != -1)
  //   POST: x !in a[..]
  {
    var a := new int[1] [9];
    var x := 8;
    expect isSorted(a); // PRE-CHECK
    var index := binarySearch(a, x);
    expect index == -1;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  isSorted(a)
  //   POST: -1 <= index < a.Length
  //   POST: index != -1
  //   POST: a[index] == x
  {
    var a := new int[1] [3];
    var x := 3;
    // expect isSorted(a); // PRE-CHECK
    var index := binarySearch(a, x);
    // expect index == 0;
  }

  // Test case for combination {1}/Ba=1,x=0:
  //   PRE:  isSorted(a)
  //   POST: -1 <= index < a.Length
  //   POST: index != -1
  //   POST: a[index] == x
  {
    var a := new int[1] [0];
    var x := 0;
    // expect isSorted(a); // PRE-CHECK
    var index := binarySearch(a, x);
    // expect index == 0;
  }

  // Test case for combination {1}/Ba=1,x=1:
  //   PRE:  isSorted(a)
  //   POST: -1 <= index < a.Length
  //   POST: index != -1
  //   POST: a[index] == x
  {
    var a := new int[1] [1];
    var x := 1;
    // expect isSorted(a); // PRE-CHECK
    var index := binarySearch(a, x);
    // expect index == 0;
  }

}

method Main()
{
  Passing();
  Failing();
}
