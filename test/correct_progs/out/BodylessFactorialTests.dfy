// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\BodylessFactorial.dfy
// Method: CalcFact
// Generated: 2026-04-21 23:35:09

function Fact(n: nat): nat
{
  if n == 0 then 1 else n * Fact(n - 1)
}

method CalcFact(n: nat) returns (f: nat)
  ensures f == Fact(n)


method TestsForCalcFact()
{
  // Test case for combination {1}:
  //   POST Q1: f == Fact(n)
  //   POST Q2: f == 1
  {
    var n := 0;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}:
  //   POST Q1: n != 0
  //   POST Q2: f == n * Fact(n - 1)
  {
    var n := 10;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/Bn=1:
  //   POST Q1: n != 0
  //   POST Q2: f == n * Fact(n - 1)
  {
    var n := 1;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/Bn=2:
  //   POST Q1: n != 0
  //   POST Q2: f == n * Fact(n - 1)
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
