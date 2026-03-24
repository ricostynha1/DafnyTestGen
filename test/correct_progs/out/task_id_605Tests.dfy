// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_605.dfy
// Method: IsPrime
// Generated: 2026-03-24 19:35:20

// Checks if a number greater than 1 is prime.
method IsPrime(n: nat) returns (result: bool)
    requires n > 1
    ensures result <==> (forall k :: 2 <= k < n ==> n % k != 0)
{
    for i := 2 to n/2 + 1
        invariant forall k :: 2 <= k < i ==> n % k != 0
    {
        if n % i == 0 {
            return false;
        }
    }
    return true;
}

// Test cases checked statically by Dafny (for not very large numbers)
method IsPrimeTest(){    
    // small prime number
    var out1 := IsPrime(13);
    assert out1;
 
    // non-prime number
    var out2 := IsPrime(1010);
    assert 1010 % 2 == 0; // proof helper (counter example)
    assert !out2;

    // large prime number
    var out3 := IsPrime(10007);
    assert out3;
}

method Passing()
{
  // Test case for combination {1}:
  //   PRE:  n > 1
  //   POST: result
  //   POST: forall k :: 2 <= k < n ==> n % k != 0
  {
    var n := 2;
    var result := IsPrime(n);
    expect result == true;
  }

  // Test case for combination {2}:
  //   PRE:  n > 1
  //   POST: !result
  //   POST: !forall k :: 2 <= k < n ==> n % k != 0
  {
    var n := 4;
    var result := IsPrime(n);
    expect result == false;
  }

  // Test case for combination {1}/Bn=3:
  //   PRE:  n > 1
  //   POST: result
  //   POST: forall k :: 2 <= k < n ==> n % k != 0
  {
    var n := 3;
    var result := IsPrime(n);
    expect result == true;
  }

  // Test case for combination {1}/R3:
  //   PRE:  n > 1
  //   POST: result
  //   POST: forall k :: 2 <= k < n ==> n % k != 0
  {
    var n := 5;
    var result := IsPrime(n);
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
