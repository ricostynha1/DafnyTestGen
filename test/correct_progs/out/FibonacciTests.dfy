// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Fibonacci.dfy
// Method: CalcFib
// Generated: 2026-04-23 20:24:34

/* 
* Formal specification and verification of a simple method for calculating 
* Fibonacci numbers applying dynamic programming.
*/

// Rcursive definition of the n-th Fibonacci number.
function Fib(n : nat ) : nat {
    if n < 2 then n else Fib(n - 2) + Fib(n - 1)
}  

// Iterative computation of the n-th Fibonacci number in time O(n) and space O(1), 
// using dynamic programming 
method CalcFib(n: nat) returns (res: nat) 
  ensures res == Fib(n)
{
    var x, y := 0, 1; // fib(0), fib(1)
    for i := 0 to n 
      invariant x == Fib(i) && y == Fib(i+1)
    {
        x, y := y, x + y; // simultaneous assignment
    }
    return x;
}



method TestsForCalcFib()
{
  // Test case for combination {1}:
  //   POST Q1: res == Fib(n)
  {
    var n := 1;
    var res := CalcFib(n);
    expect res == 1;
  }

  // Test case for combination {2}:
  //   POST Q1: res == Fib(n)
  {
    var n := 10;
    var res := CalcFib(n);
    expect res == 55;
  }

  // Test case for combination {1}/On=0:
  //   POST Q1: res == Fib(n)
  {
    var n := 0;
    var res := CalcFib(n);
    expect res == 0;
  }

  // Test case for combination {2}/R2:
  //   POST Q1: res == Fib(n)
  {
    var n := 9;
    var res := CalcFib(n);
    expect res == 34;
  }

  // Test case for combination {2}/R3:
  //   POST Q1: res == Fib(n)
  {
    var n := 8;
    var res := CalcFib(n);
    expect res == 21;
  }

  // Test case for combination {2}/R4:
  //   POST Q1: res == Fib(n)
  {
    var n := 7;
    var res := CalcFib(n);
    expect res == 13;
  }

  // Test case for combination {2}/R5:
  //   POST Q1: res == Fib(n)
  {
    var n := 6;
    var res := CalcFib(n);
    expect res == 8;
  }

  // Test case for combination {2}/R6:
  //   POST Q1: res == Fib(n)
  {
    var n := 5;
    var res := CalcFib(n);
    expect res == 5;
  }

  // Test case for combination {2}/R7:
  //   POST Q1: res == Fib(n)
  {
    var n := 4;
    var res := CalcFib(n);
    expect res == 3;
  }

  // Test case for combination {2}/R8:
  //   POST Q1: res == Fib(n)
  {
    var n := 3;
    var res := CalcFib(n);
    expect res == 2;
  }

}

method Main()
{
  TestsForCalcFib();
  print "TestsForCalcFib: all non-failing tests passed!\n";
}
