// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\TFG_tmp_tmpbvsao41w_Algoritmos Dafny_div_ent_it.dfy
// Method: div_ent_it
// Generated: 2026-03-25 22:42:00

// TFG_tmp_tmpbvsao41w_Algoritmos Dafny_div_ent_it.dfy

method div_ent_it(a: int, b: int)
    returns (c: int, r: int)
  requires a >= 0 && b > 0
  ensures a == b * c + r && 0 <= r < b
  decreases a, b
{
  c := 0;
  r := a;
  while r >= b
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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  a >= 0 && b > 0
  //   POST: a == b * c + r
  //   POST: 0 <= r < b
  {
    var a := 0;
    var b := 8;
    var c, r := div_ent_it(a, b);
    expect c == 0;
    expect r == 0;
  }

  // Test case for combination {1}:
  //   PRE:  a >= 0 && b > 0
  //   POST: a == b * c + r
  //   POST: 0 <= r < b
  {
    var a := 4;
    var b := 8;
    var c, r := div_ent_it(a, b);
    expect c == 0;
    expect r == 4;
  }

  // Test case for combination {1}/Ba=0,b=1:
  //   PRE:  a >= 0 && b > 0
  //   POST: a == b * c + r
  //   POST: 0 <= r < b
  {
    var a := 0;
    var b := 1;
    var c, r := div_ent_it(a, b);
    expect c == 0;
    expect r == 0;
  }

  // Test case for combination {1}/Ba=0,b=2:
  //   PRE:  a >= 0 && b > 0
  //   POST: a == b * c + r
  //   POST: 0 <= r < b
  {
    var a := 0;
    var b := 2;
    var c, r := div_ent_it(a, b);
    expect c == 0;
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
