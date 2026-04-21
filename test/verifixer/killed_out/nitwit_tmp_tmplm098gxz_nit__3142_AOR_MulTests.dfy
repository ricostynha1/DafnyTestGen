// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\nitwit_tmp_tmplm098gxz_nit__3142_AOR_Mul.dfy
// Method: nit_increment
// Generated: 2026-04-08 16:20:39

// nitwit_tmp_tmplm098gxz_nit.dfy

predicate valid_base(b: nat)
  decreases b
{
  b >= 2
}

predicate nitness(b: nat, n: nat)
  requires valid_base(b)
  decreases b, n
{
  0 <= n < b
}

method nit_increment(b: nat, n: nat)
    returns (sum: nat, carry: nat)
  requires valid_base(b)
  requires nitness(b, n)
  ensures nitness(b, sum)
  ensures nitness(b, carry)
  decreases b, n
{
  sum := (n + 1) % b;
  carry := (n + 1) * b;
}

predicate is_max_nit(b: nat, q: nat)
  decreases b, q
{
  q == b - 1
}

method max_nit(b: nat) returns (nmax: nat)
  requires valid_base(b)
  ensures nitness(b, nmax)
  ensures is_max_nit(b, nmax)
  decreases b
{
  nmax := b - 1;
}

method nit_flip(b: nat, n: nat) returns (nf: nat)
  requires valid_base(b)
  requires nitness(b, n)
  ensures nitness(b, nf)
  decreases b, n
{
  var mn: nat := max_nit(b);
  assert 0 < n < b ==> n <= b - 1;
  assert 0 == n ==> n <= b - 1;
  assert n <= b - 1;
  assert mn == b - 1;
  assert 0 <= n <= mn;
  nf := mn - n;
}

method nit_add(b: nat, x: nat, y: nat)
    returns (z: nat, carry: nat)
  requires valid_base(b)
  requires nitness(b, x)
  requires nitness(b, y)
  ensures nitness(b, z)
  ensures nitness(b, carry)
  ensures carry == 0 || carry == 1
  decreases b, x, y
{
  z := (x + y) % b;
  carry := (x + y) / b;
  assert x + y < b + b;
  assert (x + y) / b < (b + b) / b;
  assert (x + y) / b < 2;
  assert carry < 2;
  assert carry == 0 || carry == 1;
}

method nit_add_three(b: nat, c: nat, x: nat, y: nat)
    returns (z: nat, carry: nat)
  requires valid_base(b)
  requires c == 0 || c == 1
  requires nitness(b, x)
  requires nitness(b, y)
  ensures nitness(b, z)
  ensures nitness(b, carry)
  ensures carry == 0 || carry == 1
  decreases b, c, x, y
{
  if c == 0 {
    z, carry := nit_add(b, x, y);
  } else {
    z := (x + y + 1) % b;
    carry := (x + y + 1) / b;
    assert 0 <= b - 1;
    assert 0 <= x < b;
    assert 0 == x || 0 < x;
    assert 0 < x ==> x <= b - 1;
    assert 0 <= x <= b - 1;
    assert 0 <= y < b;
    assert 0 == y || 0 < y;
    assert 0 <= b - 1;
    assert 0 < y ==> y <= b - 1;
    assert 0 <= y <= b - 1;
    assert x + y <= b - 1 + b - 1;
    assert x + y <= 2 * b - 2;
    assert x + y + 1 <= 2 * b - 2 + 1;
    assert x + y + 1 <= 2 * b - 1;
    assert 2 * b - 1 < 2 * b;
    assert x + y + 1 < 2 * b;
    assert (x + y + 1) / b < 2;
    assert (x + y + 1) / b == 0 || (x + y + 1) / b == 1;
  }
}

predicate bibble(b: nat, a: seq<nat>)
  decreases b, a
{
  valid_base(b) &&
  |a| == 4 &&
  forall n: nat {:trigger nitness(b, n)} {:trigger n in a} :: 
    n in a ==>
      nitness(b, n)
}

method bibble_add(b: nat, p: seq<nat>, q: seq<nat>)
    returns (r: seq<nat>)
  requires valid_base(b)
  requires bibble(b, p)
  requires bibble(b, q)
  ensures bibble(b, r)
  decreases b, p, q
{
  var z3, c3 := nit_add(b, p[3], q[3]);
  var z2, c2 := nit_add_three(b, c3, p[2], q[2]);
  var z1, c1 := nit_add_three(b, c2, p[1], q[1]);
  var z0, c0 := nit_add_three(b, c1, p[0], q[0]);
  r := [z0, z1, z2, z3];
}

method bibble_increment(b: nat, p: seq<nat>) returns (r: seq<nat>)
  requires valid_base(b)
  requires bibble(b, p)
  ensures bibble(b, r)
  decreases b, p
{
  var q: seq<nat> := [0, 0, 0, 1];
  assert bibble(b, q);
  r := bibble_add(b, p, q);
}

method bibble_flip(b: nat, p: seq<nat>) returns (fp: seq<nat>)
  requires valid_base(b)
  requires bibble(b, p)
  ensures bibble(b, fp)
  decreases b, p
{
  var n0 := nit_flip(b, p[0]);
  var n1 := nit_flip(b, p[1]);
  var n2 := nit_flip(b, p[2]);
  var n3 := nit_flip(b, p[3]);
  fp := [n0, n1, n2, n3];
}

method n_complement(b: nat, p: seq<nat>) returns (com: seq<nat>)
  requires valid_base(b)
  requires bibble(b, p)
  ensures bibble(b, com)
  decreases b, p
{
  var fp := bibble_flip(b, p);
  var fpi := bibble_increment(b, fp);
  com := fpi;
}

method OriginalMain()
{
  var b := 3;
  var bibble1 := [2, 1, 0, 2];
  var complement := n_complement(b, bibble1);
  var bibble_sum := bibble_add(b, bibble1, complement);
  print bibble1, " + ", complement, " = ", bibble_sum, " (should be [0, 0, 0, 0])\n";
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  valid_base(b)
  //   POST: nitness(b, nmax)
  //   POST: is_max_nit(b, nmax)
  //   ENSURES: nitness(b, nmax)
  //   ENSURES: is_max_nit(b, nmax)
  {
    var b := 2;
    var nmax := max_nit(b);
    expect nmax == 1;
  }

  // Test case for combination {1}/Bb=3:
  //   PRE:  valid_base(b)
  //   POST: nitness(b, nmax)
  //   POST: is_max_nit(b, nmax)
  //   ENSURES: nitness(b, nmax)
  //   ENSURES: is_max_nit(b, nmax)
  {
    var b := 3;
    var nmax := max_nit(b);
    expect nmax == 2;
  }

  // Test case for combination {1}/Onmax>=2:
  //   PRE:  valid_base(b)
  //   POST: nitness(b, nmax)
  //   POST: is_max_nit(b, nmax)
  //   ENSURES: nitness(b, nmax)
  //   ENSURES: is_max_nit(b, nmax)
  {
    var b := 4;
    var nmax := max_nit(b);
    expect nmax == 3;
  }

  // Test case for combination {1}:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, nf)
  //   ENSURES: nitness(b, nf)
  {
    var b := 2;
    var n := 0;
    var nf := nit_flip(b, n);
    expect nf == 1;
    expect nitness(b, nf);
  }

  // Test case for combination {1}/Bb=2,n=1:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, nf)
  //   ENSURES: nitness(b, nf)
  {
    var b := 2;
    var n := 1;
    var nf := nit_flip(b, n);
    expect nf == 0;
    expect nitness(b, nf);
  }

  // Test case for combination {1}/Bb=3,n=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, nf)
  //   ENSURES: nitness(b, nf)
  {
    var b := 3;
    var n := 0;
    var nf := nit_flip(b, n);
    expect nf == 2;
    expect nitness(b, nf);
  }

  // Test case for combination {1}/Bb=3,n=1:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, nf)
  //   ENSURES: nitness(b, nf)
  {
    var b := 3;
    var n := 1;
    var nf := nit_flip(b, n);
    expect nf == 1;
    expect nitness(b, nf);
  }

  // Test case for combination {1}/Onf>=2:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, nf)
  //   ENSURES: nitness(b, nf)
  {
    var b := 4;
    var n := 0;
    var nf := nit_flip(b, n);
    expect nf == 3;
    expect nitness(b, nf);
  }

  // Test case for combination {1}/Onf=1:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, nf)
  //   ENSURES: nitness(b, nf)
  {
    var b := 3;
    var n := 2;
    var nf := nit_flip(b, n);
    expect nf == 0;
  }

  // Test case for combination {1}/Onf=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, nf)
  //   ENSURES: nitness(b, nf)
  {
    var b := 5;
    var n := 1;
    var nf := nit_flip(b, n);
    expect nf == 3;
  }

  // Test case for combination {1}:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 2;
    var x := 0;
    var y := 0;
    var z, carry := nit_add(b, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0;
    expect !(carry == 1);
  }

  // Test case for combination {1}/Bb=2,x=0,y=1:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 2;
    var x := 0;
    var y := 1;
    var z, carry := nit_add(b, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0;
    expect !(carry == 1);
  }

  // Test case for combination {1}/Bb=2,x=1,y=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 2;
    var x := 1;
    var y := 0;
    var z, carry := nit_add(b, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0;
    expect !(carry == 1);
  }

  // Test case for combination {1}/Oz>=2:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 3;
    var x := 0;
    var y := 0;
    var z, carry := nit_add(b, x, y);
    expect z == 0;
    expect carry == 0;
  }

  // Test case for combination {1}/Oz=1:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 2;
    var x := 1;
    var y := 1;
    var z, carry := nit_add(b, x, y);
    expect z == 0;
    expect carry == 1;
  }

  // Test case for combination {1}/Oz=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 4;
    var x := 0;
    var y := 0;
    var z, carry := nit_add(b, x, y);
    expect z == 0;
    expect carry == 0;
  }

  // Test case for combination {1}/Ocarry=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 3;
    var x := 2;
    var y := 0;
    var z, carry := nit_add(b, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0;
    expect !(carry == 1);
  }

  // Test case for combination P{1}/{1}:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 2;
    var c := 0;
    var x := 0;
    var y := 0;
    var z, carry := nit_add_three(b, c, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0;
    expect !(carry == 1);
  }

  // Test case for combination P{2}/{1}:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 2;
    var c := 1;
    var x := 0;
    var y := 0;
    var z, carry := nit_add_three(b, c, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0;
    expect !(carry == 1);
  }

  // Test case for combination P{1}/{1}/Oz>=2:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 3;
    var c := 0;
    var x := 0;
    var y := 0;
    var z, carry := nit_add_three(b, c, x, y);
    expect z == 0;
    expect carry == 0;
  }

  // Test case for combination P{1}/{1}/Oz=1:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 2;
    var c := 0;
    var x := 1;
    var y := 1;
    var z, carry := nit_add_three(b, c, x, y);
    expect z == 0;
    expect carry == 1;
  }

  // Test case for combination P{1}/{1}/Oz=0:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 4;
    var c := 0;
    var x := 0;
    var y := 0;
    var z, carry := nit_add_three(b, c, x, y);
    expect z == 0;
    expect carry == 0;
  }

  // Test case for combination P{1}/{1}/Ocarry=0:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 3;
    var c := 0;
    var x := 2;
    var y := 0;
    var z, carry := nit_add_three(b, c, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0;
    expect !(carry == 1);
  }

  // Test case for combination P{2}/{1}/Oz>=2:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 3;
    var c := 1;
    var x := 0;
    var y := 0;
    var z, carry := nit_add_three(b, c, x, y);
    expect z == 1;
    expect carry == 0;
  }

  // Test case for combination P{2}/{1}/Oz=1:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 2;
    var c := 1;
    var x := 1;
    var y := 1;
    var z, carry := nit_add_three(b, c, x, y);
    expect z == 1;
    expect carry == 1;
  }

  // Test case for combination P{2}/{1}/Oz=0:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 4;
    var c := 1;
    var x := 0;
    var y := 0;
    var z, carry := nit_add_three(b, c, x, y);
    expect z == 1;
    expect carry == 0;
  }

  // Test case for combination {1}:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   PRE:  bibble(b, q)
  //   POST: bibble(b, r)
  //   ENSURES: bibble(b, r)
  {
    var b := 2;
    var p: seq<nat> := [1, 1, 1, 1];
    var q: seq<nat> := [0, 0, 1, 0];
    var r := bibble_add(b, p, q);
    expect r == [0, 0, 0, 1];
    expect bibble(b, r);
  }

  // Test case for combination {1}/O|r|>=3:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   PRE:  bibble(b, q)
  //   POST: bibble(b, r)
  //   ENSURES: bibble(b, r)
  {
    var b := 3;
    var p: seq<nat> := [2, 1, 1, 2];
    var q: seq<nat> := [1, 0, 0, 2];
    var r := bibble_add(b, p, q);
    expect r == [0, 1, 2, 1];
    expect bibble(b, r);
  }

  // Test case for combination {1}/O|r|>=2:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   PRE:  bibble(b, q)
  //   POST: bibble(b, r)
  //   ENSURES: bibble(b, r)
  {
    var b := 4;
    var p: seq<nat> := [3, 1, 1, 1];
    var q: seq<nat> := [2, 0, 1, 0];
    var r := bibble_add(b, p, q);
    expect r == [1, 1, 2, 1];
    expect bibble(b, r);
  }

  // Test case for combination {1}:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST: bibble(b, r)
  //   ENSURES: bibble(b, r)
  {
    var b := 2;
    var p: seq<nat> := [1, 1, 1, 1];
    var r := bibble_increment(b, p);
    expect r == [0, 0, 0, 0];
    expect bibble(b, r);
  }

  // Test case for combination {1}/O|r|>=3:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST: bibble(b, r)
  //   ENSURES: bibble(b, r)
  {
    var b := 3;
    var p: seq<nat> := [2, 1, 1, 2];
    var r := bibble_increment(b, p);
    expect r == [2, 1, 2, 0];
    expect bibble(b, r);
  }

  // Test case for combination {1}/O|r|>=2:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST: bibble(b, r)
  //   ENSURES: bibble(b, r)
  {
    var b := 4;
    var p: seq<nat> := [3, 1, 1, 1];
    var r := bibble_increment(b, p);
    expect r == [3, 1, 1, 2];
    expect bibble(b, r);
  }

  // Test case for combination {1}:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST: bibble(b, fp)
  //   ENSURES: bibble(b, fp)
  {
    var b := 2;
    var p: seq<nat> := [1, 1, 1, 1];
    var fp := bibble_flip(b, p);
    expect fp == [0, 0, 0, 0];
    expect bibble(b, fp);
  }

  // Test case for combination {1}/O|fp|>=3:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST: bibble(b, fp)
  //   ENSURES: bibble(b, fp)
  {
    var b := 3;
    var p: seq<nat> := [2, 1, 1, 2];
    var fp := bibble_flip(b, p);
    expect fp == [0, 1, 1, 0];
    expect bibble(b, fp);
  }

  // Test case for combination {1}/O|fp|>=2:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST: bibble(b, fp)
  //   ENSURES: bibble(b, fp)
  {
    var b := 4;
    var p: seq<nat> := [3, 1, 1, 1];
    var fp := bibble_flip(b, p);
    expect fp == [0, 2, 2, 2];
    expect bibble(b, fp);
  }

  // Test case for combination {1}:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST: bibble(b, com)
  //   ENSURES: bibble(b, com)
  {
    var b := 2;
    var p: seq<nat> := [1, 1, 1, 1];
    var com := n_complement(b, p);
    expect com == [0, 0, 0, 1];
    expect bibble(b, com);
  }

  // Test case for combination {1}/O|com|>=3:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST: bibble(b, com)
  //   ENSURES: bibble(b, com)
  {
    var b := 3;
    var p: seq<nat> := [2, 1, 1, 2];
    var com := n_complement(b, p);
    expect com == [0, 1, 1, 1];
    expect bibble(b, com);
  }

  // Test case for combination {1}/O|com|>=2:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST: bibble(b, com)
  //   ENSURES: bibble(b, com)
  {
    var b := 4;
    var p: seq<nat> := [3, 1, 1, 1];
    var com := n_complement(b, p);
    expect com == [0, 2, 2, 3];
    expect bibble(b, com);
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, sum)
  //   POST: nitness(b, carry)
  //   ENSURES: nitness(b, sum)
  //   ENSURES: nitness(b, carry)
  {
    var b := 2;
    var n := 0;
    var sum, carry := nit_increment(b, n);
    // expect nitness(b, sum);
    // expect nitness(b, carry);
  }

  // Test case for combination {1}/Bb=2,n=1:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, sum)
  //   POST: nitness(b, carry)
  //   ENSURES: nitness(b, sum)
  //   ENSURES: nitness(b, carry)
  {
    var b := 2;
    var n := 1;
    var sum, carry := nit_increment(b, n);
    // expect nitness(b, sum);
    // expect nitness(b, carry);
  }

  // Test case for combination {1}/Bb=3,n=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, sum)
  //   POST: nitness(b, carry)
  //   ENSURES: nitness(b, sum)
  //   ENSURES: nitness(b, carry)
  {
    var b := 3;
    var n := 0;
    var sum, carry := nit_increment(b, n);
    // expect nitness(b, sum);
    // expect nitness(b, carry);
  }

  // Test case for combination {1}/Bb=3,n=1:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, sum)
  //   POST: nitness(b, carry)
  //   ENSURES: nitness(b, sum)
  //   ENSURES: nitness(b, carry)
  {
    var b := 3;
    var n := 1;
    var sum, carry := nit_increment(b, n);
    // expect nitness(b, sum);
    // expect nitness(b, carry);
  }

  // Test case for combination {1}/Osum>=2:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, sum)
  //   POST: nitness(b, carry)
  //   ENSURES: nitness(b, sum)
  //   ENSURES: nitness(b, carry)
  {
    var b := 4;
    var n := 0;
    var sum, carry := nit_increment(b, n);
    // expect nitness(b, sum);
    // expect nitness(b, carry);
  }

  // Test case for combination {1}/Osum=1:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, sum)
  //   POST: nitness(b, carry)
  //   ENSURES: nitness(b, sum)
  //   ENSURES: nitness(b, carry)
  {
    var b := 3;
    var n := 2;
    var sum, carry := nit_increment(b, n);
    // expect nitness(b, sum);
    // expect nitness(b, carry);
  }

  // Test case for combination {1}/Osum=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, sum)
  //   POST: nitness(b, carry)
  //   ENSURES: nitness(b, sum)
  //   ENSURES: nitness(b, carry)
  {
    var b := 4;
    var n := 2;
    var sum, carry := nit_increment(b, n);
    // expect nitness(b, sum);
    // expect nitness(b, carry);
  }

  // Test case for combination {1}/Ocarry>=2:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, sum)
  //   POST: nitness(b, carry)
  //   ENSURES: nitness(b, sum)
  //   ENSURES: nitness(b, carry)
  {
    var b := 5;
    var n := 0;
    var sum, carry := nit_increment(b, n);
    // expect nitness(b, sum);
    // expect nitness(b, carry);
  }

  // Test case for combination {1}/Ocarry=1:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, sum)
  //   POST: nitness(b, carry)
  //   ENSURES: nitness(b, sum)
  //   ENSURES: nitness(b, carry)
  {
    var b := 4;
    var n := 1;
    var sum, carry := nit_increment(b, n);
    // expect nitness(b, sum);
    // expect nitness(b, carry);
  }

  // Test case for combination {1}/Ocarry=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST: nitness(b, sum)
  //   POST: nitness(b, carry)
  //   ENSURES: nitness(b, sum)
  //   ENSURES: nitness(b, carry)
  {
    var b := 4;
    var n := 3;
    var sum, carry := nit_increment(b, n);
    // expect nitness(b, sum);
    // expect nitness(b, carry);
  }

  // Test case for combination P{2}/{1}/Ocarry=0:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST: nitness(b, z)
  //   POST: nitness(b, carry)
  //   POST: carry == 0
  //   POST: !(carry == 1)
  //   ENSURES: nitness(b, z)
  //   ENSURES: nitness(b, carry)
  //   ENSURES: carry == 0 || carry == 1
  {
    var b := 3;
    var c := 1;
    var x := 2;
    var y := 0;
    var z, carry := nit_add_three(b, c, x, y);
    // expect nitness(b, z);
    // expect nitness(b, carry);
    // expect carry == 0;
    // expect !(carry == 1);
  }

}

method Main()
{
  Passing();
  Failing();
}
