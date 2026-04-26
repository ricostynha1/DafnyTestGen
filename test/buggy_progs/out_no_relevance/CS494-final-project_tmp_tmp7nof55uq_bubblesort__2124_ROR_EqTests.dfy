// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\CS494-final-project_tmp_tmp7nof55uq_bubblesort__2124_ROR_Eq.dfy
// Method: BubbleSort
// Generated: 2026-04-24 13:01:42

// CS494-final-project_tmp_tmp7nof55uq_bubblesort.dfy

predicate sorted(a: array<int>, from: int, to: int)
  requires a != null
  requires 0 <= from <= to <= a.Length
  reads a
  decreases {a}, a, from, to
{
  forall x: int, y: int {:trigger a[y], a[x]} :: 
    from <= x < y < to ==>
      a[x] <= a[y]
}

predicate pivot(a: array<int>, to: int, pvt: int)
  requires a != null
  requires 0 <= pvt < to <= a.Length
  reads a
  decreases {a}, a, to, pvt
{
  forall x: int, y: int {:trigger a[y], a[x]} :: 
    0 <= x < pvt < y < to ==>
      a[x] <= a[y]
}

method BubbleSort(a: array<int>)
  requires a != null && a.Length > 0
  modifies a
  ensures sorted(a, 0, a.Length)
  ensures multiset(a[..]) == multiset(old(a[..]))
  decreases a
{
  var i := 1;
  while i < a.Length
    invariant i <= a.Length
    invariant sorted(a, 0, i)
    invariant multiset(a[..]) == multiset(old(a[..]))
    decreases a.Length - i
  {
    var j := i;
    while j == 0
      invariant multiset(a[..]) == multiset(old(a[..]))
      invariant sorted(a, 0, j)
      invariant sorted(a, j, i + 1)
      invariant pivot(a, i + 1, j)
    {
      if a[j - 1] > a[j] {
        a[j - 1], a[j] := a[j], a[j - 1];
      }
      j := j - 1;
    }
    i := i + 1;
  }
}


method TestsForBubbleSort()
{
  // Test case for combination {1}:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [5];
    BubbleSort(a);
    expect a[..] == [5];
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [2, 2];
    BubbleSort(a);
    expect a[..] == [2, 2];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oa≠old:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [6, -2];
    BubbleSort(a);
    // expect a[..] == [-2, 6]; // LHS=[6, -2], RHS=[-2, 6]
  }

  // Test case for combination {1}/R4:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [7];
    BubbleSort(a);
    expect a[..] == [7];
  }

  // Test case for combination {1}/R5:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [8];
    BubbleSort(a);
    expect a[..] == [8];
  }

  // Test case for combination {1}/R6:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [4];
    BubbleSort(a);
    expect a[..] == [4];
  }

  // Test case for combination {1}/R7:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-1];
    BubbleSort(a);
    expect a[..] == [-1];
  }

  // Test case for combination {1}/R8:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-2];
    BubbleSort(a);
    expect a[..] == [-2];
  }

  // Test case for combination {1}/R9:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-9];
    BubbleSort(a);
    expect a[..] == [-9];
  }

  // Test case for combination {1}/R10:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-8];
    BubbleSort(a);
    expect a[..] == [-8];
  }

}

method Main()
{
  TestsForBubbleSort();
  print "TestsForBubbleSort: all non-failing tests passed!\n";
}
