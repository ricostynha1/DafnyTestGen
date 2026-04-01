// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\t1_MF_tmp_tmpi_sqie4j_exemplos_colecoes_arrays_ex4.dfy
// Method: Somatorio
// Generated: 2026-04-01 22:34:09

// t1_MF_tmp_tmpi_sqie4j_exemplos_colecoes_arrays_ex4.dfy

function SomaAte(a: array<nat>, i: nat): nat
  requires 0 <= i <= a.Length
  reads a
  decreases {a}, a, i
{
  if i == 0 then
    0
  else
    a[i - 1] + SomaAte(a, i - 1)
}

method Somatorio(a: array<nat>) returns (s: nat)
  ensures s == SomaAte(a, a.Length)
  decreases a
{
  var i := 0;
  s := 0;
  while i < a.Length
    invariant 0 <= i && i <= a.Length
    invariant s == SomaAte(a, i)
    decreases a.Length - i
  {
    s := s + a[i];
    i := i + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: s == SomaAte(a, a.Length)
  {
    var a := new nat[0] [];
    var s := Somatorio(a);
    expect s == 0;
  }

  // Test case for combination {1}/Ba=1:
  //   POST: s == SomaAte(a, a.Length)
  {
    var a := new nat[1] [2];
    var s := Somatorio(a);
    expect s == 2;
  }

  // Test case for combination {1}/Ba=2:
  //   POST: s == SomaAte(a, a.Length)
  {
    var a := new nat[2] [4, 3];
    var s := Somatorio(a);
    expect s == 7;
  }

  // Test case for combination {1}/Ba=3:
  //   POST: s == SomaAte(a, a.Length)
  {
    var a := new nat[3] [5, 4, 6];
    var s := Somatorio(a);
    expect s == 15;
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
