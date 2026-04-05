// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Exercise6_Binary_Search__687-687_EVR_int.dfy
// Method: binarySearch
// Generated: 2026-04-05 23:43:46

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
      left := 0 + 1;
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
  // Test case for combination {2}:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: !(0 <= pos < a.Length)
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[1] [38];
    var val := 9;
    var pos := binarySearch(a, val);
    // expect pos == -1; // (actual runtime value — not uniquely determined by spec)
    expect !(0 <= pos < a.Length);
    expect forall i: int :: 0 <= i < a.Length ==> a[i] != val;
  }

  // Test case for combination {3}:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: a[pos] == val
  //   POST: !(pos < 0)
  //   POST: !(pos >= a.Length)
  {
    var a := new int[1] [38];
    var val := 38;
    var pos := binarySearch(a, val);
    expect pos == 0;
  }

  // Test case for combination {2}/Ba=3,val=0:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: !(0 <= pos < a.Length)
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[3] [-3, -2, -1];
    var val := 0;
    var pos := binarySearch(a, val);
    // expect pos == -1; // (actual runtime value — not uniquely determined by spec)
    expect !(0 <= pos < a.Length);
    expect forall i: int :: 0 <= i < a.Length ==> a[i] != val;
  }

  // Test case for combination {2}/Ba=2,val=1:
  //   PRE:  a.Length > 0
  //   PRE:  forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: !(0 <= pos < a.Length)
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != val
  {
    var a := new int[2] [-7720, -7719];
    var val := 1;
    var pos := binarySearch(a, val);
    // expect pos == -1; // (actual runtime value — not uniquely determined by spec)
    expect !(0 <= pos < a.Length);
    expect forall i: int :: 0 <= i < a.Length ==> a[i] != val;
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
