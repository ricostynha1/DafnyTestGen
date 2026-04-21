// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_793.dfy
// Method: LastPosition
// Generated: 2026-04-21 22:57:05

// Determines the last position of an element 'elem' in a sorted array 'arr'.
// If the element is not in the array, the method returns -1.
method LastPosition(arr: array<int>, elem: int) returns (pos: int)
    requires forall i, j :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
    ensures elem !in arr[..] ==> pos == -1 
    ensures elem in arr[..] ==> 0 <= pos < arr.Length && arr[pos] == elem && elem !in arr[pos+1..]
{
    // Scan from the end of the array to the begin of the array.
    var i := arr.Length - 1;
    while i >= 0 && arr[i] > elem
        invariant -1 <= i < arr.Length
        invariant forall k :: i < k < arr.Length ==> arr[k] > elem
    {        
        i := i - 1;
    }
    if i >= 0 && arr[i] == elem {
        return i;
    }
    return -1;
}

// Test cases checked statically.
method LastPositionTest(){
    var a1 := new int[] [1, 1, 1, 2, 3, 4, 4];

    var out1 := LastPosition(a1, 1);
    assert a1[2] == 1; // proof helper 
    assert out1 == 2;

    var out2 := LastPosition(a1, 4);
    assert a1[6] == 4; // proof helper
    assert out2 == 6;

    var out3 := LastPosition(a1, 5);
    assert out3 == -1;

    var out4 := LastPosition(a1, 0);
    assert out3 == -1;
}

method TestsForLastPosition()
{
  // Test case for combination {2}/Rel:
  //   PRE:  forall i: int, j: int :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  //   POST Q1: elem in arr[..]
  //   POST Q2: 0 <= pos
  //   POST Q3: pos < arr.Length
  //   POST Q4: arr[pos] == elem
  //   POST Q5: elem !in arr[pos + 1..]
  {
    var arr := new int[4] [-10, -10, -10, -9];
    var elem := -10;
    var pos := LastPosition(arr, elem);
    expect pos == 2;
  }

  // Test case for combination {3}:
  //   PRE:  forall i: int, j: int :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  //   POST Q1: elem !in arr[..]
  //   POST Q2: pos == -1
  {
    var arr := new int[1] [-3];
    var elem := -10;
    var pos := LastPosition(arr, elem);
    expect pos == -1;
  }

  // Test case for combination {2}/V4:
  //   PRE:  forall i: int, j: int :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  //   POST Q1: elem in arr[..]
  //   POST Q2: 0 <= pos
  //   POST Q3: pos < arr.Length
  //   POST Q4: arr[pos] == elem  // VACUOUS (forced true by other literals for this ins)
  //   POST Q5: elem !in arr[pos + 1..]
  {
    var arr := new int[1] [-1];
    var elem := -1;
    var pos := LastPosition(arr, elem);
    expect pos == 0;
  }

  // Test case for combination {2}/Bpos=1:
  //   PRE:  forall i: int, j: int :: 0 <= i < j < arr.Length ==> arr[i] <= arr[j]
  //   POST Q1: elem in arr[..]
  //   POST Q2: 0 <= pos
  //   POST Q3: pos < arr.Length
  //   POST Q4: arr[pos] == elem
  //   POST Q5: elem !in arr[pos + 1..]
  {
    var arr := new int[2] [-10, -9];
    var elem := -9;
    var pos := LastPosition(arr, elem);
    expect pos == 1;
  }

}

method Main()
{
  TestsForLastPosition();
  print "TestsForLastPosition: all non-failing tests passed!\n";
}
