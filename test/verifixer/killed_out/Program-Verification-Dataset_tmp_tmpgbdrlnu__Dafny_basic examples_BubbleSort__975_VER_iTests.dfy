// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_BubbleSort__975_VER_i.dfy
// Method: bubbleSort
// Generated: 2026-04-22 21:52:47

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
      if a[j - 1] > a[j] {
        var temp: int := a[j - 1];
        a[j - 1] := a[i];
        a[j] := temp;
      }
      j := j - 1;
    }
    i := i + 1;
  }
}


method TestsForbubbleSort()
{
  // Test case for combination {1}/Rel:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[3] [2, 2, 8];
    bubbleSort(a);
    expect a[..] == [2, 2, 8];
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-1];
    bubbleSort(a);
    expect a[..] == [-1];
  }

  // Test case for combination {1}/Oa≠old:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [8, -1];
    bubbleSort(a);
    expect a[..] == [-1, 8];
  }

}

method Main()
{
  TestsForbubbleSort();
  print "TestsForbubbleSort: all non-failing tests passed!\n";
}
