// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\630-dafny_tmp_tmpz2kokaiq_Solution__599-599_EVR_int.dfy
// Method: BinarySearch
// Generated: 2026-04-01 22:22:33

// 630-dafny_tmp_tmpz2kokaiq_Solution.dfy

function sorted(a: array<int>): bool
  reads a
  decreases {a}, a
{
  forall i: int, j: int {:trigger a[j], a[i]} :: 
    0 <= i < j < a.Length ==>
      a[i] <= a[j]
}

method BinarySearch(a: array<int>, x: int) returns (index: int)
  requires sorted(a)
  ensures 0 <= index < a.Length ==> a[index] == x
  ensures index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  decreases a, x
{
  var low := 0;
  var high := a.Length - 1;
  var mid := 0;
  while low <= high
    invariant 0 <= low <= high + 1 <= a.Length
    invariant x !in a[..low] && x !in a[high + 1..]
    decreases high - low
  {
    mid := (high + low) / 2;
    if a[mid] < 0 {
      low := mid + 1;
    } else if a[mid] > x {
      high := mid - 1;
    } else {
      return mid;
    }
  }
  return -1;
}


method Passing()
{
  // Test case for combination {3}:
  //   PRE:  sorted(a)
  //   POST: a[index] == x
  //   POST: !(index == -1)
  {
    var a := new int[1] [9];
    var x := 9;
    expect sorted(a); // PRE-CHECK
    var index := BinarySearch(a, x);
    expect index == 0;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  sorted(a)
  //   POST: !(0 <= index < a.Length)
  //   POST: !(index == -1)
  {
    var a := new int[1] [8];
    var x := 8;
    // expect sorted(a); // PRE-CHECK
    var index := BinarySearch(a, x);
    // expect !(0 <= index < a.Length);
    // expect !(index == -1);
  }

  // Test case for combination {1,2}:
  //   PRE:  sorted(a)
  //   POST: !(0 <= index < a.Length)
  //   POST: !(index == -1)
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[1] [10];
    var x := 8;
    // expect sorted(a); // PRE-CHECK
    var index := BinarySearch(a, x);
    // expect !(0 <= index < a.Length);
    // expect !(index == -1);
    // expect forall i: int :: 0 <= i < a.Length ==> a[i] != x;
  }

}

method Main()
{
  Passing();
  Failing();
}
