// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\TFG_tmp_tmpbvsao41w_Algoritmos Dafny_suma_it__219_ROR_Eq.dfy
// Method: suma_it
// Generated: 2026-04-24 17:12:23

// TFG_tmp_tmpbvsao41w_Algoritmos Dafny_suma_it.dfy

method suma_it(V: array<int>) returns (x: int)
  ensures x == suma_vector(V, 0)
  decreases V
{
  var n := V.Length;
  x := 0;
  while n == 0
    invariant 0 <= n <= V.Length && x == suma_vector(V, n)
    decreases n
  {
    x := x + V[n - 1];
    n := n - 1;
  }
}

function suma_vector(V: array<int>, n: nat): int
  requires 0 <= n <= V.Length
  reads V
  decreases V.Length - n
{
  if n == V.Length then
    0
  else
    V[n] + suma_vector(V, n + 1)
}

method OriginalMain()
{
  var v := new int[] [-1, 2, 5, -5, 8];
  var w := new int[] [1, 0, 5, 5, 8];
  var s1 := suma_it(v);
  var s2 := suma_it(w);
  print "La suma del vector v es: ", s1, "\n";
  print "La suma del vector w es: ", s2;
}


method TestsForsuma_it()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   POST Q1: x == suma_vector(V, 0)
  {
    var V := new int[0] [];
    var x := suma_it(V);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.suma__it(BigInteger[] V) in C:\cygwin64\tmp\DafnyCBT_ksgjuctapmm\runner.cs:line 5930
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_ksgjuctapmm\runner.cs:line 6005
    // expect x == suma_vector(V, 0);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   POST Q1: x == suma_vector(V, 0)
  {
    var V := new int[1] [-1];
    var x := suma_it(V);
    // expect x == -1; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/O|V|>=2:
  //   POST Q1: x == suma_vector(V, 0)
  {
    var V := new int[2] [-2, -1];
    var x := suma_it(V);
    // expect x == -3; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R3:
  //   POST Q1: x == suma_vector(V, 0)
  {
    var V := new int[1] [-10];
    var x := suma_it(V);
    // expect x == -10; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R4:
  //   POST Q1: x == suma_vector(V, 0)
  {
    var V := new int[1] [-9];
    var x := suma_it(V);
    // expect x == -9; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R5:
  //   POST Q1: x == suma_vector(V, 0)
  {
    var V := new int[1] [-8];
    var x := suma_it(V);
    // expect x == -8; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R6:
  //   POST Q1: x == suma_vector(V, 0)
  {
    var V := new int[1] [-7];
    var x := suma_it(V);
    // expect x == -7; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R7:
  //   POST Q1: x == suma_vector(V, 0)
  {
    var V := new int[1] [-6];
    var x := suma_it(V);
    // expect x == -6; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R8:
  //   POST Q1: x == suma_vector(V, 0)
  {
    var V := new int[1] [-5];
    var x := suma_it(V);
    // expect x == -5; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R9:
  //   POST Q1: x == suma_vector(V, 0)
  {
    var V := new int[1] [-4];
    var x := suma_it(V);
    // expect x == -4; // got 0
  }

}

method Main()
{
  TestsForsuma_it();
  print "TestsForsuma_it: all non-failing tests passed!\n";
}
