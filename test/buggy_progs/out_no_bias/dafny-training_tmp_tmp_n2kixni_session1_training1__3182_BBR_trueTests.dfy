// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-training_tmp_tmp_n2kixni_session1_training1__3182_BBR_true.dfy
// Method: abs
// Generated: 2026-04-24 12:06:29

// dafny-training_tmp_tmp_n2kixni_session1_training1.dfy

method abs(x: int) returns (y: int)
  ensures true
  decreases x
{
  if x < 0 {
    y := -x;
  } else {
    y := x;
  }
}

method foo(x: int)
  requires x >= 0
  decreases x
{
  var y := abs(x);
}

method max(x: int, y: int) returns (m: int)
  requires true
  ensures true
  decreases x, y
{
  var r: int;
  if x > y {
    r := 0;
  } else {
    r := 1;
  }
  m := r;
}

method ex1(n: int)
  requires true
  ensures true
  decreases n
{
  var i := 0;
  while i < n
    invariant true
    decreases n - i
  {
    i := i + 1;
  }
}

method foo2()
  ensures false
  decreases *
{
  while true
    decreases *
  {
  }
  assert false;
}

method find(a: seq<int>, key: int) returns (index: int)
  requires true
  ensures true
  decreases a, key
{
  index := 0;
  while true
    invariant true
  {
    if a[index] == key {
      return 0;
    }
    index := index + 2;
  }
  index := -10;
}

method isPalindrome(a: seq<char>) returns (b: bool)
  decreases a
{
  return true;
}

predicate sorted(a: seq<int>)
  decreases a
{
  forall j: int, k: int {:trigger a[k], a[j]} :: 
    0 <= j < k < |a| ==>
      a[j] <= a[k]
}

method unique(a: seq<int>) returns (b: seq<int>)
  requires sorted(a)
  ensures true
  decreases a
{
  return a;
}

method OriginalMain()
{
  var r := find([], 1);
  print r, "\n";
  r := find([0, 3, 5, 7], 5);
  print r, "\n";
  var s1 := ['a'];
  var r1 := isPalindrome(s1);
  print "is [", s1, "]", " a isPalindrome? ", r1, " \n";
  s1 := [];
  r1 := isPalindrome(s1);
  print "is [", s1, "]", " a isPalindrome? ", r1, " \n";
  s1 := ['a', 'b'];
  r1 := isPalindrome(s1);
  print "is [", s1, "]", " a isPalindrome? ", r1, " \n";
  s1 := ['a', 'b', 'a'];
  r1 := isPalindrome(s1);
  print "is [", s1, "]", " a isPalindrome? ", r1, " \n";
  var i := [0, 1, 3, 3, 5, 5, 7];
  var s := unique(i);
  print "unique applied to ", i, " is ", s, "\n";
}


method TestsForMain()
  decreases *
{
  // Test case for combination {1}:
  //   POST Q1: true
  {
    var x := 0;
    var y := abs(x);
    expect y == 0; // observed from implementation
  }

  // Test case for combination {1}/Ox>0:
  //   POST Q1: true
  {
    var x := 1;
    var y := abs(x);
    expect y == 1; // observed from implementation
  }

  // Test case for combination {1}/Ox<0:
  //   POST Q1: true
  {
    var x := -1;
    var y := abs(x);
    expect y == 1; // observed from implementation
  }

  // Test case for combination {1}/Oy>0:
  //   POST Q1: true
  {
    var x := -2;
    var y := abs(x);
    expect y == 2; // observed from implementation
  }

  // Test case for combination {1}/Oy<0:
  //   POST Q1: true
  {
    var x := -3;
    var y := abs(x);
    expect y == 3; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   POST Q1: true
  {
    var x := -4;
    var y := abs(x);
    expect y == 4; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   POST Q1: true
  {
    var x := -5;
    var y := abs(x);
    expect y == 5; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   POST Q1: true
  {
    var x := -6;
    var y := abs(x);
    expect y == 6; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   POST Q1: true
  {
    var x := 2;
    var y := abs(x);
    expect y == 2; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   POST Q1: true
  {
    var x := 3;
    var y := abs(x);
    expect y == 3; // observed from implementation
  }

  // Test case for combination {1}:
  //   PRE:  true
  //   POST Q1: true
  {
    var x := 0;
    var y := 0;
    var m := max(x, y);
    expect m == 1; // observed from implementation
  }

  // Test case for combination {1}/Ox>0:
  //   PRE:  true
  //   POST Q1: true
  {
    var x := 1;
    var y := 0;
    var m := max(x, y);
    expect m == 0; // observed from implementation
  }

  // Test case for combination {1}/Ox<0:
  //   PRE:  true
  //   POST Q1: true
  {
    var x := -1;
    var y := 0;
    var m := max(x, y);
    expect m == 1; // observed from implementation
  }

  // Test case for combination {1}/Oy>0:
  //   PRE:  true
  //   POST Q1: true
  {
    var x := -2;
    var y := 1;
    var m := max(x, y);
    expect m == 1; // observed from implementation
  }

  // Test case for combination {1}/Oy<0:
  //   PRE:  true
  //   POST Q1: true
  {
    var x := -3;
    var y := -1;
    var m := max(x, y);
    expect m == 1; // observed from implementation
  }

  // Test case for combination {1}/Om>0:
  //   PRE:  true
  //   POST Q1: true
  {
    var x := -4;
    var y := 2;
    var m := max(x, y);
    expect m == 1; // observed from implementation
  }

  // Test case for combination {1}/Om<0:
  //   PRE:  true
  //   POST Q1: true
  {
    var x := -5;
    var y := 1;
    var m := max(x, y);
    expect m == 1; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  true
  //   POST Q1: true
  {
    var x := 0;
    var y := -2;
    var m := max(x, y);
    expect m == 0; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  true
  //   POST Q1: true
  {
    var x := -6;
    var y := -3;
    var m := max(x, y);
    expect m == 1; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  true
  //   POST Q1: true
  {
    var x := -7;
    var y := 0;
    var m := max(x, y);
    expect m == 1; // observed from implementation
  }

  // Test case for combination {1}:
  //   PRE:  true
  //   POST Q1: true
  {
    var n := 0;
    ex1(n);
  }

  // Test case for combination {1}/On>0:
  //   PRE:  true
  //   POST Q1: true
  {
    var n := 1;
    ex1(n);
  }

  // Test case for combination {1}/On<0:
  //   PRE:  true
  //   POST Q1: true
  {
    var n := -1;
    ex1(n);
  }

  // Test case for combination {1}/R4:
  //   PRE:  true
  //   POST Q1: true
  {
    var n := 2;
    ex1(n);
  }

  // Test case for combination {1}/R5:
  //   PRE:  true
  //   POST Q1: true
  {
    var n := -2;
    ex1(n);
  }

  // Test case for combination {1}/R6:
  //   PRE:  true
  //   POST Q1: true
  {
    var n := -3;
    ex1(n);
  }

  // Test case for combination {1}/R7:
  //   PRE:  true
  //   POST Q1: true
  {
    var n := -4;
    ex1(n);
  }

  // Test case for combination {1}/R8:
  //   PRE:  true
  //   POST Q1: true
  {
    var n := -5;
    ex1(n);
  }

  // Test case for combination {1}/R9:
  //   PRE:  true
  //   POST Q1: true
  {
    var n := 3;
    ex1(n);
  }

  // Test case for combination {1}/R10:
  //   PRE:  true
  //   POST Q1: true
  {
    var n := 4;
    ex1(n);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  true
  //   POST Q1: true
  {
    var a: seq<int> := [];
    var key := 0;
    var index := find(a, key);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|=1:
  //   PRE:  true
  //   POST Q1: true
  {
    var a: seq<int> := [2];
    var key := 0;
    var index := find(a, key);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|a|>=2:
  //   PRE:  true
  //   POST Q1: true
  {
    var a: seq<int> := [3, 4];
    var key := 1;
    var index := find(a, key);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Okey<0:
  //   PRE:  true
  //   POST Q1: true
  {
    var a: seq<int> := [5];
    var key := -1;
    var index := find(a, key);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oindex>0:
  //   PRE:  true
  //   POST Q1: true
  {
    var a: seq<int> := [];
    var key := 6;
    var index := find(a, key);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oindex<0:
  //   PRE:  true
  //   POST Q1: true
  {
    var a: seq<int> := [];
    var key := 7;
    var index := find(a, key);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  true
  //   POST Q1: true
  {
    var a: seq<int> := [];
    var key := 8;
    var index := find(a, key);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  true
  //   POST Q1: true
  {
    var a: seq<int> := [10];
    var key := 9;
    var index := find(a, key);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  true
  //   POST Q1: true
  {
    var a: seq<int> := [];
    var key := 11;
    var index := find(a, key);
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  true
  //   POST Q1: true
  {
    var a: seq<int> := [];
    var key := 12;
    var index := find(a, key);
  }

  // Test case for combination {1}:
  //   PRE:  sorted(a)
  //   POST Q1: true
  {
    var a: seq<int> := [16];
    var b := unique(a);
    expect b[..] == [16]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0:
  //   PRE:  sorted(a)
  //   POST Q1: true
  {
    var a: seq<int> := [];
    var b := unique(a);
    expect b[..] == []; // observed from implementation
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  sorted(a)
  //   POST Q1: true
  {
    var a: seq<int> := [-400, 175];
    var b := unique(a);
    expect b[..] == [-400, 175]; // observed from implementation
  }

  // Test case for combination {1}/O|b|=1:
  //   PRE:  sorted(a)
  //   POST Q1: true
  {
    var a: seq<int> := [17];
    var b := unique(a);
    expect b[..] == [17]; // observed from implementation
  }

  // Test case for combination {1}/O|b|>=2:
  //   PRE:  sorted(a)
  //   POST Q1: true
  {
    var a: seq<int> := [24];
    var b := unique(a);
    expect b[..] == [24]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  sorted(a)
  //   POST Q1: true
  {
    var a: seq<int> := [18];
    var b := unique(a);
    expect b[..] == [18]; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  sorted(a)
  //   POST Q1: true
  {
    var a: seq<int> := [19];
    var b := unique(a);
    expect b[..] == [19]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  sorted(a)
  //   POST Q1: true
  {
    var a: seq<int> := [20];
    var b := unique(a);
    expect b[..] == [20]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  sorted(a)
  //   POST Q1: true
  {
    var a: seq<int> := [21];
    var b := unique(a);
    expect b[..] == [21]; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  sorted(a)
  //   POST Q1: true
  {
    var a: seq<int> := [22];
    var b := unique(a);
    expect b[..] == [22]; // observed from implementation
  }

}

method Main()
  decreases *
{
  TestsForMain();
  print "TestsForMain: all non-failing tests passed!\n";
}
