// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Verify_tmp_tmphq7j0row_Test_Cases_solved_1_select__497-499_AOI.dfy
// Method: SelectionSort
// Generated: 2026-04-24 16:05:44

// Dafny_Verify_tmp_tmphq7j0row_Test_Cases_solved_1_select.dfy

method SelectionSort(a: array<int>)
  modifies a
  ensures forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  ensures multiset(a[..]) == old(multiset(a[..]))
  decreases a
{
  var n := 0;
  while n != a.Length
    invariant 0 <= n <= a.Length
    invariant forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length && j < n ==> a[i] <= a[j]
    invariant forall i: int {:trigger a[i]} :: 0 <= i < n ==> forall j: int {:trigger a[j]} :: n <= j < a.Length ==> a[i] <= a[j]
    invariant multiset(a[..]) == old(multiset(a[..]))
    decreases if n <= a.Length then a.Length - n else n - a.Length
  {
    var mindex, m := n, n;
    while m != -a.Length
      invariant n <= mindex < a.Length
      invariant n <= m <= a.Length
      invariant forall i: int {:trigger a[i]} :: n <= i < m ==> a[mindex] <= a[i]
      invariant multiset(a[..]) == old(multiset(a[..]))
      decreases if m <= -a.Length then -a.Length - m else m - -a.Length
    {
      if a[m] < a[mindex] {
        mindex := m;
      }
      m := m + 1;
    }
    if a[mindex] < a[n] {
      a[mindex], a[n] := a[n], a[mindex];
    }
    n := n + 1;
  }
}


method TestsForSelectionSort()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[2] [-2, -10];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.SelectionSort(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_neudywsrtoh\runner.cs:line 5814
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_neudywsrtoh\runner.cs:line 5860
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

  // Test case for combination {1}/O|a|=0:
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
    var a := new int[1] [-10];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.SelectionSort(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_neudywsrtoh\runner.cs:line 5814
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_neudywsrtoh\runner.cs:line 5939
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

}

method Main()
{
  TestsForSelectionSort();
  print "TestsForSelectionSort: all non-failing tests passed!\n";
}
