// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_add_by_one_details__430-430_EVR_int.dfy
// Method: plus_one
// Generated: 2026-04-24 16:54:33

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


method TestsForplus_one()
{
  // Test case for combination {1}:
  //   PRE:  x >= 0
  //   POST Q1: r == x + 1
  {
    var x := 10;
    var r := plus_one(x);
    expect r == 11;
  }

  // Test case for combination {1}/Bx=0:
  //   PRE:  x >= 0
  //   POST Q1: r == x + 1
  {
    var x := 0;
    var r := plus_one(x);
    expect r == 1;
  }

  // Test case for combination {1}/Bx=1:
  //   PRE:  x >= 0
  //   POST Q1: r == x + 1
  {
    var x := 1;
    var r := plus_one(x);
    expect r == 2;
  }

  // Test case for combination {1}/R4:
  //   PRE:  x >= 0
  //   POST Q1: r == x + 1
  {
    var x := 9;
    var r := plus_one(x);
    expect r == 10;
  }

  // Test case for combination {1}/R5:
  //   PRE:  x >= 0
  //   POST Q1: r == x + 1
  {
    var x := 8;
    var r := plus_one(x);
    expect r == 9;
  }

  // Test case for combination {1}/R6:
  //   PRE:  x >= 0
  //   POST Q1: r == x + 1
  {
    var x := 7;
    var r := plus_one(x);
    expect r == 8;
  }

  // Test case for combination {1}/R7:
  //   PRE:  x >= 0
  //   POST Q1: r == x + 1
  {
    var x := 6;
    var r := plus_one(x);
    expect r == 7;
  }

  // Test case for combination {1}/R8:
  //   PRE:  x >= 0
  //   POST Q1: r == x + 1
  {
    var x := 5;
    var r := plus_one(x);
    expect r == 6;
  }

  // Test case for combination {1}/R9:
  //   PRE:  x >= 0
  //   POST Q1: r == x + 1
  {
    var x := 4;
    var r := plus_one(x);
    expect r == 5;
  }

  // Test case for combination {1}/R10:
  //   PRE:  x >= 0
  //   POST Q1: r == x + 1
  {
    var x := 3;
    var r := plus_one(x);
    expect r == 4;
  }

}

method Main()
{
  TestsForplus_one();
  print "TestsForplus_one: all non-failing tests passed!\n";
}
