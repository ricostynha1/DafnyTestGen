// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_Learning_Experience_tmp_tmpuxvcet_u_week1_7_week5_ComputePower.dfy
// Method: CalcPower
// Generated: 2026-04-05 23:36:07

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


method Passing()
{
  // Test case for combination {1}:
  //   POST: p == 2 * n
  {
    var n := 0;
    var p := CalcPower(n);
    expect p == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST: p == 2 * n
  {
    var n := 1;
    var p := CalcPower(n);
    expect p == 2;
  }

  // Test case for combination {1}/R3:
  //   POST: p == 2 * n
  {
    var n := 2;
    var p := CalcPower(n);
    expect p == 4;
  }

  // Test case for combination {1}:
  //   POST: p == Power(n)
  {
    var n := 0;
    var p := ComputePower(n);
    expect p == 1;
  }

  // Test case for combination {1}/Bn=1:
  //   POST: p == Power(n)
  {
    var n := 1;
    var p := ComputePower(n);
    expect p == 2;
  }

  // Test case for combination {1}/R3:
  //   POST: p == Power(n)
  {
    var n := 2;
    var p := ComputePower(n);
    expect p == 4;
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
