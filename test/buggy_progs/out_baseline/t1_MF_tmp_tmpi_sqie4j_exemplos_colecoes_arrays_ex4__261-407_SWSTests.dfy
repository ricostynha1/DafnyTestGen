// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\t1_MF_tmp_tmpi_sqie4j_exemplos_colecoes_arrays_ex4__261-407_SWS.dfy
// Method: Somatorio
// Generated: 2026-04-24 20:43:18

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
    var a := new nat[1] [400];
    var s := Somatorio(a);
    // expect s == 400; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/O|a|>=2:
  //   POST Q1: s == SomaAte(a, a.Length)
  {
    var a := new nat[2] [53, 175];
    var s := Somatorio(a);
    // expect s == 228; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R3:
  //   POST Q1: s == SomaAte(a, a.Length)
  {
    var a := new nat[1] [401];
    var s := Somatorio(a);
    // expect s == 401; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R4:
  //   POST Q1: s == SomaAte(a, a.Length)
  {
    var a := new nat[1] [402];
    var s := Somatorio(a);
    // expect s == 402; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R5:
  //   POST Q1: s == SomaAte(a, a.Length)
  {
    var a := new nat[1] [403];
    var s := Somatorio(a);
    // expect s == 403; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R6:
  //   POST Q1: s == SomaAte(a, a.Length)
  {
    var a := new nat[1] [83];
    var s := Somatorio(a);
    // expect s == 83; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R7:
  //   POST Q1: s == SomaAte(a, a.Length)
  {
    var a := new nat[1] [64];
    var s := Somatorio(a);
    // expect s == 64; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R8:
  //   POST Q1: s == SomaAte(a, a.Length)
  {
    var a := new nat[1] [65];
    var s := Somatorio(a);
    // expect s == 65; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R9:
  //   POST Q1: s == SomaAte(a, a.Length)
  {
    var a := new nat[1] [66];
    var s := Somatorio(a);
    // expect s == 66; // got 0
  }

}

method Main()
{
  TestsForSomatorio();
  print "TestsForSomatorio: all non-failing tests passed!\n";
}
