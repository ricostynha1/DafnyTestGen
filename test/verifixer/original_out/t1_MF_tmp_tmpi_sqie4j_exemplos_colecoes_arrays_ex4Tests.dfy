// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\t1_MF_tmp_tmpi_sqie4j_exemplos_colecoes_arrays_ex4.dfy
// Method: Somatorio
// Generated: 2026-04-08 19:19:04

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
  //   POST: a.Length == 0
  //   POST: s == 0
  //   ENSURES: s == SomaAte(a, a.Length)
  {
    var a := new nat[0] [];
    var s := Somatorio(a);
    expect s == 0;
  }

  // Test case for combination {2}:
  //   POST: !(a.Length == 0)
  //   POST: s == a[a.Length - 1] + SomaAte(a, a.Length - 1)
  //   ENSURES: s == SomaAte(a, a.Length)
  {
    var a := new nat[1] [2];
    var s := Somatorio(a);
    expect !(a.Length == 0);
    expect s == 2;
  }

  // Test case for combination {2}/Ba=2:
  //   POST: !(a.Length == 0)
  //   POST: s == a[a.Length - 1] + SomaAte(a, a.Length - 1)
  //   ENSURES: s == SomaAte(a, a.Length)
  {
    var a := new nat[2] [7719, 7720];
    var s := Somatorio(a);
    expect !(a.Length == 0);
    expect s == 15439;
  }

  // Test case for combination {2}/Ba=3:
  //   POST: !(a.Length == 0)
  //   POST: s == a[a.Length - 1] + SomaAte(a, a.Length - 1)
  //   ENSURES: s == SomaAte(a, a.Length)
  {
    var a := new nat[3] [7719, 7720, 8957];
    var s := Somatorio(a);
    expect !(a.Length == 0);
    expect s == 24396;
  }

  // Test case for combination {2}/Os>=2:
  //   POST: !(a.Length == 0)
  //   POST: s == a[a.Length - 1] + SomaAte(a, a.Length - 1)
  //   ENSURES: s == SomaAte(a, a.Length)
  {
    var a := new nat[1] [3];
    var s := Somatorio(a);
    expect !(a.Length == 0);
    expect s == 3;
  }

  // Test case for combination {2}/Os=1:
  //   POST: !(a.Length == 0)
  //   POST: s == a[a.Length - 1] + SomaAte(a, a.Length - 1)
  //   ENSURES: s == SomaAte(a, a.Length)
  {
    var a := new nat[2] [3, 4];
    var s := Somatorio(a);
    expect s == 7;
  }

  // Test case for combination {2}/Os=0:
  //   POST: !(a.Length == 0)
  //   POST: s == a[a.Length - 1] + SomaAte(a, a.Length - 1)
  //   ENSURES: s == SomaAte(a, a.Length)
  {
    var a := new nat[3] [4, 5, 6];
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
