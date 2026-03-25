// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Correctness_tmp_tmpwqvg5q_4_HoareLogic_exam.dfy
// Method: GCD1
// Generated: 2026-03-25 22:36:42

// Correctness_tmp_tmpwqvg5q_4_HoareLogic_exam.dfy

function gcd(a: nat, b: nat): nat
  decreases a, b

lemma r1(a: nat)
  ensures gcd(a, 0) == a
  decreases a

lemma r2(a: nat)
  ensures gcd(a, a) == a
  decreases a

lemma r3(a: nat, b: nat)
  ensures gcd(a, b) == gcd(b, a)
  decreases a, b

lemma r4(a: nat, b: nat)
  ensures b > 0 ==> gcd(a, b) == gcd(b, a % b)
  decreases a, b

method GCD1(a: int, b: int) returns (r: int)
  requires a > 0 && b > 0
  ensures gcd(a, b) == r
  decreases b
{
  if a < b {
    r3(a, b);
    r := GCD1(b, a);
  } else if a % b == 0 {
    r4(a, b);
    assert b > 0;
    assert gcd(a, b) == gcd(b, a % b);
    assert a % b == 0;
    assert gcd(a, b) == gcd(b, 0);
    r1(b);
    assert gcd(a, b) == b;
    r := b;
    assert gcd(a, b) == r;
  } else {
    r4(a, b);
    r := GCD1(b, a % b);
    assert gcd(a, b) == r;
  }
  assert gcd(a, b) == r;
}

method GCD2(a: int, b: int) returns (r: int)
  requires a > 0 && b >= 0
  ensures gcd(a, b) == r
  decreases b
{
  r1(a);
  r4(a, b);
  assert (b != 0 || (a > 0 && b >= 0 && gcd(a, b) == a)) && (b < 0 || b == 0 || (b > 0 && a % b >= 0 ==> gcd(a, b) == gcd(b, a % b)));
  assert b != 0 || (a > 0 && b >= 0 && gcd(a, b) == a);
  assert b == 0 ==> a > 0 && b >= 0 && gcd(a, b) == a;
  assert b < 0 || b == 0 || (b > 0 && a % b >= 0 ==> gcd(a, b) == gcd(b, a % b));
  assert b >= 0 && b != 0 ==> b > 0 && a % b >= 0 ==> gcd(a, b) == gcd(b, a % b);
  if b == 0 {
    r1(a);
    assert gcd(a, b) == a;
    r := a;
    assert gcd(a, b) == r;
  } else {
    r4(a, b);
    assert b > 0 && a % b >= 0 ==> gcd(a, b) == gcd(b, a % b);
    r := GCD2(b, a % b);
    assert gcd(a, b) == r;
  }
  assert gcd(a, b) == r;
}


method GeneratedTests_GCD1()
{
  // Test case for combination {1}:
  //   PRE:  a > 0 && b > 0
  //   POST: gcd(a, b) == r
  {
    var a := 1;
    var b := 1;
    var r := GCD1(a, b);
    expect gcd(a, b) == r;
  }

  // Test case for combination {1}:
  //   PRE:  a > 0 && b > 0
  //   POST: gcd(a, b) == r
  {
    var a := 2;
    var b := 2;
    var r := GCD1(a, b);
    expect gcd(a, b) == r;
  }

  // Test case for combination {1}/Ba=1,b=2:
  //   PRE:  a > 0 && b > 0
  //   POST: gcd(a, b) == r
  {
    var a := 1;
    var b := 2;
    var r := GCD1(a, b);
    expect gcd(a, b) == r;
  }

  // Test case for combination {1}/Ba=2,b=1:
  //   PRE:  a > 0 && b > 0
  //   POST: gcd(a, b) == r
  {
    var a := 2;
    var b := 1;
    var r := GCD1(a, b);
    expect gcd(a, b) == r;
  }

}

method GeneratedTests_GCD2()
{
  // Test case for combination {1}:
  //   PRE:  a > 0 && b >= 0
  //   POST: gcd(a, b) == r
  {
    var a := 1;
    var b := 0;
    var r := GCD2(a, b);
    expect gcd(a, b) == r;
  }

  // Test case for combination {1}:
  //   PRE:  a > 0 && b >= 0
  //   POST: gcd(a, b) == r
  {
    var a := 2;
    var b := 1;
    var r := GCD2(a, b);
    expect gcd(a, b) == r;
  }

  // Test case for combination {1}/Ba=1,b=1:
  //   PRE:  a > 0 && b >= 0
  //   POST: gcd(a, b) == r
  {
    var a := 1;
    var b := 1;
    var r := GCD2(a, b);
    expect gcd(a, b) == r;
  }

  // Test case for combination {1}/Ba=2,b=0:
  //   PRE:  a > 0 && b >= 0
  //   POST: gcd(a, b) == r
  {
    var a := 2;
    var b := 0;
    var r := GCD2(a, b);
    expect gcd(a, b) == r;
  }

}

method Main()
{
  GeneratedTests_GCD1();
  print "GeneratedTests_GCD1: all tests passed!\n";
  GeneratedTests_GCD2();
  print "GeneratedTests_GCD2: all tests passed!\n";
}
