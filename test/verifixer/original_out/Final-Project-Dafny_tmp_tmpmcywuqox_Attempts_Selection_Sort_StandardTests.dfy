// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Selection_Sort_Standard.dfy
// Method: selectionSorted
// Generated: 2026-04-22 21:34:23

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
        minIndex := idx';
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
    var Array := new int[1] [9];
    selectionSorted(Array);
    expect Array[..] == [9];
  }

  // Test case for combination {1}/O|Array|=0:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[0] [];
    selectionSorted(Array);
    expect Array[..] == [];
  }

  // Test case for combination {1}/O|Array|>=2:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[2] [3, 3];
    selectionSorted(Array);
    expect Array[..] == [3, 3];
  }

  // Test case for combination {1}/OArray≠old:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[2] [-9, -10];
    selectionSorted(Array);
    expect Array[..] == [-10, -9] || Array[..] == [-9, -10];
    expect Array[..] == [-10, -9]; // observed from implementation
  }

}

method Main()
{
  TestsForselectionSorted();
  print "TestsForselectionSorted: all non-failing tests passed!\n";
}
