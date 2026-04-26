// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\MIEIC_mfes_tmp_tmpq3ho7nve_exams_special_20_p5__1038_ROR_Gt.dfy
// Method: binarySearch
// Generated: 2026-04-24 20:27:10

// MIEIC_mfes_tmp_tmpq3ho7nve_exams_special_20_p5.dfy

predicate sorted(a: array<T>, n: nat)
  requires n <= a.Length
  reads a
  decreases {a}, a, n
{
  forall i: int, j: int {:trigger a[j], a[i]} :: 
    0 <= i < j < n ==>
      a[i] <= a[j]
}

method binarySearch(a: array<T>, x: T) returns (index: int)
  requires sorted(a, a.Length)
  ensures sorted(a, a.Length)
  ensures 0 <= index <= a.Length
  ensures index > 0 ==> a[index - 1] <= x
  ensures index < a.Length ==> a[index] >= x
  decreases a, x
{
  var low, high := 0, a.Length;
  while low < high
    invariant 0 <= low <= high <= a.Length
    invariant low > 0 ==> a[low - 1] <= x
    invariant high < a.Length ==> a[high] >= x
    decreases high - low
  {
    var mid := low + (high - low) / 2;
    if {
      case a[mid] > x =>
        low := mid + 1;
      case a[mid] > x =>
        high := mid;
      case a[mid] == x =>
        return mid;
    }
  }
  return low;
}

method testBinarySearch()
{
  var a := new int[2] [1, 3];
  var id0 := binarySearch(a, 0);
  assert id0 == 0;
  var id1 := binarySearch(a, 1);
  assert id1 in {0, 1};
  var id2 := binarySearch(a, 2);
  assert id2 == 1;
  var id3 := binarySearch(a, 3);
  assert id3 in {1, 2};
  var id4 := binarySearch(a, 4);
  assert id4 == 2;
}

type T = int


method TestsForbinarySearch()
{
  // Test case for combination {1}:
  //   PRE:  sorted(a, a.Length)
  //   POST Q1: sorted(a, a.Length)
  //   POST Q2: 0 <= index
  //   POST Q3: index <= a.Length
  //   POST Q4: index <= 0
  //   POST Q5: index >= a.Length
  {
    var a := new T[0] [];
    var x := 0;
    var index := binarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {2}:
  //   PRE:  sorted(a, a.Length)
  //   POST Q1: sorted(a, a.Length)
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: index <= 0
  //   POST Q5: a[index] >= x
  {
    var a := new T[1] [175];
    var x := 175;
    var index := binarySearch(a, x);
    expect index == 0 || index == 1;
    expect index == 0; // observed from implementation
  }

  // Test case for combination {3}:
  //   PRE:  sorted(a, a.Length)
  //   POST Q1: sorted(a, a.Length)
  //   POST Q2: 0 <= index
  //   POST Q3: index <= a.Length
  //   POST Q4: index > 0
  //   POST Q5: a[index - 1] <= x
  //   POST Q6: index >= a.Length
  {
    var a := new T[1] [17];
    var x := 17;
    var index := binarySearch(a, x);
    expect index == 1 || index == 0;
    expect index == 0; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {4}:
  //   PRE:  sorted(a, a.Length)
  //   POST Q1: sorted(a, a.Length)
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: index > 0
  //   POST Q5: a[index - 1] <= x
  //   POST Q6: a[index] >= x
  {
    var a := new T[2] [-400, 30056];
    var x := 0;
    var index := binarySearch(a, x);
    // expect index == 1; // got 2
  }

  // Test case for combination {1}/Bx=1:
  //   PRE:  sorted(a, a.Length)
  //   POST Q1: sorted(a, a.Length)
  //   POST Q2: 0 <= index
  //   POST Q3: index <= a.Length
  //   POST Q4: index <= 0
  //   POST Q5: index >= a.Length
  {
    var a := new T[0] [];
    var x := 1;
    var index := binarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {1}/Bx=2:
  //   PRE:  sorted(a, a.Length)
  //   POST Q1: sorted(a, a.Length)
  //   POST Q2: 0 <= index
  //   POST Q3: index <= a.Length
  //   POST Q4: index <= 0
  //   POST Q5: index >= a.Length
  {
    var a := new T[0] [];
    var x := 2;
    var index := binarySearch(a, x);
    expect index == 0;
  }

  // Test case for combination {1}/Bx=a_len-1:
  //   PRE:  sorted(a, a.Length)
  //   POST Q1: sorted(a, a.Length)
  //   POST Q2: 0 <= index
  //   POST Q3: index <= a.Length
  //   POST Q4: index <= 0
  //   POST Q5: index >= a.Length
  {
    var a := new T[0] [];
    var x := -1;
    var index := binarySearch(a, x);
    expect index == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bx=1:
  //   PRE:  sorted(a, a.Length)
  //   POST Q1: sorted(a, a.Length)
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: index <= 0
  //   POST Q5: a[index] >= x
  {
    var a := new T[1] [176];
    var x := 1;
    var index := binarySearch(a, x);
    // expect index == 0; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bx=2:
  //   PRE:  sorted(a, a.Length)
  //   POST Q1: sorted(a, a.Length)
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: index <= 0
  //   POST Q5: a[index] >= x
  {
    var a := new T[1] [177];
    var x := 2;
    var index := binarySearch(a, x);
    // expect index == 0; // got 1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bx=a_len-1:
  //   PRE:  sorted(a, a.Length)
  //   POST Q1: sorted(a, a.Length)
  //   POST Q2: 0 <= index
  //   POST Q3: index < a.Length
  //   POST Q4: index <= 0
  //   POST Q5: a[index] >= x
  {
    var a := new T[1] [175];
    var x := 0;
    var index := binarySearch(a, x);
    // expect index == 0; // got 1
  }

}

method Main()
{
  TestsForbinarySearch();
  print "TestsForbinarySearch: all non-failing tests passed!\n";
}
