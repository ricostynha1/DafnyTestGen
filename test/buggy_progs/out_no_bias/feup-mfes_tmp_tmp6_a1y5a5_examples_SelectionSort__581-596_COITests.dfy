// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\feup-mfes_tmp_tmp6_a1y5a5_examples_SelectionSort__581-596_COI.dfy
// Method: selectionSort
// Generated: 2026-04-24 12:08:21

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
  while !(i < a.Length - 1)
    invariant 0 <= i <= a.Length
    invariant isSorted(a, 0, i)
    invariant forall lhs: int, rhs: int {:trigger a[rhs], a[lhs]} :: 0 <= lhs < i <= rhs < a.Length ==> a[lhs] <= a[rhs]
    invariant multiset(a[..]) == multiset(old(a[..]))
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
  var a := new real[5] [9.0, 4.0, 6.0, 3.0, 8.0];
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
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[1] [27.0];
    var old_a := a[..];
    selectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.selectionSort(BigRational[] a) in C:\cygwin64\tmp\DafnyCBT_mkph1vddyjl\runner.cs:line 6029
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_mkph1vddyjl\runner.cs:line 6105
    // expect isSorted(a, 0, a.Length);
    // expect multiset(a[..]) == multiset(old_a);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|=0:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[0] [];
    selectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.selectionSort(BigRational[] a) in C:\cygwin64\tmp\DafnyCBT_mkph1vddyjl\runner.cs:line 6029
    // runtime error: at _module.__default.TestCase__1() in C:\cygwin64\tmp\DafnyCBT_mkph1vddyjl\runner.cs:line 6127
    // expect a[..] == [];
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[2] [11.0, 12.0];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
  }

}

method TestsForfindMin()
{
  // Test case for combination {1}/Rel:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[3] [-30056.0, -5780.0, 17869.0];
    var from := 1;
    var to := 3;
    var index := findMin(a, from, to);
    expect index == 1;
  }

  // Test case for combination {1}/V1:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index  // VACUOUS (forced true by other literals for this ins)
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[1] [175.0];
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
    var a := new real[2] [18044.0, 11.0];
    var from := 0;
    var to := 1;
    var index := findMin(a, from, to);
    expect index == 0;
  }

  // Test case for combination {1}/Bindex=from+1:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[2] [175.0, 0.0];
    var from := 0;
    var to := 2;
    var index := findMin(a, from, to);
    expect index == 1;
  }

  // Test case for combination {1}/Ofrom>=2:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[3] [13.0, 14.0, 0.0];
    var from := 2;
    var to := 3;
    var index := findMin(a, from, to);
    expect index == 2;
  }

  // Test case for combination {1}/R5:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[1] [176.0];
    var from := 0;
    var to := 1;
    var index := findMin(a, from, to);
    expect index == 0;
  }

  // Test case for combination {1}/R6:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[1] [175.5];
    var from := 0;
    var to := 1;
    var index := findMin(a, from, to);
    expect index == 0;
  }

  // Test case for combination {1}/R7:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[1] [177.0];
    var from := 0;
    var to := 1;
    var index := findMin(a, from, to);
    expect index == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  0 <= from < to <= a.Length
  //   POST Q1: from <= index
  //   POST Q2: index < to
  //   POST Q3: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[1] [176.5];
    var from := 0;
    var to := 1;
    var index := findMin(a, from, to);
    expect index == 0;
  }

}

method Main()
{
  TestsForselectionSort();
  print "TestsForselectionSort: all non-failing tests passed!\n";
  TestsForfindMin();
  print "TestsForfindMin: all non-failing tests passed!\n";
}
