// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\formal_verication_dafny_tmp_tmpwgl2qz28_Challenges_ex2__867_BBR_true.dfy
// Method: Forbid42
// Generated: 2026-04-01 22:34:28

// formal_verication_dafny_tmp_tmpwgl2qz28_Challenges_ex2.dfy

method Forbid42(x: int, y: int) returns (z: int)
  requires y != 42
  ensures z == x / (42 - y)
  decreases x, y
{
  z := x / (42 - y);
  return z;
}

method Allow42(x: int, y: int)
    returns (z: int, err: bool)
  ensures y != 42 ==> z == x / (42 - y) && err == false
  ensures y == 42 ==> z == 0 && err == true
  decreases x, y
{
  if true {
    z := x / (42 - y);
    return z, false;
  }
  return 0, true;
}

method TEST1()
{
  var c: int := Forbid42(0, 1);
  assert c == 0;
  c := Forbid42(10, 32);
  assert c == 1;
  c := Forbid42(-100, 38);
  assert c == -25;
  var d: int, z: bool := Allow42(0, 42);
  assert d == 0 && z == true;
  d, z := Allow42(-10, 42);
  assert d == 0 && z == true;
  d, z := Allow42(0, 1);
  assert d == 0 && z == false;
  d, z := Allow42(10, 32);
  assert d == 1 && z == false;
  d, z := Allow42(-100, 38);
  assert d == -25 && z == false;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  y != 42
  //   POST: z == x / (42 - y)
  {
    var x := 0;
    var y := 43;
    expect y != 42; // PRE-CHECK
    var z := Forbid42(x, y);
    expect z == 0;
  }

  // Test case for combination {1}/Bx=0,y=0:
  //   PRE:  y != 42
  //   POST: z == x / (42 - y)
  {
    var x := 0;
    var y := 0;
    expect y != 42; // PRE-CHECK
    var z := Forbid42(x, y);
    expect z == 0;
  }

  // Test case for combination {1}/Bx=0,y=1:
  //   PRE:  y != 42
  //   POST: z == x / (42 - y)
  {
    var x := 0;
    var y := 1;
    expect y != 42; // PRE-CHECK
    var z := Forbid42(x, y);
    expect z == 0;
  }

  // Test case for combination {1}/Bx=1,y=0:
  //   PRE:  y != 42
  //   POST: z == x / (42 - y)
  {
    var x := 1;
    var y := 0;
    expect y != 42; // PRE-CHECK
    var z := Forbid42(x, y);
    expect z == 0;
  }

  // Test case for combination {3}:
  //   POST: z == x / (42 - y)
  //   POST: err == false
  //   POST: !(y == 42)
  {
    var x := 0;
    var y := 43;
    var z, err := Allow42(x, y);
    expect z == 0;
    expect err == false;
  }

  // Test case for combination {3}/Bx=0,y=0:
  //   POST: z == x / (42 - y)
  //   POST: err == false
  //   POST: !(y == 42)
  {
    var x := 0;
    var y := 0;
    var z, err := Allow42(x, y);
    expect z == 0;
    expect err == false;
  }

  // Test case for combination {3}/Bx=0,y=1:
  //   POST: z == x / (42 - y)
  //   POST: err == false
  //   POST: !(y == 42)
  {
    var x := 0;
    var y := 1;
    var z, err := Allow42(x, y);
    expect z == 0;
    expect err == false;
  }

}

method Failing()
{
  // Test case for combination {2}:
  //   POST: !(y != 42)
  //   POST: z == 0
  //   POST: err == true
  {
    var x := 0;
    var y := 42;
    var z, err := Allow42(x, y);
    // expect z == 0;
    // expect err == true;
  }

}

method Main()
{
  Passing();
  Failing();
}
