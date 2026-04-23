// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\formal_verication_dafny_tmp_tmpwgl2qz28_Challenges_ex2.dfy
// Method: Forbid42
// Generated: 2026-04-22 21:34:31

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
  if y != 42 {
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


method TestsForForbid42()
{
  // Test case for combination {1}:
  //   PRE:  y != 42
  //   POST Q1: z == x / (42 - y)
  {
    var x := -10;
    var y := -10;
    var z := Forbid42(x, y);
    expect z == -1;
  }

  // Test case for combination {1}/Ox=0:
  //   PRE:  y != 42
  //   POST Q1: z == x / (42 - y)
  {
    var x := 0;
    var y := -10;
    var z := Forbid42(x, y);
    expect z == 0;
  }

  // Test case for combination {1}/Ox>0:
  //   PRE:  y != 42
  //   POST Q1: z == x / (42 - y)
  {
    var x := 10;
    var y := -10;
    var z := Forbid42(x, y);
    expect z == 0;
  }

  // Test case for combination {1}/Oy=0:
  //   PRE:  y != 42
  //   POST Q1: z == x / (42 - y)
  {
    var x := -10;
    var y := 0;
    var z := Forbid42(x, y);
    expect z == -1;
  }

}

method TestsForAllow42()
{
  // Test case for combination {1}:
  //   POST Q1: y == 42
  //   POST Q2: z == 0
  //   POST Q3: err == true
  {
    var x := -10;
    var y := 42;
    var z, err := Allow42(x, y);
    expect z == 0;
    expect err == true;
  }

  // Test case for combination {2}:
  //   POST Q1: y != 42
  //   POST Q2: z == x / (42 - y)
  //   POST Q3: err == false
  {
    var x := -10;
    var y := -10;
    var z, err := Allow42(x, y);
    expect z == -1;
    expect err == false;
  }

  // Test case for combination {1}/Ox=0:
  //   POST Q1: y == 42
  //   POST Q2: z == 0
  //   POST Q3: err == true
  {
    var x := 0;
    var y := 42;
    var z, err := Allow42(x, y);
    expect z == 0;
    expect err == true;
  }

  // Test case for combination {1}/Ox>0:
  //   POST Q1: y == 42
  //   POST Q2: z == 0
  //   POST Q3: err == true
  {
    var x := 10;
    var y := 42;
    var z, err := Allow42(x, y);
    expect z == 0;
    expect err == true;
  }

}

method Main()
{
  TestsForForbid42();
  print "TestsForForbid42: all non-failing tests passed!\n";
  TestsForAllow42();
  print "TestsForAllow42: all non-failing tests passed!\n";
}
