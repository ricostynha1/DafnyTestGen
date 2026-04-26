// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_BubbleSort__902-1007_SDL.dfy
// Method: bubbleSort
// Generated: 2026-04-24 14:12:25

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_BubbleSort.dfy

predicate sorted(a: array<int>, from: int, to: int)
  requires a != null
  requires 0 <= from <= to <= a.Length
  reads a
  decreases {a}, a, from, to
{
  forall u: int, v: int {:trigger a[v], a[u]} :: 
    from <= u < v < to ==>
      a[u] <= a[v]
}

predicate pivot(a: array<int>, to: int, pvt: int)
  requires a != null
  requires 0 <= pvt < to <= a.Length
  reads a
  decreases {a}, a, to, pvt
{
  forall u: int, v: int {:trigger a[v], a[u]} :: 
    0 <= u < pvt < v < to ==>
      a[u] <= a[v]
}

method bubbleSort(a: array<int>)
  requires a != null && a.Length > 0
  modifies a
  ensures sorted(a, 0, a.Length)
  ensures multiset(a[..]) == multiset(old(a[..]))
  decreases a
{
  var i: nat := 1;
  while i < a.Length
    invariant i <= a.Length
    invariant sorted(a, 0, i)
    invariant multiset(a[..]) == multiset(old(a[..]))
    decreases a.Length - i
  {
    var j: nat := i;
    while j > 0
      invariant multiset(a[..]) == multiset(old(a[..]))
      invariant sorted(a, 0, j)
      invariant sorted(a, j, i + 1)
      invariant pivot(a, i + 1, j)
      decreases j - 0
    {
      j := j - 1;
    }
    i := i + 1;
  }
}


method TestsForbubbleSort()
{
  // Test case for combination {1}:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [5];
    bubbleSort(a);
    expect a[..] == [5];
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [2, 2];
    bubbleSort(a);
    expect a[..] == [2, 2];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oa≠old:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [6, -2];
    bubbleSort(a);
    // expect a[..] == [-2, 6]; // LHS=[6, -2], RHS=[-2, 6]
  }

  // Test case for combination {1}/R4:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [7];
    bubbleSort(a);
    expect a[..] == [7];
  }

  // Test case for combination {1}/R5:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [8];
    bubbleSort(a);
    expect a[..] == [8];
  }

  // Test case for combination {1}/R6:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [4];
    bubbleSort(a);
    expect a[..] == [4];
  }

  // Test case for combination {1}/R7:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-1];
    bubbleSort(a);
    expect a[..] == [-1];
  }

  // Test case for combination {1}/R8:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-2];
    bubbleSort(a);
    expect a[..] == [-2];
  }

  // Test case for combination {1}/R9:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-9];
    bubbleSort(a);
    expect a[..] == [-9];
  }

  // Test case for combination {1}/R10:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-8];
    bubbleSort(a);
    expect a[..] == [-8];
  }

}

method Main()
{
  TestsForbubbleSort();
  print "TestsForbubbleSort: all non-failing tests passed!\n";
}
