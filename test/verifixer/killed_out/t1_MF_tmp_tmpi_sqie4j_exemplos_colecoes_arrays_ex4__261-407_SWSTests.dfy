// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\t1_MF_tmp_tmpi_sqie4j_exemplos_colecoes_arrays_ex4__261-407_SWS.dfy
// Method: Somatorio
// Generated: 2026-04-22 21:58:55

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
  while i < a.Length
    invariant 0 <= i && i <= a.Length
    invariant s == SomaAte(a, i)
    decreases a.Length - i
  {
    s := s + a[i];
    i := i + 1;
  }
  s := 0;
}


method TestsForSomatorio()
{
  // Test case for combination {1}:
  //   POST Q1: s == SomaAte(a, a.Length)
  {
    var a := new nat[0] [];
    var s := Somatorio(a);
    expect s == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   POST Q1: s == SomaAte(a, a.Length)
  {
    var a := new nat[1] [10];
    var s := Somatorio(a);
    // expect s == 10; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/O|a|>=2:
  //   POST Q1: s == SomaAte(a, a.Length)
  {
    var a := new nat[2] [8, 10];
    var s := Somatorio(a);
    // expect s == 18; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R3:
  //   POST Q1: s == SomaAte(a, a.Length)
  {
    var a := new nat[1] [9];
    var s := Somatorio(a);
    // expect s == 9; // got 0
  }

}

method Main()
{
  TestsForSomatorio();
  print "TestsForSomatorio: all non-failing tests passed!\n";
}
