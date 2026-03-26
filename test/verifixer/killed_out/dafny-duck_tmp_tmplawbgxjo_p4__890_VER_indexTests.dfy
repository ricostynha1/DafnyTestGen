// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-duck_tmp_tmplawbgxjo_p4__890_VER_index.dfy
// Method: single
// Generated: 2026-03-26 14:57:42

// dafny-duck_tmp_tmplawbgxjo_p4.dfy

method single(x: array<int>, y: array<int>) returns (b: array<int>)
  requires x.Length > 0
  requires y.Length > 0
  ensures b[..] == x[..] + y[..]
  decreases x, y
{
  b := new int[x.Length + y.Length];
  var i := 0;
  var index := 0;
  var sumi := x.Length + y.Length;
  while i < x.Length && index < sumi
    invariant 0 <= i <= x.Length
    invariant 0 <= index <= sumi
    invariant b[..index] == x[..i]
    decreases x.Length - i, if i < x.Length then sumi - index else 0 - 1
  {
    b[index] := x[i];
    i := i + 1;
    index := index + 1;
  }
  i := 0;
  while i < y.Length && index < index
    invariant 0 <= i <= y.Length
    invariant 0 <= index <= sumi
    invariant b[..index] == x[..] + y[..i]
    decreases y.Length - i, if i < y.Length then index - index else 0 - 1
  {
    b[index] := y[i];
    i := i + 1;
    index := index + 1;
  }
}

method OriginalMain()
{
  var a := new int[4] [1, 5, 2, 3];
  var b := new int[3] [4, 3, 5];
  var c := new int[7];
  c := single(a, b);
  assert c[..] == [1, 5, 2, 3, 4, 3, 5];
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  x.Length > 0
  //   PRE:  y.Length > 0
  //   POST: b[..] == x[..] + y[..]
  {
    var x := new int[1] [2];
    var y := new int[1] [6];
    var b := single(x, y);
  }

  // Test case for combination {1}:
  //   PRE:  x.Length > 0
  //   PRE:  y.Length > 0
  //   POST: b[..] == x[..] + y[..]
  {
    var x := new int[2] [3, 9];
    var y := new int[2] [6, 10];
    var b := single(x, y);
  }

  // Test case for combination {1}/Bx=3,y=1:
  //   PRE:  x.Length > 0
  //   PRE:  y.Length > 0
  //   POST: b[..] == x[..] + y[..]
  {
    var x := new int[3] [5, 4, 6];
    var y := new int[1] [14];
    var b := single(x, y);
  }

  // Test case for combination {1}/Bx=2,y=3:
  //   PRE:  x.Length > 0
  //   PRE:  y.Length > 0
  //   POST: b[..] == x[..] + y[..]
  {
    var x := new int[2] [5, 4];
    var y := new int[3] [7, 6, 8];
    var b := single(x, y);
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
