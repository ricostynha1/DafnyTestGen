// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Factorial.dfy
// Method: CalcFact
// Generated: 2026-04-02 18:19:56

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


method GeneratedTests_CalcFact()
{
  // Test case for combination {1}:
  //   POST: f == Fact(n)
  {
    var n := 0;
    var f := CalcFact(n);
    expect f == 1;
  }

  // Test case for combination {1}/Bn=1:
  //   POST: f == Fact(n)
  {
    var n := 1;
    var f := CalcFact(n);
    expect f == 1;
  }

  // Test case for combination {1}/R3:
  //   POST: f == Fact(n)
  {
    var n := 2;
    var f := CalcFact(n);
    expect f == 2;
  }

}

method Main()
{
  GeneratedTests_CalcFact();
  print "GeneratedTests_CalcFact: all tests passed!\n";
}
