// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Final-Project-Dafny_tmp_tmpmcywuqox_Attempts_Insertion_Sorted_Standard__775-775_EVR_int.dfy
// Method: sorting
// Generated: 2026-04-05 23:43:53

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  Array.Length > 1
  //   POST: InsertionSorted(Array, 0, Array.Length)
  {
    var Array := new int[2] [10, 11];
    sorting(Array);
    expect InsertionSorted(Array, 0, Array.Length);
  }

  // Test case for combination {1}/BArray=3:
  //   PRE:  Array.Length > 1
  //   POST: InsertionSorted(Array, 0, Array.Length)
  {
    var Array := new int[3] [5, 4, 6];
    sorting(Array);
    expect InsertionSorted(Array, 0, Array.Length);
  }

  // Test case for combination {1}/R3:
  //   PRE:  Array.Length > 1
  //   POST: InsertionSorted(Array, 0, Array.Length)
  {
    var Array := new int[4] [21, 22, 23, 24];
    sorting(Array);
    expect InsertionSorted(Array, 0, Array.Length);
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
