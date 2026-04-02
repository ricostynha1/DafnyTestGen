// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_733.dfy
// Method: FindFirstOccurrence
// Generated: 2026-04-02 18:21:39

// Finds the index of the first occurrence of a target in a sorted array.
// If the target is not in the array, returns -1.
method FindFirstOccurrence(arr: array<int>, target: int) returns (index: int)
    requires forall i, j :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
    ensures target !in arr[..] ==> index == -1 
    ensures target in arr[..] ==> 0 <= index < arr.Length && arr[index] == target && target !in arr[..index]
{
    for i := 0 to arr.Length
        invariant target !in arr[..i]
    {
        if arr[i] == target {
            return i;
        }
        else if arr[i] > target {
            return -1;
        }
    }
    return -1;
}

// Test cases checked statically.
method FindFirstOccurrenceTest(){
    var a1 := new int[] [2, 5, 5, 5, 6, 6, 8, 9, 9, 9];
    var out1 := FindFirstOccurrence(a1, 5);
    assert a1[1] == 5; // proof helper
    assert out1 == 1;

    var out2 := FindFirstOccurrence(a1, 9);
    assert a1[7] == 9; // proof helper
    assert out2 == 7;

    var out3 := FindFirstOccurrence(a1, 1);
    assert out3 == -1;
}


method GeneratedTests_FindFirstOccurrence()
{
  // Test case for combination {2}:
  //   PRE:  forall i, j :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  //   POST: !(target !in arr[..])
  //   POST: 0 <= index < arr.Length
  //   POST: arr[index] == target
  //   POST: target !in arr[..index]
  {
    var arr := new int[1] [609];
    var target := 609;
    var index := FindFirstOccurrence(arr, target);
    expect index == 0;
  }

  // Test case for combination {3}:
  //   PRE:  forall i, j :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  //   POST: index == -1
  //   POST: !(target in arr[..])
  {
    var arr := new int[0] [];
    var target := 0;
    var index := FindFirstOccurrence(arr, target);
    expect index == -1;
  }

  // Test case for combination {2}/Barr=2,target=0,arr-shape=strict-asc:
  //   PRE:  forall i, j :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  //   POST: !(target !in arr[..])
  //   POST: 0 <= index < arr.Length
  //   POST: arr[index] == target
  //   POST: target !in arr[..index]
  {
    var arr := new int[2] [0, 7720];
    var target := 0;
    var index := FindFirstOccurrence(arr, target);
    expect index == 0;
  }

  // Test case for combination {2}/Barr=3,target=1,arr-shape=const:
  //   PRE:  forall i, j :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  //   POST: !(target !in arr[..])
  //   POST: 0 <= index < arr.Length
  //   POST: arr[index] == target
  //   POST: target !in arr[..index]
  {
    var arr := new int[3] [1, 1, 1];
    var target := 1;
    var index := FindFirstOccurrence(arr, target);
    expect index == 0;
  }

}

method Main()
{
  GeneratedTests_FindFirstOccurrence();
  print "GeneratedTests_FindFirstOccurrence: all tests passed!\n";
}
