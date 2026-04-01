// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_3.dfy
// Method: IsNonPrime
// Generated: 2026-03-31 21:52:28

// Checks if a natural number greater than 1 is non-prime.
method IsNonPrime(n: nat) returns (result: bool)
  requires n > 1
  ensures result <==> exists k :: 1 < k < n && n % k == 0
{
  for i := 2 to n/2 + 1
    invariant ! exists k :: 1 < k < i && n % k == 0
  {
    if n % i == 0 {
      return true;
    }
  }
  return false;
}

// Test cases checked statically.
method IsNonPrimeTest(){
  var res1 := IsNonPrime(2);
  assert !res1;

  var res2 := IsNonPrime(10);
  assert 10 % 2 == 0; // proof helper (example)
  assert res2;

  var res3 := IsNonPrime(35);
  assert 35 % 5 == 0; // proof helper (example)
  assert res3;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  n > 1
  //   POST: result
  //   POST: exists k :: 1 < k < n && n % k == 0
  {
    var n := 4;
    expect n > 1; // PRE-CHECK
    var result := IsNonPrime(n);
    expect result == true;
    expect exists k :: 1 < k < n && n % k == 0;
  }

  // Test case for combination {2}:
  //   PRE:  n > 1
  //   POST: !result
  //   POST: !exists k :: 1 < k < n && n % k == 0
  {
    var n := 2;
    expect n > 1; // PRE-CHECK
    var result := IsNonPrime(n);
    expect result == false;
    expect !exists k :: 1 < k < n && n % k == 0;
  }

  // Test case for combination {2}/Bn=3:
  //   PRE:  n > 1
  //   POST: !result
  //   POST: !exists k :: 1 < k < n && n % k == 0
  {
    var n := 3;
    expect n > 1; // PRE-CHECK
    var result := IsNonPrime(n);
    expect result == false;
    expect !exists k :: 1 < k < n && n % k == 0;
  }

  // Test case for combination {1}/R2:
  //   PRE:  n > 1
  //   POST: result
  //   POST: exists k :: 1 < k < n && n % k == 0
  {
    var n := 6;
    expect n > 1; // PRE-CHECK
    var result := IsNonPrime(n);
    expect result == true;
    expect exists k :: 1 < k < n && n % k == 0;
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
