// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\ProjectosCVS_tmp_tmp_02_gmcw_Handout 1_CVS_handout1_55754_55780.dfy
// Method: peasantMult
// Generated: 2026-04-08 19:17:43

// ProjectosCVS_tmp_tmp_02_gmcw_Handout 1_CVS_handout1_55754_55780.dfy

lemma peasantMultLemma(a: int, b: int)
  requires b >= 0
  ensures b % 2 == 0 ==> a * b == 2 * a * b / 2
  ensures b % 2 == 1 ==> a * b == a + 2 * a * (b - 1) / 2
  decreases a, b
{
  if b % 2 == 0 && b > 0 {
    peasantMultLemma(a, b - 2);
  }
  if b % 2 == 1 && b > 1 {
    peasantMultLemma(a, b - 2);
  }
}

method peasantMult(a: int, b: int) returns (r: int)
  requires b > 0
  ensures r == a * b
  decreases a, b
{
  r := 0;
  var aa := a;
  var bb := b;
  while bb > 0
    invariant 0 <= bb <= b
    invariant r + aa * bb == a * b
    decreases bb
  {
    if bb % 2 == 0 {
      aa := 2 * aa;
      bb := bb / 2;
    } else if bb % 2 == 1 {
      r := r + aa;
      aa := 2 * aa;
      bb := (bb - 1) / 2;
    }
  }
}

method euclidianDiv(a: int, b: int)
    returns (q: int, r: int)
  requires a >= 0
  requires b > 0
  ensures a == b * q + r
  decreases a, b
{
  r := a;
  q := 0;
  while r - b >= 0
    invariant 0 <= r <= a
    invariant r == a - b * q
    decreases r - b
  {
    r := r - b;
    q := q + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  b > 0
  //   POST: r == a * b
  //   ENSURES: r == a * b
  {
    var a := 0;
    var b := 1;
    var r := peasantMult(a, b);
    expect r == 0;
  }

  // Test case for combination {1}/Ba=0,b=2:
  //   PRE:  b > 0
  //   POST: r == a * b
  //   ENSURES: r == a * b
  {
    var a := 0;
    var b := 2;
    var r := peasantMult(a, b);
    expect r == 0;
  }

  // Test case for combination {1}/Ba=1,b=1:
  //   PRE:  b > 0
  //   POST: r == a * b
  //   ENSURES: r == a * b
  {
    var a := 1;
    var b := 1;
    var r := peasantMult(a, b);
    expect r == 1;
  }

  // Test case for combination {1}/Ba=1,b=2:
  //   PRE:  b > 0
  //   POST: r == a * b
  //   ENSURES: r == a * b
  {
    var a := 1;
    var b := 2;
    var r := peasantMult(a, b);
    expect r == 2;
  }

  // Test case for combination {1}/Or>0:
  //   PRE:  b > 0
  //   POST: r == a * b
  //   ENSURES: r == a * b
  {
    var a := 1;
    var b := 15;
    var r := peasantMult(a, b);
    expect r == 15;
  }

  // Test case for combination {1}/Or<0:
  //   PRE:  b > 0
  //   POST: r == a * b
  //   ENSURES: r == a * b
  {
    var a := -1;
    var b := 17;
    var r := peasantMult(a, b);
    expect r == -17;
  }

  // Test case for combination {1}/Or=0:
  //   PRE:  b > 0
  //   POST: r == a * b
  //   ENSURES: r == a * b
  {
    var a := 0;
    var b := 15;
    var r := peasantMult(a, b);
    expect r == 0;
  }

  // Test case for combination {1}:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST: a == b * q + r
  //   ENSURES: a == b * q + r
  {
    var a := 0;
    var b := 1;
    var q, r := euclidianDiv(a, b);
    expect a == 0;
  }

  // Test case for combination {1}/Ba=0,b=2:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST: a == b * q + r
  //   ENSURES: a == b * q + r
  {
    var a := 0;
    var b := 2;
    var q, r := euclidianDiv(a, b);
    expect a == 0;
  }

  // Test case for combination {1}/Ba=1,b=1:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST: a == b * q + r
  //   ENSURES: a == b * q + r
  {
    var a := 1;
    var b := 1;
    var q, r := euclidianDiv(a, b);
    expect a == 1;
  }

  // Test case for combination {1}/Ba=1,b=2:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST: a == b * q + r
  //   ENSURES: a == b * q + r
  {
    var a := 1;
    var b := 2;
    var q, r := euclidianDiv(a, b);
    expect a == 1;
  }

  // Test case for combination {1}/Oq>0:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST: a == b * q + r
  //   ENSURES: a == b * q + r
  {
    var a := 1;
    var b := 4;
    var q, r := euclidianDiv(a, b);
    expect a == 1;
  }

  // Test case for combination {1}/Oq<0:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST: a == b * q + r
  //   ENSURES: a == b * q + r
  {
    var a := 0;
    var b := 4;
    var q, r := euclidianDiv(a, b);
    expect a == 0;
  }

  // Test case for combination {1}/Oq=0:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST: a == b * q + r
  //   ENSURES: a == b * q + r
  {
    var a := 3;
    var b := 4;
    var q, r := euclidianDiv(a, b);
    expect q == 0;
    expect r == 3;
  }

  // Test case for combination {1}/Or>0:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST: a == b * q + r
  //   ENSURES: a == b * q + r
  {
    var a := 0;
    var b := 16;
    var q, r := euclidianDiv(a, b);
    expect a == 0;
  }

  // Test case for combination {1}/Or<0:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST: a == b * q + r
  //   ENSURES: a == b * q + r
  {
    var a := 23;
    var b := 15;
    var q, r := euclidianDiv(a, b);
    expect a == 23;
  }

  // Test case for combination {1}/Or=0:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST: a == b * q + r
  //   ENSURES: a == b * q + r
  {
    var a := 0;
    var b := 64;
    var q, r := euclidianDiv(a, b);
    expect q == 0;
    expect r == 0;
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
