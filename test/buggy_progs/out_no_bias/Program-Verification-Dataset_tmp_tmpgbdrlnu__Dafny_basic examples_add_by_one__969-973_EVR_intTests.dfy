// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_add_by_one__969-973_EVR_int.dfy
// Method: add_by_one
// Generated: 2026-04-24 12:26:19

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
  r := x;
  assert i <= y && r == x + i;
  assert y - i >= 0;
  i, r := *, *;
  assume i <= y && r == x + i;
  assume y - i >= 0;
  var rank_before := y - i;
  if i < y {
    r := 0;
    i := i + 1;
    assert i <= y && r == x + i;
    assert y - i >= 0;
    assert rank_before - (y - i) > 0;
    assume false;
  }
  return r;
}


method TestsForadd_by_one()
{
  // Test case for combination {1}:
  //   PRE:  y >= 0
  //   POST Q1: r == x + y
  {
    var x := 0;
    var y := 0;
    var r := add_by_one(x, y);
    expect r == 0;
  }

  // Test case for combination {1}/By=1:
  //   PRE:  y >= 0
  //   POST Q1: r == x + y
  {
    var x := -1;
    var y := 1;
    var r := add_by_one(x, y);
    expect r == 0;
  }

  // Test case for combination {1}/Ox>0:
  //   PRE:  y >= 0
  //   POST Q1: r == x + y
  {
    var x := 1;
    var y := 2;
    var r := add_by_one(x, y);
    expect r == 3;
  }

  // Test case for combination {1}/Or<0:
  //   PRE:  y >= 0
  //   POST Q1: r == x + y
  {
    var x := -2;
    var y := 0;
    var r := add_by_one(x, y);
    expect r == -2;
  }

  // Test case for combination {1}/R5:
  //   PRE:  y >= 0
  //   POST Q1: r == x + y
  {
    var x := -3;
    var y := 0;
    var r := add_by_one(x, y);
    expect r == -3;
  }

  // Test case for combination {1}/R6:
  //   PRE:  y >= 0
  //   POST Q1: r == x + y
  {
    var x := -4;
    var y := 3;
    var r := add_by_one(x, y);
    expect r == -1;
  }

  // Test case for combination {1}/R7:
  //   PRE:  y >= 0
  //   POST Q1: r == x + y
  {
    var x := -5;
    var y := 0;
    var r := add_by_one(x, y);
    expect r == -5;
  }

  // Test case for combination {1}/R8:
  //   PRE:  y >= 0
  //   POST Q1: r == x + y
  {
    var x := -6;
    var y := 4;
    var r := add_by_one(x, y);
    expect r == -2;
  }

  // Test case for combination {1}/R9:
  //   PRE:  y >= 0
  //   POST Q1: r == x + y
  {
    var x := -7;
    var y := 0;
    var r := add_by_one(x, y);
    expect r == -7;
  }

  // Test case for combination {1}/R10:
  //   PRE:  y >= 0
  //   POST Q1: r == x + y
  {
    var x := -8;
    var y := 5;
    var r := add_by_one(x, y);
    expect r == -3;
  }

}

method Main()
{
  TestsForadd_by_one();
  print "TestsForadd_by_one: all non-failing tests passed!\n";
}
