// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Programs_tmp_tmp99966ew4_binary_search__642-642_AOI.dfy
// Method: BinarySearch
// Generated: 2026-04-24 09:48:16

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
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Rel:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == value
  //   POST Q4: index >= 0
  {
    var a := new int[2] [9, 10];
    var value := 9;
    var index := BinarySearch(a, value);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.BinarySearch(BigInteger[] a, BigInteger value) in C:\cygwin64\tmp\DafnyCBT_vqaspqfcdvg\runner.cs:line 5956
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_vqaspqfcdvg\runner.cs:line 5996
    // expect index == 0;
  }

  // Test case for combination {1}:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index ==> index < a.Length && a[index] == value
  //   POST Q2: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[1] [-1];
    var value := -10;
    var index := BinarySearch(a, value);
    expect 0 <= index ==> index < a.Length && a[index] == value;
    expect index < 0 ==> forall k: int :: 0 <= k < a.Length ==> a[k] != value;
    expect index == -1; // observed from implementation
  }

  // Test case for combination {2}/V3:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == value  // VACUOUS (forced true by other literals for this ins)
  //   POST Q4: index >= 0
  {
    var a := new int[1] [-10];
    var value := -10;
    var index := BinarySearch(a, value);
    expect index == 0;
  }

  // Test case for combination {1}/O|a|=0:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index ==> index < a.Length && a[index] == value
  //   POST Q2: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[0] [];
    var value := -10;
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
    var a := new int[2] [-2, -2];
    var value := -6;
    var index := BinarySearch(a, value);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.BinarySearch(BigInteger[] a, BigInteger value) in C:\cygwin64\tmp\DafnyCBT_vqaspqfcdvg\runner.cs:line 5956
    // runtime error: at _module.__default.TestCase__4() in C:\cygwin64\tmp\DafnyCBT_vqaspqfcdvg\runner.cs:line 6142
    // expect 0 <= index ==> index < a.Length && a[index] == value;
    // expect index < 0 ==> forall k: int :: 0 <= k < a.Length ==> a[k] != value;
  }

  // Test case for combination {1}/Ovalue=0:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index ==> index < a.Length && a[index] == value
  //   POST Q2: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[1] [-10];
    var value := 0;
    var index := BinarySearch(a, value);
    expect 0 <= index ==> index < a.Length && a[index] == value;
    expect index < 0 ==> forall k: int :: 0 <= k < a.Length ==> a[k] != value;
    expect index == -1; // observed from implementation
  }

  // Test case for combination {1}/Ovalue>0:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index ==> index < a.Length && a[index] == value
  //   POST Q2: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[1] [9];
    var value := 2;
    var index := BinarySearch(a, value);
    expect 0 <= index ==> index < a.Length && a[index] == value;
    expect index < 0 ==> forall k: int :: 0 <= k < a.Length ==> a[k] != value;
    expect index == -1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Ovalue=0:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index
  //   POST Q2: index < a.Length
  //   POST Q3: a[index] == value
  //   POST Q4: index >= 0
  {
    var a := new int[4] [-1, -1, -1, 0];
    var value := 0;
    var index := BinarySearch(a, value);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.BinarySearch(BigInteger[] a, BigInteger value) in C:\cygwin64\tmp\DafnyCBT_vqaspqfcdvg\runner.cs:line 5956
    // runtime error: at _module.__default.TestCase__7() in C:\cygwin64\tmp\DafnyCBT_vqaspqfcdvg\runner.cs:line 6265
    // expect index == 3;
  }

  // Test case for combination {1}/R6:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index ==> index < a.Length && a[index] == value
  //   POST Q2: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[1] [6];
    var value := -9;
    var index := BinarySearch(a, value);
    expect 0 <= index ==> index < a.Length && a[index] == value;
    expect index < 0 ==> forall k: int :: 0 <= k < a.Length ==> a[k] != value;
    expect index == -1; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  a != null && 0 <= a.Length && sorted(a)
  //   POST Q1: 0 <= index ==> index < a.Length && a[index] == value
  //   POST Q2: index < 0 ==> forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] != value
  {
    var a := new int[1] [-1];
    var value := -7;
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
