// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\feup-mfes_tmp_tmp6_a1y5a5_examples_SelectionSort__1657_LVR_4.0.dfy
// Method: selectionSort
// Generated: 2026-04-24 13:54:24

// feup-mfes_tmp_tmp6_a1y5a5_examples_SelectionSort.dfy

predicate isSorted(a: array<real>, from: nat, to: nat)
  requires 0 <= from <= to <= a.Length
  reads a
  decreases {a}, a, from, to
{
  forall i: int, j: int {:trigger a[j], a[i]} :: 
    from <= i < j < to ==>
      a[i] <= a[j]
}

method selectionSort(a: array<real>)
  modifies a
  ensures isSorted(a, 0, a.Length)
  ensures multiset(a[..]) == multiset(old(a[..]))
  decreases a
{
  var i := 0;
  while i < a.Length - 1
    invariant 0 <= i <= a.Length
    invariant isSorted(a, 0, i)
    invariant forall lhs: int, rhs: int {:trigger a[rhs], a[lhs]} :: 0 <= lhs < i <= rhs < a.Length ==> a[lhs] <= a[rhs]
    invariant multiset(a[..]) == multiset(old(a[..]))
    decreases a.Length - 1 - i
  {
    var j := findMin(a, i, a.Length);
    a[i], a[j] := a[j], a[i];
    i := i + 1;
  }
}

method findMin(a: array<real>, from: nat, to: nat)
    returns (index: nat)
  requires 0 <= from < to <= a.Length
  ensures from <= index < to
  ensures forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  decreases a, from, to
{
  var i := from + 1;
  index := from;
  while i < to
    invariant from <= index < i <= to
    invariant forall k: int {:trigger a[k]} :: from <= k < i ==> a[k] >= a[index]
    decreases a.Length - i
  {
    if a[i] < a[index] {
      index := i;
    }
    i := i + 1;
  }
}

method testSelectionSort()
{
  var a := new real[5] [9.0, 4.0, 6.0, 4.0, 8.0];
  assert a[..] == [9.0, 4.0, 6.0, 3.0, 8.0];
  selectionSort(a);
  assert a[..] == [3.0, 4.0, 6.0, 8.0, 9.0];
}

method testFindMin()
{
  var a := new real[5] [9.0, 5.0, 6.0, 4.0, 8.0];
  var m := findMin(a, 0, 5);
  assert a[3] == 4.0;
  assert m == 3;
}


method TestsForselectionSort()
{
  // Test case for combination {1}:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[0] [];
    selectionSort(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/O|a|=1:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[1] [2.0];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[2] [13.0, 12.0];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
    expect a[..] == [12.0, 13.0]; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[1] [14.0];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
  }

  // Test case for combination {1}/R5:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[1] [11.0];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
  }

  // Test case for combination {1}/R6:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[1] [15.0];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
  }

  // Test case for combination {1}/R7:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[1] [16.0];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
  }

  // Test case for combination {1}/R8:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[1] [17.0];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
  }

  // Test case for combination {1}/R9:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[1] [19.0];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
  }

  // Test case for combination {1}/R10:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[1] [18.0];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
  }

}

method TestsForfindMin()
{
  // Test case for combination {1}:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[3] [58618.0, 58617.5, 58618.0];
    var from := 2;
    var to := 3;
    var index := findMin(a, from, to);
    expect index == 2;
  }

  // Test case for combination {1}/Bfrom=0:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[2] [29656.0, 29656.0];
    var from := 0;
    var to := 2;
    var index := findMin(a, from, to);
    expect index == 1 || index == 0;
    expect index == 0; // observed from implementation
  }

  // Test case for combination {1}/Bfrom=1:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[2] [11.0, -400.0];
    var from := 1;
    var to := 2;
    var index := findMin(a, from, to);
    expect index == 1;
  }

  // Test case for combination {1}/Bto=1:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[1] [0.0];
    var from := 0;
    var to := 1;
    var index := findMin(a, from, to);
    expect index == 0;
  }

  // Test case for combination {1}/Bto=a_len-1:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[5] [-399.5, -30456.5, -14373.0, -30456.0, -38472.5];
    var from := 2;
    var to := 4;
    var index := findMin(a, from, to);
    expect index == 3;
  }

  // Test case for combination {1}/R6:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[3] [-13973.0, -32464.0, -32463.5];
    var from := 2;
    var to := 3;
    var index := findMin(a, from, to);
    expect index == 2;
  }

  // Test case for combination {1}/R7:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[3] [-36703.5, 29656.5, -36703.0];
    var from := 2;
    var to := 3;
    var index := findMin(a, from, to);
    expect index == 2;
  }

  // Test case for combination {1}/R8:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[3] [-36720.0, -36720.5, -36720.0];
    var from := 2;
    var to := 3;
    var index := findMin(a, from, to);
    expect index == 2;
  }

  // Test case for combination {1}/R9:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[3] [-36720.25, -37835.75, -37835.75];
    var from := 2;
    var to := 3;
    var index := findMin(a, from, to);
    expect index == 2;
  }

  // Test case for combination {1}/R10:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[3] [-36795.75, -38333.25, -38332.75];
    var from := 2;
    var to := 3;
    var index := findMin(a, from, to);
    expect index == 2;
  }

}

method Main()
{
  TestsForselectionSort();
  print "TestsForselectionSort: all non-failing tests passed!\n";
  TestsForfindMin();
  print "TestsForfindMin: all non-failing tests passed!\n";
}
