// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_product_details__358_BBR_false.dfy
// Method: CalcProduct
// Generated: 2026-03-26 15:04:48

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_product_details.dfy

method CalcProduct(m: nat, n: nat) returns (res: nat)
  ensures res == m * n
  decreases m, n
{
  var m1: nat := m;
  res := 0;
  assert res == (m - m1) * n;
  m1, res := *, *;
  assume res == (m - m1) * n;
  if m1 != 0 {
    var n1: nat := n;
    assert res == (m - m1) * n + n - n1;
    res, n1 := *, *;
    assume res == (m - m1) * n + n - n1;
    if false {
      ghost var old_n1 := n1;
      res := res + 1;
      n1 := n1 - 1;
      assert res == (m - m1) * n + n - n1;
      assert n1 < old_n1;
      assert n1 >= 0;
      assume false;
    }
    m1 := m1 - 1;
    assert res == (m - m1) * n;
    assume false;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: res == m * n
  {
    var m := 11;
    var n := 0;
    var res := CalcProduct(m, n);
    expect res == 0;
  }

  // Test case for combination {1}:
  //   POST: res == m * n
  {
    var m := 16;
    var n := 0;
    var res := CalcProduct(m, n);
    expect res == 0;
  }

  // Test case for combination {1}/Bm=0,n=0:
  //   POST: res == m * n
  {
    var m := 0;
    var n := 0;
    var res := CalcProduct(m, n);
    expect res == 0;
  }

  // Test case for combination {1}/Bm=0,n=1:
  //   POST: res == m * n
  {
    var m := 0;
    var n := 1;
    var res := CalcProduct(m, n);
    expect res == 0;
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
