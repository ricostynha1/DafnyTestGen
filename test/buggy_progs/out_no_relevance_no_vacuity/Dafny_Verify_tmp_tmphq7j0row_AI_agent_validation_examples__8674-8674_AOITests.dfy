// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Verify_tmp_tmphq7j0row_AI_agent_validation_examples__8674-8674_AOI.dfy
// Method: ComputePower
// Generated: 2026-04-24 23:30:24

// Dafny_Verify_tmp_tmphq7j0row_AI_agent_validation_examples.dfy

function Power(n: nat): nat
  decreases n
{
  if n == 0 then
    1
  else
    2 * Power(n - 1)
}

method ComputePower(N: int) returns (y: nat)
  requires N >= 0
  ensures y == Power(N)
  decreases N
{
  y := 1;
  var x := 0;
  while x != N
    invariant 0 <= x <= N
    invariant y == Power(x)
    decreases N - x
  {
    x, y := x + 1, y + y;
  }
}

method Max(a: array<nat>) returns (m: int)
  ensures forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  ensures (m == 0 && a.Length == 0) || exists i: int {:trigger a[i]} :: 0 <= i < a.Length && m == a[i]
  decreases a
{
  m := 0;
  var n := 0;
  while n != a.Length
    invariant 0 <= n <= a.Length
    invariant forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] <= m
    invariant (m == 0 && n == 0) || exists i: int {:trigger a[i]} :: 0 <= i < n && m == a[i]
    decreases if n <= a.Length then a.Length - n else n - a.Length
  {
    if m < a[n] {
      m := a[n];
    }
    n := n + 1;
  }
}

method Cube(n: nat) returns (c: nat)
  ensures c == n * n * n
  decreases n
{
  c := 0;
  var i := 0;
  var k := 1;
  var m := 6;
  while i != n
    invariant 0 <= i <= n
    invariant c == i * i * i
    invariant k == 3 * i * i + 3 * i + 1
    invariant m == 6 * i + 6
    decreases if i <= n then n - i else i - n
  {
    c, k, m := c + k, k + m, m + 6;
    i := i + 1;
  }
}

method IncrementMatrix(a: array2<int>)
  modifies a
  ensures forall i: int, j: int {:trigger old(a[i, j])} {:trigger a[i, j]} :: 0 <= i < a.Length0 && 0 <= j < a.Length1 ==> a[i, j] == old(a[i, j]) + 1
  decreases a
{
  var m := 0;
  while m != a.Length0
    invariant 0 <= m <= a.Length0
    invariant forall i: int, j: int {:trigger old(a[i, j])} {:trigger a[i, j]} :: 0 <= i < m && 0 <= j < a.Length1 ==> a[i, j] == old(a[i, j]) + 1
    invariant forall i: int, j: int {:trigger old(a[i, j])} {:trigger a[i, j]} :: m <= i < a.Length0 && 0 <= j < a.Length1 ==> a[i, j] == old(a[i, j])
    decreases if m <= a.Length0 then a.Length0 - m else m - a.Length0
  {
    var n := 0;
    while n != a.Length1
      invariant 0 <= n <= a.Length1
      invariant forall i: int, j: int {:trigger old(a[i, j])} {:trigger a[i, j]} :: 0 <= i < m && 0 <= j < a.Length1 ==> a[i, j] == old(a[i, j]) + 1
      invariant forall i: int, j: int {:trigger old(a[i, j])} {:trigger a[i, j]} :: m < i < a.Length0 && 0 <= j < a.Length1 ==> a[i, j] == old(a[i, j])
      invariant forall j: int {:trigger old(a[m, j])} {:trigger a[m, j]} :: 0 <= j < n ==> a[m, j] == old(a[m, j]) + 1
      invariant forall j: int {:trigger old(a[m, j])} {:trigger a[m, j]} :: n <= j < a.Length1 ==> a[m, j] == old(a[m, j])
      decreases if n <= a.Length1 then a.Length1 - n else n - a.Length1
    {
      a[m, n] := a[m, n] + 1;
      n := n + 1;
    }
    m := m + 1;
  }
}

method CopyMatrix(src: array2, dst: array2)
  requires src.Length0 == dst.Length0 && src.Length1 == dst.Length1
  modifies dst
  ensures forall i: int, j: int {:trigger old(src[i, j])} {:trigger dst[i, j]} :: 0 <= i < src.Length0 && 0 <= j < src.Length1 ==> dst[i, j] == old(src[i, j])
  decreases src, dst
{
  var m := 0;
  while m != src.Length0
    invariant 0 <= m <= src.Length0
    invariant forall i: int, j: int {:trigger old(src[i, j])} {:trigger dst[i, j]} :: 0 <= i < m && 0 <= j < src.Length1 ==> dst[i, j] == old(src[i, j])
    invariant forall i: int, j: int {:trigger old(src[i, j])} {:trigger src[i, j]} :: 0 <= i < src.Length0 && 0 <= j < src.Length1 ==> src[i, j] == old(src[i, j])
    decreases if m <= src.Length0 then src.Length0 - m else m - src.Length0
  {
    var n := 0;
    while n != src.Length1
      invariant 0 <= n <= src.Length1
      invariant forall i: int, j: int {:trigger old(src[i, j])} {:trigger dst[i, j]} :: 0 <= i < m && 0 <= j < src.Length1 ==> dst[i, j] == old(src[i, j])
      invariant forall i: int, j: int {:trigger old(src[i, j])} {:trigger src[i, j]} :: 0 <= i < src.Length0 && 0 <= j < src.Length1 ==> src[i, j] == old(src[i, j])
      invariant forall j: int {:trigger old(src[m, j])} {:trigger dst[m, j]} :: 0 <= j < n ==> dst[m, j] == old(src[m, j])
      decreases if n <= src.Length1 then src.Length1 - n else n - src.Length1
    {
      dst[m, n] := src[m, n];
      n := n + 1;
    }
    m := m + 1;
  }
}

method DoubleArray(src: array<int>, dst: array<int>)
  requires src.Length == dst.Length
  modifies dst
  ensures forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  decreases src, dst
{
  var n := 0;
  while n != src.Length
    invariant 0 <= n <= src.Length
    invariant forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < n ==> dst[i] == 2 * old(src[i])
    invariant forall i: int {:trigger old(src[i])} {:trigger src[i]} :: n <= i < src.Length ==> src[i] == old(src[i])
    decreases if n <= src.Length then src.Length - n else n - src.Length
  {
    dst[n] := 2 * src[-n];
    n := n + 1;
  }
}

method RotateLeft(a: array)
  requires a.Length > 0
  modifies a
  ensures forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  ensures a[a.Length - 1] == old(a[0])
  decreases a
{
  var n := 0;
  while n != a.Length - 1
    invariant 0 <= n <= a.Length - 1
    invariant forall i: int {:trigger a[i]} :: 0 <= i < n ==> a[i] == old(a[i + 1])
    invariant a[n] == old(a[0])
    invariant forall i: int {:trigger old(a[i])} {:trigger a[i]} :: n < i <= a.Length - 1 ==> a[i] == old(a[i])
    decreases if n <= a.Length - 1 then a.Length - 1 - n else n - (a.Length - 1)
  {
    a[n], a[n + 1] := a[n + 1], a[n];
    n := n + 1;
  }
}

method RotateRight(a: array)
  requires a.Length > 0
  modifies a
  ensures forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  ensures a[0] == old(a[a.Length - 1])
  decreases a
{
  var n := 1;
  while n != a.Length
    invariant 1 <= n <= a.Length
    invariant forall i: int {:trigger a[i]} :: 1 <= i < n ==> a[i] == old(a[i - 1])
    invariant a[0] == old(a[n - 1])
    invariant forall i: int {:trigger old(a[i])} {:trigger a[i]} :: n <= i <= a.Length - 1 ==> a[i] == old(a[i])
    decreases if n <= a.Length then a.Length - n else n - a.Length
  {
    a[0], a[n] := a[n], a[0];
    n := n + 1;
  }
}


method TestsForComputePower()
{
  // Test case for combination {1}:
  //   PRE:  N >= 0
  //   POST Q1: y == Power(N)
  {
    var N := 0;
    var y := ComputePower(N);
    expect y == 1;
  }

  // Test case for combination {2}:
  //   PRE:  N >= 0
  //   POST Q1: y == Power(N)
  {
    var N := 2;
    var y := ComputePower(N);
    expect y == 4;
  }

  // Test case for combination {2}/BN=1:
  //   PRE:  N >= 0
  //   POST Q1: y == Power(N)
  {
    var N := 1;
    var y := ComputePower(N);
    expect y == 2;
  }

  // Test case for combination {2}/R3:
  //   PRE:  N >= 0
  //   POST Q1: y == Power(N)
  {
    var N := 10;
    var y := ComputePower(N);
    expect y == 1024;
  }

  // Test case for combination {2}/R4:
  //   PRE:  N >= 0
  //   POST Q1: y == Power(N)
  {
    var N := 9;
    var y := ComputePower(N);
    expect y == 512;
  }

  // Test case for combination {2}/R5:
  //   PRE:  N >= 0
  //   POST Q1: y == Power(N)
  {
    var N := 8;
    var y := ComputePower(N);
    expect y == 256;
  }

  // Test case for combination {2}/R6:
  //   PRE:  N >= 0
  //   POST Q1: y == Power(N)
  {
    var N := 7;
    var y := ComputePower(N);
    expect y == 128;
  }

  // Test case for combination {2}/R7:
  //   PRE:  N >= 0
  //   POST Q1: y == Power(N)
  {
    var N := 6;
    var y := ComputePower(N);
    expect y == 64;
  }

  // Test case for combination {2}/R8:
  //   PRE:  N >= 0
  //   POST Q1: y == Power(N)
  {
    var N := 5;
    var y := ComputePower(N);
    expect y == 32;
  }

  // Test case for combination {2}/R9:
  //   PRE:  N >= 0
  //   POST Q1: y == Power(N)
  {
    var N := 4;
    var y := ComputePower(N);
    expect y == 16;
  }

}

method TestsForMax()
{
  // Test case for combination {1}:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: m == 0
  //   POST Q3: a.Length == 0
  {
    var a := new nat[0] [];
    var m := Max(a);
    expect m == 0;
  }

  // Test case for combination {2}:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: m != 0
  //   POST Q3: 0 <= (a.Length - 1)
  //   POST Q4: m == a[0]
  {
    var a := new nat[1] [10];
    var m := Max(a);
    expect m == 10;
  }

  // Test case for combination {3}:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: m != 0
  //   POST Q3: exists i :: 1 <= i < (a.Length - 1) && m == a[i]
  {
    var a := new nat[3] [5, 7, 6];
    var m := Max(a);
    expect m == 7;
  }

  // Test case for combination {5}:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: m == 0
  //   POST Q3: a.Length != 0
  //   POST Q4: 0 <= (a.Length - 1)
  //   POST Q5: m == a[0]
  {
    var a := new nat[1] [0];
    var m := Max(a);
    expect m == 0;
  }

  // Test case for combination {6}:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: m == 0
  //   POST Q3: a.Length != 0
  //   POST Q4: exists i :: 1 <= i < (a.Length - 1) && m == a[i]
  {
    var a := new nat[8] [0, 0, 0, 0, 0, 0, 0, 0];
    var m := Max(a);
    expect m == 0;
  }

  // Test case for combination {2}/O|a|>=2:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: m != 0
  //   POST Q3: 0 <= (a.Length - 1)
  //   POST Q4: m == a[0]
  {
    var a := new nat[2] [9, 2];
    var m := Max(a);
    expect m == 9;
  }

  // Test case for combination {4}/O|a|>=2:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: m != 0
  //   POST Q3: 0 <= (a.Length - 1)
  //   POST Q4: m == a[(a.Length - 1)]
  {
    var a := new nat[2] [6, 6];
    var m := Max(a);
    expect m == 6;
  }

  // Test case for combination {2}/R3:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: m != 0
  //   POST Q3: 0 <= (a.Length - 1)
  //   POST Q4: m == a[0]
  {
    var a := new nat[1] [9];
    var m := Max(a);
    expect m == 9;
  }

  // Test case for combination {2}/R4:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: m != 0
  //   POST Q3: 0 <= (a.Length - 1)
  //   POST Q4: m == a[0]
  {
    var a := new nat[1] [8];
    var m := Max(a);
    expect m == 8;
  }

  // Test case for combination {2}/R5:
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST Q2: m != 0
  //   POST Q3: 0 <= (a.Length - 1)
  //   POST Q4: m == a[0]
  {
    var a := new nat[1] [4];
    var m := Max(a);
    expect m == 4;
  }

}

method TestsForCube()
{
  // Test case for combination {1}:
  //   POST Q1: c == n * n * n
  {
    var n := 10;
    var c := Cube(n);
    expect c == 1000;
  }

  // Test case for combination {1}/Bn=0:
  //   POST Q1: c == n * n * n
  {
    var n := 0;
    var c := Cube(n);
    expect c == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST Q1: c == n * n * n
  {
    var n := 1;
    var c := Cube(n);
    expect c == 1;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: c == n * n * n
  {
    var n := 9;
    var c := Cube(n);
    expect c == 729;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: c == n * n * n
  {
    var n := 8;
    var c := Cube(n);
    expect c == 512;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: c == n * n * n
  {
    var n := 7;
    var c := Cube(n);
    expect c == 343;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: c == n * n * n
  {
    var n := 6;
    var c := Cube(n);
    expect c == 216;
  }

  // Test case for combination {1}/R8:
  //   POST Q1: c == n * n * n
  {
    var n := 2;
    var c := Cube(n);
    expect c == 8;
  }

  // Test case for combination {1}/R9:
  //   POST Q1: c == n * n * n
  {
    var n := 3;
    var c := Cube(n);
    expect c == 27;
  }

  // Test case for combination {1}/R10:
  //   POST Q1: c == n * n * n
  {
    var n := 5;
    var c := Cube(n);
    expect c == 125;
  }

}

method TestsForDoubleArray()
{
  // Test case for combination {1}:
  //   PRE:  src.Length == dst.Length
  //   POST Q1: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[1] [9];
    var dst := new int[1] [10];
    var old_src := src[..];
    DoubleArray(src, dst);
    expect dst[..] == [18];
  }

  // Test case for combination {1}/O|src|=0:
  //   PRE:  src.Length == dst.Length
  //   POST Q1: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[0] [];
    var dst := new int[0] [];
    var old_src := src[..];
    DoubleArray(src, dst);
    expect dst[..] == [];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|src|>=2:
  //   PRE:  src.Length == dst.Length
  //   POST Q1: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[2] [3, -10];
    var dst := new int[2] [4, 3];
    var old_src := src[..];
    DoubleArray(src, dst);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.DoubleArray(BigInteger[] src, BigInteger[] dst) in C:\cygwin64\tmp\DafnyCBT_2yxabrnn4si\runner.cs:line 6940
    // runtime error: at _module.__default.TestCase__32() in C:\cygwin64\tmp\DafnyCBT_2yxabrnn4si\runner.cs:line 7898
    // expect dst[..] == [6, -20];
  }

  // Test case for combination {1}/R4:
  //   PRE:  src.Length == dst.Length
  //   POST Q1: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[1] [2];
    var dst := new int[1] [-1];
    var old_src := src[..];
    DoubleArray(src, dst);
    expect dst[..] == [4];
  }

  // Test case for combination {1}/R5:
  //   PRE:  src.Length == dst.Length
  //   POST Q1: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[1] [2];
    var dst := new int[1] [-2];
    var old_src := src[..];
    DoubleArray(src, dst);
    expect dst[..] == [4];
  }

  // Test case for combination {1}/R6:
  //   PRE:  src.Length == dst.Length
  //   POST Q1: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[1] [2];
    var dst := new int[1] [-3];
    var old_src := src[..];
    DoubleArray(src, dst);
    expect dst[..] == [4];
  }

  // Test case for combination {1}/R7:
  //   PRE:  src.Length == dst.Length
  //   POST Q1: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[1] [2];
    var dst := new int[1] [-4];
    var old_src := src[..];
    DoubleArray(src, dst);
    expect dst[..] == [4];
  }

  // Test case for combination {1}/R8:
  //   PRE:  src.Length == dst.Length
  //   POST Q1: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[1] [2];
    var dst := new int[1] [-10];
    var old_src := src[..];
    DoubleArray(src, dst);
    expect dst[..] == [4];
  }

  // Test case for combination {1}/R9:
  //   PRE:  src.Length == dst.Length
  //   POST Q1: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[1] [2];
    var dst := new int[1] [-9];
    var old_src := src[..];
    DoubleArray(src, dst);
    expect dst[..] == [4];
  }

  // Test case for combination {1}/R10:
  //   PRE:  src.Length == dst.Length
  //   POST Q1: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[1] [3];
    var dst := new int[1] [-10];
    var old_src := src[..];
    DoubleArray(src, dst);
    expect dst[..] == [6];
  }

}

method TestsForRotateLeft()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  {
    var a := new int[1] [17];
    RotateLeft<int>(a);
    expect a[..] == [17];
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  {
    var a := new int[2] [16, 16];
    RotateLeft<int>(a);
    expect a[..] == [16, 16];
  }

  // Test case for combination {1}/Oa≠old:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  {
    var a := new int[2] [24, 29];
    RotateLeft<int>(a);
    expect a[..] == [29, 24];
  }

  // Test case for combination {1}/R4:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  {
    var a := new int[1] [19];
    RotateLeft<int>(a);
    expect a[..] == [19];
  }

  // Test case for combination {1}/R5:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  {
    var a := new int[1] [20];
    RotateLeft<int>(a);
    expect a[..] == [20];
  }

  // Test case for combination {1}/R6:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  {
    var a := new int[1] [21];
    RotateLeft<int>(a);
    expect a[..] == [21];
  }

  // Test case for combination {1}/R7:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  {
    var a := new int[1] [22];
    RotateLeft<int>(a);
    expect a[..] == [22];
  }

  // Test case for combination {1}/R8:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  {
    var a := new int[1] [23];
    RotateLeft<int>(a);
    expect a[..] == [23];
  }

  // Test case for combination {1}/R9:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  {
    var a := new int[1] [25];
    RotateLeft<int>(a);
    expect a[..] == [25];
  }

  // Test case for combination {1}/R10:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   POST Q2: a[a.Length - 1] == old(a[0])
  {
    var a := new int[1] [26];
    RotateLeft<int>(a);
    expect a[..] == [26];
  }

}

method TestsForRotateRight()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   POST Q2: a[0] == old(a[a.Length - 1])
  {
    var a := new int[1] [14];
    RotateRight<int>(a);
    expect a[..] == [14];
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   POST Q2: a[0] == old(a[a.Length - 1])
  {
    var a := new int[2] [8, 16];
    RotateRight<int>(a);
    expect a[..] == [16, 8];
  }

  // Test case for combination {1}/R3:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   POST Q2: a[0] == old(a[a.Length - 1])
  {
    var a := new int[1] [17];
    RotateRight<int>(a);
    expect a[..] == [17];
  }

  // Test case for combination {1}/R4:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   POST Q2: a[0] == old(a[a.Length - 1])
  {
    var a := new int[1] [18];
    RotateRight<int>(a);
    expect a[..] == [18];
  }

  // Test case for combination {1}/R5:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   POST Q2: a[0] == old(a[a.Length - 1])
  {
    var a := new int[1] [19];
    RotateRight<int>(a);
    expect a[..] == [19];
  }

  // Test case for combination {1}/R6:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   POST Q2: a[0] == old(a[a.Length - 1])
  {
    var a := new int[1] [20];
    RotateRight<int>(a);
    expect a[..] == [20];
  }

  // Test case for combination {1}/R7:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   POST Q2: a[0] == old(a[a.Length - 1])
  {
    var a := new int[1] [21];
    RotateRight<int>(a);
    expect a[..] == [21];
  }

  // Test case for combination {1}/R8:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   POST Q2: a[0] == old(a[a.Length - 1])
  {
    var a := new int[1] [22];
    RotateRight<int>(a);
    expect a[..] == [22];
  }

  // Test case for combination {1}/R9:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   POST Q2: a[0] == old(a[a.Length - 1])
  {
    var a := new int[1] [23];
    RotateRight<int>(a);
    expect a[..] == [23];
  }

  // Test case for combination {1}/R10:
  //   PRE:  a.Length > 0
  //   POST Q1: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   POST Q2: a[0] == old(a[a.Length - 1])
  {
    var a := new int[1] [24];
    RotateRight<int>(a);
    expect a[..] == [24];
  }

}

method Main()
{
  TestsForComputePower();
  print "TestsForComputePower: all non-failing tests passed!\n";
  TestsForMax();
  print "TestsForMax: all non-failing tests passed!\n";
  TestsForCube();
  print "TestsForCube: all non-failing tests passed!\n";
  TestsForDoubleArray();
  print "TestsForDoubleArray: all non-failing tests passed!\n";
  TestsForRotateLeft();
  print "TestsForRotateLeft: all non-failing tests passed!\n";
  TestsForRotateRight();
  print "TestsForRotateRight: all non-failing tests passed!\n";
}
