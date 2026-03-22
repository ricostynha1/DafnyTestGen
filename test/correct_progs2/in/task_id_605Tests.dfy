// Auto-generated test cases by DafnyTestGen
// Source: c:\Dados\Dafny\DafnyTestGen\test\correct_progs2\in\task_id_605.dfy
// Method: IsPrime
// Generated: 2026-03-22 12:15:04

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

method GeneratedTests_IsPrime()
{
  // Test case for combination {2}:
  //   PRE:  n > 1
  //   POST: !(result)
  //   POST: !(n % 2 != 0)
  {
    var n := 4;
    var result := IsPrime(n);
    expect result == false;
  }

  // Test case for combination {3}:
  //   PRE:  n > 1
  //   POST: !(result)
  //   POST: exists k :: 3 <= k < (n - 1) && !(n % k != 0)
  {
    var n := 15;
    var result := IsPrime(n);
    expect result == false;
  }

  // Test case for combination {2,3}:
  //   PRE:  n > 1
  //   POST: !(result)
  //   POST: !(n % 2 != 0)
  //   POST: exists k :: 3 <= k < (n - 1) && !(n % k != 0)
  {
    var n := 6;
    var result := IsPrime(n);
    expect result == false;
  }

}

method Main()
{
  GeneratedTests_IsPrime();
  print "GeneratedTests_IsPrime: all tests passed!\n";
}
