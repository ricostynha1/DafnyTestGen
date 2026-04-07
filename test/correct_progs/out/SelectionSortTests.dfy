// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\SelectionSort.dfy
// Method: SelectionSort
// Generated: 2026-04-06 23:22:22

/* 
* Formal verification with Dafny of the selection sort algorithm 
* described in https://en.wikipedia.org/wiki/Selection_sort  
*/

// Sorts array 'a' using the selection sort algorithm.
method SelectionSort(a: array<int>)
  modifies a
  ensures IsSorted(a) 
  ensures multiset(a[..]) == multiset(old(a[..]))
{
    // In each iteration, find the minimum value in the unsorted part of the array
    // (on the right) and append it (by swapping) to the sorted part (on the left).
    for i := 0 to a.Length 
      invariant forall l, r :: 0 <= l < i && l < r < a.Length ==> a[l] <= a[r] // a[..i] sorted and <= a[i..]
      invariant multiset(a[..]) == multiset(old(a[..]))
    {
        // Find the minimum value in the unsorted part of the array
        var jMin := i;
        for j := i + 1 to a.Length
          invariant i <= jMin < a.Length
          invariant forall k :: i <= k < j ==> a[k] >= a[jMin]
        {
            if a[j] < a[jMin] {
                jMin := j;
            }
        } 
        // Swap it with the first unsorted element
        if jMin != i {
          a[i], a[jMin] := a[jMin], a[i]; 
        }
    }
}

// Auxiliary predicate that checks if an array 'a' is sorted.
predicate IsSorted(a: array<int>)
  reads a
{
    forall i, j :: 0 <= i < j < a.Length ==> a[i] <= a[j] 
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: IsSorted(a)
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[0] [];
    SelectionSort(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/Ba=1:
  //   POST: IsSorted(a)
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [2];
    SelectionSort(a);
    expect a[..] == [2];
  }

  // Test case for combination {1}/Ba=2:
  //   POST: IsSorted(a)
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [7681, -38];
    SelectionSort(a);
    expect a[..] == [-38, 7681];
  }

  // Test case for combination {1}/Ba=3:
  //   POST: IsSorted(a)
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[3] [-2, -38, 1234];
    SelectionSort(a);
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
