// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_add_by_one.dfy
// Method: add_by_one
// Generated: 2026-04-22 21:36:44

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
    r := r + 1;
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
    var x := -1;
    var y := 10;
    var r := add_by_one(x, y);
    expect r == 9;
  }

  // Test case for combination {1}/By=0:
  //   PRE:  y >= 0
  //   POST Q1: r == x + y
  {
    var x := -10;
    var y := 0;
    var r := add_by_one(x, y);
    expect r == -10;
  }

  // Test case for combination {1}/By=1:
  //   PRE:  y >= 0
  //   POST Q1: r == x + y
  {
    var x := -10;
    var y := 1;
    var r := add_by_one(x, y);
    expect r == -9;
  }

  // Test case for combination {1}/Ox=0:
  //   PRE:  y >= 0
  //   POST Q1: r == x + y
  {
    var x := 0;
    var y := 10;
    var r := add_by_one(x, y);
    expect r == 10;
  }

}

method Main()
{
  TestsForadd_by_one();
  print "TestsForadd_by_one: all non-failing tests passed!\n";
}
