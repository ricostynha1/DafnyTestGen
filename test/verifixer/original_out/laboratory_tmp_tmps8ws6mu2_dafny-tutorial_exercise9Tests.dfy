// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\laboratory_tmp_tmps8ws6mu2_dafny-tutorial_exercise9.dfy
// Method: ComputeFib
// Generated: 2026-04-01 22:29:28

// laboratory_tmp_tmps8ws6mu2_dafny-tutorial_exercise9.dfy

function fib(n: nat): nat
  decreases n
{
  if n == 0 then
    0
  else if n == 1 then
    1
  else
    fib(n - 1) + fib(n - 2)
}

method ComputeFib(n: nat) returns (b: nat)
  ensures b == fib(n)
  decreases n
{
  var i: int := 0;
  b := 0;
  var c := 1;
  while i < n
    invariant 0 <= i <= n
    invariant b == fib(i)
    invariant c == fib(i + 1)
    decreases n - i
  {
    b, c := c, c + b;
    i := i + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: b == fib(n)
  {
    var n := 0;
    var b := ComputeFib(n);
    expect b == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST: b == fib(n)
  {
    var n := 1;
    var b := ComputeFib(n);
    expect b == 1;
  }

  // Test case for combination {1}/R3:
  //   POST: b == fib(n)
  {
    var n := 2;
    var b := ComputeFib(n);
    expect b == 1;
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
