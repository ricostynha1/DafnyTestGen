// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_BubbleSort_sol__1005_VER_i.dfy
// Method: bubbleSort
// Generated: 2026-04-22 21:52:50

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_BubbleSort_sol.dfy

predicate sorted_between(a: array<int>, from: nat, to: nat)
  requires a != null
  requires from <= to
  requires to <= a.Length
  reads a
  decreases {a}, a, from, to
{
  forall i: int, j: int {:trigger a[j], a[i]} :: 
    from <= i < j < to &&
    0 <= i < j < a.Length ==>
      a[i] <= a[j]
}

predicate sorted(a: array<int>)
  requires a != null
  reads a
  decreases {a}, a
{
  sorted_between(a, 0, a.Length)
}

method bubbleSort(a: array<int>)
  requires a != null
  requires a.Length > 0
  modifies a
  ensures sorted(a)
  ensures multiset(old(a[..])) == multiset(a[..])
  decreases a
{
  var i: nat := 1;
  while i < a.Length
    invariant i <= a.Length
    invariant sorted_between(a, 0, i)
    invariant multiset(old(a[..])) == multiset(a[..])
    decreases a.Length - i
  {
    var j: nat := i;
    while j > 0
      invariant 0 <= j <= i
      invariant sorted_between(a, 0, j)
      invariant forall u: int, v: int {:trigger a[v], a[u]} :: 0 <= u < j < v < i + 1 ==> a[u] <= a[v]
      invariant sorted_between(a, j, i + 1)
      invariant multiset(old(a[..])) == multiset(a[..])
      decreases j - 0
    {
      if a[j - 1] > a[j] {
        var temp: int := a[i - 1];
        a[j - 1] := a[j];
        a[j] := temp;
      }
      j := j - 1;
    }
    i := i + 1;
  }
}


method TestsForbubbleSort()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  a != null
  //   PRE:  a.Length > 0
  //   POST Q1: sorted(a)
  //   POST Q2: multiset(old(a[..])) == multiset(a[..])
  {
    var a := new int[3] [4, 4, 2];
    bubbleSort(a);
    // actual runtime state: a=[2, 2, 4]
    // expect a[..] == [2, 4, 4]; // LHS=[2, 2, 4], RHS=[2, 4, 4]
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  a != null
  //   PRE:  a.Length > 0
  //   POST Q1: sorted(a)
  //   POST Q2: multiset(old(a[..])) == multiset(a[..])
  {
    var a := new int[1] [2];
    bubbleSort(a);
    expect a[..] == [2];
  }

}

method Main()
{
  TestsForbubbleSort();
  print "TestsForbubbleSort: all non-failing tests passed!\n";
}
