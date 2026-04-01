// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_add_by_one__474_VER_i.dfy
// Method: add_by_one
// Generated: 2026-04-01 22:37:23

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_add_by_one.dfy

method add_by_one(x: int, y: int) returns (r: int)
  requires y >= 0
  ensures r == x + y
  decreases x, y
{
  var i: int := 0;
  r := x;
  while i < y
    invariant i <= y
    invariant r == x + i
    decreases y - i
  {
    r := r + 1;
    i := i + 1;
  }
  return r;
}

method bar(x: int, y: int) returns (r: int)
  requires y >= 0
  ensures r == x + y
  decreases x, y
{
  var i := 0;
  r := i;
  assert i <= y && r == x + i;
  assert y - i >= 0;
  i, r := *, *;
  assume i <= y && r == x + i;
  assume y - i >= 0;
  var rank_before := y - i;
  if i < y {
    r := r + 1;
    i := i + 1;
    assert i <= y && r == x + i;
    assert y - i >= 0;
    assert rank_before - (y - i) > 0;
    assume false;
  }
  return r;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  y >= 0
  //   POST: r == x + y
  {
    var x := 0;
    var y := 0;
    expect y >= 0; // PRE-CHECK
    var r := add_by_one(x, y);
    expect r == 0;
  }

  // Test case for combination {1}/Bx=0,y=1:
  //   PRE:  y >= 0
  //   POST: r == x + y
  {
    var x := 0;
    var y := 1;
    expect y >= 0; // PRE-CHECK
    var r := add_by_one(x, y);
    expect r == 1;
  }

  // Test case for combination {1}/Bx=1,y=0:
  //   PRE:  y >= 0
  //   POST: r == x + y
  {
    var x := 1;
    var y := 0;
    expect y >= 0; // PRE-CHECK
    var r := add_by_one(x, y);
    expect r == 1;
  }

  // Test case for combination {1}/Bx=1,y=1:
  //   PRE:  y >= 0
  //   POST: r == x + y
  {
    var x := 1;
    var y := 1;
    expect y >= 0; // PRE-CHECK
    var r := add_by_one(x, y);
    expect r == 2;
  }

  // Test case for combination {1}:
  //   PRE:  y >= 0
  //   POST: r == x + y
  {
    var x := 0;
    var y := 0;
    expect y >= 0; // PRE-CHECK
    var r := bar(x, y);
    expect r == 0;
  }

  // Test case for combination {1}/Bx=0,y=1:
  //   PRE:  y >= 0
  //   POST: r == x + y
  {
    var x := 0;
    var y := 1;
    expect y >= 0; // PRE-CHECK
    var r := bar(x, y);
    expect r == 1;
  }

}

method Failing()
{
  // Test case for combination {1}/Bx=1,y=0:
  //   PRE:  y >= 0
  //   POST: r == x + y
  {
    var x := 1;
    var y := 0;
    // expect y >= 0; // PRE-CHECK
    var r := bar(x, y);
    // expect r == 1;
  }

  // Test case for combination {1}/Bx=1,y=1:
  //   PRE:  y >= 0
  //   POST: r == x + y
  {
    var x := 1;
    var y := 1;
    // expect y >= 0; // PRE-CHECK
    var r := bar(x, y);
    // expect r == 2;
  }

}

method Main()
{
  Passing();
  Failing();
}
