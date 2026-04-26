// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\t1_MF_tmp_tmpi_sqie4j_exemplos_introducao_ex4__272-272_AOI.dfy
// Method: Fatorial
// Generated: 2026-04-24 14:27:30

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


method TestsForFatorial()
{
  // Test case for combination {1}:
  //   POST Q1: r == Fat(n)
  {
    var n := 0;
    var r := Fatorial(n);
    expect r == 1;
  }

  // Test case for combination {2}:
  //   POST Q1: r == Fat(n)
  {
    var n := 10;
    var r := Fatorial(n);
    expect r == 3628800;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bn=1:
  //   POST Q1: r == Fat(n)
  {
    var n := 1;
    var r := Fatorial(n);
    // expect r == 1; // got -1
  }

  // Test case for combination {2}/Bn=2:
  //   POST Q1: r == Fat(n)
  {
    var n := 2;
    var r := Fatorial(n);
    expect r == 2;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R4:
  //   POST Q1: r == Fat(n)
  {
    var n := 9;
    var r := Fatorial(n);
    // expect r == 362880; // got -362880
  }

  // Test case for combination {2}/R5:
  //   POST Q1: r == Fat(n)
  {
    var n := 8;
    var r := Fatorial(n);
    expect r == 40320;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R6:
  //   POST Q1: r == Fat(n)
  {
    var n := 7;
    var r := Fatorial(n);
    // expect r == 5040; // got -5040
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R7:
  //   POST Q1: r == Fat(n)
  {
    var n := 3;
    var r := Fatorial(n);
    // expect r == 6; // got -6
  }

  // Test case for combination {2}/R8:
  //   POST Q1: r == Fat(n)
  {
    var n := 4;
    var r := Fatorial(n);
    expect r == 24;
  }

  // Test case for combination {2}/R9:
  //   POST Q1: r == Fat(n)
  {
    var n := 6;
    var r := Fatorial(n);
    expect r == 720;
  }

}

method Main()
{
  TestsForFatorial();
  print "TestsForFatorial: all non-failing tests passed!\n";
}
