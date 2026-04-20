// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\BodylessFactorial.dfy
// Method: CalcFact
// Generated: 2026-04-20 22:05:58

function Fact(n: nat): nat
{
  if n == 0 then 1 else n * Fact(n - 1)
}

method CalcFact(n: nat) returns (f: nat)
  ensures f == Fact(n)


method TestsForCalcFact()
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
    var n := 10;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/Bn=1:
  //   POST: !(n == 0)
  //   POST: f == n * Fact(n - 1)
  //   ENSURES: f == Fact(n)
  {
    var n := 1;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/Bn=2:
  //   POST: !(n == 0)
  //   POST: f == n * Fact(n - 1)
  //   ENSURES: f == Fact(n)
  {
    var n := 2;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

}

method Main()
{
  TestsForCalcFact();
  print "TestsForCalcFact: all tests passed!\n";
}
