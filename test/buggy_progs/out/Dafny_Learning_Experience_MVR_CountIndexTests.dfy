// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Learning_Experience_MVR_CountIndex.dfy
// Method: FooCount
// Generated: 2026-04-17 13:52:47

// Dafny_Learning_Experience_tmp_tmpuxvcet_u_week1_7_A2_Q1_trimmed copy - 副本.dfy

function Count(hi: nat, s: seq<int>): int
  requires 0 <= hi <= |s|
  decreases hi
{
  if hi == 0 then
    0
  else if s[hi - 1] % 2 == 0 then
    1 + Count(hi - 1, s)
  else
    Count(hi - 1, s)
}

method FooCount(CountIndex: nat, a: seq<int>, b: array<int>)
    returns (p: nat)
  requires CountIndex == 0 || (|a| == b.Length && 1 <= CountIndex <= |a|)
  modifies b
  ensures p == Count(CountIndex, a)
  decreases CountIndex
{
  assert CountIndex == 0 || (|a| == b.Length && 1 <= CountIndex <= |a|);
  assert CountIndex == 0 || (|a| == b.Length && 0 <= CountIndex - 1 <= |a|);
  assert CountIndex != 0 ==> |a| == b.Length && 0 <= CountIndex - 1 <= |a|;
  assert CountIndex == 0 ==> true && CountIndex != 0 ==> |a| == b.Length && 0 <= CountIndex - 1 <= |a|;
  if CountIndex == 0 {
    assert true;
    assert 0 == 0;
    assert 0 == Count(0, a);
    p := 0;
    assert p == Count(CountIndex, a);
  } else {
    assert |a| == b.Length && 0 <= CountIndex - 1 <= |a|;
    assert (a[CountIndex - 1] % 2 == 0 ==> |a| == b.Length && 0 <= CountIndex - 1 < |a| && 1 + Count(CountIndex - 1, a) == Count(CountIndex, a)) && (a[CountIndex - 1] % 2 != 0 ==> |a| == b.Length && 0 <= CountIndex - 1 < |a| && Count(CountIndex - 1, a) == Count(CountIndex, a));
    if a[CountIndex - 1] % 2 == 0 {
      assert |a| == b.Length && 0 <= CountIndex - 1 < |a| && 1 + Count(CountIndex - 1, a) == Count(CountIndex, a);
      var d := FooCount(CountIndex - 1, a, b);
      assert d + 1 == Count(CountIndex, a);
      p := d + 1;
      assert p == Count(CountIndex, a);
    } else {
      assert |a| == b.Length && 0 <= CountIndex - 1 < |a| && Count(CountIndex - 1, a) == Count(CountIndex, a);
      assert |a| == b.Length && 0 <= CountIndex - 1 < |a| && forall p': int :: p' == Count(CountIndex - 1, a) ==> p' == Count(CountIndex, a);
      var d := FooCount(CountIndex - 1, a, b);
      assert d == Count(CountIndex, a);
      p := d;
      assert p == Count(CountIndex, a);
    }
    b[CountIndex - 1] := p;
    assert p == Count(CountIndex, a);
  }
}

method FooPreCompute(a: array<int>, b: array<int>)
  requires a.Length == b.Length
  modifies b
  decreases a, b
{
  var CountIndex := 1;
  while CountIndex != CountIndex + 1
    invariant 1 <= CountIndex <= a.Length + 1
    decreases a.Length + 1 - CountIndex
  {
    assert (CountIndex == 0 || (a.Length == b.Length && 1 <= CountIndex <= a.Length)) && forall a': int :: a' == Count(CountIndex, a[..]) ==> a' == Count(CountIndex, a[..]);
    var p := FooCount(CountIndex, a[..], b);
    assert 1 <= CountIndex <= a.Length;
    assert 1 <= CountIndex + 1 <= a.Length + 1;
    CountIndex := CountIndex + 1;
    assert 1 <= CountIndex <= a.Length + 1;
  }
}

method ComputeCount(CountIndex: nat, a: seq<int>, b: array<int>)
    returns (p: nat)
  requires CountIndex == 0 || (|a| == b.Length && 1 <= CountIndex <= |a|)
  modifies b
  ensures p == Count(CountIndex, a)
  decreases CountIndex
{
  if CountIndex == 0 {
    p := 0;
  } else {
    if a[CountIndex - 1] % 2 == 0 {
      var d := ComputeCount(CountIndex - 1, a, b);
      p := d + 1;
    } else {
      var d := ComputeCount(CountIndex - 1, a, b);
      p := d;
    }
    b[CountIndex - 1] := p;
  }
}

method PreCompute(a: array<int>, b: array<int>) returns (p: nat)
  requires a.Length == b.Length
  modifies b
  ensures (b.Length == 0 || (a.Length == b.Length && 1 <= b.Length <= a.Length)) && forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..])
  decreases a, b
{
  assert (b.Length == 0 || (a.Length == b.Length && 1 <= b.Length <= a.Length)) && forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..]);
  p := ComputeCount(b.Length, a[..], b);
}

method Evens(a: array<int>) returns (c: array2<int>)
  decreases a
{
  c := new int[a.Length, a.Length];
  var b := new int[a.Length];
  var foo := PreCompute(a, b);
  var m := 0;
  while m != a.Length
    invariant 0 <= m <= a.Length
    invariant forall i: int, j: int {:trigger c[i, j]} :: 0 <= i < m && 0 <= j < a.Length ==> j < i ==> c[i, j] == 0
    invariant forall i: int, j: int {:trigger c[i, j]} :: 0 <= i < m && 0 <= j < a.Length ==> j >= i ==> i > 0 ==> c[i, j] == b[j] - b[i - 1]
    invariant forall i: int, j: int {:trigger c[i, j]} :: 0 <= i < m && 0 <= j < a.Length ==> j >= i ==> i == 0 ==> c[i, j] == b[j]
    decreases a.Length - m
    modifies c
  {
    var n := 0;
    while n != a.Length
      invariant 0 <= n <= a.Length
      invariant forall i: int, j: int {:trigger c[i, j]} :: 0 <= i < m && 0 <= j < a.Length ==> j < i ==> c[i, j] == 0
      invariant forall j: int {:trigger c[m, j]} :: 0 <= j < n ==> j < m ==> c[m, j] == 0
      invariant forall i: int, j: int {:trigger c[i, j]} :: 0 <= i < m && 0 <= j < a.Length ==> j >= i ==> i > 0 ==> c[i, j] == b[j] - b[i - 1]
      invariant forall j: int {:trigger b[j]} {:trigger c[m, j]} :: 0 <= j < n ==> j >= m ==> m > 0 ==> c[m, j] == b[j] - b[m - 1]
      invariant forall i: int, j: int {:trigger c[i, j]} :: 0 <= i < m && 0 <= j < a.Length ==> j >= i ==> i == 0 ==> c[i, j] == b[j]
      invariant forall j: int {:trigger b[j]} {:trigger c[m, j]} :: 0 <= j < n ==> j >= m ==> m == 0 ==> c[m, j] == b[j]
      decreases a.Length - n
      modifies c
    {
      if n < m {
        c[m, n] := 0;
      } else {
        if m > 0 {
          c[m, n] := b[n] - b[m - 1];
        } else {
          c[m, n] := b[n];
        }
      }
      n := n + 1;
    }
    m := m + 1;
  }
}

method Mult(x: int, y: int) returns (r: int)
  requires x >= 0 && y >= 0
  ensures r == x * y
  decreases x
{
  if x == 0 {
    r := 0;
  } else {
    assert x - 1 >= 0 && y >= 0 && (x - 1) * y + y == x * y;
    var z := Mult(x - 1, y);
    assert z + y == x * y;
    r := z + y;
    assert r == x * y;
  }
}


method TestsForFooCount()
{
  // Test case for combination P{1}/{1}:
  //   PRE:  CountIndex == 0 || (|a| == b.Length && 1 <= CountIndex <= |a|)
  //   POST: p == Count(CountIndex, a)
  //   POST: p == 0
  //   ENSURES: p == Count(CountIndex, a)
  {
    var CountIndex := 0;
    var a: seq<int> := [];
    var b := new int[0] [];
    var p := FooCount(CountIndex, a, b);
    expect p == 0;
  }

  // Test case for combination P{2}/{2}:
  //   PRE:  CountIndex == 0 || (|a| == b.Length && 1 <= CountIndex <= |a|)
  //   POST: !(CountIndex == 0)
  //   POST: p == if a[CountIndex - 1] % 2 == 0 then 1 + Count(CountIndex - 1, a) else Count(CountIndex - 1, a)
  //   ENSURES: p == Count(CountIndex, a)
  {
    var CountIndex := 1;
    var a: seq<int> := [7];
    var b := new int[1] [10];
    var p := FooCount(CountIndex, a, b);
    expect p == 0;
  }

  // Test case for combination P{2}/{2}/BCountIndex=2:
  //   PRE:  CountIndex == 0 || (|a| == b.Length && 1 <= CountIndex <= |a|)
  //   POST: !(CountIndex == 0)
  //   POST: p == if a[CountIndex - 1] % 2 == 0 then 1 + Count(CountIndex - 1, a) else Count(CountIndex - 1, a)
  //   ENSURES: p == Count(CountIndex, a)
  {
    var CountIndex := 2;
    var a: seq<int> := [11, 12];
    var b := new int[2] [16, 17];
    var p := FooCount(CountIndex, a, b);
    expect p == 1;
  }

  // Test case for combination P{1}/{1}/O|a|=1:
  //   PRE:  CountIndex == 0 || (|a| == b.Length && 1 <= CountIndex <= |a|)
  //   POST: p == Count(CountIndex, a)
  //   POST: p == 0
  //   ENSURES: p == Count(CountIndex, a)
  {
    var CountIndex := 0;
    var a: seq<int> := [4];
    var b := new int[0] [];
    var p := FooCount(CountIndex, a, b);
    expect p == 0;
  }

}

method TestsForComputeCount()
{
  // Test case for combination P{1}/{1}:
  //   PRE:  CountIndex == 0 || (|a| == b.Length && 1 <= CountIndex <= |a|)
  //   POST: p == Count(CountIndex, a)
  //   POST: p == 0
  //   ENSURES: p == Count(CountIndex, a)
  {
    var CountIndex := 0;
    var a: seq<int> := [];
    var b := new int[0] [];
    var p := ComputeCount(CountIndex, a, b);
    expect p == 0;
  }

  // Test case for combination P{2}/{2}:
  //   PRE:  CountIndex == 0 || (|a| == b.Length && 1 <= CountIndex <= |a|)
  //   POST: !(CountIndex == 0)
  //   POST: p == if a[CountIndex - 1] % 2 == 0 then 1 + Count(CountIndex - 1, a) else Count(CountIndex - 1, a)
  //   ENSURES: p == Count(CountIndex, a)
  {
    var CountIndex := 1;
    var a: seq<int> := [7];
    var b := new int[1] [10];
    var p := ComputeCount(CountIndex, a, b);
    expect p == 0;
  }

  // Test case for combination P{2}/{2}/BCountIndex=2:
  //   PRE:  CountIndex == 0 || (|a| == b.Length && 1 <= CountIndex <= |a|)
  //   POST: !(CountIndex == 0)
  //   POST: p == if a[CountIndex - 1] % 2 == 0 then 1 + Count(CountIndex - 1, a) else Count(CountIndex - 1, a)
  //   ENSURES: p == Count(CountIndex, a)
  {
    var CountIndex := 2;
    var a: seq<int> := [11, 12];
    var b := new int[2] [16, 17];
    var p := ComputeCount(CountIndex, a, b);
    expect p == 1;
  }

  // Test case for combination P{1}/{1}/O|a|=1:
  //   PRE:  CountIndex == 0 || (|a| == b.Length && 1 <= CountIndex <= |a|)
  //   POST: p == Count(CountIndex, a)
  //   POST: p == 0
  //   ENSURES: p == Count(CountIndex, a)
  {
    var CountIndex := 0;
    var a: seq<int> := [4];
    var b := new int[0] [];
    var p := ComputeCount(CountIndex, a, b);
    expect p == 0;
  }

}

method TestsForPreCompute()
{
  // Test case for combination {2}:
  //   PRE:  a.Length == b.Length
  //   POST: !(b.Length == 0)
  //   POST: a.Length == b.Length
  //   POST: 1 <= b.Length
  //   POST: b.Length <= a.Length
  //   POST: forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..])
  //   ENSURES: (b.Length == 0 || (a.Length == b.Length && 1 <= b.Length <= a.Length)) && forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..])
  {
    var a := new int[1] [7];
    var b := new int[1] [9];
    var p := PreCompute(a, b);
    expect !(b.Length == 0);
    expect a.Length == b.Length;
    expect 1 <= b.Length;
    expect b.Length <= a.Length;
    expect forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..]);
  }

  // Test case for combination {2}/Q|a|>=2:
  //   PRE:  a.Length == b.Length
  //   POST: !(b.Length == 0)
  //   POST: a.Length == b.Length
  //   POST: 1 <= b.Length
  //   POST: b.Length <= a.Length
  //   POST: forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..])
  //   ENSURES: (b.Length == 0 || (a.Length == b.Length && 1 <= b.Length <= a.Length)) && forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..])
  {
    var a := new int[2] [14, 15];
    var b := new int[2] [19, 20];
    var p := PreCompute(a, b);
    expect !(b.Length == 0);
    expect a.Length == b.Length;
    expect 1 <= b.Length;
    expect b.Length <= a.Length;
    expect forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..]);
  }

  // Test case for combination {2}/Bp=1:
  //   PRE:  a.Length == b.Length
  //   POST: !(b.Length == 0)
  //   POST: a.Length == b.Length
  //   POST: 1 <= b.Length
  //   POST: b.Length <= a.Length
  //   POST: forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..])
  //   ENSURES: (b.Length == 0 || (a.Length == b.Length && 1 <= b.Length <= a.Length)) && forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..])
  {
    var a := new int[1] [11];
    var b := new int[1] [8];
    var p := PreCompute(a, b);
    expect !(b.Length == 0);
    expect a.Length == b.Length;
    expect 1 <= b.Length;
    expect b.Length <= a.Length;
    expect forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..]);
  }

  // Test case for combination {2}/Op>=2:
  //   PRE:  a.Length == b.Length
  //   POST: !(b.Length == 0)
  //   POST: a.Length == b.Length
  //   POST: 1 <= b.Length
  //   POST: b.Length <= a.Length
  //   POST: forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..])
  //   ENSURES: (b.Length == 0 || (a.Length == b.Length && 1 <= b.Length <= a.Length)) && forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..])
  {
    var a := new int[1] [12];
    var b := new int[1] [6];
    var p := PreCompute(a, b);
    expect !(b.Length == 0);
    expect a.Length == b.Length;
    expect 1 <= b.Length;
    expect b.Length <= a.Length;
    expect forall p: int :: p == Count(b.Length, a[..]) ==> p == Count(b.Length, a[..]);
  }

}

method TestsForMult()
{
  // Test case for combination {1}:
  //   PRE:  x >= 0 && y >= 0
  //   POST: r == x * y
  //   ENSURES: r == x * y
  {
    var x := 0;
    var y := 0;
    var r := Mult(x, y);
    expect r == 0;
  }

  // Test case for combination {1}/Bx=1:
  //   PRE:  x >= 0 && y >= 0
  //   POST: r == x * y
  //   ENSURES: r == x * y
  {
    var x := 1;
    var y := 0;
    var r := Mult(x, y);
    expect r == 0;
  }

  // Test case for combination {1}/By=1:
  //   PRE:  x >= 0 && y >= 0
  //   POST: r == x * y
  //   ENSURES: r == x * y
  {
    var x := 0;
    var y := 1;
    var r := Mult(x, y);
    expect r == 0;
  }

  // Test case for combination {1}/Or>0:
  //   PRE:  x >= 0 && y >= 0
  //   POST: r == x * y
  //   ENSURES: r == x * y
  {
    var x := 1;
    var y := 7;
    var r := Mult(x, y);
    expect r == 7;
  }

}

method Main()
{
  TestsForFooCount();
  print "TestsForFooCount: all non-failing tests passed!\n";
  TestsForComputeCount();
  print "TestsForComputeCount: all non-failing tests passed!\n";
  TestsForPreCompute();
  print "TestsForPreCompute: all non-failing tests passed!\n";
  TestsForMult();
  print "TestsForMult: all non-failing tests passed!\n";
}
