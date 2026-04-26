// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Verify_tmp_tmphq7j0row_Test_Cases_solved_1_select__497-499_AOI.dfy
// Method: SelectionSort
// Generated: 2026-04-24 23:34:41

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
  // Test case for combination {1}:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[1] [10];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.SelectionSort(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 5940
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 5985
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
  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[2] [-1, 2];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.SelectionSort(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 5940
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 6065
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[1] [-10];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.SelectionSort(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 5940
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 6105
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[1] [9];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.SelectionSort(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 5940
    // runtime error: at _module.__default.TestCase__4() in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 6145
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[1] [-9];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.SelectionSort(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 5940
    // runtime error: at _module.__default.TestCase__5() in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 6185
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[1] [-8];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.SelectionSort(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 5940
    // runtime error: at _module.__default.TestCase__6() in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 6225
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[1] [3];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.SelectionSort(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 5940
    // runtime error: at _module.__default.TestCase__7() in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 6265
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[1] [4];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.SelectionSort(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 5940
    // runtime error: at _module.__default.TestCase__8() in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 6305
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST Q2: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[1] [-7];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.SelectionSort(BigInteger[] a) in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 5940
    // runtime error: at _module.__default.TestCase__9() in C:\cygwin64\tmp\DafnyCBT_givgh02035s\runner.cs:line 6345
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

}

method Main()
{
  TestsForSelectionSort();
  print "TestsForSelectionSort: all non-failing tests passed!\n";
}
