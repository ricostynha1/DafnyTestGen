// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_basic examples_product_details.dfy
// Method: CalcProduct
// Generated: 2026-04-22 20:11:49

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
    if n1 != 0 {
      var old_n1 := n1;
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


method TestsForCalcProduct()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   POST Q1: res == m * n
  {
    var m := 10;
    var n := 10;
    var res := CalcProduct(m, n);
    // expect res == 100; // got 1
  }

  // Test case for combination {1}/Bm=0:
  //   POST Q1: res == m * n
  {
    var m := 0;
    var n := 10;
    var res := CalcProduct(m, n);
    expect res == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bm=1:
  //   POST Q1: res == m * n
  {
    var m := 1;
    var n := 10;
    var res := CalcProduct(m, n);
    // expect res == 10; // got 1
  }

  // Test case for combination {1}/Bn=0:
  //   POST Q1: res == m * n
  {
    var m := 10;
    var n := 0;
    var res := CalcProduct(m, n);
    expect res == 0;
  }

}

method Main()
{
  TestsForCalcProduct();
  print "TestsForCalcProduct: all non-failing tests passed!\n";
}
