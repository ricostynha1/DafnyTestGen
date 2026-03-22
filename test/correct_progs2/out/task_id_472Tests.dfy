// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_472.dfy
// Method: ContainsConsecutiveNumbers
// Generated: 2026-03-21 23:08:47

// Checks if an array contains at least two consecutive numbers
method ContainsConsecutiveNumbers(a: array<int>) returns (result: bool)
    ensures result <==> (exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1])
{
    result := false;
    if a.Length > 0 {
        for i := 0 to a.Length - 1
            invariant forall k :: 0 <= k < i ==> a[k] + 1 != a[k + 1]
        {
            if a[i] + 1 == a[i + 1] {
                result := true;
                break;
            }
        }
    }
}

// Test cases checked statically
method ContainsConsecutiveNumbersTest(){
    // all consecutive
    var a1 := new int[] [1, 2, 3, 4, 5];
    var out1 := ContainsConsecutiveNumbers(a1);
    assert a1[1] == a1[0] + 1; // proof helper (example)
    assert out1;

    // some consecutive
    var a2 := new int[] [1, 3, 4, 6];
    var out2 := ContainsConsecutiveNumbers(a2);
    assert a2[2] == a2[1] + 1; // proof helper (example)
    assert out2;

    // none consecutive
    var a3 := new int[] [1, 3, 5];
    var out3 := ContainsConsecutiveNumbers(a3);
    assert !out3;

    var a4 := new int[] [1];
    var out4 := ContainsConsecutiveNumbers(a4);
    assert !out4;

    var a5 := new int[] [];
    var out5 := ContainsConsecutiveNumbers(a5);
    assert !out5;
}

method Passing()
{
  // Test case for combination {1}/Ba=3:
  //   POST: result
  //   POST: a[0] + 1 == a[0 + 1]
  {
    var a := new int[3] [2437, 2438, 2440];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {3}/Ba=3:
  //   POST: result
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  {
    var a := new int[3] [2435, 2437, 2438];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {1,3}/Ba=2:
  //   POST: result
  //   POST: a[0] + 1 == a[0 + 1]
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  {
    var a := new int[2] [609, 610];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {1,3}/Ba=3:
  //   POST: result
  //   POST: a[0] + 1 == a[0 + 1]
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  {
    var a := new int[3] [1235, 1236, 1237];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {4}/Ba=0:
  //   POST: !(result)
  //   POST: !(exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1])
  {
    var a := new int[0] [];
    var result := ContainsConsecutiveNumbers(a);
    expect result == false;
  }

  // Test case for combination {4}/Ba=1:
  //   POST: !(result)
  //   POST: !(exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1])
  {
    var a := new int[1] [2];
    var result := ContainsConsecutiveNumbers(a);
    expect result == false;
  }

  // Test case for combination {4}/Ba=2:
  //   POST: !(result)
  //   POST: !(exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1])
  {
    var a := new int[2] [7719, 7721];
    var result := ContainsConsecutiveNumbers(a);
    expect result == false;
  }

  // Test case for combination {4}/Ba=3:
  //   POST: !(result)
  //   POST: !(exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1])
  {
    var a := new int[3] [1234, 1236, 1238];
    var result := ContainsConsecutiveNumbers(a);
    expect result == false;
  }

  // Test case for combination {1}/R2:
  //   POST: result
  //   POST: a[0] + 1 == a[0 + 1]
  {
    var a := new int[4] [8097, 8098, 10624, 10626];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {1}/R3:
  //   POST: result
  //   POST: a[0] + 1 == a[0 + 1]
  {
    var a := new int[8] [-2531, -2530, -2528, -1212, 4398, 13712, 13712, 17225];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {2}/R1:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  {
    var a := new int[4] [1107, 1107, 1108, 1110];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {2}/R2:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  {
    var a := new int[7] [1139, 1141, 1142, 1143, 66, 607, 609];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {2}/R3:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  {
    var a := new int[6] [1139, 1141, 1142, 1143, 609, 611];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {1,2}/R1:
  //   POST: result
  //   POST: a[0] + 1 == a[0 + 1]
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  {
    var a := new int[4] [9725, 9726, 9727, 9729];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {1,2}/R2:
  //   POST: result
  //   POST: a[0] + 1 == a[0 + 1]
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  {
    var a := new int[8] [1796, 1797, 39, 65, 1594, 1595, 1593, 1596];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {1,2}/R3:
  //   POST: result
  //   POST: a[0] + 1 == a[0 + 1]
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  {
    var a := new int[6] [2280, 2281, 2282, 55, 447, 449];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {3}/R2:
  //   POST: result
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  {
    var a := new int[4] [251, 253, 250, 251];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {3}/R3:
  //   POST: result
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  {
    var a := new int[5] [3579, -7228, -7226, 1141, 1142];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {1,3}/R3:
  //   POST: result
  //   POST: a[0] + 1 == a[0 + 1]
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  {
    var a := new int[4] [971, 972, 974, 975];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {2,3}/R1:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  {
    var a := new int[4] [8363, 8365, 8366, 8367];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {2,3}/R2:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  {
    var a := new int[5] [6906, 6906, 1143, 1144, 1145];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {2,3}/R3:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  {
    var a := new int[7] [1886, 1888, 1889, 1890, 60, 8364, 8365];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {1,2,3}/R1:
  //   POST: result
  //   POST: a[0] + 1 == a[0 + 1]
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  {
    var a := new int[4] [8943, 8944, 8945, 8946];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {1,2,3}/R2:
  //   POST: result
  //   POST: a[0] + 1 == a[0 + 1]
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  {
    var a := new int[7] [279, 280, 62, 281, 282, 283, 284];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {1,2,3}/R3:
  //   POST: result
  //   POST: a[0] + 1 == a[0 + 1]
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  {
    var a := new int[6] [279, 280, 281, 282, 609, 610];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
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
