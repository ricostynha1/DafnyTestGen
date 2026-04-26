// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\MFES_2021_tmp_tmpuljn8zd9_PracticalClasses_TP3_2_Insertion_Sort__1086_LVR_7.dfy
// Method: insertionSort
// Generated: 2026-04-25 00:21:39

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


method TestsForinsertionSort()
{
  // Test case for combination {1}:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [6];
    insertionSort(a);
    expect a[..] == [6];
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[0] [];
    insertionSort(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[2] [9, 5];
    insertionSort(a);
    expect a[..] == [5, 9];
  }

  // Test case for combination {1}/R4:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-1];
    insertionSort(a);
    expect a[..] == [-1];
  }

  // Test case for combination {1}/R5:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-10];
    insertionSort(a);
    expect a[..] == [-10];
  }

  // Test case for combination {1}/R6:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-9];
    insertionSort(a);
    expect a[..] == [-9];
  }

  // Test case for combination {1}/R7:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-8];
    insertionSort(a);
    expect a[..] == [-8];
  }

  // Test case for combination {1}/R8:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-7];
    insertionSort(a);
    expect a[..] == [-7];
  }

  // Test case for combination {1}/R9:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [8];
    insertionSort(a);
    expect a[..] == [8];
  }

  // Test case for combination {1}/R10:
  //   POST Q1: isSorted(a, 0, a.Length)
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new int[1] [-6];
    insertionSort(a);
    expect a[..] == [-6];
  }

}

method Main()
{
  TestsForinsertionSort();
  print "TestsForinsertionSort: all non-failing tests passed!\n";
}
