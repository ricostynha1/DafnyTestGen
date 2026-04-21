// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny_examples_tmp_tmp8qotd4ez_leetcode_0069-sqrt__607-613_AOI.dfy
// Method: mySqrt
// Generated: 2026-04-08 16:45:22

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
  while l <= r
    invariant l >= 0
    invariant r >= 0
    invariant l * l <= x
    invariant (r + 1) * (r + 1) > x
    decreases r - l
  {
    var mid := (l + r) / 2;
    if mid * mid <= x && (mid + 1) * (mid + 1) > x {
      return mid;
    } else if -(mid * mid) <= x {
      l := mid + 1;
    } else {
      r := mid - 1;
    }
  }
}


method Passing()
{
  // Test case for combination {1}/Bx=0:
  //   PRE:  0 <= x
  //   POST: sqrt(x, res)
  //   ENSURES: sqrt(x, res)
  {
    var x := 0;
    var res := mySqrt(x);
    expect res == 0;
  }

  // Test case for combination {1}/Bx=1:
  //   PRE:  0 <= x
  //   POST: sqrt(x, res)
  //   ENSURES: sqrt(x, res)
  {
    var x := 1;
    var res := mySqrt(x);
    expect res == 1;
  }

  // Test case for combination {1}/Ores>0:
  //   PRE:  0 <= x
  //   POST: sqrt(x, res)
  //   ENSURES: sqrt(x, res)
  {
    var x := 3;
    var res := mySqrt(x);
    expect res == 1;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  0 <= x
  //   POST: sqrt(x, res)
  //   ENSURES: sqrt(x, res)
  {
    var x := 7;
    var res := mySqrt(x);
    // expect res == 2;
  }

}

method Main()
{
  Passing();
  Failing();
}
