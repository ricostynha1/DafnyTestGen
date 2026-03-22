// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_433.dfy
// Method: IsGreater
// Generated: 2026-03-22 22:39:02

// Checks if a number 'n' is greater than all elements in an array 'a'
method IsGreater(n: int, a: array<int>) returns (result: bool)
    ensures result <==> (forall i :: 0 <= i < a.Length ==> n > a[i])
{
    for i := 0 to a.Length
        invariant forall k :: 0 <= k < i ==> n > a[k]
    {
        if n <= a[i] {
            return false;
        }
    }
    return true;
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 0;
    var a := new int[0] [];
    var result := IsGreater(n, a);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST: !(result)
  //   POST: !(n > a[0])
  {
    var n := 8855;
    var a := new int[2] [8855, 8854];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {3}:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  {
    var n := 955;
    var a := new int[4] [953, 7719, 1490, 954];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,3}:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  {
    var n := 0;
    var a := new int[4] [38, 2437, 5853, -1];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {4}:
  //   POST: !(result)
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 38;
    var a := new int[2] [37, 38];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,4}:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 0;
    var a := new int[1] [8855];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {3,4}:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 0;
    var a := new int[4] [-1, 2437, 5853, 1236];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,3,4}:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 0;
    var a := new int[4] [38, 31, 8855, 1236];
    var result := IsGreater(n, a);
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
