// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\CatalanBuggy.dfy
// Method: CatalanNumber
// Generated: 2026-04-24 19:25:16

function C(n: nat): nat  
{
   if n == 0 then 1 else (4 * n - 2) * C(n-1) / (n + 1) 
}

method CatalanNumber(n: nat) returns (res: nat)
  ensures res == C(n)
{
  res := 1;
  for i := 1 to n + 1
  {
    res := (4 * i - 2) * res / (i + 2);  // BUG: (i+2) instead of (i+1)
  }
  return res;
}


method TestsForCatalanNumber()
{
  // Test case for combination {1}:
  //   POST Q1: res == C(n)
  {
    var n := 0;
    var res := CatalanNumber(n);
    expect res == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   POST Q1: res == C(n)
  {
    var n := 1;
    var res := CatalanNumber(n);
    // expect res == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bn=2:
  //   POST Q1: res == C(n)
  {
    var n := 2;
    var res := CatalanNumber(n);
    // expect res == 2; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R3:
  //   POST Q1: res == C(n)
  {
    var n := 3;
    var res := CatalanNumber(n);
    // expect res == 5; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R4:
  //   POST Q1: res == C(n)
  {
    var n := 4;
    var res := CatalanNumber(n);
    // expect res == 14; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R5:
  //   POST Q1: res == C(n)
  {
    var n := 5;
    var res := CatalanNumber(n);
    // expect res == 42; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R6:
  //   POST Q1: res == C(n)
  {
    var n := 6;
    var res := CatalanNumber(n);
    // expect res == 132; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R7:
  //   POST Q1: res == C(n)
  {
    var n := 7;
    var res := CatalanNumber(n);
    // expect res == 429; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R8:
  //   POST Q1: res == C(n)
  {
    var n := 8;
    var res := CatalanNumber(n);
    // expect res == 1430; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R9:
  //   POST Q1: res == C(n)
  {
    var n := 9;
    var res := CatalanNumber(n);
    // expect res == 4862; // got 0
  }

}

method Main()
{
  TestsForCatalanNumber();
  print "TestsForCatalanNumber: all non-failing tests passed!\n";
}
