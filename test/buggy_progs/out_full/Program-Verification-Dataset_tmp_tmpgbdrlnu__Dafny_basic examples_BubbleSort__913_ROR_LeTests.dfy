// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_BubbleSort__913_ROR_Le.dfy
// Method: bubbleSort
// Generated: 2026-04-24 10:46:34

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
      if a[j - 1] <= a[j] {
        var temp: int := a[j - 1];
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
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[3] [10, -6, -6];
    bubbleSort(a);
    // expect a[..] == [-6, -6, 10]; // LHS=[10, -6, -6], RHS=[-6, -6, 10]
  }

  // Test case for combination {1}/V1:
  //   PRE:  a != null && a.Length > 0
  //   POST Q1: sorted(a, 0, a.Length)  // VACUOUS (forced true by other literals for this ins)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [5];
    bubbleSort(a);
    expect a[..] == [5];
  }

}

method Main()
{
  TestsForbubbleSort();
  print "TestsForbubbleSort: all non-failing tests passed!\n";
}
