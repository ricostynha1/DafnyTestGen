// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\FastModularExponentiation.dfy
// Method: FastExponentiation
// Generated: 2026-03-24 21:24:50

/* 
* Verification in Dafny of the fast modular exponentiation algorithm,  
* as described in https://en.wikipedia.org/wiki/Modular_exponentiation.
* It is based on the fast exponentiation algorithm.
*/

// Computes x^n in time O(log n) and space O(1) 
// by the fast exponentiation algorithm.
method FastExponentiation(x: nat, n: nat) returns (p: nat)
  ensures p == Power(x, n)
{
    var mx: nat  := x; // remaining base
    var mn: nat := n; // remaining exponent
    p := 1; // partial result
    while mn > 0 
        invariant Power(x, n) == p * Power(mx, mn) 
    {
        PowerLemma(mx, mn / 2); // helper
        if mn % 2 == 1 {
            p := p * mx;
        } 
        mx := mx * mx;
        mn := mn / 2;
    }
}

// Recursive definition of x^n.
function Power(x: nat, n: nat) : (p: nat) {
    if n == 0 then 1 else x * Power(x, n-1)
}

// Computes (x^n mod m) in time O(log n) and space O(1)
// by the fast modular exponentiation algorithm.
method FastModularExponentiation(x: nat, n: nat, m: nat) returns (res: nat) 
    requires m > 0
    ensures res == Power(x, n) % m
{
    if m == 1 {
        return 0; // x^n % 1 == 0
    }

    var mn: nat := n; // remaining exponent

    ghost var mx: nat := x; // helper: remaining base for computing Power(x, n) (ghost)
    ghost var p : nat := 1; // helper: partial result for computing Power(x, n) (ghost)

    var mx2: nat := x % m; // remaining base for computing Power(x, n) % m 
    var p2 : nat := 1; // partial result for computing Power(x, n) % m 

    while mn > 0 
        invariant Power(x, n) == p * Power(mx, mn)
        invariant p2 == p % m
        invariant mx2 == mx % m
    {
        PowerLemma(mx, mn / 2); // helper
        if mn % 2 == 1 {
            ModProdLemma(p, mx, m); //helper ==> (p * mx) % m == ((p % m) * (mx % m)) % m == (p2 * mx2) % m
            p := p * mx; // helper
            p2 := (p2 * mx2) % m;
        } 
        mn := mn / 2;
        ModProdLemma(mx, mx, m); // helper ==> (mx * mx) % m == ((mx % m) * (mx % m)) % m == (mx2 * mx2) % m
        mx := mx * mx; // helper
        mx2 := (mx2 * mx2) % m;
    }
    
    return p2;
}

// State and prove (by automatic induction on 'n') the property: x^(2n) = (x^2)^n.
lemma {:induction n} PowerLemma(x: nat, n: nat) 
  ensures Power(x, 2 * n) == Power(x * x, n) 
{    
}

// State and prove the property: (a * b) % m == ((a % m) * (b % m)) % m, with m > 0
lemma ModProdLemma(a: nat, b: nat, m: nat)
  requires m > 0
  ensures (a * b) % m == ((a % m) * (b % m)) % m
{
    // integer division and remainder for a by m
    var q1 := a / m;
    var r1 := a % m;
    assert a == q1 * m + r1;

    // integer division and remainder for b by m
    var q2 := b / m;
    var r2 := b % m;
    assert b == q2 * m + r2;

    // product a * b
    var q := q1 * q2 * m + q1 * r2 + q2 * r1;
    var r := r1 * r2;
    assert a * b == q * m + r;
    ModLemma2(q, r, m); // ==> (a * b) % m == (q * m + r) % m == r % m
 }

// State and prove the property: (q * m + r) % m == r % m, with m > 0.
lemma ModLemma2(q: nat, r: nat, m: nat)
  requires m > 0 
  ensures (q * m + r) % m == r % m
{
    // integer division and remainder for (q * m + r) by m
    var q1 := (q * m + r) / m;
    var r1 := (q * m + r) % m;
    assert q * m + r == q1 * m + r1 && 0 <= r1 < m;

    // integer division and remainder for r by m
    var q2 := r / m;
    var r2 := r % m;
    assert r == q2 * m + r2 && 0 <= r2 < m;
    
    assert 0 - m < r1 - r2 == (q2 - q1 + q) * m < m; // combining the previous assertions
    ProdLemma(q2 - q1 + q, m); // ==> r1 - r2 == 0
}

// Proves (automatically) that |a| * b >= b when |a| > 0.
lemma ProdLemma(a: int, b: nat)
 ensures a > 0 ==> a * b >= b
 ensures a < 0 ==> a * b <= b
{ 
}



method Passing()
{
  // Test case for combination {1}:
  //   POST: p == Power(x, n)
  {
    var x := 0;
    var n := 0;
    var p := FastExponentiation(x, n);
    expect p == Power(x, n);
  }

  // Test case for combination {1}/Bx=0,n=1:
  //   POST: p == Power(x, n)
  {
    var x := 0;
    var n := 1;
    var p := FastExponentiation(x, n);
    expect p == Power(x, n);
  }

  // Test case for combination {1}/Bx=1,n=0:
  //   POST: p == Power(x, n)
  {
    var x := 1;
    var n := 0;
    var p := FastExponentiation(x, n);
    expect p == Power(x, n);
  }

  // Test case for combination {1}/Bx=1,n=1:
  //   POST: p == Power(x, n)
  {
    var x := 1;
    var n := 1;
    var p := FastExponentiation(x, n);
    expect p == Power(x, n);
  }

  // Test case for combination {1}:
  //   PRE:  m > 0
  //   POST: res == Power(x, n) % m
  {
    var x := 0;
    var n := 0;
    var m := 1;
    var res := FastModularExponentiation(x, n, m);
    expect res == Power(x, n) % m;
  }

  // Test case for combination {1}/Bx=0,n=0,m=2:
  //   PRE:  m > 0
  //   POST: res == Power(x, n) % m
  {
    var x := 0;
    var n := 0;
    var m := 2;
    var res := FastModularExponentiation(x, n, m);
    expect res == Power(x, n) % m;
  }

  // Test case for combination {1}/Bx=0,n=1,m=1:
  //   PRE:  m > 0
  //   POST: res == Power(x, n) % m
  {
    var x := 0;
    var n := 1;
    var m := 1;
    var res := FastModularExponentiation(x, n, m);
    expect res == Power(x, n) % m;
  }

  // Test case for combination {1}/Bx=0,n=1,m=2:
  //   PRE:  m > 0
  //   POST: res == Power(x, n) % m
  {
    var x := 0;
    var n := 1;
    var m := 2;
    var res := FastModularExponentiation(x, n, m);
    expect res == Power(x, n) % m;
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
