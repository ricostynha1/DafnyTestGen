// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny-programs_tmp_tmpnso9eu7u_Algorithms + sorting_bubble-sort__1253_VER_N.dfy
// Method: BubbleSort
// Generated: 2026-04-24 16:21:22

// Dafny-programs_tmp_tmpnso9eu7u_Algorithms + sorting_bubble-sort.dfy

predicate sorted_between(A: array<int>, from: int, to: int)
  reads A
  decreases {A}, A, from, to
{
  forall i: int, j: int {:trigger A[j], A[i]} :: 
    0 <= i <= j < A.Length &&
    from <= i <= j <= to ==>
      A[i] <= A[j]
}

predicate sorted(A: array<int>)
  reads A
  decreases {A}, A
{
  sorted_between(A, 0, A.Length - 1)
}

method BubbleSort(A: array<int>)
  modifies A
  ensures sorted(A)
  ensures multiset(A[..]) == multiset(old(A[..]))
  decreases A
{
  var N := A.Length;
  var i := N - 1;
  while 0 < i
    invariant multiset(A[..]) == multiset(old(A[..]))
    invariant sorted_between(A, i, N - 1)
    invariant forall n: int, m: int {:trigger A[m], A[n]} :: 0 <= n <= i < m < N ==> A[n] <= A[m]
    decreases i
  {
    print A[..], "\n";
    var j := 0;
    while j < i
      invariant 0 < i < N
      invariant 0 <= j <= i
      invariant multiset(A[..]) == multiset(old(A[..]))
      invariant sorted_between(A, i, N - 1)
      invariant forall n: int, m: int {:trigger A[m], A[n]} :: 0 <= n <= i < m < N ==> A[n] <= A[m]
      invariant forall n: int {:trigger A[n]} :: 0 <= n <= j ==> A[n] <= A[j]
      decreases i - j
    {
      if A[j] > A[j + 1] {
        A[j], A[j + 1] := A[N + 1], A[j];
        print A[..], "\n";
      }
      j := j + 1;
    }
    i := i - 1;
    print "\n";
  }
}

method OriginalMain()
{
  var A := new int[10];
  A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9] := 2, 4, 6, 15, 3, 19, 17, 16, 18, 1;
  BubbleSort(A);
  print A[..];
}


method TestsForBubbleSort()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   POST Q1: sorted(A)
  //   POST Q2: multiset(A[..]) == multiset(old(A[..]))
  {
    var A := new int[2] [-1, -3];
    BubbleSort(A);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.BubbleSort(BigInteger[] A) in C:\cygwin64\tmp\DafnyCBT_ushh25dglev\runner.cs:line 5846
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_ushh25dglev\runner.cs:line 5934
    // expect A[..] == [-3, -1];
  }

  // Test case for combination {1}/O|A|=0:
  //   POST Q1: sorted(A)
  //   POST Q2: multiset(A[..]) == multiset(old(A[..]))
  {
    var A := new int[0] [];
    BubbleSort(A);
    expect A[..] == [];
  }

  // Test case for combination {1}/O|A|=1:
  //   POST Q1: sorted(A)
  //   POST Q2: multiset(A[..]) == multiset(old(A[..]))
  {
    var A := new int[1] [-1];
    BubbleSort(A);
    expect A[..] == [-1];
  }

}

method Main()
{
  TestsForBubbleSort();
  print "TestsForBubbleSort: all non-failing tests passed!\n";
}
