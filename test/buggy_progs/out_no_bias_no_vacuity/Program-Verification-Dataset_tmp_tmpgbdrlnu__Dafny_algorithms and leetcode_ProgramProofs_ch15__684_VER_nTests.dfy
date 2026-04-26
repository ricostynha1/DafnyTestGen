// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_algorithms and leetcode_ProgramProofs_ch15__684_VER_n.dfy
// Method: SelectionSort
// Generated: 2026-04-24 22:41:02

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_algorithms and leetcode_ProgramProofs_ch15.dfy

predicate SplitPoint(a: array<int>, n: int)
  requires 0 <= n <= n
  reads a
  decreases {a}, a, n
{
  forall i: int, j: int {:trigger a[j], a[i]} :: 
    0 <= i < n <= j < a.Length ==>
      a[i] <= a[j]
}

method SelectionSort(a: array<int>)
  modifies a
  ensures forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  ensures multiset(a[..]) == old(multiset(a[..]))
  decreases a
{
  var n := 0;
  while n != a.Length
    invariant 0 <= n <= a.Length
    invariant forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < n ==> a[i] <= a[j]
    invariant SplitPoint(a, n)
    invariant multiset(a[..]) == old(multiset(a[..]))
    decreases if n <= a.Length then a.Length - n else n - a.Length
  {
    var mindex, m := n, n;
    while n != a.Length
      invariant n <= m <= a.Length && n <= mindex < a.Length
      invariant forall i: int {:trigger a[i]} :: n <= i < m ==> a[mindex] <= a[i]
      decreases if n <= a.Length then a.Length - n else n - a.Length
    {
      if a[m] < a[mindex] {
        mindex := m;
      }
      m := m + 1;
    }
    a[n], a[mindex] := a[mindex], a[n];
    assert forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < n ==> a[i] <= a[j];
    n := n + 1;
  }
}

method QuickSort(a: array<int>)
  modifies a
  ensures forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  ensures multiset(a[..]) == old(multiset(a[..]))
  decreases a
{
  QuickSortAux(a, 0, a.Length);
}

twostate predicate SwapFrame(a: array<int>, lo: int, hi: int)
  requires 0 <= lo <= hi <= a.Length
  reads a
  decreases {a}, a, lo, hi
{
  (forall i: int {:trigger (a[i])} {:trigger a[i]} :: 
    0 <= i < lo || hi <= i < a.Length ==>
      a[i] == (a[i])) &&
  multiset(a[..]) == (multiset(a[..]))
}

method QuickSortAux(a: array<int>, lo: int, hi: int)
  requires 0 <= lo <= hi <= a.Length
  requires SplitPoint(a, lo) && SplitPoint(a, hi)
  modifies a
  ensures forall i: int, j: int {:trigger a[j], a[i]} :: lo <= i < j < hi ==> a[i] <= a[j]
  ensures SwapFrame(a, lo, hi)
  ensures SplitPoint(a, lo) && SplitPoint(a, hi)
  decreases hi - lo
{
  if 2 <= hi - lo {
    var p := Partition(a, lo, hi);
    QuickSortAux(a, lo, p);
    QuickSortAux(a, p + 1, hi);
  }
}

method Partition(a: array<int>, lo: int, hi: int)
    returns (p: int)
  requires 0 <= lo < hi <= a.Length
  requires SplitPoint(a, lo) && SplitPoint(a, hi)
  modifies a
  ensures lo <= p < hi
  ensures forall i: int {:trigger a[i]} :: lo <= i < p ==> a[i] < a[p]
  ensures forall i: int {:trigger a[i]} :: p <= i < hi ==> a[p] <= a[i]
  ensures SplitPoint(a, lo) && SplitPoint(a, hi)
  ensures SwapFrame(a, lo, hi)
  decreases a, lo, hi
{
  var pivot := a[lo];
  var m, n := lo + 1, hi;
  while m < n
    invariant lo + 1 <= m <= n <= hi
    invariant a[lo] == pivot
    invariant forall i: int {:trigger a[i]} :: lo + 1 <= i < m ==> a[i] < pivot
    invariant forall i: int {:trigger a[i]} :: n <= i < hi ==> pivot <= a[i]
    invariant SplitPoint(a, lo) && SplitPoint(a, hi)
    invariant SwapFrame(a, lo, hi)
    decreases n - m
  {
    if a[m] < pivot {
      m := m + 1;
    } else {
      a[m], a[n - 1] := a[n - 1], a[m];
      n := n - 1;
    }
  }
  a[lo], a[m - 1] := a[m - 1], a[lo];
  return m - 1;
}


method TestsForSelectionSort()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[0] [];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    expect multiset(a[..]) == old_multiset_a;
    expect old_multiset_a == multiset{}; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|=1:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[1] [2];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.SelectionSort(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_bsyzkz5g2va\runner.cs:line 5961
    // runtime error: at _module.__default.TestCase__1() in C:\cygwin64\tmp\DafnyCBT_bsyzkz5g2va\runner.cs:line 6098
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[2] [22, 21];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.SelectionSort(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_bsyzkz5g2va\runner.cs:line 5961
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_bsyzkz5g2va\runner.cs:line 6139
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

}

method TestsForQuickSort()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[0] [];
    var old_multiset_a := multiset(a[..]);
    QuickSort(a);
    expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    expect multiset(a[..]) == old_multiset_a;
    expect old_multiset_a == multiset{}; // observed from implementation
  }

  // Test case for combination {1}/O|a|=1:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[1] [2];
    var old_multiset_a := multiset(a[..]);
    QuickSort(a);
    expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    expect multiset(a[..]) == old_multiset_a;
    expect old_multiset_a == multiset{2}; // observed from implementation
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[2] [22, 21];
    var old_multiset_a := multiset(a[..]);
    QuickSort(a);
    expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    expect multiset(a[..]) == old_multiset_a;
    expect old_multiset_a == multiset{21, 22}; // observed from implementation
    expect a[..] == [21, 22]; // observed from implementation
  }

}

method Main()
{
  TestsForSelectionSort();
  print "TestsForSelectionSort: all non-failing tests passed!\n";
  TestsForQuickSort();
  print "TestsForQuickSort: all non-failing tests passed!\n";
}
