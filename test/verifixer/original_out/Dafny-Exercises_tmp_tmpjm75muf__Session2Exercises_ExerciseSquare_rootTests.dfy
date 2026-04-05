// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny-Exercises_tmp_tmpjm75muf__Session2Exercises_ExerciseSquare_root.dfy
// Method: mroot1
// Generated: 2026-04-05 23:37:48

// Dafny-Exercises_tmp_tmpjm75muf__Session2Exercises_ExerciseSquare_root.dfy

method mroot1(n: int) returns (r: int)
  requires n >= 0
  ensures r >= 0 && r * r <= n < (r + 1) * (r + 1)
  decreases n
{
  r := 0;
  while (r + 1) * (r + 1) <= n
    invariant r >= 0 && r * r <= n
    decreases n - r * r
  {
    r := r + 1;
  }
}

method mroot2(n: int) returns (r: int)
  requires n >= 0
  ensures r >= 0 && r * r <= n < (r + 1) * (r + 1)
  decreases n
{
  r := n;
  while n < r * r
    invariant 0 <= r <= n && n < (r + 1) * (r + 1)
    invariant r * r <= n ==> n < (r + 1) * (r + 1)
    decreases r
  {
    r := r - 1;
  }
}

method mroot3(n: int) returns (r: int)
  requires n >= 0
  ensures r >= 0 && r * r <= n < (r + 1) * (r + 1)
  decreases n
{
  var y: int;
  var h: int;
  r := 0;
  y := n + 1;
  while y != r + 1
    invariant r >= 0 && r * r <= n < y * y && y >= r + 1
    decreases y - r
  {
    h := (r + y) / 2;
    if h * h <= n {
      r := h;
    } else {
      y := h;
    }
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: r >= 0
  //   POST: r * r <= n < (r + 1) * (r + 1)
  {
    var n := 15;
    var r := mroot1(n);
    expect r == 3;
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  n >= 0
  //   POST: r >= 0
  //   POST: r * r <= n < (r + 1) * (r + 1)
  {
    var n := 0;
    var r := mroot1(n);
    expect r == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST: r >= 0
  //   POST: r * r <= n < (r + 1) * (r + 1)
  {
    var n := 1;
    var r := mroot1(n);
    expect r == 1;
  }

  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: r >= 0
  //   POST: r * r <= n < (r + 1) * (r + 1)
  {
    var n := 15;
    var r := mroot2(n);
    expect r == 3;
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  n >= 0
  //   POST: r >= 0
  //   POST: r * r <= n < (r + 1) * (r + 1)
  {
    var n := 0;
    var r := mroot2(n);
    expect r == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST: r >= 0
  //   POST: r * r <= n < (r + 1) * (r + 1)
  {
    var n := 1;
    var r := mroot2(n);
    expect r == 1;
  }

  // Test case for combination {1}:
  //   PRE:  n >= 0
  //   POST: r >= 0
  //   POST: r * r <= n < (r + 1) * (r + 1)
  {
    var n := 15;
    var r := mroot3(n);
    expect r == 3;
  }

  // Test case for combination {1}/Bn=0:
  //   PRE:  n >= 0
  //   POST: r >= 0
  //   POST: r * r <= n < (r + 1) * (r + 1)
  {
    var n := 0;
    var r := mroot3(n);
    expect r == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  n >= 0
  //   POST: r >= 0
  //   POST: r * r <= n < (r + 1) * (r + 1)
  {
    var n := 1;
    var r := mroot3(n);
    expect r == 1;
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
