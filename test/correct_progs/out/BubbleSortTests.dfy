// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\BubbleSort.dfy
// Method: BubbleSort
// Generated: 2026-04-21 23:10:24

/* 
* Formal verification of the bubble sort algorithm with Dafny.
* The algorithm was taken from https://en.wikipedia.org/wiki/Bubble_sort .
*/

// Checks if a sequence 's' is sorted.
predicate IsSorted(s: seq<int>) 
{
  forall i, j :: 0 <= i < j < |s| ==> s[i] <= s[j]
}

// Checks if a sequence 's' is partitioned at index 'n' and right sorted, meaning that the first
// 'n' elements are less or equal than the remaining elements, which are sorted.
predicate IsPartitionedAndRightSorted(s: seq<int>, n: int)
  requires 0 <= n <= |s| 
{
  forall i, j :: 0 <= i < j < |s| && j >= n ==> s[i] <= s[j]
}

// Sorts array 'a' inplace using the bubble sort algorithm.
method BubbleSort(a: array<int>)
  modifies a
  ensures IsSorted(a[..])
  ensures multiset(a[..]) == multiset(old(a[..]))
{
  var n := a.Length; // sorted elements are a[n..] (and greater than a[..n])

  // Does multiple passes over the array, each time bubbling the largest element to the right-hand side.
  while n  > 1
    invariant 0 <= n <= a.Length
    invariant IsPartitionedAndRightSorted(a[..], n)
    invariant multiset(a[..]) == multiset(old(a[..]))
  {
    // Scans the array a[..n] from left to right, swapping adjacent elements if they
    // are in the wrong order. At the same time, keeps the index of the last swap (newn). 
    var newn : nat := 0;
    for i := 1 to n
      invariant 0 <= newn < i 
      invariant IsPartitionedAndRightSorted(a[..i], newn)
      invariant IsPartitionedAndRightSorted(a[..], n)
      invariant multiset(a[..]) == multiset(old(a[..]))
    {
      if (a[i-1] > a[i]) { 
        a[i-1], a[i] := a[i], a[i-1]; 
        newn := i;
      }
    }
    n := newn;
  }
}



method TestsForBubbleSort()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: IsSorted(a[..])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [-8, 8];
    BubbleSort(a);
    expect a[..] == [-8, 8];
  }

  // Test case for combination {1}/V1:
  //   POST Q1: IsSorted(a[..])  // VACUOUS (forced true by other literals for this ins)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [10];
    BubbleSort(a);
    expect a[..] == [10];
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: IsSorted(a[..])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[0] [];
    BubbleSort(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/Oa≠old:
  //   POST Q1: IsSorted(a[..])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [8, 6];
    BubbleSort(a);
    expect a[..] == [6, 8];
  }

}

method Main()
{
  TestsForBubbleSort();
  print "TestsForBubbleSort: all non-failing tests passed!\n";
}
