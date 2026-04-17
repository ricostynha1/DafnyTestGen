// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\CatalanBuggy.dfy
// Method: CatalanNumber
// Generated: 2026-04-17 13:52:36

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
  //   POST: res == C(n)
  //   POST: res == 1
  //   ENSURES: res == C(n)
  {
    var n := 0;
    var res := CatalanNumber(n);
    expect res == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   POST: !(n == 0)
  //   POST: res == (4 * n - 2) * C(n - 1) / (n + 1)
  //   ENSURES: res == C(n)
  {
    var n := 1;
    var res := CatalanNumber(n);
    // expect res == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bn=2:
  //   POST: !(n == 0)
  //   POST: res == (4 * n - 2) * C(n - 1) / (n + 1)
  //   ENSURES: res == C(n)
  {
    var n := 2;
    var res := CatalanNumber(n);
    // expect res == 2; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Ores>=2:
  //   POST: !(n == 0)
  //   POST: res == (4 * n - 2) * C(n - 1) / (n + 1)
  //   ENSURES: res == C(n)
  {
    var n := 5;
    var res := CatalanNumber(n);
    // expect res == 42; // got 0
  }

}

method Main()
{
  TestsForCatalanNumber();
  print "TestsForCatalanNumber: all non-failing tests passed!\n";
}
