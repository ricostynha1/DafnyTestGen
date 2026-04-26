// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Selection_Sort_Standard__755-755_AOI.dfy
// Method: selectionSorted
// Generated: 2026-04-24 16:42:16

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
    var Array := new int[1] [-1];
    selectionSorted(Array);
    expect Array[..] == [-1];
  }

  // Test case for combination {1}/O|Array|=0:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[0] [];
    selectionSorted(Array);
    expect Array[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|Array|>=2:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[2] [-1, -2];
    selectionSorted(Array);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.selectionSorted(BigInteger[] Array) in C:\cygwin64\tmp\DafnyCBT_jlerxlwuuar\runner.cs:line 5898
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_jlerxlwuuar\runner.cs:line 5966
    // expect Array[..] == [-2, -1] || Array[..] == [-1, -2];
  }

  // Test case for combination {1}/R4:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [-2];
    selectionSorted(Array);
    expect Array[..] == [-2];
  }

  // Test case for combination {1}/R5:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [-3];
    selectionSorted(Array);
    expect Array[..] == [-3];
  }

  // Test case for combination {1}/R6:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [-4];
    selectionSorted(Array);
    expect Array[..] == [-4];
  }

  // Test case for combination {1}/R7:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [-5];
    selectionSorted(Array);
    expect Array[..] == [-5];
  }

  // Test case for combination {1}/R8:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [-6];
    selectionSorted(Array);
    expect Array[..] == [-6];
  }

  // Test case for combination {1}/R9:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [-7];
    selectionSorted(Array);
    expect Array[..] == [-7];
  }

  // Test case for combination {1}/R10:
  //   POST Q1: multiset(old(Array[..])) == multiset(Array[..])
  {
    var Array := new int[1] [-9];
    selectionSorted(Array);
    expect Array[..] == [-9];
  }

}

method Main()
{
  TestsForselectionSorted();
  print "TestsForselectionSorted: all non-failing tests passed!\n";
}
