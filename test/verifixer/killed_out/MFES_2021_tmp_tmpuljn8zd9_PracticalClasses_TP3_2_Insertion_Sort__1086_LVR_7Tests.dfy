// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\MFES_2021_tmp_tmpuljn8zd9_PracticalClasses_TP3_2_Insertion_Sort__1086_LVR_7.dfy
// Method: insertionSort
// Generated: 2026-04-01 22:36:39

// MFES_2021_tmp_tmpuljn8zd9_PracticalClasses_TP3_2_Insertion_Sort.dfy

method insertionSort(a: array<int>)
  modifies a
  ensures isSorted(a, 0, a.Length)
  ensures multiset(a[..]) == multiset(old(a[..]))
  decreases a
{
  var i := 0;
  while i < a.Length
    invariant 0 <= i <= a.Length
    invariant isSorted(a, 0, i)
    invariant multiset(a[..]) == multiset(old(a[..]))
    decreases a.Length - i
  {
    var j := i;
    while j > 0 && a[j - 1] > a[j]
      invariant 0 <= j <= i
      invariant multiset(a[..]) == multiset(old(a[..]))
      invariant forall l: int, r: int {:trigger a[r], a[l]} :: 0 <= l < r <= i && r != j ==> a[l] <= a[r]
      decreases j
    {
      a[j - 1], a[j] := a[j], a[j - 1];
      j := j - 1;
    }
    i := i + 1;
  }
}

predicate isSorted(a: array<int>, from: nat, to: nat)
  requires 0 <= from <= to <= a.Length
  reads a
  decreases {a}, a, from, to
{
  forall i: int, j: int {:trigger a[j], a[i]} :: 
    from <= i < j < to ==>
      a[i] <= a[j]
}

method testInsertionSort()
{
  var a := new int[] [9, 4, 3, 7, 8];
  assert a[..] == [9, 4, 3, 6, 8];
  insertionSort(a);
  assert a[..] == [3, 4, 6, 8, 9];
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: isSorted(a, 0, a.Length)
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[0] [];
    var old_a := a[..];
    insertionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
  }

  // Test case for combination {1}/Ba=1:
  //   POST: isSorted(a, 0, a.Length)
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [3];
    var old_a := a[..];
    insertionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
  }

  // Test case for combination {1}/Ba=2:
  //   POST: isSorted(a, 0, a.Length)
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [4, 3];
    var old_a := a[..];
    insertionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
  }

  // Test case for combination {1}/Ba=3:
  //   POST: isSorted(a, 0, a.Length)
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[3] [5, 4, 6];
    var old_a := a[..];
    insertionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a);
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
