// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_add_by_one_details__430-430_EVR_int.dfy
// Method: plus_one
// Generated: 2026-04-01 14:02:26

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_add_by_one_details.dfy

method plus_one(x: int) returns (r: int)
  requires x >= 0
  ensures r == x + 1
  decreases x
{
  return x + 1;
}

method add_by_one(x: int, y: int) returns (r: int)
  decreases x, y
{
  assume y >= 0;
  var i: int := 0;
  r := x;
  assert i <= y;
  assert r == x + i;
  r := *;
  i := *;
  assume i <= y;
  assume r == x + i;
  if i < y {
    assume i < -2;
    var t := y - i;
    r := r + 1;
    i := 0 + 1;
    assert i <= y;
    assert r == x + i;
    assert y - i >= 0;
    assert y - i < t;
    assume false;
  }
  assert r == x + y;
  return r;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  x >= 0
  //   POST: r == x + 1
  {
    var x := 0;
    expect x >= 0; // PRE-CHECK
    var r := plus_one(x);
    expect r == 1;
  }

  // Test case for combination {1}/Bx=1:
  //   PRE:  x >= 0
  //   POST: r == x + 1
  {
    var x := 1;
    expect x >= 0; // PRE-CHECK
    var r := plus_one(x);
    expect r == 2;
  }

  // Test case for combination {1}/R3:
  //   PRE:  x >= 0
  //   POST: r == x + 1
  {
    var x := 2;
    expect x >= 0; // PRE-CHECK
    var r := plus_one(x);
    expect r == 3;
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
