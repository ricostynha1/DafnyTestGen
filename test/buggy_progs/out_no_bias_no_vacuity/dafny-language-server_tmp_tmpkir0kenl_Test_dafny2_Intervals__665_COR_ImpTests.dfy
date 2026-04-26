// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-language-server_tmp_tmpkir0kenl_Test_dafny2_Intervals__665_COR_Imp.dfy
// Method: RoundDown
// Generated: 2026-04-24 22:08:36

// dafny-language-server_tmp_tmpkir0kenl_Test_dafny2_Intervals.dfy

class Rounding {
  var thresholds: array<int>

  function Valid(): bool
    reads this, thresholds
    decreases {this, thresholds}
  {
    forall m: int, n: int {:trigger thresholds[n], thresholds[m]} :: 
      0 <= m < n < thresholds.Length ==>
        thresholds[m] <= thresholds[n]
  }

  method RoundDown(k: int) returns (r: int)
    requires Valid()
    ensures -1 <= r < thresholds.Length
    ensures forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
    ensures 0 <= r ==> thresholds[r] <= k
    decreases k
  {
    if thresholds.Length == 0 ==> k < thresholds[0] {
      return -1;
    }
    var i, j := 0, thresholds.Length - 1;
    while i < j
      invariant 0 <= i <= j < thresholds.Length
      invariant thresholds[i] <= k
      invariant forall m: int {:trigger thresholds[m]} :: j < m < thresholds.Length ==> k < thresholds[m]
      decreases j - i
    {
      var mid := i + (j - i + 1) / 2;
      assert i < mid <= j;
      if thresholds[mid] <= k {
        i := mid;
      } else {
        j := mid - 1;
      }
    }
    return i;
  }

  method RoundUp(k: int) returns (r: int)
    requires Valid()
    ensures 0 <= r <= thresholds.Length
    ensures forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
    ensures r < thresholds.Length ==> k <= thresholds[r]
    decreases k
  {
    if thresholds.Length == 0 || thresholds[thresholds.Length - 1] < k {
      return thresholds.Length;
    }
    var i, j := 0, thresholds.Length - 1;
    while i < j
      invariant 0 <= i <= j < thresholds.Length
      invariant k <= thresholds[j]
      invariant forall m: int {:trigger thresholds[m]} :: 0 <= m < i ==> thresholds[m] < k
      decreases j - i
    {
      var mid := i + (j - i) / 2;
      assert i <= mid < j;
      if thresholds[mid] < k {
        i := mid + 1;
      } else {
        j := mid;
      }
    }
    return i;
  }
}


method TestsForRoundDown()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 > r
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[0] [];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundDown(k);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.Rounding.RoundDown(BigInteger k) in C:\cygwin64\tmp\DafnyCBT_lbib4v3ybpm\runner.cs:line 6800
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_lbib4v3ybpm\runner.cs:line 6142
    // expect r == -1;
  }

  // Test case for combination {1}/O|thresholds|>=2:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 > r
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[2] [-400, 175];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundDown(k);
    expect r == -1 || r == 0 || r == 1;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {2}/Br=0:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 <= r
  //   POST Q5: thresholds[r] <= k
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [175];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundDown(k);
    expect r == 0 || r == -1;
    expect r == -1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ok>0:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 > r
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[0] [];
    obj.thresholds := tmp_thresholds;
    var k := 1;
    var r := obj.RoundDown(k);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.Rounding.RoundDown(BigInteger k) in C:\cygwin64\tmp\DafnyCBT_lbib4v3ybpm\runner.cs:line 6800
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyCBT_lbib4v3ybpm\runner.cs:line 6247
    // expect r == -1;
  }

  // Test case for combination {1}/Ok<0:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 > r
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [17];
    obj.thresholds := tmp_thresholds;
    var k := -1;
    var r := obj.RoundDown(k);
    expect r == -1 || r == 0;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {2}/Ok>0:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 <= r
  //   POST Q5: thresholds[r] <= k
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [17];
    obj.thresholds := tmp_thresholds;
    var k := 1;
    var r := obj.RoundDown(k);
    expect r == 0 || r == -1;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {2}/Ok<0:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 <= r
  //   POST Q5: thresholds[r] <= k
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [18];
    obj.thresholds := tmp_thresholds;
    var k := -1;
    var r := obj.RoundDown(k);
    expect r == 0 || r == -1;
    expect r == -1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 > r
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[0] [];
    obj.thresholds := tmp_thresholds;
    var k := 16;
    var r := obj.RoundDown(k);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.Rounding.RoundDown(BigInteger k) in C:\cygwin64\tmp\DafnyCBT_lbib4v3ybpm\runner.cs:line 6800
    // runtime error: at _module.__default.TestCase__7() in C:\cygwin64\tmp\DafnyCBT_lbib4v3ybpm\runner.cs:line 6385
    // expect r == -1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 > r
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[0] [];
    obj.thresholds := tmp_thresholds;
    var k := 18;
    var r := obj.RoundDown(k);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.Rounding.RoundDown(BigInteger k) in C:\cygwin64\tmp\DafnyCBT_lbib4v3ybpm\runner.cs:line 6800
    // runtime error: at _module.__default.TestCase__8() in C:\cygwin64\tmp\DafnyCBT_lbib4v3ybpm\runner.cs:line 6421
    // expect r == -1;
  }

}

method TestsForRoundUp()
{
  // Test case for combination {1}/Rel:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r
  //   POST Q2: r <= thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q4: r >= thresholds.Length
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[0] [];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundUp(k);
    expect r == 0;
  }

  // Test case for combination {2}/Br=1:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q4: k <= thresholds[r]
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[2] [-400, 175];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundUp(k);
    expect r == 1 || r == 0 || r == 2;
    expect r == 1; // observed from implementation
  }

  // Test case for combination {1}/Br=1:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r
  //   POST Q2: r <= thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q4: r >= thresholds.Length
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [15];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundUp(k);
    expect r == 1 || r == 0;
    expect r == 0; // observed from implementation
  }

  // Test case for combination {1}/Ok>0:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r
  //   POST Q2: r <= thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q4: r >= thresholds.Length
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[0] [];
    obj.thresholds := tmp_thresholds;
    var k := 1;
    var r := obj.RoundUp(k);
    expect r == 0;
  }

  // Test case for combination {1}/Ok<0:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r
  //   POST Q2: r <= thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q4: r >= thresholds.Length
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[0] [];
    obj.thresholds := tmp_thresholds;
    var k := -1;
    var r := obj.RoundUp(k);
    expect r == 0;
  }

  // Test case for combination {2}/Ok>0:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q4: k <= thresholds[r]
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [17];
    obj.thresholds := tmp_thresholds;
    var k := 1;
    var r := obj.RoundUp(k);
    expect r == 0 || r == 1;
    expect r == 0; // observed from implementation
  }

  // Test case for combination {2}/Ok<0:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q4: k <= thresholds[r]
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [18];
    obj.thresholds := tmp_thresholds;
    var k := -1;
    var r := obj.RoundUp(k);
    expect r == 0 || r == 1;
    expect r == 0; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r
  //   POST Q2: r <= thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q4: r >= thresholds.Length
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [18];
    obj.thresholds := tmp_thresholds;
    var k := 17;
    var r := obj.RoundUp(k);
    expect r == 1 || r == 0;
    expect r == 0; // observed from implementation
  }

}

method Main()
{
  TestsForRoundDown();
  print "TestsForRoundDown: all non-failing tests passed!\n";
  TestsForRoundUp();
  print "TestsForRoundUp: all non-failing tests passed!\n";
}
