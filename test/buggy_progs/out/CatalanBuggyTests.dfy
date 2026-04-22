// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\CatalanBuggy.dfy
// Method: CatalanNumber
// Generated: 2026-04-22 10:40:35

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
  //   POST Q2: res == 1
  {
    var n := 0;
    var res := CatalanNumber(n);
    expect res == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   POST Q1: n != 0
  //   POST Q2: res == (4 * n - 2) * C(n - 1) / (n + 1)
  {
    var n := 10;
    var res := CatalanNumber(n);
    // actual runtime state: res=0
    // expect res == 16796; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bn=1:
  //   POST Q1: n != 0
  //   POST Q2: res == (4 * n - 2) * C(n - 1) / (n + 1)
  {
    var n := 1;
    var res := CatalanNumber(n);
    // actual runtime state: res=0
    // expect res == 1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bn=2:
  //   POST Q1: n != 0
  //   POST Q2: res == (4 * n - 2) * C(n - 1) / (n + 1)
  {
    var n := 2;
    var res := CatalanNumber(n);
    // actual runtime state: res=0
    // expect res == 2; // got 0
  }

}

method Main()
{
  TestsForCatalanNumber();
  print "TestsForCatalanNumber: all non-failing tests passed!\n";
}
