// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Fibonacci.dfy
// Method: CalcFib
// Generated: 2026-04-11 13:06:31

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



method Passing()
{
  // Test case for combination {1}:
  //   POST: res == Fib(n)
  //   POST: res == n
  //   ENSURES: res == Fib(n)
  {
    var n := 0;
    var res := CalcFib(n);
    expect res == 0;
  }

  // Test case for combination {2}:
  //   POST: !(n < 2)
  //   POST: res == (if n - 2 < 2 then n - 2 else Fib(n - 2 - 2) + Fib(n - 2 - 1)) + (if n - 1 < 2 then n - 1 else Fib(n - 1 - 2) + Fib(n - 1 - 1))
  //   ENSURES: res == Fib(n)
  {
    var n := 42;
    var res := CalcFib(n);
    expect res == 267914296;
  }

  // Test case for combination {1}/Bn=1:
  //   POST: res == Fib(n)
  //   POST: res == n
  //   ENSURES: res == Fib(n)
  {
    var n := 1;
    var res := CalcFib(n);
    expect res == 1;
  }

  // Test case for combination {2}/Ores>=2:
  //   POST: !(n < 2)
  //   POST: res == (if n - 2 < 2 then n - 2 else Fib(n - 2 - 2) + Fib(n - 2 - 1)) + (if n - 1 < 2 then n - 1 else Fib(n - 1 - 2) + Fib(n - 1 - 1))
  //   ENSURES: res == Fib(n)
  {
    var n := 4;
    var res := CalcFib(n);
    expect res == 3;
  }

  // Test case for combination {2}/Ores=1:
  //   POST: !(n < 2)
  //   POST: res == (if n - 2 < 2 then n - 2 else Fib(n - 2 - 2) + Fib(n - 2 - 1)) + (if n - 1 < 2 then n - 1 else Fib(n - 1 - 2) + Fib(n - 1 - 1))
  //   ENSURES: res == Fib(n)
  {
    var n := 5;
    var res := CalcFib(n);
    expect res == 5;
  }

  // Test case for combination {2}/Ores=0:
  //   POST: !(n < 2)
  //   POST: res == (if n - 2 < 2 then n - 2 else Fib(n - 2 - 2) + Fib(n - 2 - 1)) + (if n - 1 < 2 then n - 1 else Fib(n - 1 - 2) + Fib(n - 1 - 1))
  //   ENSURES: res == Fib(n)
  {
    var n := 3;
    var res := CalcFib(n);
    expect res == 2;
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
