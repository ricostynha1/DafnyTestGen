// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_145.dfy
// Method: MaxDifference
// Generated: 2026-03-24 11:21:14

// Finds the maximum difference between any two elements in a non-empty array.
method MaxDifference(a: array<int>) returns (diff: int)
  requires a.Length > 0
  ensures exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && a[i] - a[j] == diff
  ensures forall i, j :: 0 <= i < a.Length && 0 <= j < a.Length ==> a[i] - a[j] <= diff
{
  var minVal := a[0]; // minimum value in the array (so far)
  var maxVal := a[0]; // maximum value in the array (so far)
  for i := 1 to a.Length
    invariant minVal in a[..i]
    invariant maxVal in a[..i]
    invariant forall k :: 0 <= k < i ==> minVal <= a[k] <= maxVal
  {
    if a[i] < minVal {
      minVal := a[i];
    } else if a[i] > maxVal {
      maxVal := a[i];
    }
  }
  diff := maxVal - minVal;
}

// Test cases checked statically.
method MaxDifferenceTest(){
  var a1:= new int[] [2, 1, 5, 3];
  var out1 := MaxDifference(a1);
  assert a1[2] == 5; // proof helper (max value in the array)
  assert a1[1] == 1; // proof helper (min value in the array)
  assert out1 == 4 == 5 - 1;

  var a2:= new int[] [9,3,2,5,1];
  var out2 := MaxDifference(a2);
  assert a2[0] == 9; // helper
  assert a2[4] == 1; // helper
  assert out2 == 8 == 9 - 1;
  
  var a3:= new int[] [3,2,1];
  var out3 := MaxDifference(a3);
  assert a3[0] == 3;  // helper
  assert a3[2] == 1;  // helper
  assert out3 == 2 == 3 - 1;
}

method GeneratedTests_MaxDifference()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && a[i] - a[j] == diff
  //   POST: forall i, j :: 0 <= i < a.Length && 0 <= j < a.Length ==> a[i] - a[j] <= diff
  {
    var a := new int[1] [281];
    var diff := MaxDifference(a);
    expect diff == 0;
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a.Length > 0
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && a[i] - a[j] == diff
  //   POST: forall i, j :: 0 <= i < a.Length && 0 <= j < a.Length ==> a[i] - a[j] <= diff
  {
    var a := new int[2] [8945, 8944];
    var diff := MaxDifference(a);
    expect diff == 1;
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && a[i] - a[j] == diff
  //   POST: forall i, j :: 0 <= i < a.Length && 0 <= j < a.Length ==> a[i] - a[j] <= diff
  {
    var a := new int[3] [7750, 6906, 6907];
    var diff := MaxDifference(a);
    expect diff == 844;
  }

}

method Main()
{
  GeneratedTests_MaxDifference();
  print "GeneratedTests_MaxDifference: all tests passed!\n";
}
