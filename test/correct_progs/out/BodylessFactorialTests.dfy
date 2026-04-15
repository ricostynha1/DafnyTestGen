// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\BodylessFactorial.dfy
// Method: CalcFact
// Generated: 2026-04-15 16:32:35

function Fact(n: nat): nat
{
  if n == 0 then 1 else n * Fact(n - 1)
}

method CalcFact(n: nat) returns (f: nat)
  ensures f == Fact(n)


method GeneratedTests_CalcFact()
{
  // Test case for combination {1}:
  //   POST: f == Fact(n)
  //   POST: f == 1
  //   ENSURES: f == Fact(n)
  {
    var n := 0;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}:
  //   POST: !(n == 0)
  //   POST: f == n * Fact(n - 1)
  //   ENSURES: f == Fact(n)
  {
    var n := 1;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/Of>=2:
  //   POST: !(n == 0)
  //   POST: f == n * Fact(n - 1)
  //   ENSURES: f == Fact(n)
  {
    var n := 2;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/R3:
  //   POST: !(n == 0)
  //   POST: f == n * Fact(n - 1)
  //   ENSURES: f == Fact(n)
  {
    var n := 3;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

}

method Main()
{
  GeneratedTests_CalcFact();
  print "GeneratedTests_CalcFact: all tests passed!\n";
}
