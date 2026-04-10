// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\InsertionSort.dfy
// Method: InsertionSort
// Generated: 2026-04-08 22:04:55

/* 
 * Formal verification of the insertion sort algorithm with Dafny. 
 */

type T = int // for demo purposes, but could be another comparable type

// Auxiliary predicate that checks if a sequence 's' is sorted. 
predicate IsSorted(s: seq<T>) {
    forall i, j :: 0 <= i < j < |s| ==> s[i] <= s[j] 
}

// Sorts array 'a' using the insertion sort algorithm.
method InsertionSort(a: array<T>) 
    modifies a    
    ensures IsSorted(a[..])
    ensures multiset(a[..]) == multiset(old(a[..]))
{    
    // In each iteration, it picks the next element from the unsorted part of the array (on the right)
    // and inserts it into the correct position in the sorted part of the array (on the left).  
    for i := 0 to a.Length
      invariant IsSorted(a[..i]) 
      invariant multiset(a[..]) == multiset(old(a[..]))
    {
      var j := i; 
      // Move the element at index 'i' to the left as needed (position 'j'),
      // to keep the array sorted. 
      while j > 0 && a[j-1] > a[j]
        invariant 0 <= j <= i
        invariant forall l, r :: 0 <= l < r <= i && r != j ==> a[l] <= a[r] 
        invariant multiset(a[..]) == multiset(old(a[..]))
      {
        a[j-1], a[j] := a[j], a[j-1]; // swap (parallel assignment)
        j := j - 1;
      }
    }
}



method Passing()
{
  // Test case for combination {1}:
  //   POST: IsSorted(a[..])
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  //   ENSURES: IsSorted(a[..])
  //   ENSURES: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new T[0] [];
    InsertionSort(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/Ba=1:
  //   POST: IsSorted(a[..])
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  //   ENSURES: IsSorted(a[..])
  //   ENSURES: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new T[1] [2];
    InsertionSort(a);
    expect a[..] == [2];
  }

  // Test case for combination {1}/Ba=2:
  //   POST: IsSorted(a[..])
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  //   ENSURES: IsSorted(a[..])
  //   ENSURES: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new T[2] [7681, -38];
    InsertionSort(a);
    expect a[..] == [-38, 7681];
  }

  // Test case for combination {1}/Ba=3:
  //   POST: IsSorted(a[..])
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  //   ENSURES: IsSorted(a[..])
  //   ENSURES: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new T[3] [-2, -38, 1234];
    InsertionSort(a);
    expect a[..] == [-38, -2, 1234];
  }

}

method Failing()
{
  // (no failing tests)
}

method Main()
{
  Passing();
  Failing();
}
