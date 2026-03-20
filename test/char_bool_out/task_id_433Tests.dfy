// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\char_bool_in\task_id_433.dfy
// Method: IsGreater
// Generated: 2026-03-20 21:12:23

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
  //   POST: !(forall i :: 0 <= i < a.Length ==> n > a[i])
  {
    var n := 0;
    var a := new int[1] [38];
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
