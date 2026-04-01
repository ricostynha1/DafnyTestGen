// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafl_tmp_tmp_r3_8w3y_dafny_examples_uiowa_fibonacci__587_ROR_Ge.dfy
// Method: ComputeFib
// Generated: 2026-04-01 22:24:41

// dafl_tmp_tmp_r3_8w3y_dafny_examples_uiowa_fibonacci.dfy

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

method ComputeFib(n: nat) returns (f: nat)
  ensures f == fib(n)
  decreases n
{
  if n == 0 {
    f := 0;
  } else {
    var i := 1;
    var f_2 := 0;
    var f_1 := 0;
    f := 1;
    while i >= n
      invariant i <= n
      invariant f_1 == fib(i - 1)
      invariant f == fib(i)
      decreases n - i
    {
      f_2 := f_1;
      f_1 := f;
      f := f_1 + f_2;
      i := i + 1;
    }
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: f == fib(n)
  {
    var n := 0;
    var f := ComputeFib(n);
    expect f == 0;
  }

  // Test case for combination {1}/R3:
  //   POST: f == fib(n)
  {
    var n := 2;
    var f := ComputeFib(n);
    expect f == 1;
  }

}

method Failing()
{
  // Test case for combination {1}/Bn=1:
  //   POST: f == fib(n)
  {
    var n := 1;
    var f := ComputeFib(n);
    // expect f == fib(n);
  }

}

method Main()
{
  Passing();
  Failing();
}
