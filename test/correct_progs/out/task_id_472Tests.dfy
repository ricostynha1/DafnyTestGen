// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_472.dfy
// Method: ContainsConsecutiveNumbers
// Generated: 2026-04-10 23:17:12

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
  // Test case for combination {1}:
  //   POST: result
  //   POST: 0 <= (a.Length - 1 - 1)
  //   POST: a[0] + 1 == a[0 + 1]
  //   ENSURES: result <==> exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1]
  {
    var a := new int[3] [28957, 28958, 28960];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  //   ENSURES: result <==> exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1]
  {
    var a := new int[6] [-2, 0, -1, 0, 1, 2440];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {3}:
  //   POST: result
  //   POST: 0 <= (a.Length - 1 - 1)
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  //   ENSURES: result <==> exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1]
  {
    var a := new int[4] [2435, 2437, 23677, 23678];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {4}:
  //   POST: !result
  //   POST: !exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1]
  //   ENSURES: result <==> exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1]
  {
    var a := new int[0] [];
    var result := ContainsConsecutiveNumbers(a);
    expect result == false;
  }

  // Test case for combination {1}/Oresult=true:
  //   POST: result
  //   POST: 0 <= (a.Length - 1 - 1)
  //   POST: a[0] + 1 == a[0 + 1]
  //   ENSURES: result <==> exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1]
  {
    var a := new int[4] [28957, 28958, 28960, 28962];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {2}/Oresult=true:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1 - 1) && a[i] + 1 == a[i + 1]
  //   ENSURES: result <==> exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1]
  {
    var a := new int[5] [-2, 0, 11796, 11797, 11799];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {3}/Oresult=true:
  //   POST: result
  //   POST: 0 <= (a.Length - 1 - 1)
  //   POST: a[(a.Length - 1 - 1)] + 1 == a[(a.Length - 1 - 1) + 1]
  //   ENSURES: result <==> exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1]
  {
    var a := new int[3] [23673, 23675, 23676];
    var result := ContainsConsecutiveNumbers(a);
    expect result == true;
  }

  // Test case for combination {4}/Oresult=false:
  //   POST: !result
  //   POST: !exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1]
  //   ENSURES: result <==> exists i :: 0 <= i < a.Length - 1 && a[i] + 1 == a[i + 1]
  {
    var a := new int[1] [15];
    var result := ContainsConsecutiveNumbers(a);
    expect result == false;
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
