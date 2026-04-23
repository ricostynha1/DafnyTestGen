// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_605.dfy
// Method: IsPrime
// Generated: 2026-04-22 21:33:15

// dafny-synthesis_task_id_605.dfy

method IsPrime(n: int) returns (result: bool)
  requires n >= 2
  ensures result <==> forall k: int {:trigger n % k} :: 2 <= k < n ==> n % k != 0
  decreases n
{
  result := true;
  var i := 2;
  while i <= n / 2
    invariant 2 <= i
    invariant result <==> forall k: int {:trigger n % k} :: 2 <= k < i ==> n % k != 0
    decreases n / 2 - i
  {
    if n % i == 0 {
      result := false;
      break;
    }
    i := i + 1;
  }
}


method TestsForIsPrime()
{
  // Test case for combination {1}:
  //   PRE:  n >= 2
  //   POST Q1: result <==> forall k: int {:trigger n % k} :: 2 <= k < n ==> n % k != 0
  {
    var n := 2;
    var result := IsPrime(n);
    expect result <==> forall k: int :: 2 <= k < n ==> n % k != 0;
    expect result == true; // observed from implementation
  }

  // Test case for combination {2}:
  //   PRE:  n >= 2
  //   POST Q1: !result
  //   POST Q2: 2 <= (n - 1)
  //   POST Q3: n % 2 == 0
  {
    var n := 10;
    var result := IsPrime(n);
    expect result == false;
  }

  // Test case for combination {1}/Bn=3:
  //   PRE:  n >= 2
  //   POST Q1: result
  //   POST Q2: forall k: int {:trigger n % k} :: 2 <= k < n ==> n % k != 0
  {
    var n := 3;
    var result := IsPrime(n);
    expect result == true;
  }

  // Test case for combination {1}/R3:
  //   PRE:  n >= 2
  //   POST Q1: result <==> forall k: int {:trigger n % k} :: 2 <= k < n ==> n % k != 0
  {
    var n := 5;
    var result := IsPrime(n);
    expect result <==> forall k: int :: 2 <= k < n ==> n % k != 0;
    expect result == true; // observed from implementation
  }

}

method Main()
{
  TestsForIsPrime();
  print "TestsForIsPrime: all non-failing tests passed!\n";
}
