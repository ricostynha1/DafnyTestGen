// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\ProjectosCVS_tmp_tmp_02_gmcw_Handout 1_CVS_handout1_55754_55780__1071-1071_AOI.dfy
// Method: peasantMult
// Generated: 2026-04-25 00:28:55

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
      r := -r + aa;
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


method TestsForpeasantMult()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  b > 0
  //   POST Q1: r == a * b
  {
    var a := -10;
    var b := 10;
    var r := peasantMult(a, b);
    // expect r == -100; // got -60
  }

  // Test case for combination {1}/Bb=1:
  //   PRE:  b > 0
  //   POST Q1: r == a * b
  {
    var a := 10;
    var b := 1;
    var r := peasantMult(a, b);
    expect r == 10;
  }

  // Test case for combination {1}/Bb=2:
  //   PRE:  b > 0
  //   POST Q1: r == a * b
  {
    var a := 10;
    var b := 2;
    var r := peasantMult(a, b);
    expect r == 20;
  }

  // Test case for combination {1}/Oa=0:
  //   PRE:  b > 0
  //   POST Q1: r == a * b
  {
    var a := 0;
    var b := 10;
    var r := peasantMult(a, b);
    expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  b > 0
  //   POST Q1: r == a * b
  {
    var a := -9;
    var b := 10;
    var r := peasantMult(a, b);
    // expect r == -90; // got -54
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  b > 0
  //   POST Q1: r == a * b
  {
    var a := 2;
    var b := 9;
    var r := peasantMult(a, b);
    // expect r == 18; // got 14
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  b > 0
  //   POST Q1: r == a * b
  {
    var a := -8;
    var b := 10;
    var r := peasantMult(a, b);
    // expect r == -80; // got -48
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  b > 0
  //   POST Q1: r == a * b
  {
    var a := 10;
    var b := 10;
    var r := peasantMult(a, b);
    // expect r == 100; // got 60
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  b > 0
  //   POST Q1: r == a * b
  {
    var a := 9;
    var b := 10;
    var r := peasantMult(a, b);
    // expect r == 90; // got 54
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  b > 0
  //   POST Q1: r == a * b
  {
    var a := -7;
    var b := 10;
    var r := peasantMult(a, b);
    // expect r == -70; // got -42
  }

}

method TestsForeuclidianDiv()
{
  // Test case for combination {1}:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST Q1: a == b * q + r
  {
    var a := 10;
    var b := 10;
    var q, r := euclidianDiv(a, b);
    expect q == 1; // observed from implementation
    expect r == 0; // observed from implementation
  }

  // Test case for combination {1}/Bb=1:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST Q1: a == b * q + r
  {
    var a := 10;
    var b := 1;
    var q, r := euclidianDiv(a, b);
    expect q == 10; // observed from implementation
    expect r == 0; // observed from implementation
  }

  // Test case for combination {1}/Bb=2:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST Q1: a == b * q + r
  {
    var a := 10;
    var b := 2;
    var q, r := euclidianDiv(a, b);
    expect q == 5; // observed from implementation
    expect r == 0; // observed from implementation
  }

  // Test case for combination {1}/Oa=0:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST Q1: a == b * q + r
  {
    var a := 0;
    var b := 10;
    var q, r := euclidianDiv(a, b);
    expect q == 0; // observed from implementation
    expect r == 0; // observed from implementation
  }

  // Test case for combination {1}/Oq<0:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST Q1: a == b * q + r
  {
    var a := 9;
    var b := 10;
    var q, r := euclidianDiv(a, b);
    expect q == 0; // observed from implementation
    expect r == 9; // observed from implementation
  }

  // Test case for combination {1}/Or<0:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST Q1: a == b * q + r
  {
    var a := 10;
    var b := 9;
    var q, r := euclidianDiv(a, b);
    expect q == 1; // observed from implementation
    expect r == 1; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST Q1: a == b * q + r
  {
    var a := 2;
    var b := 10;
    var q, r := euclidianDiv(a, b);
    expect q == 0; // observed from implementation
    expect r == 2; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST Q1: a == b * q + r
  {
    var a := 9;
    var b := 2;
    var q, r := euclidianDiv(a, b);
    expect q == 4; // observed from implementation
    expect r == 1; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST Q1: a == b * q + r
  {
    var a := 8;
    var b := 2;
    var q, r := euclidianDiv(a, b);
    expect q == 4; // observed from implementation
    expect r == 0; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  a >= 0
  //   PRE:  b > 0
  //   POST Q1: a == b * q + r
  {
    var a := 8;
    var b := 10;
    var q, r := euclidianDiv(a, b);
    expect q == 0; // observed from implementation
    expect r == 8; // observed from implementation
  }

}

method Main()
{
  TestsForpeasantMult();
  print "TestsForpeasantMult: all non-failing tests passed!\n";
  TestsForeuclidianDiv();
  print "TestsForeuclidianDiv: all non-failing tests passed!\n";
}
