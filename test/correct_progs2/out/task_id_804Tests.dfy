// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_804.dfy
// Method: ContainsEvenNumber
// Generated: 2026-03-21 23:27:21

// Checks if an array contains an even number.
method ContainsEvenNumber(a: array<int>) returns (result: bool)
  ensures result <==> exists i :: 0 <= i < a.Length && IsEven(a[i])
{
  result := false;
  for i := 0 to a.Length
    invariant ! exists k :: 0 <= k < i && IsEven(a[k])
  {
    if IsEven(a[i]) {
      result := true;
      break;
    }
  }
}

// Checks if a number is even.
predicate IsEven(n: int) {
  n % 2 == 0
}

method ContainsEvenNumberTest(){
  var a1 := new int[] [1, 2, 3];
  var out1 := ContainsEvenNumber(a1);
  assert IsEven(a1[1]); // proof helper
  assert out1;

  var a2:= new int[] [1, 2, 1, 4];
  var out2 := ContainsEvenNumber(a2);
  assert IsEven(a2[1]);
  assert out2;

  var a3:= new int[] [1,1];
  var out3 := ContainsEvenNumber(a3);
  assert ! out3;
}


method Passing()
{
  // Test case for combination {1}/Ba=2:
  //   POST: result
  //   POST: IsEven(a[0])
  {
    var a := new int[2] [-2472, 1121];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {1}/Ba=3:
  //   POST: result
  //   POST: IsEven(a[0])
  {
    var a := new int[3] [-16912, -16911, -16909];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {2}/Ba=3:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsEven(a[i])
  {
    var a := new int[3] [-5, -2, -3];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {1,2}/Ba=3:
  //   POST: result
  //   POST: IsEven(a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsEven(a[i])
  {
    var a := new int[3] [4872, 4874, 4873];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {3}/Ba=2:
  //   POST: result
  //   POST: IsEven(a[(a.Length - 1)])
  {
    var a := new int[2] [2471, 2472];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {3}/Ba=3:
  //   POST: result
  //   POST: IsEven(a[(a.Length - 1)])
  {
    var a := new int[3] [-5, -3, -2];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {1,3}/Ba=1:
  //   POST: result
  //   POST: IsEven(a[0])
  //   POST: IsEven(a[(a.Length - 1)])
  {
    var a := new int[1] [898];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {1,3}/Ba=2:
  //   POST: result
  //   POST: IsEven(a[0])
  //   POST: IsEven(a[(a.Length - 1)])
  {
    var a := new int[2] [4874, 4876];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {1,3}/Ba=3:
  //   POST: result
  //   POST: IsEven(a[0])
  //   POST: IsEven(a[(a.Length - 1)])
  {
    var a := new int[3] [4872, 4873, 4874];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {2,3}/Ba=3:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsEven(a[i])
  //   POST: IsEven(a[(a.Length - 1)])
  {
    var a := new int[3] [-5, -2, -4];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {1,2,3}/Ba=3:
  //   POST: result
  //   POST: IsEven(a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsEven(a[i])
  //   POST: IsEven(a[(a.Length - 1)])
  {
    var a := new int[3] [16728, 21606, 16730];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {4}/Ba=0:
  //   POST: !(result)
  //   POST: !(exists i :: 0 <= i < a.Length && IsEven(a[i]))
  {
    var a := new int[0] [];
    var result := ContainsEvenNumber(a);
    expect result == false;
  }

  // Test case for combination {4}/Ba=1:
  //   POST: !(result)
  //   POST: !(exists i :: 0 <= i < a.Length && IsEven(a[i]))
  {
    var a := new int[1] [1];
    var result := ContainsEvenNumber(a);
    expect result == false;
  }

  // Test case for combination {4}/Ba=2:
  //   POST: !(result)
  //   POST: !(exists i :: 0 <= i < a.Length && IsEven(a[i]))
  {
    var a := new int[2] [4875, 4877];
    var result := ContainsEvenNumber(a);
    expect result == false;
  }

  // Test case for combination {4}/Ba=3:
  //   POST: !(result)
  //   POST: !(exists i :: 0 <= i < a.Length && IsEven(a[i]))
  {
    var a := new int[3] [-3, -1, 4565];
    var result := ContainsEvenNumber(a);
    expect result == false;
  }

  // Test case for combination {1}/R3:
  //   POST: result
  //   POST: IsEven(a[0])
  {
    var a := new int[4] [898, 11841, 5995, 16197];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {2}/R2:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsEven(a[i])
  {
    var a := new int[4] [11707, 32, 16730, 563];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {2}/R3:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsEven(a[i])
  {
    var a := new int[6] [11707, 50, 16730, 57, 64, 563];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {1,2}/R2:
  //   POST: result
  //   POST: IsEven(a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsEven(a[i])
  {
    var a := new int[4] [11706, 34, 16730, 1071];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {1,2}/R3:
  //   POST: result
  //   POST: IsEven(a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsEven(a[i])
  {
    var a := new int[8] [11706, 40, 74, 16730, 94, 5994, 60, 1071];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {3}/R3:
  //   POST: result
  //   POST: IsEven(a[(a.Length - 1)])
  {
    var a := new int[4] [16197, 563, 35, 898];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {2,3}/R2:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsEven(a[i])
  //   POST: IsEven(a[(a.Length - 1)])
  {
    var a := new int[4] [563, 31, 1218, 3592];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {2,3}/R3:
  //   POST: result
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsEven(a[i])
  //   POST: IsEven(a[(a.Length - 1)])
  {
    var a := new int[6] [563, 2472, 66, 1218, 60, 3592];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {1,2,3}/R2:
  //   POST: result
  //   POST: IsEven(a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsEven(a[i])
  //   POST: IsEven(a[(a.Length - 1)])
  {
    var a := new int[4] [4874, 32, 562, 1218];
    var result := ContainsEvenNumber(a);
    expect result == true;
  }

  // Test case for combination {1,2,3}/R3:
  //   POST: result
  //   POST: IsEven(a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && IsEven(a[i])
  //   POST: IsEven(a[(a.Length - 1)])
  {
    var a := new int[6] [3776, 7218, 57, 60, 16730, 1218];
    var result := ContainsEvenNumber(a);
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
