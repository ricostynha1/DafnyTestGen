// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_Verify_tmp_tmphq7j0row_AI_agent_validation_examples.dfy
// Method: ComputePower
// Generated: 2026-04-08 19:06:14

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
    dst[n] := 2 * src[n];
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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  N >= 0
  //   POST: N == 0
  //   POST: y == 1
  //   ENSURES: y == Power(N)
  {
    var N := 0;
    var y := ComputePower(N);
    expect y == 1;
  }

  // Test case for combination {2}:
  //   PRE:  N >= 0
  //   POST: !(N == 0)
  //   POST: y == 2 * Power(N - 1)
  //   ENSURES: y == Power(N)
  {
    var N := 1;
    var y := ComputePower(N);
    expect !(N == 0);
    expect y == 2;
  }

  // Test case for combination {2}/Oy=1:
  //   PRE:  N >= 0
  //   POST: !(N == 0)
  //   POST: y == 2 * Power(N - 1)
  //   ENSURES: y == Power(N)
  {
    var N := 2;
    var y := ComputePower(N);
    expect y == 4;
  }

  // Test case for combination {2}/Oy=0:
  //   PRE:  N >= 0
  //   POST: !(N == 0)
  //   POST: y == 2 * Power(N - 1)
  //   ENSURES: y == Power(N)
  {
    var N := 3;
    var y := ComputePower(N);
    expect y == 8;
  }

  // Test case for combination {2}:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST: m == 0
  //   POST: a.Length == 0
  //   POST: !exists i: int {:trigger a[i]} :: 0 <= i < a.Length && m == a[i]
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   ENSURES: (m == 0 && a.Length == 0) || exists i: int {:trigger a[i]} :: 0 <= i < a.Length && m == a[i]
  {
    var a := new nat[0] [];
    var m := Max(a);
    expect m == 0;
  }

  // Test case for combination {3}:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST: !(m == 0)
  //   POST: !(a.Length == 0)
  //   POST: 0 < a.Length
  //   POST: m == a[0]
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   ENSURES: (m == 0 && a.Length == 0) || exists i: int {:trigger a[i]} :: 0 <= i < a.Length && m == a[i]
  {
    var a := new nat[1] [39];
    var m := Max(a);
    expect m == 39;
  }

  // Test case for combination {4}:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST: !(m == 0)
  //   POST: !(a.Length == 0)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && m == a[i]
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   ENSURES: (m == 0 && a.Length == 0) || exists i: int {:trigger a[i]} :: 0 <= i < a.Length && m == a[i]
  {
    var a := new nat[3] [0, 39, 39];
    var m := Max(a);
    expect m == 39;
  }

  // Test case for combination {5}:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST: !(m == 0)
  //   POST: !(a.Length == 0)
  //   POST: 0 < a.Length
  //   POST: m == a[(a.Length - 1)]
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   ENSURES: (m == 0 && a.Length == 0) || exists i: int {:trigger a[i]} :: 0 <= i < a.Length && m == a[i]
  {
    var a := new nat[1] [7720];
    var m := Max(a);
    expect m == 7720;
  }

  // Test case for combination {7}:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST: m == 0
  //   POST: !(a.Length == 0)
  //   POST: 0 < a.Length
  //   POST: m == a[0]
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   ENSURES: (m == 0 && a.Length == 0) || exists i: int {:trigger a[i]} :: 0 <= i < a.Length && m == a[i]
  {
    var a := new nat[1] [0];
    var m := Max(a);
    expect m == 0;
  }

  // Test case for combination {8}:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST: m == 0
  //   POST: !(a.Length == 0)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && m == a[i]
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   ENSURES: (m == 0 && a.Length == 0) || exists i: int {:trigger a[i]} :: 0 <= i < a.Length && m == a[i]
  {
    var a := new nat[4] [0, 0, 0, 0];
    var m := Max(a);
    expect m == 0;
  }

  // Test case for combination {3}/Om>0:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST: !(m == 0)
  //   POST: !(a.Length == 0)
  //   POST: 0 < a.Length
  //   POST: m == a[0]
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   ENSURES: (m == 0 && a.Length == 0) || exists i: int {:trigger a[i]} :: 0 <= i < a.Length && m == a[i]
  {
    var a := new nat[2] [450, 449];
    var m := Max(a);
    expect m == 450;
  }

  // Test case for combination {4}/Om>0:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST: !(m == 0)
  //   POST: !(a.Length == 0)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && m == a[i]
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   ENSURES: (m == 0 && a.Length == 0) || exists i: int {:trigger a[i]} :: 0 <= i < a.Length && m == a[i]
  {
    var a := new nat[4] [0, 450, 450, 449];
    var m := Max(a);
    expect m == 450;
  }

  // Test case for combination {5}/Om>0:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   POST: !(m == 0)
  //   POST: !(a.Length == 0)
  //   POST: 0 < a.Length
  //   POST: m == a[(a.Length - 1)]
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] <= m
  //   ENSURES: (m == 0 && a.Length == 0) || exists i: int {:trigger a[i]} :: 0 <= i < a.Length && m == a[i]
  {
    var a := new nat[2] [0, 1237];
    var m := Max(a);
    expect m == 1237;
  }

  // Test case for combination {1}:
  //   POST: c == n * n * n
  //   ENSURES: c == n * n * n
  {
    var n := 0;
    var c := Cube(n);
    expect c == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST: c == n * n * n
  //   ENSURES: c == n * n * n
  {
    var n := 1;
    var c := Cube(n);
    expect c == 1;
  }

  // Test case for combination {1}/Oc>=2:
  //   POST: c == n * n * n
  //   ENSURES: c == n * n * n
  {
    var n := 2;
    var c := Cube(n);
    expect c == 8;
  }

  // Test case for combination {1}:
  //   PRE:  src.Length == dst.Length
  //   POST: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  //   ENSURES: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[0] [];
    var dst := new int[0] [];
    var old_src := src[..];
    DoubleArray(src, dst);
    expect dst[..] == [];
  }

  // Test case for combination {1}/Bsrc=1,dst=1:
  //   PRE:  src.Length == dst.Length
  //   POST: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  //   ENSURES: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[1] [0];
    var dst := new int[1] [8];
    var old_src := src[..];
    DoubleArray(src, dst);
    expect dst[..] == [0];
  }

  // Test case for combination {1}/Bsrc=2,dst=2:
  //   PRE:  src.Length == dst.Length
  //   POST: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  //   ENSURES: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[2] [0, 7720];
    var dst := new int[2] [9, 8];
    var old_src := src[..];
    DoubleArray(src, dst);
    expect dst[..] == [0, 15440];
  }

  // Test case for combination {1}/Bsrc=3,dst=3:
  //   PRE:  src.Length == dst.Length
  //   POST: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  //   ENSURES: forall i: int {:trigger old(src[i])} {:trigger dst[i]} :: 0 <= i < src.Length ==> dst[i] == 2 * old(src[i])
  {
    var src := new int[3] [-21240, -21239, 0];
    var dst := new int[3] [12, 11, 13];
    var old_src := src[..];
    DoubleArray(src, dst);
    expect dst[..] == [-42480, -42478, 0];
  }

  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   POST: a[a.Length - 1] == old(a[0])
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   ENSURES: a[a.Length - 1] == old(a[0])
  {
    var a := new int[1] [16];
    RotateLeft(a);
    expect a[..] == [16];
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a.Length > 0
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   POST: a[a.Length - 1] == old(a[0])
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   ENSURES: a[a.Length - 1] == old(a[0])
  {
    var a := new int[2] [4, 3];
    RotateLeft(a);
    expect a[..] == [3, 4];
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   POST: a[a.Length - 1] == old(a[0])
  //   ENSURES: forall i: int {:trigger a[i]} :: 0 <= i < a.Length - 1 ==> a[i] == old(a[i + 1])
  //   ENSURES: a[a.Length - 1] == old(a[0])
  {
    var a := new int[3] [6, 4, 5];
    RotateLeft(a);
    expect a[..] == [4, 5, 6];
  }

  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   POST: a[0] == old(a[a.Length - 1])
  //   ENSURES: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   ENSURES: a[0] == old(a[a.Length - 1])
  {
    var a := new int[1] [15];
    RotateRight(a);
    expect a[..] == [15];
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a.Length > 0
  //   POST: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   POST: a[0] == old(a[a.Length - 1])
  //   ENSURES: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   ENSURES: a[0] == old(a[a.Length - 1])
  {
    var a := new int[2] [3, 4];
    RotateRight(a);
    expect a[..] == [4, 3];
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   POST: a[0] == old(a[a.Length - 1])
  //   ENSURES: forall i: int {:trigger a[i]} :: 1 <= i < a.Length ==> a[i] == old(a[i - 1])
  //   ENSURES: a[0] == old(a[a.Length - 1])
  {
    var a := new int[3] [4, 5, 6];
    RotateRight(a);
    expect a[..] == [6, 4, 5];
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
