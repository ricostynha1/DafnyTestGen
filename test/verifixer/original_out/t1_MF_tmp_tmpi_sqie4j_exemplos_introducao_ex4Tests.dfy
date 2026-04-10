// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\t1_MF_tmp_tmpi_sqie4j_exemplos_introducao_ex4.dfy
// Method: Fatorial
// Generated: 2026-04-08 19:19:08

// t1_MF_tmp_tmpi_sqie4j_exemplos_introducao_ex4.dfy

function Fat(n: nat): nat
  decreases n
{
  if n == 0 then
    1
  else
    n * Fat(n - 1)
}

method Fatorial(n: nat) returns (r: nat)
  ensures r == Fat(n)
  decreases n
{
  r := 1;
  var i := 0;
  while i < n
    invariant 0 <= i <= n
    invariant r == Fat(i)
    decreases n - i
  {
    i := i + 1;
    r := r * i;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: n == 0
  //   POST: r == 1
  //   ENSURES: r == Fat(n)
  {
    var n := 0;
    var r := Fatorial(n);
    expect r == 1;
  }

  // Test case for combination {2}:
  //   POST: !(n == 0)
  //   POST: r == n * Fat(n - 1)
  //   ENSURES: r == Fat(n)
  {
    var n := 1;
    var r := Fatorial(n);
    expect !(n == 0);
    expect r == 1;
  }

  // Test case for combination {2}/Or=1:
  //   POST: !(n == 0)
  //   POST: r == n * Fat(n - 1)
  //   ENSURES: r == Fat(n)
  {
    var n := 2;
    var r := Fatorial(n);
    expect r == 2;
  }

  // Test case for combination {2}/Or=0:
  //   POST: !(n == 0)
  //   POST: r == n * Fat(n - 1)
  //   ENSURES: r == Fat(n)
  {
    var n := 3;
    var r := Fatorial(n);
    expect r == 6;
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
