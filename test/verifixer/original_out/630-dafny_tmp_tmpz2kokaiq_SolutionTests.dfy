// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\630-dafny_tmp_tmpz2kokaiq_Solution.dfy
// Method: BinarySearch
// Generated: 2026-04-08 19:03:08

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
    if a[mid] < x {
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
  // Test case for combination {12}:
  //   PRE:  sorted(a)
  //   POST: 0 <= index < a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   POST: !(index == -1)
  //   POST: 0 < a.Length
  //   POST: !(a[0] != x)
  //   ENSURES: 0 <= index < a.Length ==> a[index] == x
  //   ENSURES: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[1] [3];
    var x := 3;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {13}:
  //   PRE:  sorted(a)
  //   POST: 0 <= index < a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   POST: !(index == -1)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(a[i] != x)
  //   ENSURES: 0 <= index < a.Length ==> a[index] == x
  //   ENSURES: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[3] [16, 9, 23];
    var x := 9;
    var index := BinarySearch(a, x);
    expect index == 1;
  }

  // Test case for combination {12}/Oindex=0:
  //   PRE:  sorted(a)
  //   POST: 0 <= index < a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   POST: !(index == -1)
  //   POST: 0 < a.Length
  //   POST: !(a[0] != x)
  //   ENSURES: 0 <= index < a.Length ==> a[index] == x
  //   ENSURES: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[2] [15, 13];
    var x := 15;
    var index := BinarySearch(a, x);
    expect index == 0;
  }

}

method Failing()
{
  // Test case for combination {13}/Oindex>0:
  //   PRE:  sorted(a)
  //   POST: 0 <= index < a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   POST: !(index == -1)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(a[i] != x)
  //   ENSURES: 0 <= index < a.Length ==> a[index] == x
  //   ENSURES: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[4] [18, 17, 17, 15];
    var x := 17;
    var index := BinarySearch(a, x);
    // expect 0 <= index < a.Length;
    // expect forall i: int :: 0 <= i < a.Length ==> a[i] != x;
    // expect !(index == -1);
    // expect exists i :: 1 <= i < (a.Length - 1) && !(a[i] != x);
  }

  // Test case for combination {14}/Oindex>0:
  //   PRE:  sorted(a)
  //   POST: 0 <= index < a.Length
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   POST: !(index == -1)
  //   POST: 0 < a.Length
  //   POST: !(a[(a.Length - 1)] != x)
  //   ENSURES: 0 <= index < a.Length ==> a[index] == x
  //   ENSURES: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[2] [17, 9];
    var x := 9;
    var index := BinarySearch(a, x);
    // expect index == 1;
  }

}

method Main()
{
  Passing();
  Failing();
}
