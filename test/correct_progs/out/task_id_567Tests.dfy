// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_567.dfy
// Method: IsSortedArr
// Generated: 2026-04-15 10:33:58

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
  //   ENSURES: sorted <==> forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
  {
    var a := new int[0] [];
    var sorted := IsSortedArr(a);
    expect sorted == true;
  }

  // Test case for combination {2}:
  //   POST: !sorted
  //   POST: 0 <= (a.Length - 1 - 1)
  //   POST: !(a[0] <= a[0 + 1])
  //   ENSURES: sorted <==> forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
  {
    var a := new int[2] [7719, 7718];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {3}:
  //   POST: !sorted
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && !(a[i] <= a[i + 1])
  //   ENSURES: sorted <==> forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
  {
    var a := new int[4] [18, 8367, 8366, 26];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {4}:
  //   POST: !sorted
  //   POST: 0 <= (a.Length - 1 - 1)
  //   POST: !(a[(a.Length - 1 - 1)] <= a[(a.Length - 1 - 1) + 1])
  //   ENSURES: sorted <==> forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
  {
    var a := new int[2] [7720, 7719];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {5}:
  //   POST: !sorted
  //   POST: exists i, i_2 | 0 <= i && i < i_2 && i_2 <= (a.Length - 1 - 1) :: (!(a[i] <= a[i + 1])) && (!(a[i_2] <= a[i_2 + 1]))
  //   ENSURES: sorted <==> forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
  {
    var a := new int[3] [21239, 21238, 21237];
    var sorted := IsSortedArr(a);
    expect sorted == false;
  }

  // Test case for combination {1}/Q|a|>=2:
  //   POST: sorted
  //   POST: forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
  //   ENSURES: sorted <==> forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
  {
    var a := new int[2] [-7719, 38];
    var sorted := IsSortedArr(a);
    expect sorted == true;
  }

  // Test case for combination {1}/Q|a|=1:
  //   POST: sorted
  //   POST: forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
  //   ENSURES: sorted <==> forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
  {
    var a := new int[1] [2];
    var sorted := IsSortedArr(a);
    expect sorted == true;
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
