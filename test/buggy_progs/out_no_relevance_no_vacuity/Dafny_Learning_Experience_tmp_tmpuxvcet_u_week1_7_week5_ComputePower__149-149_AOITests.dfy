// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Dafny_Learning_Experience_tmp_tmpuxvcet_u_week1_7_week5_ComputePower__149-149_AOI.dfy
// Method: CalcPower
// Generated: 2026-04-24 23:23:34

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
  p := 2 * -n;
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
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   POST Q1: p == 2 * n
  {
    var n := 2;
    var p := CalcPower(n);
    // expect p == 4; // got -4
  }

  // Test case for combination {1}/Bn=0:
  //   POST Q1: p == 2 * n
  {
    var n := 0;
    var p := CalcPower(n);
    expect p == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bn=1:
  //   POST Q1: p == 2 * n
  {
    var n := 1;
    var p := CalcPower(n);
    // expect p == 2; // got -2
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   POST Q1: p == 2 * n
  {
    var n := 10;
    var p := CalcPower(n);
    // expect p == 20; // got -20
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   POST Q1: p == 2 * n
  {
    var n := 9;
    var p := CalcPower(n);
    // expect p == 18; // got -18
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   POST Q1: p == 2 * n
  {
    var n := 8;
    var p := CalcPower(n);
    // expect p == 16; // got -16
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   POST Q1: p == 2 * n
  {
    var n := 7;
    var p := CalcPower(n);
    // expect p == 14; // got -14
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   POST Q1: p == 2 * n
  {
    var n := 6;
    var p := CalcPower(n);
    // expect p == 12; // got -12
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   POST Q1: p == 2 * n
  {
    var n := 5;
    var p := CalcPower(n);
    // expect p == 10; // got -10
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   POST Q1: p == 2 * n
  {
    var n := 4;
    var p := CalcPower(n);
    // expect p == 8; // got -8
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

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Bn=1:
  //   POST Q1: p == Power(n)
  {
    var n := 1;
    var p := ComputePower(n);
    // expect p == 2; // got -2
  }

  // Test case for combination {2}/Bn=2:
  //   POST Q1: p == Power(n)
  {
    var n := 2;
    var p := ComputePower(n);
    expect p == 4;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R4:
  //   POST Q1: p == Power(n)
  {
    var n := 9;
    var p := ComputePower(n);
    // expect p == 512; // got -512
  }

  // Test case for combination {2}/R5:
  //   POST Q1: p == Power(n)
  {
    var n := 8;
    var p := ComputePower(n);
    expect p == 256;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R6:
  //   POST Q1: p == Power(n)
  {
    var n := 7;
    var p := ComputePower(n);
    // expect p == 128; // got -128
  }

  // Test case for combination {2}/R7:
  //   POST Q1: p == Power(n)
  {
    var n := 6;
    var p := ComputePower(n);
    expect p == 64;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/R8:
  //   POST Q1: p == Power(n)
  {
    var n := 5;
    var p := ComputePower(n);
    // expect p == 32; // got -32
  }

  // Test case for combination {2}/R9:
  //   POST Q1: p == Power(n)
  {
    var n := 4;
    var p := ComputePower(n);
    expect p == 16;
  }

}

method Main()
{
  TestsForCalcPower();
  print "TestsForCalcPower: all non-failing tests passed!\n";
  TestsForComputePower();
  print "TestsForComputePower: all non-failing tests passed!\n";
}
