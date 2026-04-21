// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_3.dfy
// Method: IsNonPrime
// Generated: 2026-04-21 23:14:16

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


method TestsForIsNonPrime()
{
  // Test case for combination {1}:
  //   PRE:  n > 1
  //   POST Q1: result
  //   POST Q2: 2 <= (n - 1)
  //   POST Q3: n % 2 == 0
  {
    var n := 10;
    var result := IsNonPrime(n);
    expect result == true;
  }

  // Test case for combination {4}/Bn=2:
  //   PRE:  n > 1
  //   POST Q1: !result
  //   POST Q2: !exists k: int :: 1 < k < n && n % k == 0
  {
    var n := 2;
    var result := IsNonPrime(n);
    expect result == false;
  }

  // Test case for combination {4}/Bn=3:
  //   PRE:  n > 1
  //   POST Q1: !result
  //   POST Q2: !exists k: int :: 1 < k < n && n % k == 0
  {
    var n := 3;
    var result := IsNonPrime(n);
    expect result == false;
  }

}

method Main()
{
  TestsForIsNonPrime();
  print "TestsForIsNonPrime: all non-failing tests passed!\n";
}
