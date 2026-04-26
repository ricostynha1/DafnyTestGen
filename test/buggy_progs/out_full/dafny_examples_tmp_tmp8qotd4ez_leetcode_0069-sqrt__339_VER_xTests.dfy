// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny_examples_tmp_tmp8qotd4ez_leetcode_0069-sqrt__339_VER_x.dfy
// Method: mySqrt
// Generated: 2026-04-24 09:40:04

// dafny_examples_tmp_tmp8qotd4ez_leetcode_0069-sqrt.dfy

predicate sqrt(x: int, r: int)
  decreases x, r
{
  r * r <= x &&
  (r + 1) * (r + 1) > x
}

lemma uniqueSqrt(x: int, r1: int, r2: int)
  requires x >= 0 && r1 >= 0 && r2 >= 0
  ensures sqrt(x, r1) && sqrt(x, r2) ==> r1 == r2
  decreases x, r1, r2
{
}

method mySqrt(x: int) returns (res: int)
  requires 0 <= x
  ensures sqrt(x, res)
  decreases x
{
  var l, r := 0, x;
  while x <= r
    invariant l >= 0
    invariant r >= 0
    invariant l * l <= x
    invariant (r + 1) * (r + 1) > x
    decreases r - l
  {
    var mid := (l + r) / 2;
    if mid * mid <= x && (mid + 1) * (mid + 1) > x {
      return mid;
    } else if mid * mid <= x {
      l := mid + 1;
    } else {
      r := mid - 1;
    }
  }
}


method TestsFormySqrt()
{
  // Test case for combination {1}/Rel:
  //   PRE:  0 <= x
  //   POST Q1: sqrt(x, res)
  //   POST Q2: (res + 1) * (res + 1) > x
  {
    var x := 4;
    var res := mySqrt(x);
    expect res == 2;
  }

  // Test case for combination {1}/Bx=0:
  //   PRE:  0 <= x
  //   POST Q1: sqrt(x, res)
  //   POST Q2: (res + 1) * (res + 1) > x
  {
    var x := 0;
    var res := mySqrt(x);
    expect res == 0;
  }

  // Test case for combination {1}/Bx=1:
  //   PRE:  0 <= x
  //   POST Q1: sqrt(x, res)
  //   POST Q2: (res + 1) * (res + 1) > x
  {
    var x := 1;
    var res := mySqrt(x);
    expect res == 1;
  }

  // Test case for combination {1}/Bres=x-1:
  //   PRE:  0 <= x
  //   POST Q1: sqrt(x, res)
  //   POST Q2: (res + 1) * (res + 1) > x
  {
    var x := 2;
    var res := mySqrt(x);
    expect res == 1;
  }

  // Test case for combination {1}/R4:
  //   PRE:  0 <= x
  //   POST Q1: sqrt(x, res)
  //   POST Q2: (res + 1) * (res + 1) > x
  {
    var x := 3;
    var res := mySqrt(x);
    expect res == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  0 <= x
  //   POST Q1: sqrt(x, res)
  //   POST Q2: (res + 1) * (res + 1) > x
  {
    var x := 8;
    var res := mySqrt(x);
    // expect res == 2; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  0 <= x
  //   POST Q1: sqrt(x, res)
  //   POST Q2: (res + 1) * (res + 1) > x
  {
    var x := 9;
    var res := mySqrt(x);
    // expect res == 3; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  0 <= x
  //   POST Q1: sqrt(x, res)
  //   POST Q2: (res + 1) * (res + 1) > x
  {
    var x := 10;
    var res := mySqrt(x);
    // expect res == 3; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  0 <= x
  //   POST Q1: sqrt(x, res)
  //   POST Q2: (res + 1) * (res + 1) > x
  {
    var x := 7;
    var res := mySqrt(x);
    // expect res == 2; // got 0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  0 <= x
  //   POST Q1: sqrt(x, res)
  //   POST Q2: (res + 1) * (res + 1) > x
  {
    var x := 6;
    var res := mySqrt(x);
    // expect res == 2; // got 0
  }

}

method Main()
{
  TestsFormySqrt();
  print "TestsFormySqrt: all non-failing tests passed!\n";
}
