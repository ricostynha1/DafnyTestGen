// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\FastExponentiation.dfy
// Method: FastExponentiation
// Generated: 2026-04-20 22:25:08

// Computes x^n in time O(log n) and space O(1) 
// using the fast exponentiation algorithm.
method FastExponentiation(x: real, n: nat) returns (p: real)
  ensures p == Power(x, n)
{
  p := 1.0; // partial result
  var mx: real := x; // remaining base (x)
  var mn: nat := n; // remaining exponent (n)
  while mn > 0 
    invariant Power(x, n) == p * Power(mx, mn)
  {
     PowerSquareLemma(mx, mn/2); // helper: invokes the lemma
     if mn % 2 == 1 { 
        p := p * mx; 
     } 
      mx := mx * mx;
      mn := mn / 2;
  }
}

// Recursive definiton of x^n.
function Power(x: real, n: nat) : (p: real) {
    if n == 0 then 1.0 else x * Power(x, n-1)
}

// Proves (by induction on n) the property x^(2*n) = (x^2)^n.
lemma PowerSquareLemma(x: real, n: nat) 
  ensures Power(x, 2 * n) == Power(x * x, n) 
{ 
  if n == 1 {
    assert Power(x, 2 * 1) == x * Power(x, 1);
  }
  else if n > 1 { 
    PowerSquareLemma(x, n - 1); 
  }
}



method TestsForFastExponentiation()
{
  // Test case for combination {1}:
  //   POST: p == Power(x, n)
  //   POST: p == 1.0
  //   ENSURES: p == Power(x, n)
  {
    var x := 0.0;
    var n := 0;
    var p := FastExponentiation(x, n);
    expect p == 1.0;
  }

  // Test case for combination {2}:
  //   POST: !(n == 0)
  //   POST: p == x * Power(x, n - 1)
  //   ENSURES: p == Power(x, n)
  {
    var x := 0.0;
    var n := 10;
    var p := FastExponentiation(x, n);
    expect p == 0.0;
  }

  // Test case for combination {2}/Bn=1:
  //   POST: !(n == 0)
  //   POST: p == x * Power(x, n - 1)
  //   ENSURES: p == Power(x, n)
  {
    var x := 0.0;
    var n := 1;
    var p := FastExponentiation(x, n);
    expect p == 0.0;
  }

  // Test case for combination {2}/Bn=2:
  //   POST: !(n == 0)
  //   POST: p == x * Power(x, n - 1)
  //   ENSURES: p == Power(x, n)
  {
    var x := 0.0;
    var n := 2;
    var p := FastExponentiation(x, n);
    expect p == 0.0;
  }

}

method Main()
{
  TestsForFastExponentiation();
  print "TestsForFastExponentiation: all non-failing tests passed!\n";
}
