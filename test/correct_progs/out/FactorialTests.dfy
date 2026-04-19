// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Factorial.dfy
// Method: CalcFact
// Generated: 2026-04-19 21:52:15

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
    expect f == 1;
  }

  // Test case for combination {2}:
  //   POST: !(n == 0)
  //   POST: f == n * Fact(n - 1)
  //   ENSURES: f == Fact(n)
  {
    var n := 20;
    var f := CalcFact(n);
    expect f == 2432902008176640000;
  }

  // Test case for combination {2}/Bn=1:
  //   POST: !(n == 0)
  //   POST: f == n * Fact(n - 1)
  //   ENSURES: f == Fact(n)
  {
    var n := 1;
    var f := CalcFact(n);
    expect f == 1;
  }

  // Test case for combination {2}/Bn=2:
  //   POST: !(n == 0)
  //   POST: f == n * Fact(n - 1)
  //   ENSURES: f == Fact(n)
  {
    var n := 2;
    var f := CalcFact(n);
    expect f == 2;
  }

}

method Main()
{
  TestsForCalcFact();
  print "TestsForCalcFact: all non-failing tests passed!\n";
}
