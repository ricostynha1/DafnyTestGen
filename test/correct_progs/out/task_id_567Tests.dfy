// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\correct_progs\in\task_id_567.dfy
// Method: IsSortedArr
// Generated: 2026-03-23 00:10:47

// Checks if an array is sorted in non-decreasing order.
method IsSortedArr(a: array<int>) returns (sorted: bool)
    ensures sorted <==> forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i+1]
{
    if a.Length > 0 {
        for k := 1 to a.Length
            invariant forall i, j :: 0 <= i < j < k ==> a[i] <= a[j]
        {
            if a[k-1] > a[k] {
                return false;
            }
        }
    }
    return true;
}

// Test cases checked statically.
method IsSortedTest(){
  var a1:= new int[] [1, 1, 2, 4, 6];
  var out1 := IsSortedArr(a1);
  assert out1;

  var a2 := new int[] [1, 2, 4, 3, 6];
  var out2 := IsSortedArr(a2);
  assert a2[3] < a2[2]; // helper (counterexample)
  assert ! out2;
}

method Passing()
{
  // Test case for combination {1}:
  //   POST: sorted
  //   POST: forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
  {
    var a := new int[0] [];
    var sorted := IsSortedArr(a);
    expect sorted == true;
  }

  // Test case for combination {2}:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  {
    var a := new int[3] [-8855, -8856, 8365];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {3}:
  //   POST: !(sorted)
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  {
    var a := new int[5] [-2437, 0, 0, -1, 0];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {2,3}:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  {
    var a := new int[4] [21240, 21239, 0, 8855];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {4}:
  //   POST: !(sorted)
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[3] [11292, 11292, 11291];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {2,4}:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[2] [21238, 21237];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {3,4}:
  //   POST: !(sorted)
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[4] [-21238, 0, -1, -2];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {2,3,4}:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[4] [8855, 8854, 8853, 8852];
    var sorted := IsSortedArr(a);
    expect sorted == false;
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
