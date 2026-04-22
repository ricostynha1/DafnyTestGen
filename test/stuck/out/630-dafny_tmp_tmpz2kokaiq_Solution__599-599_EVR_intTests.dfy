// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\stuck\in\630-dafny_tmp_tmpz2kokaiq_Solution__599-599_EVR_int.dfy
// Method: BinarySearch
// Generated: 2026-04-22 19:22:52

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
  // Test case for combination {2}/Rel:
  //   PRE:  sorted(a)
  //   POST Q1: 0 <= index < a.Length ==> a[index] == x
  //   POST Q2: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[1] [-4];
    var x := -10;
    var index := BinarySearch(a, x);
    expect 0 <= index < a.Length ==> a[index] == x;
    expect index == -1;
  }

  // Test case for combination {3}/Bx=a_len:
  //   PRE:  sorted(a)
  //   POST Q1: 0 <= index < a.Length ==> a[index] == x
  //   POST Q2: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[2] [2, 10];
    var x := 2;
    var index := BinarySearch(a, x);
    expect 0 <= index < a.Length ==> a[index] == x;
    expect index == 0;
  }

  // Test case for combination {3}/Bx=a_len-1:
  //   PRE:  sorted(a)
  //   POST Q1: 0 <= index < a.Length ==> a[index] == x
  //   POST Q2: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[3] [10, 10, 10];
    var x := 2;
    var index := BinarySearch(a, x);
    expect 0 <= index < a.Length ==> a[index] == x;
    expect index == -1;
  }

  // Test case for combination {3}/Bindex=0:
  //   PRE:  sorted(a)
  //   POST Q1: 0 <= index < a.Length ==> a[index] == x
  //   POST Q2: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[0] [];
    var x := -9;
    var index := BinarySearch(a, x);
    expect 0 <= index < a.Length ==> a[index] == x;
    expect index == -1;
  }

  // Test case for combination {4}/Bindex=1:
  //   PRE:  sorted(a)
  //   POST Q1: 0 <= index < a.Length ==> a[index] == x
  //   POST Q2: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[2] [-10, 10];
    var x := 10;
    var index := BinarySearch(a, x);
    expect 0 <= index < a.Length ==> a[index] == x;
    expect index == 1;
  }

  // Test case for combination {1}/O|a|=0:
  //   PRE:  sorted(a)
  //   POST Q1: 0 <= index < a.Length ==> a[index] == x
  //   POST Q2: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[0] [];
    var x := -10;
    var index := BinarySearch(a, x);
    expect 0 <= index < a.Length ==> a[index] == x;
    expect index == -1;
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  sorted(a)
  //   POST Q1: 0 <= index < a.Length ==> a[index] == x
  //   POST Q2: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[2] [-10, -10];
    var x := -9;
    var index := BinarySearch(a, x);
    expect 0 <= index < a.Length ==> a[index] == x;
    expect index == -1;
  }

}

method Failing()
{
  // Test case for combination {1}/Rel:
  //   PRE:  sorted(a)
  //   POST Q1: 0 <= index < a.Length ==> a[index] == x
  //   POST Q2: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[1] [-10];
    var x := -10;
    var index := BinarySearch(a, x);
    // expect 0 <= index < a.Length ==> a[index] == x; // got true
    // expect index == -1 ==> forall i: int :: 0 <= i < a.Length ==> a[i] != x; // got -1
  }

  // Test case for combination {4}/Rel:
  //   PRE:  sorted(a)
  //   POST Q1: 0 <= index < a.Length ==> a[index] == x
  //   POST Q2: index == -1 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[2] [-10, 6];
    var x := -10;
    var index := BinarySearch(a, x);
    // expect 0 <= index < a.Length ==> a[index] == x; // got true
    // expect index == -1 ==> forall i: int :: 0 <= i < a.Length ==> a[i] != x; // got -1
  }

}

method Main()
{
  Passing();
  Failing();
}
