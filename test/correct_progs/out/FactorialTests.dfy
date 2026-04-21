// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Factorial.dfy
// Method: CalcFact
// Generated: 2026-04-21 11:30:22

// Recursive definition of the factorial of a number 'n'. 
function Fact(n: nat) : nat 
{
  if n == 0 then 1 else n * Fact(n-1)
}

// Computes the factorial of a number 'n' in time O(n) and space O(1).
method CalcFact(n: nat) returns (f: nat) 
  ensures f == Fact(n)
{
  f := 1;
  for i := 1 to n + 1 
    invariant f == Fact(i-1)
  {
    f := f * i;
  }
  return f;
}


method TestsForCalcFact()
{
  // Test case for combination {1}:
  //   POST: f == Fact(n)
  //   POST: f == 1
  //   ENSURES: f == Fact(n)
  {
    var n := 0;
    var f := CalcFact(n);
    if (!(f == 1)) {
      print "FAIL: expected f == 1; got LHS=", f, ", RHS=", 1, "\n";
      expect false;
    }
  }

  // Test case for combination {2}:
  //   POST: !(n == 0)
  //   POST: f == n * Fact(n - 1)
  //   ENSURES: f == Fact(n)
  {
    var n := 10;
    var f := CalcFact(n);
    if (!(f == 3628800)) {
      print "FAIL: expected f == 3628800; got LHS=", f, ", RHS=", 3628800, "\n";
      expect false;
    }
  }

  // Test case for combination {2}/Bn=1:
  //   POST: !(n == 0)
  //   POST: f == n * Fact(n - 1)
  //   ENSURES: f == Fact(n)
  {
    var n := 1;
    var f := CalcFact(n);
    if (!(f == 1)) {
      print "FAIL: expected f == 1; got LHS=", f, ", RHS=", 1, "\n";
      expect false;
    }
  }

  // Test case for combination {2}/Bn=2:
  //   POST: !(n == 0)
  //   POST: f == n * Fact(n - 1)
  //   ENSURES: f == Fact(n)
  {
    var n := 2;
    var f := CalcFact(n);
    if (!(f == 2)) {
      print "FAIL: expected f == 2; got LHS=", f, ", RHS=", 2, "\n";
      expect false;
    }
  }

}

method Main()
{
  TestsForCalcFact();
  print "TestsForCalcFact: all non-failing tests passed!\n";
}

