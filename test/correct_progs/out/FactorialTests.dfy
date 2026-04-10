// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Factorial.dfy
// Method: CalcFact
// Generated: 2026-04-10 22:57:39

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
  // Test case for combination {1}:
  //   POST: f == Fact(n)
  //   POST: f == 1
  //   ENSURES: f == Fact(n)
  {
    var n := 0;
    var f := CalcFact(n);
    expect f == 1;
  }

  // Test case for combination {2}:
  //   POST: !(n == 0)
  //   POST: f == n * (if n - 1 == 0 then 1 else n - 1 * Fact(n - 1 - 1))
  //   ENSURES: f == Fact(n)
  {
    var n := 224;
    var f := CalcFact(n);
    expect f == 55971593537537760404604573101364593176499404892579159768377152549395149245330647483833277915864388784447820896631966823753514906972682973565755801329326510071918742943565354051665634790924674413411085992886622125541764634019891159167420086648483483701916733257620551762703648325379440730697875571890344334786574299450407459134155346330065961388198972801957484316615567463363379200000000000000000000000000000000000000000000000000000;
  }

  // Test case for combination {2}/Bn=1:
  //   POST: !(n == 0)
  //   POST: f == n * (if n - 1 == 0 then 1 else n - 1 * Fact(n - 1 - 1))
  //   ENSURES: f == Fact(n)
  {
    var n := 1;
    var f := CalcFact(n);
    expect f == 1;
  }

  // Test case for combination {2}/Of>=2:
  //   POST: !(n == 0)
  //   POST: f == n * (if n - 1 == 0 then 1 else n - 1 * Fact(n - 1 - 1))
  //   ENSURES: f == Fact(n)
  {
    var n := 3;
    var f := CalcFact(n);
    expect f == 6;
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
