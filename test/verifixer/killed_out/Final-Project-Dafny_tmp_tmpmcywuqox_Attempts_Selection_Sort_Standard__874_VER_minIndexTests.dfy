// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Selection_Sort_Standard__874_VER_minIndex.dfy
// Method: selectionSorted
// Generated: 2026-04-08 16:17:35

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
    idx := minIndex + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: multiset(old(Array[..])) == multiset(Array[..])
  //   ENSURES: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[0] [];
    selectionSorted(Array);
    expect Array[..] == [];
  }

  // Test case for combination {1}/BArray=1:
  //   POST: multiset(old(Array[..])) == multiset(Array[..])
  //   ENSURES: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [2];
    selectionSorted(Array);
    expect Array[..] == [2];
  }

  // Test case for combination {1}/BArray=2:
  //   POST: multiset(old(Array[..])) == multiset(Array[..])
  //   ENSURES: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[2] [4, 3];
    var old_Array := Array[..];
    selectionSorted(Array);
    expect multiset(old_Array) == multiset(Array[..]);
  }

  // Test case for combination {1}/BArray=3:
  //   POST: multiset(old(Array[..])) == multiset(Array[..])
  //   ENSURES: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[3] [12, 4, 5];
    var old_Array := Array[..];
    selectionSorted(Array);
    expect multiset(old_Array) == multiset(Array[..]);
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
