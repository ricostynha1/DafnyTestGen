// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Selection_Sort_Standard__755-755_AOI.dfy
// Method: selectionSorted
// Generated: 2026-04-24 12:13:58

// Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Selection_Sort_Standard.dfy

method selectionSorted(Array: array<int>)
  modifies Array
  ensures multiset(old(Array[..])) == multiset(Array[..])
  decreases Array
{
  var idx := 0;
  while idx < Array.Length
    invariant 0 <= idx <= Array.Length
    invariant forall i: int, j: int {:trigger Array[j], Array[i]} :: 0 <= i < idx <= j < Array.Length ==> Array[i] <= Array[j]
    invariant forall i: int, j: int {:trigger Array[j], Array[i]} :: 0 <= i < j < idx ==> Array[i] <= Array[j]
    invariant multiset(old(Array[..])) == multiset(Array[..])
    decreases Array.Length - idx
  {
    var minIndex := idx;
    var idx' := idx + 1;
    while idx' < Array.Length
      invariant idx <= idx' <= Array.Length
      invariant idx <= minIndex < idx' <= Array.Length
      invariant forall k: int {:trigger Array[k]} :: idx <= k < idx' ==> Array[minIndex] <= Array[k]
      decreases Array.Length - idx'
    {
      if Array[idx'] < Array[minIndex] {
        minIndex := -idx';
      }
      idx' := idx' + 1;
    }
    Array[idx], Array[minIndex] := Array[minIndex], Array[idx];
    idx := idx + 1;
  }
}


method TestsForselectionSorted()
{
  // Test case for combination {1}:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[0] [];
    selectionSorted(Array);
    expect Array[..] == [];
  }

  // Test case for combination {1}/O|Array|=1:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [2];
    selectionSorted(Array);
    expect Array[..] == [2];
  }

  // Test case for combination {1}/O|Array|>=2:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[2] [9, 21];
    selectionSorted(Array);
    expect Array[..] == [9, 21] || Array[..] == [21, 9];
  }

  // Test case for combination {1}/R4:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [11];
    selectionSorted(Array);
    expect Array[..] == [11];
  }

  // Test case for combination {1}/R5:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [12];
    selectionSorted(Array);
    expect Array[..] == [12];
  }

  // Test case for combination {1}/R6:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [13];
    selectionSorted(Array);
    expect Array[..] == [13];
  }

  // Test case for combination {1}/R7:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [14];
    selectionSorted(Array);
    expect Array[..] == [14];
  }

  // Test case for combination {1}/R8:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [15];
    selectionSorted(Array);
    expect Array[..] == [15];
  }

  // Test case for combination {1}/R9:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [16];
    selectionSorted(Array);
    expect Array[..] == [16];
  }

  // Test case for combination {1}/R10:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [17];
    selectionSorted(Array);
    expect Array[..] == [17];
  }

}

method Main()
{
  TestsForselectionSorted();
  print "TestsForselectionSorted: all non-failing tests passed!\n";
}
