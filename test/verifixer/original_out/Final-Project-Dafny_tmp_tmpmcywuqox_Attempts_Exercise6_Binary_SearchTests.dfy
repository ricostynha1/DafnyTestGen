// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Exercise6_Binary_Search.dfy
// Method: binarySearch
// Generated: 2026-04-08 19:11:55

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
      left := med + 1;
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


method Passing()
{
  // Test case for combination {16}:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= pos < a.Length
  //   POST: a[pos] == val
  //   POST: !(pos < 0)
  //   POST: !(pos >= a.Length)
  //   POST: 0 < a.Length
  //   POST: !(a[0] != val)
  //   ENSURES: 0 <= pos < a.Length ==> a[pos] == val
  //   ENSURES: pos < 0 || pos >= a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[1] [38];
    var val := 38;
    var pos := binarySearch(a, val);
    expect pos == 0;
  }

  // Test case for combination {17}:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= pos < a.Length
  //   POST: a[pos] == val
  //   POST: !(pos < 0)
  //   POST: !(pos >= a.Length)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(a[i] != val)
  //   ENSURES: 0 <= pos < a.Length ==> a[pos] == val
  //   ENSURES: pos < 0 || pos >= a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[3] [-38, -38, 7719];
    var val := -38;
    var pos := binarySearch(a, val);
    expect pos == 1;
    expect 0 <= pos < a.Length;
    expect a[pos] == val;
    expect !(pos < 0);
    expect !(pos >= a.Length);
    expect exists i :: 1 <= i < (a.Length - 1) && !(a[i] != val);
  }

  // Test case for combination {16}/Opos=0:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= pos < a.Length
  //   POST: a[pos] == val
  //   POST: !(pos < 0)
  //   POST: !(pos >= a.Length)
  //   POST: 0 < a.Length
  //   POST: !(a[0] != val)
  //   ENSURES: 0 <= pos < a.Length ==> a[pos] == val
  //   ENSURES: pos < 0 || pos >= a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[2] [7757, 7758];
    var val := 7757;
    var pos := binarySearch(a, val);
    expect pos == 0;
  }

  // Test case for combination {17}/Opos>0:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= pos < a.Length
  //   POST: a[pos] == val
  //   POST: !(pos < 0)
  //   POST: !(pos >= a.Length)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(a[i] != val)
  //   ENSURES: 0 <= pos < a.Length ==> a[pos] == val
  //   ENSURES: pos < 0 || pos >= a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[4] [7719, 7720, 7720, 7721];
    var val := 7720;
    var pos := binarySearch(a, val);
    expect pos == 2;
    expect 0 <= pos < a.Length;
    expect a[pos] == val;
    expect !(pos < 0);
    expect !(pos >= a.Length);
    expect exists i :: 1 <= i < (a.Length - 1) && !(a[i] != val);
  }

  // Test case for combination {18}/Opos>0:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: 0 <= pos < a.Length
  //   POST: a[pos] == val
  //   POST: !(pos < 0)
  //   POST: !(pos >= a.Length)
  //   POST: 0 < a.Length
  //   POST: !(a[(a.Length - 1)] != val)
  //   ENSURES: 0 <= pos < a.Length ==> a[pos] == val
  //   ENSURES: pos < 0 || pos >= a.Length ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[2] [7757, 7758];
    var val := 7758;
    var pos := binarySearch(a, val);
    expect pos == 1;
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
