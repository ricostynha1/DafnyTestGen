// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\CatalanBuggy.dfy
// Method: CatalanNumber
// Generated: 2026-04-15 20:40:39

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


method Passing()
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

}

method Failing()
{
  // Test case for combination {2}:
  //   POST: !(n == 0)
  //   POST: res == (4 * n - 2) * C(n - 1) / (n + 1)
  //   ENSURES: res == C(n)
  {
    var n := 1;
    var res := CatalanNumber(n);
    // expect res == 1; // got 0
  }

  // Test case for combination {2}/Ores>=2:
  //   POST: !(n == 0)
  //   POST: res == (4 * n - 2) * C(n - 1) / (n + 1)
  //   ENSURES: res == C(n)
  {
    var n := 7;
    var res := CatalanNumber(n);
    // expect res == 429; // got 0
  }

  // Test case for combination {2}/R3:
  //   POST: !(n == 0)
  //   POST: res == (4 * n - 2) * C(n - 1) / (n + 1)
  //   ENSURES: res == C(n)
  {
    var n := 2;
    var res := CatalanNumber(n);
    // expect res == 2; // got 0
  }

}

method Main()
{
  Passing();
  Failing();
}
