// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Insertion_Sorted_Standard__775-775_EVR_int.dfy
// Method: sorting
// Generated: 2026-04-24 16:42:08

// Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Insertion_Sorted_Standard.dfy

predicate InsertionSorted(Array: array<int>, left: int, right: int)
  requires 0 <= left <= right <= Array.Length
  reads Array
  decreases {Array}, Array, left, right
{
  forall i: int, j: int {:trigger Array[j], Array[i]} :: 
    left <= i < j < right ==>
      Array[i] <= Array[j]
}

method sorting(Array: array<int>)
  requires Array.Length > 1
  modifies Array
  ensures InsertionSorted(Array, 0, Array.Length)
  decreases Array
{
  var high := 1;
  while high < Array.Length
    invariant 1 <= high <= Array.Length
    invariant InsertionSorted(Array, 0, high)
    decreases Array.Length - high
  {
    var low := high - 1;
    while low >= 0 && Array[low + 1] < Array[low]
      invariant forall idx: int, idx': int {:trigger Array[idx'], Array[idx]} :: 0 <= idx < idx' < high + 1 && idx' != low + 1 ==> Array[idx] <= Array[idx']
      decreases low - 0, if low >= 0 then Array[low] - Array[low + 1] else 0 - 1
    {
      Array[low], Array[low + 1] := Array[low + 1], Array[low];
      low := 0 - 1;
    }
    high := high + 1;
  }
}


method TestsForsorting()
{
  // Test case for combination {1}:
  //   PRE:  Array.Length > 1
  //   POST Q1: InsertionSorted(Array, 0, Array.Length)
  {
    var Array := new int[2] [-10, -3];
    sorting(Array);
    expect InsertionSorted(Array, 0, Array.Length);
  }

  // Test case for combination {1}/R2:
  //   PRE:  Array.Length > 1
  //   POST Q1: InsertionSorted(Array, 0, Array.Length)
  {
    var Array := new int[2] [-9, -4];
    sorting(Array);
    expect InsertionSorted(Array, 0, Array.Length);
  }

  // Test case for combination {1}/R3:
  //   PRE:  Array.Length > 1
  //   POST Q1: InsertionSorted(Array, 0, Array.Length)
  {
    var Array := new int[2] [-10, 2];
    sorting(Array);
    expect InsertionSorted(Array, 0, Array.Length);
  }

  // Test case for combination {1}/R4:
  //   PRE:  Array.Length > 1
  //   POST Q1: InsertionSorted(Array, 0, Array.Length)
  {
    var Array := new int[2] [2, -2];
    sorting(Array);
    expect InsertionSorted(Array, 0, Array.Length);
    expect Array[..] == [-2, 2]; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  Array.Length > 1
  //   POST Q1: InsertionSorted(Array, 0, Array.Length)
  {
    var Array := new int[2] [-10, 6];
    sorting(Array);
    expect InsertionSorted(Array, 0, Array.Length);
  }

  // Test case for combination {1}/R6:
  //   PRE:  Array.Length > 1
  //   POST Q1: InsertionSorted(Array, 0, Array.Length)
  {
    var Array := new int[2] [-5, -5];
    sorting(Array);
    expect InsertionSorted(Array, 0, Array.Length);
  }

  // Test case for combination {1}/R7:
  //   PRE:  Array.Length > 1
  //   POST Q1: InsertionSorted(Array, 0, Array.Length)
  {
    var Array := new int[2] [6, -6];
    sorting(Array);
    expect InsertionSorted(Array, 0, Array.Length);
    expect Array[..] == [-6, 6]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  Array.Length > 1
  //   POST Q1: InsertionSorted(Array, 0, Array.Length)
  {
    var Array := new int[2] [-4, -10];
    sorting(Array);
    expect InsertionSorted(Array, 0, Array.Length);
    expect Array[..] == [-10, -4]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  Array.Length > 1
  //   POST Q1: InsertionSorted(Array, 0, Array.Length)
  {
    var Array := new int[2] [-3, -8];
    sorting(Array);
    expect InsertionSorted(Array, 0, Array.Length);
    expect Array[..] == [-8, -3]; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  Array.Length > 1
  //   POST Q1: InsertionSorted(Array, 0, Array.Length)
  {
    var Array := new int[2] [-6, -1];
    sorting(Array);
    expect InsertionSorted(Array, 0, Array.Length);
  }

}

method Main()
{
  TestsForsorting();
  print "TestsForsorting: all non-failing tests passed!\n";
}
