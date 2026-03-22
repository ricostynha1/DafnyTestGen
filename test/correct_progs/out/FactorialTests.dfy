// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Factorial.dfy
// Method: CalcFact
// Generated: 2026-03-22 21:06:55

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


method Passing()
{
  // Test case for combination 1/Bn=0:
  //   POST: f == Fact(n)
  {
    var n := 0;
    var f := CalcFact(n);
    expect f == Fact(n);
  }

  // Test case for combination 1/Bn=1:
  //   POST: f == Fact(n)
  {
    var n := 1;
    var f := CalcFact(n);
    expect f == Fact(n);
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
