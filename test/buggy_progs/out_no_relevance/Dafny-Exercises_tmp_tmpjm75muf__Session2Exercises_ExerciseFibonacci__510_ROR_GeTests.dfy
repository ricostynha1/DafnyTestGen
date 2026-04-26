// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny-Exercises_tmp_tmpjm75muf__Session2Exercises_ExerciseFibonacci__510_ROR_Ge.dfy
// Method: fibonacci1
// Generated: 2026-04-24 13:22:58

// Dafny-Exercises_tmp_tmpjm75muf__Session2Exercises_ExerciseFibonacci.dfy

function fib(n: nat): nat
  decreases n
{
  if n == 0 then
    0
  else if n == 1 then
    1
  else
    fib(n - 1) + fib(n - 2)
}

method fibonacci1(n: nat) returns (f: nat)
  ensures f == fib(n)
  decreases n
{
  var i := 0;
  f := 0;
  var fsig := 1;
  while i < n
    invariant f == fib(i) && fsig == fib(i + 1)
    invariant i <= n
    decreases n - i
  {
    f, fsig := fsig, f + fsig;
    i := i + 1;
  }
}

method fibonacci2(n: nat) returns (f: nat)
  ensures f == fib(n)
  decreases n
{
  if n >= 0 {
    f := 0;
  } else {
    var i := 1;
    var fant := 0;
    f := 1;
    while i < n
      invariant fant == fib(i - 1) && f == fib(i)
      invariant i <= n
      decreases n - i
    {
      fant, f := f, fant + f;
      i := i + 1;
    }
  }
}

method fibonacci3(n: nat) returns (f: nat)
  ensures f == fib(n)
  decreases n
{
  {
    var i: int := 0;
    var a := 1;
    f := 0;
    while i < n
      invariant 0 <= i <= n
      invariant if i == 0 then a == fib(i + 1) && f == fib(i) else a == fib(i - 1) && f == fib(i)
      decreases n - i
    {
      a, f := f, a + f;
      i := i + 1;
    }
  }
}


method TestsForfibonacci1()
{
  // Test case for combination {1}:
  //   POST Q1: f == fib(n)
  {
    var n := 0;
    var f := fibonacci1(n);
    expect f == 0;
  }

  // Test case for combination {2}:
  //   POST Q1: f == fib(n)
  {
    var n := 1;
    var f := fibonacci1(n);
    expect f == 1;
  }

  // Test case for combination {3}:
  //   POST Q1: f == fib(n)
  {
    var n := 10;
    var f := fibonacci1(n);
    expect f == 55;
  }

  // Test case for combination {3}/Bn=2:
  //   POST Q1: f == fib(n)
  {
    var n := 2;
    var f := fibonacci1(n);
    expect f == 1;
  }

  // Test case for combination {3}/Bn=3:
  //   POST Q1: f == fib(n)
  {
    var n := 3;
    var f := fibonacci1(n);
    expect f == 2;
  }

  // Test case for combination {3}/R4:
  //   POST Q1: f == fib(n)
  {
    var n := 9;
    var f := fibonacci1(n);
    expect f == 34;
  }

  // Test case for combination {3}/R5:
  //   POST Q1: f == fib(n)
  {
    var n := 8;
    var f := fibonacci1(n);
    expect f == 21;
  }

  // Test case for combination {3}/R6:
  //   POST Q1: f == fib(n)
  {
    var n := 7;
    var f := fibonacci1(n);
    expect f == 13;
  }

  // Test case for combination {3}/R7:
  //   POST Q1: f == fib(n)
  {
    var n := 4;
    var f := fibonacci1(n);
    expect f == 3;
  }

  // Test case for combination {3}/R8:
  //   POST Q1: f == fib(n)
  {
    var n := 5;
    var f := fibonacci1(n);
    expect f == 5;
  }

}

method TestsForfibonacci2()
{
  // Test case for combination {1}:
  //   POST Q1: f == fib(n)
  {
    var n := 0;
    var f := fibonacci2(n);
    expect f == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   POST Q1: f == fib(n)
  {
    var n := 1;
    var f := fibonacci2(n);
    // expect f == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}:
  //   POST Q1: f == fib(n)
  {
    var n := 10;
    var f := fibonacci2(n);
    // expect f == 55; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/Bn=2:
  //   POST Q1: f == fib(n)
  {
    var n := 2;
    var f := fibonacci2(n);
    // expect f == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/Bn=3:
  //   POST Q1: f == fib(n)
  {
    var n := 3;
    var f := fibonacci2(n);
    // expect f == 2; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R4:
  //   POST Q1: f == fib(n)
  {
    var n := 9;
    var f := fibonacci2(n);
    // expect f == 34; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R5:
  //   POST Q1: f == fib(n)
  {
    var n := 8;
    var f := fibonacci2(n);
    // expect f == 21; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R6:
  //   POST Q1: f == fib(n)
  {
    var n := 7;
    var f := fibonacci2(n);
    // expect f == 13; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R7:
  //   POST Q1: f == fib(n)
  {
    var n := 4;
    var f := fibonacci2(n);
    // expect f == 3; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/R8:
  //   POST Q1: f == fib(n)
  {
    var n := 5;
    var f := fibonacci2(n);
    // expect f == 5; // got 0
  }

}

method TestsForfibonacci3()
{
  // Test case for combination {1}:
  //   POST Q1: f == fib(n)
  {
    var n := 0;
    var f := fibonacci3(n);
    expect f == 0;
  }

  // Test case for combination {2}:
  //   POST Q1: f == fib(n)
  {
    var n := 1;
    var f := fibonacci3(n);
    expect f == 1;
  }

  // Test case for combination {3}:
  //   POST Q1: f == fib(n)
  {
    var n := 10;
    var f := fibonacci3(n);
    expect f == 55;
  }

  // Test case for combination {3}/Bn=2:
  //   POST Q1: f == fib(n)
  {
    var n := 2;
    var f := fibonacci3(n);
    expect f == 1;
  }

  // Test case for combination {3}/Bn=3:
  //   POST Q1: f == fib(n)
  {
    var n := 3;
    var f := fibonacci3(n);
    expect f == 2;
  }

  // Test case for combination {3}/R4:
  //   POST Q1: f == fib(n)
  {
    var n := 9;
    var f := fibonacci3(n);
    expect f == 34;
  }

  // Test case for combination {3}/R5:
  //   POST Q1: f == fib(n)
  {
    var n := 8;
    var f := fibonacci3(n);
    expect f == 21;
  }

  // Test case for combination {3}/R6:
  //   POST Q1: f == fib(n)
  {
    var n := 7;
    var f := fibonacci3(n);
    expect f == 13;
  }

  // Test case for combination {3}/R7:
  //   POST Q1: f == fib(n)
  {
    var n := 4;
    var f := fibonacci3(n);
    expect f == 3;
  }

  // Test case for combination {3}/R8:
  //   POST Q1: f == fib(n)
  {
    var n := 5;
    var f := fibonacci3(n);
    expect f == 5;
  }

}

method Main()
{
  TestsForfibonacci1();
  print "TestsForfibonacci1: all non-failing tests passed!\n";
  TestsForfibonacci2();
  print "TestsForfibonacci2: all non-failing tests passed!\n";
  TestsForfibonacci3();
  print "TestsForfibonacci3: all non-failing tests passed!\n";
}
