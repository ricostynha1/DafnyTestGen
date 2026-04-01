// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\t1_MF_tmp_tmpi_sqie4j_exemplos_introducao_ex4__272-272_AOI.dfy
// Method: Fatorial
// Generated: 2026-04-01 14:05:58

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
    r := -r * i;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: r == Fat(n)
  {
    var n := 0;
    var r := Fatorial(n);
    expect r == 1;
  }

  // Test case for combination {1}/R3:
  //   POST: r == Fat(n)
  {
    var n := 2;
    var r := Fatorial(n);
    expect r == 2;
  }

}

method Failing()
{
  // Test case for combination {1}/Bn=1:
  //   POST: r == Fat(n)
  {
    var n := 1;
    var r := Fatorial(n);
    // expect r == Fat(n);
  }

}

method Main()
{
  Passing();
  Failing();
}
