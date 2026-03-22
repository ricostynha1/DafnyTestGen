// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_775.dfy
// Method: IsOddAtIndexOdd
// Generated: 2026-03-21 23:21:23

// Checks if all elements at odd indices are odd.
method IsOddAtIndexOdd(a: array<int>) returns (result: bool)
    ensures result <==> forall i :: 0 <= i < a.Length && IsOdd(i) ==> IsOdd(a[i])
{
    for i := 0 to a.Length
        invariant forall k :: 0 <= k < i && IsOdd(k) ==> IsOdd(a[k])
    {
        if IsOdd(i) && !IsOdd(a[i]) {
            return false;
        }
    }
    return true;
}

predicate IsOdd(n: int) {
    n % 2 == 1
}

// Test cases checked statically.
method IsOddAtIndexOddTest(){
  var a1 := new int[] [2, 1, 4, 3, 6, 7, 6, 3];
  var out1 := IsOddAtIndexOdd(a1);
  assert out1;

  var a2 := new int[] [1, 2, 3];
  var out2 := IsOddAtIndexOdd(a2);
  assert a2[1] == 2; // proof helper (counter example)
  assert !out2;
}

method Passing()
{
  // Test case for combination {1}/Ba=0:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length && IsOdd(i) ==> IsOdd(a[i])
  {
    var a := new int[0] [];
    var result := IsOddAtIndexOdd(a);
    expect result == true;
  }

  // Test case for combination {1}/Ba=1:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length && IsOdd(i) ==> IsOdd(a[i])
  {
    var a := new int[1] [2];
    var result := IsOddAtIndexOdd(a);
    expect result == true;
  }

  // Test case for combination {1}/Ba=2:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length && IsOdd(i) ==> IsOdd(a[i])
  {
    var a := new int[2] [6, 2473];
    var result := IsOddAtIndexOdd(a);
    expect result == true;
  }

  // Test case for combination {1}/Ba=3:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length && IsOdd(i) ==> IsOdd(a[i])
  {
    var a := new int[3] [4, 2473, 5];
    var result := IsOddAtIndexOdd(a);
    expect result == true;
  }

  // Test case for combination {3}/Ba=3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsOdd(i) && !(IsOdd(a[i]))
  {
    var a := new int[3] [17, 2472, 18];
    var result := IsOddAtIndexOdd(a);
    expect result == false;
  }

  // Test case for combination {4}/Ba=2:
  //   POST: !(result)
  //   POST: IsOdd((a.Length - 1)) && !(IsOdd(a[(a.Length - 1)]))
  {
    var a := new int[2] [14, 3592];
    var result := IsOddAtIndexOdd(a);
    expect result == false;
  }

  // Test case for combination {3}/R2:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsOdd(i) && !(IsOdd(a[i]))
  {
    var a := new int[4] [36, 11706, 37, 1071];
    var result := IsOddAtIndexOdd(a);
    expect result == false;
  }

  // Test case for combination {3}/R3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsOdd(i) && !(IsOdd(a[i]))
  {
    var a := new int[7] [38, 4564, 41, 54, 55, 51, 56];
    var result := IsOddAtIndexOdd(a);
    expect result == false;
  }

  // Test case for combination {4}/R2:
  //   POST: !(result)
  //   POST: IsOdd((a.Length - 1)) && !(IsOdd(a[(a.Length - 1)]))
  {
    var a := new int[4] [35, 37, 40, 898];
    var result := IsOddAtIndexOdd(a);
    expect result == false;
  }

  // Test case for combination {4}/R3:
  //   POST: !(result)
  //   POST: IsOdd((a.Length - 1)) && !(IsOdd(a[(a.Length - 1)]))
  {
    var a := new int[6] [32, 11707, 71, 17891, 70, 898];
    var result := IsOddAtIndexOdd(a);
    expect result == false;
  }

  // Test case for combination {3,4}/R1:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsOdd(i) && !(IsOdd(a[i]))
  //   POST: IsOdd((a.Length - 1)) && !(IsOdd(a[(a.Length - 1)]))
  {
    var a := new int[4] [41, 1070, 50, 1948];
    var result := IsOddAtIndexOdd(a);
    expect result == false;
  }

  // Test case for combination {3,4}/R2:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsOdd(i) && !(IsOdd(a[i]))
  //   POST: IsOdd((a.Length - 1)) && !(IsOdd(a[(a.Length - 1)]))
  {
    var a := new int[6] [45, 16730, 49, 53, 59, 2284];
    var result := IsOddAtIndexOdd(a);
    expect result == false;
  }

  // Test case for combination {3,4}/R3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsOdd(i) && !(IsOdd(a[i]))
  //   POST: IsOdd((a.Length - 1)) && !(IsOdd(a[(a.Length - 1)]))
  {
    var a := new int[8] [42, 43, 44, 14130, 76, 5494, 86, 4564];
    var result := IsOddAtIndexOdd(a);
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
