// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\TFG_tmp_tmpbvsao41w_Algoritmos Dafny_div_ent_it__251_ROR_Le.dfy
// Method: div_ent_it
// Generated: 2026-04-22 21:59:03

// TFG_tmp_tmpbvsao41w_Algoritmos Dafny_div_ent_it.dfy

method div_ent_it(a: int, b: int)
    returns (c: int, r: int)
  requires a >= 0 && b > 0
  ensures a == b * c + r && 0 <= r < b
  decreases a, b
{
  c := 0;
  r := a;
  while r <= b
    invariant a == b * c + r && r >= 0 && b > 0
    decreases r
  {
    c := c + 1;
    r := r - b;
  }
}

method OriginalMain()
{
  var c, r := div_ent_it(6, 2);
  print "Cociente: ", c, ", Resto: ", r;
}


method TestsFordiv_ent_it()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  a >= 0 && b > 0
  //   POST Q1: a == b * c + r
  //   POST Q2: 0 <= r
  //   POST Q3: r < b
  {
    var a := 10;
    var b := 10;
    var c, r := div_ent_it(a, b);
    // expect c == 1;
    // expect r == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bb=1:
  //   PRE:  a >= 0 && b > 0
  //   POST Q1: a == b * c + r
  //   POST Q2: 0 <= r
  //   POST Q3: r < b
  {
    var a := 10;
    var b := 1;
    var c, r := div_ent_it(a, b);
    // actual runtime state: c=0, r=10
    // expect c == 10; // LHS=0, RHS=10
    // expect r == 0; // LHS=10, RHS=0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bb=2:
  //   PRE:  a >= 0 && b > 0
  //   POST Q1: a == b * c + r
  //   POST Q2: 0 <= r
  //   POST Q3: r < b
  {
    var a := 10;
    var b := 2;
    var c, r := div_ent_it(a, b);
    // actual runtime state: c=0, r=10
    // expect c == 5; // LHS=0, RHS=5
    // expect r == 0; // LHS=10, RHS=0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Br=1:
  //   PRE:  a >= 0 && b > 0
  //   POST Q1: a == b * c + r
  //   POST Q2: 0 <= r
  //   POST Q3: r < b
  {
    var a := 10;
    var b := 9;
    var c, r := div_ent_it(a, b);
    // actual runtime state: c=0, r=10
    // expect c == 1; // LHS=0, RHS=1
    // expect r == 1; // LHS=10, RHS=1
  }

}

method Main()
{
  TestsFordiv_ent_it();
  print "TestsFordiv_ent_it: all non-failing tests passed!\n";
}
