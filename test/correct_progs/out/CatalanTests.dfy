// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Catalan.dfy
// Method: CatalanNumber
// Generated: 2026-03-31 21:45:42

/* Catalan numbers are a sequence of natural numbers with significant importance in combinatorial mathematics. 
   They count the number of ways to correctly match parentheses, the number of rooted binary trees with n internal nodes,
   and many other combinatorial structures.
   The n-th Catalan number is given by the formula C(n) = (2n)! / ((n+1)! * n!).
   Catalan numbers can also be defined recursively as C(0) = 1 and C(n) = (4n - 2) * C(n-1) / (n + 1).
*/

// Recursive definition.
function C(n: nat): nat  
{
   if n == 0 then 1 else (4 * n - 2) * C(n-1) / (n + 1) 
}

// Iterative calculation using dynamic programming.
method CatalanNumber(n: nat) returns (res: nat)
  ensures res == C(n)
{
  res := 1; // C(0)
  for i := 1 to n + 1 // upper bound is excluded 
    invariant res == C(i - 1)
  {
    res := (4 * i - 2) * res / (i + 1);      
  }
  return res;
}



method GeneratedTests_CatalanNumber()
{
  // Test case for combination {1}:
  //   POST: res == C(n)
  {
    var n := 0;
    var check_res := C(n);
    var res := CatalanNumber(n);
    expect res == check_res;
  }

  // Test case for combination {1}/Bn=1:
  //   POST: res == C(n)
  {
    var n := 1;
    var check_res := C(n);
    var res := CatalanNumber(n);
    expect res == check_res;
  }

  // Test case for combination {1}/R3:
  //   POST: res == C(n)
  {
    var n := 2;
    var check_res := C(n);
    var res := CatalanNumber(n);
    expect res == check_res;
  }

}

method Main()
{
  GeneratedTests_CatalanNumber();
  print "GeneratedTests_CatalanNumber: all tests passed!\n";
}
