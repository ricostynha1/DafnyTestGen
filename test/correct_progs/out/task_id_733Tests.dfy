// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_733.dfy
// Method: FindFirstOccurrence
// Generated: 2026-04-21 23:44:17

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


method TestsForFindFirstOccurrence()
{
  // Test case for combination {2}/Rel:
  //   PRE:  forall i: int, j: int :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  //   POST Q1: target in arr[..]
  //   POST Q2: 0 <= index
  //   POST Q3: index < arr.Length
  //   POST Q4: arr[index] == target
  //   POST Q5: target !in arr[..index]
  {
    var arr := new int[4] [-10, -2, -1, -1];
    var target := -1;
    var index := FindFirstOccurrence(arr, target);
    expect index == 2;
  }

  // Test case for combination {3}:
  //   PRE:  forall i: int, j: int :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  //   POST Q1: target !in arr[..]
  //   POST Q2: index == -1
  {
    var arr := new int[1] [-10];
    var target := -9;
    var index := FindFirstOccurrence(arr, target);
    expect index == -1;
  }

  // Test case for combination {2}/V4:
  //   PRE:  forall i: int, j: int :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  //   POST Q1: target in arr[..]
  //   POST Q2: 0 <= index
  //   POST Q3: index < arr.Length
  //   POST Q4: arr[index] == target  // VACUOUS (forced true by other literals for this ins)
  //   POST Q5: target !in arr[..index]
  {
    var arr := new int[1] [-1];
    var target := -1;
    var index := FindFirstOccurrence(arr, target);
    expect index == 0;
  }

  // Test case for combination {2}/Bindex=1:
  //   PRE:  forall i: int, j: int :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  //   POST Q1: target in arr[..]
  //   POST Q2: 0 <= index
  //   POST Q3: index < arr.Length
  //   POST Q4: arr[index] == target
  //   POST Q5: target !in arr[..index]
  {
    var arr := new int[2] [8, 10];
    var target := 10;
    var index := FindFirstOccurrence(arr, target);
    expect index == 1;
  }

}

method Main()
{
  TestsForFindFirstOccurrence();
  print "TestsForFindFirstOccurrence: all non-failing tests passed!\n";
}
