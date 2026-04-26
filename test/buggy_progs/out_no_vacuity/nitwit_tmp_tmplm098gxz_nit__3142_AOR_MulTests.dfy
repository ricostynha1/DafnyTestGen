// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\nitwit_tmp_tmplm098gxz_nit__3142_AOR_Mul.dfy
// Method: nit_increment
// Generated: 2026-04-24 16:53:30

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


method TestsFornit_increment()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, sum)
  //   POST Q2: nitness(b, carry)
  {
    var b := 10;
    var n := 9;
    var sum, carry := nit_increment(b, n);
    // actual runtime state: sum=0, carry=100
    // expect nitness(b, sum); // got true
    // expect nitness(b, carry); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bb=2:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, sum)
  //   POST Q2: nitness(b, carry)
  //   POST Q3: 0 <= carry
  //   POST Q4: carry < b
  {
    var b := 2;
    var n := 1;
    var sum, carry := nit_increment(b, n);
    // actual runtime state: sum=0, carry=4
    // expect sum == 1 || sum == 0 || sum == 0 || sum == 1; // got true
    // expect carry == 1 || carry == 0 || carry == 1 || carry == 0; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bb=3:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, sum)
  //   POST Q2: nitness(b, carry)
  {
    var b := 3;
    var n := 2;
    var sum, carry := nit_increment(b, n);
    // actual runtime state: sum=0, carry=9
    // expect nitness(b, sum); // got true
    // expect nitness(b, carry); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bn=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, sum)
  //   POST Q2: nitness(b, carry)
  {
    var b := 10;
    var n := 0;
    var sum, carry := nit_increment(b, n);
    // actual runtime state: sum=1, carry=10
    // expect nitness(b, sum); // got true
    // expect nitness(b, carry); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bcarry=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, sum)
  //   POST Q2: nitness(b, carry)
  {
    var b := 10;
    var n := 2;
    var sum, carry := nit_increment(b, n);
    // actual runtime state: sum=3, carry=30
    // expect nitness(b, sum); // got true
    // expect nitness(b, carry); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, sum)
  //   POST Q2: nitness(b, carry)
  {
    var b := 10;
    var n := 3;
    var sum, carry := nit_increment(b, n);
    // actual runtime state: sum=4, carry=40
    // expect nitness(b, sum); // got true
    // expect nitness(b, carry); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, sum)
  //   POST Q2: nitness(b, carry)
  {
    var b := 10;
    var n := 8;
    var sum, carry := nit_increment(b, n);
    // actual runtime state: sum=9, carry=90
    // expect nitness(b, sum); // got true
    // expect nitness(b, carry); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, sum)
  //   POST Q2: nitness(b, carry)
  {
    var b := 10;
    var n := 7;
    var sum, carry := nit_increment(b, n);
    // actual runtime state: sum=8, carry=80
    // expect nitness(b, sum); // got true
    // expect nitness(b, carry); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, sum)
  //   POST Q2: nitness(b, carry)
  {
    var b := 10;
    var n := 6;
    var sum, carry := nit_increment(b, n);
    // actual runtime state: sum=7, carry=70
    // expect nitness(b, sum); // got true
    // expect nitness(b, carry); // got false
  }

}

method TestsFormax_nit()
{
  // Test case for combination {1}/Rel:
  //   PRE:  valid_base(b)
  //   POST Q1: nitness(b, nmax)
  //   POST Q2: is_max_nit(b, nmax)
  //   POST Q3: nmax == b - 1
  {
    var b := 10;
    var nmax := max_nit(b);
    expect nmax == 9;
  }

  // Test case for combination {1}/Bb=2:
  //   PRE:  valid_base(b)
  //   POST Q1: nitness(b, nmax)
  //   POST Q2: is_max_nit(b, nmax)
  //   POST Q3: nmax == b - 1
  {
    var b := 2;
    var nmax := max_nit(b);
    expect nmax == 1;
  }

  // Test case for combination {1}/Bb=3:
  //   PRE:  valid_base(b)
  //   POST Q1: nitness(b, nmax)
  //   POST Q2: is_max_nit(b, nmax)
  //   POST Q3: nmax == b - 1
  {
    var b := 3;
    var nmax := max_nit(b);
    expect nmax == 2;
  }

  // Test case for combination {1}/R4:
  //   PRE:  valid_base(b)
  //   POST Q1: nitness(b, nmax)
  //   POST Q2: is_max_nit(b, nmax)
  //   POST Q3: nmax == b - 1
  {
    var b := 9;
    var nmax := max_nit(b);
    expect nmax == 8;
  }

  // Test case for combination {1}/R5:
  //   PRE:  valid_base(b)
  //   POST Q1: nitness(b, nmax)
  //   POST Q2: is_max_nit(b, nmax)
  //   POST Q3: nmax == b - 1
  {
    var b := 8;
    var nmax := max_nit(b);
    expect nmax == 7;
  }

  // Test case for combination {1}/R6:
  //   PRE:  valid_base(b)
  //   POST Q1: nitness(b, nmax)
  //   POST Q2: is_max_nit(b, nmax)
  //   POST Q3: nmax == b - 1
  {
    var b := 7;
    var nmax := max_nit(b);
    expect nmax == 6;
  }

  // Test case for combination {1}/R7:
  //   PRE:  valid_base(b)
  //   POST Q1: nitness(b, nmax)
  //   POST Q2: is_max_nit(b, nmax)
  //   POST Q3: nmax == b - 1
  {
    var b := 6;
    var nmax := max_nit(b);
    expect nmax == 5;
  }

  // Test case for combination {1}/R8:
  //   PRE:  valid_base(b)
  //   POST Q1: nitness(b, nmax)
  //   POST Q2: is_max_nit(b, nmax)
  //   POST Q3: nmax == b - 1
  {
    var b := 5;
    var nmax := max_nit(b);
    expect nmax == 4;
  }

  // Test case for combination {1}/R9:
  //   PRE:  valid_base(b)
  //   POST Q1: nitness(b, nmax)
  //   POST Q2: is_max_nit(b, nmax)
  //   POST Q3: nmax == b - 1
  {
    var b := 4;
    var nmax := max_nit(b);
    expect nmax == 3;
  }

}

method TestsFornit_flip()
{
  // Test case for combination {1}/Rel:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, nf)
  {
    var b := 10;
    var n := 9;
    var nf := nit_flip(b, n);
    expect nitness(b, nf);
    expect nf == 0; // observed from implementation
  }

  // Test case for combination {1}/Bb=2:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, nf)
  //   POST Q2: nf < b
  {
    var b := 2;
    var n := 1;
    var nf := nit_flip(b, n);
    expect nf == 1 || nf == 0;
    expect nf == 0; // observed from implementation
  }

  // Test case for combination {1}/Bb=3:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, nf)
  //   POST Q2: nf < b
  {
    var b := 3;
    var n := 2;
    var nf := nit_flip(b, n);
    expect nf == 2 || nf == 0 || nf == 1;
    expect nf == 0; // observed from implementation
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, nf)
  {
    var b := 10;
    var n := 0;
    var nf := nit_flip(b, n);
    expect nitness(b, nf);
    expect nf == 9; // observed from implementation
  }

  // Test case for combination {1}/Bnf=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, nf)
  {
    var b := 9;
    var n := 2;
    var nf := nit_flip(b, n);
    expect nitness(b, nf);
    expect nf == 6; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, nf)
  {
    var b := 8;
    var n := 2;
    var nf := nit_flip(b, n);
    expect nitness(b, nf);
    expect nf == 5; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, nf)
  {
    var b := 10;
    var n := 8;
    var nf := nit_flip(b, n);
    expect nitness(b, nf);
    expect nf == 1; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, nf)
  {
    var b := 10;
    var n := 7;
    var nf := nit_flip(b, n);
    expect nitness(b, nf);
    expect nf == 2; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, n)
  //   POST Q1: nitness(b, nf)
  {
    var b := 10;
    var n := 6;
    var nf := nit_flip(b, n);
    expect nitness(b, nf);
    expect nf == 3; // observed from implementation
  }

}

method TestsFornit_add()
{
  // Test case for combination {1}/Rel:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST Q1: nitness(b, z)
  //   POST Q2: nitness(b, carry)
  //   POST Q3: carry == 0 || carry == 1
  {
    var b := 10;
    var x := 9;
    var y := 9;
    var z, carry := nit_add(b, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0 || carry == 1;
    expect z == 8; // observed from implementation
    expect carry == 1; // observed from implementation
  }

  // Test case for combination {1}/Bb=2:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST Q1: nitness(b, z)
  //   POST Q2: nitness(b, carry)
  //   POST Q3: carry != 0
  //   POST Q4: carry == 1
  //   POST Q5: carry == 0
  {
    var b := 2;
    var x := 1;
    var y := 1;
    var z, carry := nit_add(b, x, y);
    expect z == 1 || z == 0 || z == 0 || z == 1;
    expect carry == 0 || carry == 0 || carry == 1 || carry == 1;
    expect z == 0; // observed from implementation
    expect carry == 1; // observed from implementation
  }

  // Test case for combination {1}/Bb=3:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST Q1: nitness(b, z)
  //   POST Q2: nitness(b, carry)
  //   POST Q3: carry == 0 || carry == 1
  {
    var b := 3;
    var x := 2;
    var y := 2;
    var z, carry := nit_add(b, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0 || carry == 1;
    expect z == 1; // observed from implementation
    expect carry == 1; // observed from implementation
  }

  // Test case for combination {1}/Bx=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST Q1: nitness(b, z)
  //   POST Q2: nitness(b, carry)
  //   POST Q3: carry == 0 || carry == 1
  {
    var b := 10;
    var x := 0;
    var y := 9;
    var z, carry := nit_add(b, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0 || carry == 1;
    expect z == 9; // observed from implementation
    expect carry == 0; // observed from implementation
  }

  // Test case for combination {1}/By=0:
  //   PRE:  valid_base(b)
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST Q1: nitness(b, z)
  //   POST Q2: nitness(b, carry)
  //   POST Q3: carry == 0 || carry == 1
  {
    var b := 10;
    var x := 9;
    var y := 0;
    var z, carry := nit_add(b, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0 || carry == 1;
    expect z == 9; // observed from implementation
    expect carry == 0; // observed from implementation
  }

}

method TestsFornit_add_three()
{
  // Test case for combination P{1}/{1}/Rel:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST Q1: nitness(b, z)
  //   POST Q2: nitness(b, carry)
  //   POST Q3: carry == 0 || carry == 1
  {
    var b := 10;
    var c := 0;
    var x := 9;
    var y := 9;
    var z, carry := nit_add_three(b, c, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0 || carry == 1;
    expect z == 8; // observed from implementation
    expect carry == 1; // observed from implementation
  }

  // Test case for combination P{2}/{1}/Rel:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST Q1: nitness(b, z)
  //   POST Q2: nitness(b, carry)
  //   POST Q3: carry == 0 || carry == 1
  {
    var b := 10;
    var c := 1;
    var x := 9;
    var y := 9;
    var z, carry := nit_add_three(b, c, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0 || carry == 1;
    expect z == 9; // observed from implementation
    expect carry == 1; // observed from implementation
  }

  // Test case for combination P{1}/{1}/Bb=2:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST Q1: nitness(b, z)
  //   POST Q2: nitness(b, carry)
  //   POST Q3: carry != 0
  //   POST Q4: carry == 1
  //   POST Q5: carry == 0
  {
    var b := 2;
    var c := 0;
    var x := 1;
    var y := 1;
    var z, carry := nit_add_three(b, c, x, y);
    expect z == 1 || z == 0 || z == 0 || z == 1;
    expect carry == 0 || carry == 0 || carry == 1 || carry == 1;
    expect z == 0; // observed from implementation
    expect carry == 1; // observed from implementation
  }

  // Test case for combination P{1}/{1}/Bb=3:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST Q1: nitness(b, z)
  //   POST Q2: nitness(b, carry)
  //   POST Q3: carry == 0 || carry == 1
  {
    var b := 3;
    var c := 0;
    var x := 2;
    var y := 2;
    var z, carry := nit_add_three(b, c, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0 || carry == 1;
    expect z == 1; // observed from implementation
    expect carry == 1; // observed from implementation
  }

  // Test case for combination P{1}/{1}/Bx=0:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST Q1: nitness(b, z)
  //   POST Q2: nitness(b, carry)
  //   POST Q3: carry == 0 || carry == 1
  {
    var b := 10;
    var c := 0;
    var x := 0;
    var y := 9;
    var z, carry := nit_add_three(b, c, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0 || carry == 1;
    expect z == 9; // observed from implementation
    expect carry == 0; // observed from implementation
  }

  // Test case for combination P{1}/{1}/By=0:
  //   PRE:  valid_base(b)
  //   PRE:  c == 0 || c == 1
  //   PRE:  nitness(b, x)
  //   PRE:  nitness(b, y)
  //   POST Q1: nitness(b, z)
  //   POST Q2: nitness(b, carry)
  //   POST Q3: carry == 0 || carry == 1
  {
    var b := 10;
    var c := 0;
    var x := 9;
    var y := 0;
    var z, carry := nit_add_three(b, c, x, y);
    expect nitness(b, z);
    expect nitness(b, carry);
    expect carry == 0 || carry == 1;
    expect z == 9; // observed from implementation
    expect carry == 0; // observed from implementation
  }

}

method TestsForbibble_add()
{
  // Test case for combination {1}/Rel:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   PRE:  bibble(b, q)
  //   POST Q1: bibble(b, r)
  {
    var b := 9;
    var p: seq<nat> := [7, 5, 8, 8];
    var q: seq<nat> := [5, 6, 8, 8];
    var r := bibble_add(b, p, q);
    expect bibble(b, r);
    expect r == [4, 3, 8, 7]; // observed from implementation
  }

  // Test case for combination {1}/Bb=2:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   PRE:  bibble(b, q)
  //   POST Q1: bibble(b, r)
  {
    var b := 2;
    var p: seq<nat> := [1, 1, 1, 0];
    var q: seq<nat> := [1, 1, 1, 1];
    var r := bibble_add(b, p, q);
    expect bibble(b, r);
    expect r == [1, 1, 0, 1]; // observed from implementation
  }

  // Test case for combination {1}/Bb=3:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   PRE:  bibble(b, q)
  //   POST Q1: bibble(b, r)
  {
    var b := 3;
    var p: seq<nat> := [2, 2, 2, 0];
    var q: seq<nat> := [2, 2, 2, 2];
    var r := bibble_add(b, p, q);
    expect bibble(b, r);
    expect r == [2, 2, 1, 2]; // observed from implementation
  }

  // Test case for combination {1}/R3:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   PRE:  bibble(b, q)
  //   POST Q1: bibble(b, r)
  {
    var b := 4;
    var p: seq<nat> := [3, 3, 3, 1];
    var q: seq<nat> := [3, 3, 3, 3];
    var r := bibble_add(b, p, q);
    expect bibble(b, r);
    expect r == [3, 3, 3, 0]; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   PRE:  bibble(b, q)
  //   POST Q1: bibble(b, r)
  {
    var b := 5;
    var p: seq<nat> := [4, 4, 4, 2];
    var q: seq<nat> := [4, 4, 4, 4];
    var r := bibble_add(b, p, q);
    expect bibble(b, r);
    expect r == [4, 4, 4, 1]; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   PRE:  bibble(b, q)
  //   POST Q1: bibble(b, r)
  {
    var b := 10;
    var p: seq<nat> := [5, 7, 2, 7];
    var q: seq<nat> := [9, 2, 2, 0];
    var r := bibble_add(b, p, q);
    expect bibble(b, r);
    expect r == [4, 9, 4, 7]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   PRE:  bibble(b, q)
  //   POST Q1: bibble(b, r)
  {
    var b := 9;
    var p: seq<nat> := [3, 2, 8, 4];
    var q: seq<nat> := [5, 8, 8, 7];
    var r := bibble_add(b, p, q);
    expect bibble(b, r);
    expect r == [0, 2, 8, 2]; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   PRE:  bibble(b, q)
  //   POST Q1: bibble(b, r)
  {
    var b := 6;
    var p: seq<nat> := [5, 5, 5, 0];
    var q: seq<nat> := [2, 5, 2, 5];
    var r := bibble_add(b, p, q);
    expect bibble(b, r);
    expect r == [2, 5, 1, 5]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   PRE:  bibble(b, q)
  //   POST Q1: bibble(b, r)
  {
    var b := 10;
    var p: seq<nat> := [4, 2, 7, 8];
    var q: seq<nat> := [6, 6, 7, 0];
    var r := bibble_add(b, p, q);
    expect bibble(b, r);
    expect r == [0, 9, 4, 8]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   PRE:  bibble(b, q)
  //   POST Q1: bibble(b, r)
  {
    var b := 10;
    var p: seq<nat> := [5, 6, 8, 9];
    var q: seq<nat> := [7, 7, 7, 6];
    var r := bibble_add(b, p, q);
    expect bibble(b, r);
    expect r == [3, 4, 6, 5]; // observed from implementation
  }

}

method TestsForbibble_increment()
{
  // Test case for combination {1}/Rel:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, r)
  {
    var b := 7;
    var p: seq<nat> := [5, 6, 4, 6];
    var r := bibble_increment(b, p);
    expect bibble(b, r);
    expect r == [5, 6, 5, 0]; // observed from implementation
  }

  // Test case for combination {1}/Bb=2:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, r)
  {
    var b := 2;
    var p: seq<nat> := [1, 1, 1, 0];
    var r := bibble_increment(b, p);
    expect bibble(b, r);
    expect r == [1, 1, 1, 1]; // observed from implementation
  }

  // Test case for combination {1}/Bb=3:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, r)
  {
    var b := 3;
    var p: seq<nat> := [2, 2, 2, 1];
    var r := bibble_increment(b, p);
    expect bibble(b, r);
    expect r == [2, 2, 2, 2]; // observed from implementation
  }

  // Test case for combination {1}/R3:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, r)
  {
    var b := 10;
    var p: seq<nat> := [4, 5, 7, 0];
    var r := bibble_increment(b, p);
    expect bibble(b, r);
    expect r == [4, 5, 7, 1]; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, r)
  {
    var b := 7;
    var p: seq<nat> := [5, 6, 4, 2];
    var r := bibble_increment(b, p);
    expect bibble(b, r);
    expect r == [5, 6, 4, 3]; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, r)
  {
    var b := 7;
    var p: seq<nat> := [6, 5, 3, 3];
    var r := bibble_increment(b, p);
    expect bibble(b, r);
    expect r == [6, 5, 3, 4]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, r)
  {
    var b := 7;
    var p: seq<nat> := [5, 4, 6, 0];
    var r := bibble_increment(b, p);
    expect bibble(b, r);
    expect r == [5, 4, 6, 1]; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, r)
  {
    var b := 7;
    var p: seq<nat> := [5, 5, 6, 4];
    var r := bibble_increment(b, p);
    expect bibble(b, r);
    expect r == [5, 5, 6, 5]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, r)
  {
    var b := 7;
    var p: seq<nat> := [5, 6, 3, 1];
    var r := bibble_increment(b, p);
    expect bibble(b, r);
    expect r == [5, 6, 3, 2]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, r)
  {
    var b := 9;
    var p: seq<nat> := [5, 8, 3, 1];
    var r := bibble_increment(b, p);
    expect bibble(b, r);
    expect r == [5, 8, 3, 2]; // observed from implementation
  }

}

method TestsForbibble_flip()
{
  // Test case for combination {1}/Rel:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, fp)
  {
    var b := 9;
    var p: seq<nat> := [5, 4, 5, 8];
    var fp := bibble_flip(b, p);
    expect bibble(b, fp);
    expect fp == [3, 4, 3, 0]; // observed from implementation
  }

  // Test case for combination {1}/Bb=2:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, fp)
  {
    var b := 2;
    var p: seq<nat> := [1, 1, 1, 0];
    var fp := bibble_flip(b, p);
    expect bibble(b, fp);
    expect fp == [0, 0, 0, 1]; // observed from implementation
  }

  // Test case for combination {1}/Bb=3:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, fp)
  {
    var b := 3;
    var p: seq<nat> := [2, 2, 2, 1];
    var fp := bibble_flip(b, p);
    expect bibble(b, fp);
    expect fp == [0, 0, 0, 1]; // observed from implementation
  }

  // Test case for combination {1}/R3:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, fp)
  {
    var b := 10;
    var p: seq<nat> := [4, 5, 7, 0];
    var fp := bibble_flip(b, p);
    expect bibble(b, fp);
    expect fp == [5, 4, 2, 9]; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, fp)
  {
    var b := 7;
    var p: seq<nat> := [5, 6, 4, 2];
    var fp := bibble_flip(b, p);
    expect bibble(b, fp);
    expect fp == [1, 0, 2, 4]; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, fp)
  {
    var b := 7;
    var p: seq<nat> := [6, 5, 3, 3];
    var fp := bibble_flip(b, p);
    expect bibble(b, fp);
    expect fp == [0, 1, 3, 3]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, fp)
  {
    var b := 7;
    var p: seq<nat> := [5, 4, 6, 0];
    var fp := bibble_flip(b, p);
    expect bibble(b, fp);
    expect fp == [1, 2, 0, 6]; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, fp)
  {
    var b := 7;
    var p: seq<nat> := [5, 5, 6, 4];
    var fp := bibble_flip(b, p);
    expect bibble(b, fp);
    expect fp == [1, 1, 0, 2]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, fp)
  {
    var b := 7;
    var p: seq<nat> := [5, 6, 3, 1];
    var fp := bibble_flip(b, p);
    expect bibble(b, fp);
    expect fp == [1, 0, 3, 5]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, fp)
  {
    var b := 9;
    var p: seq<nat> := [5, 8, 3, 1];
    var fp := bibble_flip(b, p);
    expect bibble(b, fp);
    expect fp == [3, 0, 5, 7]; // observed from implementation
  }

}

method TestsForn_complement()
{
  // Test case for combination {1}/Rel:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, com)
  {
    var b := 10;
    var p: seq<nat> := [4, 9, 6, 9];
    var com := n_complement(b, p);
    expect bibble(b, com);
    expect com == [5, 0, 3, 1]; // observed from implementation
  }

  // Test case for combination {1}/Bb=2:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, com)
  {
    var b := 2;
    var p: seq<nat> := [1, 1, 1, 0];
    var com := n_complement(b, p);
    expect bibble(b, com);
    expect com == [0, 0, 1, 0]; // observed from implementation
  }

  // Test case for combination {1}/Bb=3:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, com)
  {
    var b := 3;
    var p: seq<nat> := [2, 2, 2, 1];
    var com := n_complement(b, p);
    expect bibble(b, com);
    expect com == [0, 0, 0, 2]; // observed from implementation
  }

  // Test case for combination {1}/R3:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, com)
  {
    var b := 10;
    var p: seq<nat> := [4, 5, 7, 0];
    var com := n_complement(b, p);
    expect bibble(b, com);
    expect com == [5, 4, 3, 0]; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, com)
  {
    var b := 7;
    var p: seq<nat> := [5, 6, 4, 2];
    var com := n_complement(b, p);
    expect bibble(b, com);
    expect com == [1, 0, 2, 5]; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, com)
  {
    var b := 7;
    var p: seq<nat> := [6, 5, 3, 3];
    var com := n_complement(b, p);
    expect bibble(b, com);
    expect com == [0, 1, 3, 4]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, com)
  {
    var b := 7;
    var p: seq<nat> := [5, 4, 6, 0];
    var com := n_complement(b, p);
    expect bibble(b, com);
    expect com == [1, 2, 1, 0]; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, com)
  {
    var b := 7;
    var p: seq<nat> := [5, 5, 6, 4];
    var com := n_complement(b, p);
    expect bibble(b, com);
    expect com == [1, 1, 0, 3]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, com)
  {
    var b := 7;
    var p: seq<nat> := [5, 6, 3, 1];
    var com := n_complement(b, p);
    expect bibble(b, com);
    expect com == [1, 0, 3, 6]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  valid_base(b)
  //   PRE:  bibble(b, p)
  //   POST Q1: bibble(b, com)
  {
    var b := 9;
    var p: seq<nat> := [5, 8, 3, 1];
    var com := n_complement(b, p);
    expect bibble(b, com);
    expect com == [3, 0, 5, 8]; // observed from implementation
  }

}

method Main()
{
  TestsFornit_increment();
  print "TestsFornit_increment: all non-failing tests passed!\n";
  TestsFormax_nit();
  print "TestsFormax_nit: all non-failing tests passed!\n";
  TestsFornit_flip();
  print "TestsFornit_flip: all non-failing tests passed!\n";
  TestsFornit_add();
  print "TestsFornit_add: all non-failing tests passed!\n";
  TestsFornit_add_three();
  print "TestsFornit_add_three: all non-failing tests passed!\n";
  TestsForbibble_add();
  print "TestsForbibble_add: all non-failing tests passed!\n";
  TestsForbibble_increment();
  print "TestsForbibble_increment: all non-failing tests passed!\n";
  TestsForbibble_flip();
  print "TestsForbibble_flip: all non-failing tests passed!\n";
  TestsForn_complement();
  print "TestsForn_complement: all non-failing tests passed!\n";
}
