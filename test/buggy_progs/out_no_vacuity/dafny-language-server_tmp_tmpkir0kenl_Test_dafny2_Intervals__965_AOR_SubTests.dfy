// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-language-server_tmp_tmpkir0kenl_Test_dafny2_Intervals__965_AOR_Sub.dfy
// Method: RoundDown
// Generated: 2026-04-24 16:15:56

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
    if thresholds.Length == 0 || k < thresholds[0] {
      return -1;
    }
    var i, j := 0, thresholds.Length - 1;
    while i < j
      invariant 0 <= i <= j < thresholds.Length
      invariant thresholds[i] <= k
      invariant forall m: int {:trigger thresholds[m]} :: j < m < thresholds.Length ==> k < thresholds[m]
      decreases j - i
    {
      var mid := i + (j - i - 1) / 2;
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
  // Test case for combination {1}/Rel:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r < thresholds.Length
  //   POST Q2: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q3: 0 <= r ==> thresholds[r] <= k
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [10];
    obj.thresholds := tmp_thresholds;
    var k := -1;
    var r := obj.RoundDown(k);
    expect -1 <= r < obj.thresholds.Length;
    expect forall m: int :: r < m < obj.thresholds.Length ==> k < obj.thresholds[m];
    expect 0 <= r ==> obj.thresholds[r] <= k;
    expect r == -1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Rel:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r < thresholds.Length
  //   POST Q2: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q3: 0 <= r ==> thresholds[r] <= k
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[2] [-4, -1];
    obj.thresholds := tmp_thresholds;
    var k := 10;
    var r := obj.RoundDown(k);
    // expect -1 <= r < obj.thresholds.Length;
    // expect forall m: int :: r < m < obj.thresholds.Length ==> k < obj.thresholds[m];
    // expect 0 <= r ==> obj.thresholds[r] <= k;
  }

  // Test case for combination {1}/Br=thresholds_len-1:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 > r
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[0] [];
    obj.thresholds := tmp_thresholds;
    var k := -10;
    var r := obj.RoundDown(k);
    expect r == -1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Br=1:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 <= r
  //   POST Q5: thresholds[r] <= k
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[2] [-10, -1];
    obj.thresholds := tmp_thresholds;
    var k := -10;
    var r := obj.RoundDown(k);
    // expect r == 1 || r == 0 || r == -1;
  }

  // Test case for combination {2}/Ok=0:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 <= r
  //   POST Q5: thresholds[r] <= k
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [-10];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundDown(k);
    expect r == 0 || r == -1;
    expect r == 0; // observed from implementation
  }

  // Test case for combination {1}/Ok>0:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 > r
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [-9];
    obj.thresholds := tmp_thresholds;
    var k := 10;
    var r := obj.RoundDown(k);
    expect r == -1 || r == 0;
    expect r == 0; // observed from implementation
  }

  // Test case for combination {1}/O|thresholds|>=2:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 > r
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[2] [6, 10];
    obj.thresholds := tmp_thresholds;
    var k := -9;
    var r := obj.RoundDown(k);
    expect r == -1 || r == 0 || r == 1;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 > r
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [2];
    obj.thresholds := tmp_thresholds;
    var k := -8;
    var r := obj.RoundDown(k);
    expect r == -1 || r == 0;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  Valid()
  //   POST Q1: -1 <= r
  //   POST Q2: r < thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST Q4: 0 > r
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [4];
    obj.thresholds := tmp_thresholds;
    var k := -7;
    var r := obj.RoundDown(k);
    expect r == -1 || r == 0;
    expect r == -1; // observed from implementation
  }

}

method TestsForRoundUp()
{
  // Test case for combination {1}/Rel:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r <= thresholds.Length
  //   POST Q2: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q3: r < thresholds.Length ==> k <= thresholds[r]
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [10];
    obj.thresholds := tmp_thresholds;
    var k := 2;
    var r := obj.RoundUp(k);
    expect 0 <= r <= obj.thresholds.Length;
    expect forall m: int :: 0 <= m < r ==> obj.thresholds[m] < k;
    expect r < obj.thresholds.Length ==> k <= obj.thresholds[r];
    expect r == 0; // observed from implementation
  }

  // Test case for combination {2}/Rel:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r <= thresholds.Length
  //   POST Q2: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q3: r < thresholds.Length ==> k <= thresholds[r]
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[2] [-10, -10];
    obj.thresholds := tmp_thresholds;
    var k := 2;
    var r := obj.RoundUp(k);
    expect 0 <= r <= obj.thresholds.Length;
    expect forall m: int :: 0 <= m < r ==> obj.thresholds[m] < k;
    expect r < obj.thresholds.Length ==> k <= obj.thresholds[r];
    expect r == 2; // observed from implementation
  }

  // Test case for combination {1}/Br=0:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r
  //   POST Q2: r <= thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q4: r >= thresholds.Length
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[0] [];
    obj.thresholds := tmp_thresholds;
    var k := -10;
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
    var tmp_thresholds := new int[2] [-10, -1];
    obj.thresholds := tmp_thresholds;
    var k := -10;
    var r := obj.RoundUp(k);
    expect r == 1 || r == 0 || r == 2;
    expect r == 0; // observed from implementation
  }

  // Test case for combination {1}/Ok=0:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r
  //   POST Q2: r <= thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q4: r >= thresholds.Length
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [-10];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundUp(k);
    expect r == 1 || r == 0;
    expect r == 1; // observed from implementation
  }

  // Test case for combination {1}/O|thresholds|>=2:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r
  //   POST Q2: r <= thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q4: r >= thresholds.Length
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[2] [7, 7];
    obj.thresholds := tmp_thresholds;
    var k := -9;
    var r := obj.RoundUp(k);
    expect r == 2 || r == 0 || r == 1;
    expect r == 0; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r
  //   POST Q2: r <= thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q4: r >= thresholds.Length
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [-1];
    obj.thresholds := tmp_thresholds;
    var k := -8;
    var r := obj.RoundUp(k);
    expect r == 1 || r == 0;
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
    var tmp_thresholds := new int[1] [3];
    obj.thresholds := tmp_thresholds;
    var k := -7;
    var r := obj.RoundUp(k);
    expect r == 1 || r == 0;
    expect r == 0; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  Valid()
  //   POST Q1: 0 <= r
  //   POST Q2: r <= thresholds.Length
  //   POST Q3: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST Q4: r >= thresholds.Length
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [2];
    obj.thresholds := tmp_thresholds;
    var k := -6;
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
