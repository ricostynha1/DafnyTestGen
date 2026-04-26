// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Programs_tmp_tmp99966ew4_binary_search__642-642_AOI.dfy
// Method: BinarySearch
// Generated: 2026-04-24 19:43:16

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


method TestsForBinarySearch()
{
  // Test case for combination {1}:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index ==> index < a.Length && a[index] == value
  //   POST Q2: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[0] [];
    var value := 0;
    var index := BinarySearch(a, value);
    expect 0 <= index ==> index < a.Length && a[index] == value;
    expect index < 0 ==> forall k: int :: 0 <= k < a.Length ==> a[k] != value;
    expect index == -1; // observed from implementation
  }

  // Test case for combination {2}:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == value
  //   POST Q4: index >= 0
  {
    var a := new int[1] [17];
    var value := 17;
    var index := BinarySearch(a, value);
    expect index == 0;
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index ==> index < a.Length && a[index] == value
  //   POST Q2: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[1] [2];
    var value := 3;
    var index := BinarySearch(a, value);
    expect 0 <= index ==> index < a.Length && a[index] == value;
    expect index < 0 ==> forall k: int :: 0 <= k < a.Length ==> a[k] != value;
    expect index == -1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index ==> index < a.Length && a[index] == value
  //   POST Q2: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[2] [-400, 175];
    var value := 8;
    var index := BinarySearch(a, value);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.BinarySearch(BigInteger[] a, BigInteger value) in C:\cygwin64\tmp\DafnyCBT_gkupdu2n4l4\runner.cs:line 5955
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyCBT_gkupdu2n4l4\runner.cs:line 6107
    // expect 0 <= index ==> index < a.Length && a[index] == value;
    // expect index < 0 ==> forall k: int :: 0 <= k < a.Length ==> a[k] != value;
  }

  // Test case for combination {1}/Ovalue<0:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index ==> index < a.Length && a[index] == value
  //   POST Q2: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[0] [];
    var value := -1;
    var index := BinarySearch(a, value);
    expect 0 <= index ==> index < a.Length && a[index] == value;
    expect index < 0 ==> forall k: int :: 0 <= k < a.Length ==> a[k] != value;
    expect index == -1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/O|a|>=2:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == value
  //   POST Q4: index >= 0
  {
    var a := new int[2] [-17869, 400];
    var value := 400;
    var index := BinarySearch(a, value);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.BinarySearch(BigInteger[] a, BigInteger value) in C:\cygwin64\tmp\DafnyCBT_gkupdu2n4l4\runner.cs:line 5955
    // runtime error: at _module.__default.TestCase__5() in C:\cygwin64\tmp\DafnyCBT_gkupdu2n4l4\runner.cs:line 6187
    // expect index == 1;
  }

  // Test case for combination {2}/Ovalue=0:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == value
  //   POST Q4: index >= 0
  {
    var a := new int[1] [0];
    var value := 0;
    var index := BinarySearch(a, value);
    expect index == 0;
  }

  // Test case for combination {2}/Ovalue<0:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == value
  //   POST Q4: index >= 0
  {
    var a := new int[1] [-1];
    var value := -1;
    var index := BinarySearch(a, value);
    expect index == 0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index ==> index < a.Length && a[index] == value
  //   POST Q2: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[0] [];
    var value := 9;
    var index := BinarySearch(a, value);
    expect 0 <= index ==> index < a.Length && a[index] == value;
    expect index < 0 ==> forall k: int :: 0 <= k < a.Length ==> a[k] != value;
    expect index == -1; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index ==> index < a.Length && a[index] == value
  //   POST Q2: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[0] [];
    var value := 10;
    var index := BinarySearch(a, value);
    expect 0 <= index ==> index < a.Length && a[index] == value;
    expect index < 0 ==> forall k: int :: 0 <= k < a.Length ==> a[k] != value;
    expect index == -1; // observed from implementation
  }

}

method Main()
{
  TestsForBinarySearch();
  print "TestsForBinarySearch: all non-failing tests passed!\n";
}
