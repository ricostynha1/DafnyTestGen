// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-language-server_tmp_tmpkir0kenl_Test_dafny2_Intervals.dfy
// Method: RoundDown
// Generated: 2026-04-08 19:09:19

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


method Passing()
{
  // Test case for combination {3}:
  //   PRE:  Valid()
  //   POST: -1 <= r < thresholds.Length
  //   POST: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST: 0 <= r
  //   POST: thresholds[r] <= k
  //   ENSURES: -1 <= r < thresholds.Length
  //   ENSURES: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   ENSURES: 0 <= r ==> thresholds[r] <= k
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [-38];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundDown(k);
    expect r == 0;
  }

  // Test case for combination {3}/Bk=0,thresholds=2:
  //   PRE:  Valid()
  //   POST: -1 <= r < thresholds.Length
  //   POST: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST: 0 <= r
  //   POST: thresholds[r] <= k
  //   ENSURES: -1 <= r < thresholds.Length
  //   ENSURES: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   ENSURES: 0 <= r ==> thresholds[r] <= k
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[2] [-7719, 39];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundDown(k);
    expect r == 0;
  }

  // Test case for combination {3}/Bk=0,thresholds=3:
  //   PRE:  Valid()
  //   POST: -1 <= r < thresholds.Length
  //   POST: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST: 0 <= r
  //   POST: thresholds[r] <= k
  //   ENSURES: -1 <= r < thresholds.Length
  //   ENSURES: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   ENSURES: 0 <= r ==> thresholds[r] <= k
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[3] [-21238, 7720, 7721];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundDown(k);
    expect r == 0;
  }

  // Test case for combination {3}/Bk=1,thresholds=1:
  //   PRE:  Valid()
  //   POST: -1 <= r < thresholds.Length
  //   POST: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST: 0 <= r
  //   POST: thresholds[r] <= k
  //   ENSURES: -1 <= r < thresholds.Length
  //   ENSURES: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   ENSURES: 0 <= r ==> thresholds[r] <= k
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [-38];
    obj.thresholds := tmp_thresholds;
    var k := 1;
    var r := obj.RoundDown(k);
    expect r == 0;
  }

  // Test case for combination {3}/Or=0:
  //   PRE:  Valid()
  //   POST: -1 <= r < thresholds.Length
  //   POST: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST: 0 <= r
  //   POST: thresholds[r] <= k
  //   ENSURES: -1 <= r < thresholds.Length
  //   ENSURES: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   ENSURES: 0 <= r ==> thresholds[r] <= k
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [-1];
    obj.thresholds := tmp_thresholds;
    var k := -1;
    var r := obj.RoundDown(k);
    expect r == 0;
  }

  // Test case for combination {3}:
  //   PRE:  Valid()
  //   POST: 0 <= r <= thresholds.Length
  //   POST: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST: r < thresholds.Length
  //   POST: k <= thresholds[r]
  //   ENSURES: 0 <= r <= thresholds.Length
  //   ENSURES: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   ENSURES: r < thresholds.Length ==> k <= thresholds[r]
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [38];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundUp(k);
    expect r == 0;
  }

  // Test case for combination {3}/Bk=0,thresholds=2:
  //   PRE:  Valid()
  //   POST: 0 <= r <= thresholds.Length
  //   POST: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST: r < thresholds.Length
  //   POST: k <= thresholds[r]
  //   ENSURES: 0 <= r <= thresholds.Length
  //   ENSURES: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   ENSURES: r < thresholds.Length ==> k <= thresholds[r]
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[2] [-1, 30613];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundUp(k);
    expect r == 1;
  }

  // Test case for combination {3}/Bk=0,thresholds=3:
  //   PRE:  Valid()
  //   POST: 0 <= r <= thresholds.Length
  //   POST: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST: r < thresholds.Length
  //   POST: k <= thresholds[r]
  //   ENSURES: 0 <= r <= thresholds.Length
  //   ENSURES: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   ENSURES: r < thresholds.Length ==> k <= thresholds[r]
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[3] [-2, -1, 32285];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundUp(k);
    expect r == 2;
  }

  // Test case for combination {3}/Bk=1,thresholds=1:
  //   PRE:  Valid()
  //   POST: 0 <= r <= thresholds.Length
  //   POST: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST: r < thresholds.Length
  //   POST: k <= thresholds[r]
  //   ENSURES: 0 <= r <= thresholds.Length
  //   ENSURES: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   ENSURES: r < thresholds.Length ==> k <= thresholds[r]
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [1];
    obj.thresholds := tmp_thresholds;
    var k := 1;
    var r := obj.RoundUp(k);
    expect r == 0;
  }

  // Test case for combination {3}/Or>0:
  //   PRE:  Valid()
  //   POST: 0 <= r <= thresholds.Length
  //   POST: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST: r < thresholds.Length
  //   POST: k <= thresholds[r]
  //   ENSURES: 0 <= r <= thresholds.Length
  //   ENSURES: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   ENSURES: r < thresholds.Length ==> k <= thresholds[r]
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[2] [-1, 38];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundUp(k);
    expect r == 1;
  }

  // Test case for combination {3}/Or=0:
  //   PRE:  Valid()
  //   POST: 0 <= r <= thresholds.Length
  //   POST: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   POST: r < thresholds.Length
  //   POST: k <= thresholds[r]
  //   ENSURES: 0 <= r <= thresholds.Length
  //   ENSURES: forall m: int {:trigger thresholds[m]} :: 0 <= m < r ==> thresholds[m] < k
  //   ENSURES: r < thresholds.Length ==> k <= thresholds[r]
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[1] [38];
    obj.thresholds := tmp_thresholds;
    var k := -1;
    var r := obj.RoundUp(k);
    expect r == 0;
  }

}

method Failing()
{
  // Test case for combination {3}/Or>0:
  //   PRE:  Valid()
  //   POST: -1 <= r < thresholds.Length
  //   POST: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   POST: 0 <= r
  //   POST: thresholds[r] <= k
  //   ENSURES: -1 <= r < thresholds.Length
  //   ENSURES: forall m: int {:trigger thresholds[m]} :: r < m < thresholds.Length ==> k < thresholds[m]
  //   ENSURES: 0 <= r ==> thresholds[r] <= k
  {
    var obj := new Rounding;
    var tmp_thresholds := new int[2] [22, -38];
    obj.thresholds := tmp_thresholds;
    var k := 0;
    var r := obj.RoundDown(k);
    // expect r == 1;
  }

}

method Main()
{
  Passing();
  Failing();
}
