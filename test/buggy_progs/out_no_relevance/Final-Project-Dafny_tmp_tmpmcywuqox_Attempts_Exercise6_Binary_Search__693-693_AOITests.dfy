// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Exercise6_Binary_Search__693-693_AOI.dfy
// Method: binarySearch
// Generated: 2026-04-24 13:58:47

// Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Exercise6_Binary_Search.dfy

method binarySearch(a: array<int>, val: int) returns (pos: int)
  requires a.Length > 0
  requires forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  ensures 0 <= pos < a.Length ==> a[pos] == val
  ensures pos < 0 || pos >= a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  decreases a, val
{
  var left := 0;
  var right := a.Length;
  if a[left] > val || a[right - 1] < val {
    return -1;
  }
  while left < right
    invariant 0 <= left <= right <= a.Length
    invariant forall i: int {:trigger a[i]} :: 0 <= i < a.Length && !(left <= i < right) ==> a[i] != val
    decreases right - left
  {
    var med := (left + right) / 2;
    assert left <= med <= right;
    if a[med] < val {
      left := med + -1;
    } else if a[med] > val {
      right := med;
    } else {
      assert a[med] == val;
      pos := med;
      return;
    }
  }
  return -1;
}


method TestsForbinarySearch()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q1: 0 <= pos < a.Length ==> a[pos] == val
  //   POST Q2: pos < 0 || pos >= a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[1] [10];
    var val := -10;
    var pos := binarySearch(a, val);
    expect 0 <= pos < a.Length ==> a[pos] == val;
    expect pos < 0 || pos >= a.Length ==> forall i: int :: 0 <= i < a.Length ==> a[i] != val;
    expect pos == -1; // observed from implementation
  }

  // Test case for combination {3}:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q1: 0 <= pos
  //   POST Q2: pos < a.Length
  //   POST Q3: a[pos] == val
  //   POST Q4: pos >= 0
  {
    var a := new int[1] [-10];
    var val := -10;
    var pos := binarySearch(a, val);
    expect pos == 0;
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q1: 0 <= pos < a.Length ==> a[pos] == val
  //   POST Q2: pos < 0 || pos >= a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[2] [-7, 7];
    var val := -9;
    var pos := binarySearch(a, val);
    expect 0 <= pos < a.Length ==> a[pos] == val;
    expect pos < 0 || pos >= a.Length ==> forall i: int :: 0 <= i < a.Length ==> a[i] != val;
    expect pos == -1; // observed from implementation
  }

  // Test case for combination {1}/Oval=0:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q1: 0 <= pos < a.Length ==> a[pos] == val
  //   POST Q2: pos < 0 || pos >= a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[1] [-1];
    var val := 0;
    var pos := binarySearch(a, val);
    expect 0 <= pos < a.Length ==> a[pos] == val;
    expect pos < 0 || pos >= a.Length ==> forall i: int :: 0 <= i < a.Length ==> a[i] != val;
    expect pos == -1; // observed from implementation
  }

  // Test case for combination {1}/Oval>0:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q1: 0 <= pos < a.Length ==> a[pos] == val
  //   POST Q2: pos < 0 || pos >= a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[1] [10];
    var val := 2;
    var pos := binarySearch(a, val);
    expect 0 <= pos < a.Length ==> a[pos] == val;
    expect pos < 0 || pos >= a.Length ==> forall i: int :: 0 <= i < a.Length ==> a[i] != val;
    expect pos == -1; // observed from implementation
  }

  // Test case for combination {2}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q1: 0 <= pos < a.Length ==> a[pos] == val
  //   POST Q2: pos < 0 || pos >= a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[2] [-3, 6];
    var val := -9;
    var pos := binarySearch(a, val);
    expect 0 <= pos < a.Length ==> a[pos] == val;
    expect pos < 0 || pos >= a.Length ==> forall i: int :: 0 <= i < a.Length ==> a[i] != val;
    expect pos == -1; // observed from implementation
  }

  // Test case for combination {2}/Oval=0:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q1: 0 <= pos < a.Length ==> a[pos] == val
  //   POST Q2: pos < 0 || pos >= a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[1] [-10];
    var val := 0;
    var pos := binarySearch(a, val);
    expect 0 <= pos < a.Length ==> a[pos] == val;
    expect pos < 0 || pos >= a.Length ==> forall i: int :: 0 <= i < a.Length ==> a[i] != val;
    expect pos == -1; // observed from implementation
  }

  // Test case for combination {2}/Oval>0:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q1: 0 <= pos < a.Length ==> a[pos] == val
  //   POST Q2: pos < 0 || pos >= a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[1] [-1];
    var val := 2;
    var pos := binarySearch(a, val);
    expect 0 <= pos < a.Length ==> a[pos] == val;
    expect pos < 0 || pos >= a.Length ==> forall i: int :: 0 <= i < a.Length ==> a[i] != val;
    expect pos == -1; // observed from implementation
  }

  // Test case for combination {3}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q1: 0 <= pos
  //   POST Q2: pos < a.Length
  //   POST Q3: a[pos] == val
  //   POST Q4: pos >= 0
  {
    var a := new int[2] [-10, -1];
    var val := -1;
    var pos := binarySearch(a, val);
    expect pos == 1;
  }

}

method Main()
{
  TestsForbinarySearch();
  print "TestsForbinarySearch: all non-failing tests passed!\n";
}
