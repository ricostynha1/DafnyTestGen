// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\DafnyTestGen\test\in\Fibonacci.dfy
// Method: CalcFib
// Generated: 2026-03-20 12:27:55

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



method GeneratedTests_CalcFib()
{
  // Test case for combination 1/Bn=0:
  //   POST: res == Fib(n)
  {
    var n := 0;
    var res := CalcFib(n);
    expect res == Fib(n);
  }

  // Test case for combination 1/Bn=1:
  //   POST: res == Fib(n)
  {
    var n := 1;
    var res := CalcFib(n);
    expect res == Fib(n);
  }

}

method Main()
{
  GeneratedTests_CalcFib();
  print "GeneratedTests_CalcFib: all tests passed!\n";
}
