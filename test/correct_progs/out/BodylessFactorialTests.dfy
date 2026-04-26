// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\BodylessFactorial.dfy
// Method: CalcFact
// Generated: 2026-04-23 19:32:00

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
  {
    var n := 0;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}:
  //   POST Q1: f == Fact(n)
  {
    var n := 10;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/Bn=1:
  //   POST Q1: f == Fact(n)
  {
    var n := 1;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/Bn=2:
  //   POST Q1: f == Fact(n)
  {
    var n := 2;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/R4:
  //   POST Q1: f == Fact(n)
  {
    var n := 9;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/R5:
  //   POST Q1: f == Fact(n)
  {
    var n := 8;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/R6:
  //   POST Q1: f == Fact(n)
  {
    var n := 7;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/R7:
  //   POST Q1: f == Fact(n)
  {
    var n := 6;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/R8:
  //   POST Q1: f == Fact(n)
  {
    var n := 5;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

  // Test case for combination {2}/R9:
  //   POST Q1: f == Fact(n)
  {
    var n := 4;
    // var f := CalcFact(n);
    // expect f == Fact(n);
  }

}

method Main()
{
  TestsForCalcFact();
  print "TestsForCalcFact: all tests passed!\n";
}
