// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_Learning_Experience_tmp_tmpuxvcet_u_week1_7_week5_ComputePower.dfy
// Method: CalcPower
// Generated: 2026-04-22 21:27:56

// Dafny_Learning_Experience_tmp_tmpuxvcet_u_week1_7_week5_ComputePower.dfy

function Power(n: nat): nat
  decreases n
{
  if n == 0 then
    1
  else
    2 * Power(n - 1)
}

method CalcPower(n: nat) returns (p: nat)
  ensures p == 2 * n
  decreases n
{
  p := 2 * n;
}

method ComputePower(n: nat) returns (p: nat)
  ensures p == Power(n)
  decreases n
{
  p := 1;
  var i := 0;
  while i != n
    invariant 0 <= i <= n
    invariant p * Power(n - i) == Power(n)
    decreases if i <= n then n - i else i - n
  {
    p := CalcPower(p);
    i := i + 1;
  }
}


method TestsForCalcPower()
{
  // Test case for combination {1}:
  //   POST Q1: p == 2 * n
  {
    var n := 10;
    var p := CalcPower(n);
    expect p == 20;
  }

  // Test case for combination {1}/Bn=0:
  //   POST Q1: p == 2 * n
  {
    var n := 0;
    var p := CalcPower(n);
    expect p == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST Q1: p == 2 * n
  {
    var n := 1;
    var p := CalcPower(n);
    expect p == 2;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: p == 2 * n
  {
    var n := 9;
    var p := CalcPower(n);
    expect p == 18;
  }

}

method TestsForComputePower()
{
  // Test case for combination {1}:
  //   POST Q1: p == Power(n)
  {
    var n := 0;
    var p := ComputePower(n);
    expect p == 1;
  }

  // Test case for combination {2}:
  //   POST Q1: p == Power(n)
  {
    var n := 10;
    var p := ComputePower(n);
    expect p == 1024;
  }

  // Test case for combination {2}/Bn=1:
  //   POST Q1: p == Power(n)
  {
    var n := 1;
    var p := ComputePower(n);
    expect p == 2;
  }

  // Test case for combination {2}/Bn=2:
  //   POST Q1: p == Power(n)
  {
    var n := 2;
    var p := ComputePower(n);
    expect p == 4;
  }

}

method Main()
{
  TestsForCalcPower();
  print "TestsForCalcPower: all non-failing tests passed!\n";
  TestsForComputePower();
  print "TestsForComputePower: all non-failing tests passed!\n";
}
