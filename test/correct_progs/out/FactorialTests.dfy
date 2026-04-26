// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Factorial.dfy
// Method: CalcFact
// Generated: 2026-04-23 20:23:47

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
  //   POST Q1: f == Fact(n)
  {
    var n := 0;
    var f := CalcFact(n);
    expect f == 1;
  }

  // Test case for combination {2}:
  //   POST Q1: f == Fact(n)
  {
    var n := 10;
    var f := CalcFact(n);
    expect f == 3628800;
  }

  // Test case for combination {2}/Bn=1:
  //   POST Q1: f == Fact(n)
  {
    var n := 1;
    var f := CalcFact(n);
    expect f == 1;
  }

  // Test case for combination {2}/Bn=2:
  //   POST Q1: f == Fact(n)
  {
    var n := 2;
    var f := CalcFact(n);
    expect f == 2;
  }

  // Test case for combination {2}/R4:
  //   POST Q1: f == Fact(n)
  {
    var n := 9;
    var f := CalcFact(n);
    expect f == 362880;
  }

  // Test case for combination {2}/R5:
  //   POST Q1: f == Fact(n)
  {
    var n := 8;
    var f := CalcFact(n);
    expect f == 40320;
  }

  // Test case for combination {2}/R6:
  //   POST Q1: f == Fact(n)
  {
    var n := 7;
    var f := CalcFact(n);
    expect f == 5040;
  }

  // Test case for combination {2}/R7:
  //   POST Q1: f == Fact(n)
  {
    var n := 6;
    var f := CalcFact(n);
    expect f == 720;
  }

  // Test case for combination {2}/R8:
  //   POST Q1: f == Fact(n)
  {
    var n := 5;
    var f := CalcFact(n);
    expect f == 120;
  }

  // Test case for combination {2}/R9:
  //   POST Q1: f == Fact(n)
  {
    var n := 4;
    var f := CalcFact(n);
    expect f == 24;
  }

}

method Main()
{
  TestsForCalcFact();
  print "TestsForCalcFact: all non-failing tests passed!\n";
}
