// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_567.dfy
// Method: IsSortedArr
// Generated: 2026-03-21 23:10:25

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
  // Test case for combination {1}/Ba=2:
  //   POST: sorted
  //   POST: forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
  {
    var a := new int[2] [1236, 1237];
    var sorted := IsSortedArr(a);
    expect sorted == true;
  }

  // Test case for combination {1}/Ba=3:
  //   POST: sorted
  //   POST: forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
  {
    var a := new int[3] [7718, 7719, 7720];
    var sorted := IsSortedArr(a);
    expect sorted == true;
  }

  // Test case for combination {2}/Ba=3:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  {
    var a := new int[3] [8366, 8365, 8367];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {4}/Ba=3:
  //   POST: !(sorted)
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[3] [1794, 1796, 1795];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {2,4}/Ba=2:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[2] [8855, 8854];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {2,4}/Ba=3:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[3] [7720, 7719, 7718];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {1}/R3:
  //   POST: sorted
  //   POST: forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
  {
    var a := new int[4] [-451, -211, 1144, 3032];
    var sorted := IsSortedArr(a);
    expect sorted == true;
  }

  // Test case for combination {2}/R2:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  {
    var a := new int[4] [-1001, -1002, -1002, -567];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {2}/R3:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  {
    var a := new int[7] [-8797, -8798, -5499, -4821, -962, 6759, 8568];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {3}/R1:
  //   POST: !(sorted)
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  {
    var a := new int[4] [1984, 6663, 6662, 12567];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {3}/R2:
  //   POST: !(sorted)
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  {
    var a := new int[7] [-449, 3053, 3056, 3055, 3054, -5286, 1592];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {3}/R3:
  //   POST: !(sorted)
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  {
    var a := new int[8] [-449, 525, 38, 39, 40, 1656, 1655, 2245];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {2,3}/R1:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  {
    var a := new int[4] [924, 923, 922, 2245];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {2,3}/R2:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  {
    var a := new int[7] [2436, 2435, 38, -4320, -6209, -8279, -6956];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {2,3}/R3:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  {
    var a := new int[6] [2437, 2436, 2435, 2434, -8098, -6956];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {4}/R2:
  //   POST: !(sorted)
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[4] [-1201, -305, 1977, 1976];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {4}/R3:
  //   POST: !(sorted)
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[5] [-8365, -1178, -439, 1653, -3003];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {2,4}/R3:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[4] [-1627, -15781, -5348, -13818];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {3,4}/R1:
  //   POST: !(sorted)
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[4] [-5853, 2245, 2244, 590];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {3,4}/R2:
  //   POST: !(sorted)
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[6] [-8098, -6445, 56, 4096, -588, -589];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {3,4}/R3:
  //   POST: !(sorted)
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[5] [-8098, -7124, -6957, -6958, -11638];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {2,3,4}/R1:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[4] [8947, 8946, 8945, 8944];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {2,3,4}/R2:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[7] [283, 282, 62, 281, 280, 279, 278];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {2,3,4}/R3:
  //   POST: !(sorted)
  //   POST: !(a[0] <= a[0 + 1])
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  {
    var a := new int[6] [283, 282, 281, 280, 609, 608];
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
