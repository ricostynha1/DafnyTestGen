// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_605__165_LVR_0.dfy
// Method: IsPrime
// Generated: 2026-04-24 12:05:08

// dafny-synthesis_task_id_605.dfy

method IsPrime(n: int) returns (result: bool)
  requires n >= 2
  ensures result <==> forall k: int {:trigger n % k} :: 2 <= k < n ==> n % k != 0
  decreases n
{
  result := true;
  var i := 0;
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
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  n >= 2
  //   POST Q1: result
  //   POST Q2: forall k: int {:trigger n % k} :: 2 <= k < n ==> n % k != 0
  {
    var n := 2;
    var result := IsPrime(n);
    // runtime error: Unhandled exception. System.DivideByZeroException: Attempted to divide by zero.
    // runtime error: at System.Numerics.BigInteger.op_Modulus(BigInteger dividend, BigInteger divisor)
    // runtime error: at Dafny.Helpers.EuclideanModulus(BigInteger a, BigInteger b) in C:\cygwin64\tmp\DafnyCBT_puw1w23fjug\runner.cs:line 1828
    // expect result == true;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  n >= 2
  //   POST Q1: !result
  //   POST Q2: 2 <= (n - 1)
  //   POST Q3: n % 2 == 0
  {
    var n := 4;
    var result := IsPrime(n);
    // runtime error: Unhandled exception. System.DivideByZeroException: Attempted to divide by zero.
    // runtime error: at System.Numerics.BigInteger.op_Modulus(BigInteger dividend, BigInteger divisor)
    // runtime error: at Dafny.Helpers.EuclideanModulus(BigInteger a, BigInteger b) in C:\cygwin64\tmp\DafnyCBT_puw1w23fjug\runner.cs:line 1828
    // expect result == false;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}:
  //   PRE:  n >= 2
  //   POST Q1: !result
  //   POST Q2: exists k :: 3 <= k < (n - 1) && !(n % k != 0)
  {
    var n := 6;
    var result := IsPrime(n);
    // runtime error: Unhandled exception. System.DivideByZeroException: Attempted to divide by zero.
    // runtime error: at System.Numerics.BigInteger.op_Modulus(BigInteger dividend, BigInteger divisor)
    // runtime error: at Dafny.Helpers.EuclideanModulus(BigInteger a, BigInteger b) in C:\cygwin64\tmp\DafnyCBT_puw1w23fjug\runner.cs:line 1828
    // expect result == false;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bn=3:
  //   PRE:  n >= 2
  //   POST Q1: result
  //   POST Q2: forall k: int {:trigger n % k} :: 2 <= k < n ==> n % k != 0
  {
    var n := 3;
    var result := IsPrime(n);
    // runtime error: Unhandled exception. System.DivideByZeroException: Attempted to divide by zero.
    // runtime error: at System.Numerics.BigInteger.op_Modulus(BigInteger dividend, BigInteger divisor)
    // runtime error: at Dafny.Helpers.EuclideanModulus(BigInteger a, BigInteger b) in C:\cygwin64\tmp\DafnyCBT_puw1w23fjug\runner.cs:line 1828
    // expect result == true;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   PRE:  n >= 2
  //   POST Q1: result
  //   POST Q2: forall k: int {:trigger n % k} :: 2 <= k < n ==> n % k != 0
  {
    var n := 5;
    var result := IsPrime(n);
    // runtime error: Unhandled exception. System.DivideByZeroException: Attempted to divide by zero.
    // runtime error: at System.Numerics.BigInteger.op_Modulus(BigInteger dividend, BigInteger divisor)
    // runtime error: at Dafny.Helpers.EuclideanModulus(BigInteger a, BigInteger b) in C:\cygwin64\tmp\DafnyCBT_puw1w23fjug\runner.cs:line 1828
    // expect result == true;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  n >= 2
  //   POST Q1: result
  //   POST Q2: forall k: int {:trigger n % k} :: 2 <= k < n ==> n % k != 0
  {
    var n := 7;
    var result := IsPrime(n);
    // runtime error: Unhandled exception. System.DivideByZeroException: Attempted to divide by zero.
    // runtime error: at System.Numerics.BigInteger.op_Modulus(BigInteger dividend, BigInteger divisor)
    // runtime error: at Dafny.Helpers.EuclideanModulus(BigInteger a, BigInteger b) in C:\cygwin64\tmp\DafnyCBT_puw1w23fjug\runner.cs:line 1828
    // expect result == true;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  n >= 2
  //   POST Q1: result
  //   POST Q2: forall k: int {:trigger n % k} :: 2 <= k < n ==> n % k != 0
  {
    var n := 13;
    var result := IsPrime(n);
    // runtime error: Unhandled exception. System.DivideByZeroException: Attempted to divide by zero.
    // runtime error: at System.Numerics.BigInteger.op_Modulus(BigInteger dividend, BigInteger divisor)
    // runtime error: at Dafny.Helpers.EuclideanModulus(BigInteger a, BigInteger b) in C:\cygwin64\tmp\DafnyCBT_puw1w23fjug\runner.cs:line 1828
    // expect result == true;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  n >= 2
  //   POST Q1: result
  //   POST Q2: forall k: int {:trigger n % k} :: 2 <= k < n ==> n % k != 0
  {
    var n := 17;
    var result := IsPrime(n);
    // runtime error: Unhandled exception. System.DivideByZeroException: Attempted to divide by zero.
    // runtime error: at System.Numerics.BigInteger.op_Modulus(BigInteger dividend, BigInteger divisor)
    // runtime error: at Dafny.Helpers.EuclideanModulus(BigInteger a, BigInteger b) in C:\cygwin64\tmp\DafnyCBT_puw1w23fjug\runner.cs:line 1828
    // expect result == true;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  n >= 2
  //   POST Q1: result
  //   POST Q2: forall k: int {:trigger n % k} :: 2 <= k < n ==> n % k != 0
  {
    var n := 23;
    var result := IsPrime(n);
    // runtime error: Unhandled exception. System.DivideByZeroException: Attempted to divide by zero.
    // runtime error: at System.Numerics.BigInteger.op_Modulus(BigInteger dividend, BigInteger divisor)
    // runtime error: at Dafny.Helpers.EuclideanModulus(BigInteger a, BigInteger b) in C:\cygwin64\tmp\DafnyCBT_puw1w23fjug\runner.cs:line 1828
    // expect result == true;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  n >= 2
  //   POST Q1: result
  //   POST Q2: forall k: int {:trigger n % k} :: 2 <= k < n ==> n % k != 0
  {
    var n := 29;
    var result := IsPrime(n);
    // runtime error: Unhandled exception. System.DivideByZeroException: Attempted to divide by zero.
    // runtime error: at System.Numerics.BigInteger.op_Modulus(BigInteger dividend, BigInteger divisor)
    // runtime error: at Dafny.Helpers.EuclideanModulus(BigInteger a, BigInteger b) in C:\cygwin64\tmp\DafnyCBT_puw1w23fjug\runner.cs:line 1828
    // expect result == true;
  }

}

method Main()
{
  TestsForIsPrime();
  print "TestsForIsPrime: all non-failing tests passed!\n";
}
