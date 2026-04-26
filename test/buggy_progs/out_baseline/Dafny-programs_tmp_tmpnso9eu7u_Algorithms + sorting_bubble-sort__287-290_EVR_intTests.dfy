// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny-programs_tmp_tmpnso9eu7u_Algorithms + sorting_bubble-sort__287-290_EVR_int.dfy
// Method: BubbleSort
// Generated: 2026-04-24 20:01:07

// Dafny-programs_tmp_tmpnso9eu7u_Algorithms + sorting_bubble-sort.dfy

predicate sorted_between(A: array<int>, from: int, to: int)
  reads A
  decreases {A}, A, from, to
{
  forall i: int, j: int :: 
    0 <= i <= j < A.Length &&
    from <= i <= j <= to ==>
      A[i] <= 0
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
        A[j], A[j + 1] := A[j + 1], A[j];
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
  // Test case for combination {1}:
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
    var A := new int[1] [-175];
    BubbleSort(A);
    expect A[..] == [-175];
  }

  // Test case for combination {1}/O|A|>=2:
  //   POST Q1: sorted(A)
  //   POST Q2: multiset(A[..]) == multiset(old(A[..]))
  {
    var A := new int[2] [-175, -400];
    BubbleSort(A);
    expect A[..] == [-175, -400] || A[..] == [-400, -175];
    expect A[..] == [-400, -175]; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   POST Q1: sorted(A)
  //   POST Q2: multiset(A[..]) == multiset(old(A[..]))
  {
    var A := new int[1] [-174];
    BubbleSort(A);
    expect A[..] == [-174];
  }

  // Test case for combination {1}/R5:
  //   POST Q1: sorted(A)
  //   POST Q2: multiset(A[..]) == multiset(old(A[..]))
  {
    var A := new int[1] [-173];
    BubbleSort(A);
    expect A[..] == [-173];
  }

  // Test case for combination {1}/R6:
  //   POST Q1: sorted(A)
  //   POST Q2: multiset(A[..]) == multiset(old(A[..]))
  {
    var A := new int[1] [-172];
    BubbleSort(A);
    expect A[..] == [-172];
  }

  // Test case for combination {1}/R7:
  //   POST Q1: sorted(A)
  //   POST Q2: multiset(A[..]) == multiset(old(A[..]))
  {
    var A := new int[1] [-176];
    BubbleSort(A);
    expect A[..] == [-176];
  }

  // Test case for combination {1}/R8:
  //   POST Q1: sorted(A)
  //   POST Q2: multiset(A[..]) == multiset(old(A[..]))
  {
    var A := new int[1] [-177];
    BubbleSort(A);
    expect A[..] == [-177];
  }

  // Test case for combination {1}/R9:
  //   POST Q1: sorted(A)
  //   POST Q2: multiset(A[..]) == multiset(old(A[..]))
  {
    var A := new int[1] [-178];
    BubbleSort(A);
    expect A[..] == [-178];
  }

  // Test case for combination {1}/R10:
  //   POST Q1: sorted(A)
  //   POST Q2: multiset(A[..]) == multiset(old(A[..]))
  {
    var A := new int[1] [-179];
    BubbleSort(A);
    expect A[..] == [-179];
  }

}

method Main()
{
  TestsForBubbleSort();
  print "TestsForBubbleSort: all non-failing tests passed!\n";
}
