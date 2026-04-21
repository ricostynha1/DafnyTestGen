// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Programmverifikation-und-synthese_tmp_tmppurk6ime_PVS_Assignment_ex_10_Hoangkim_ex10_hoangkim__1049_ROR_Eq.dfy
// Method: square0
// Generated: 2026-04-08 16:23:02

// Programmverifikation-und-synthese_tmp_tmppurk6ime_PVS_Assignment_ex_10_Hoangkim_ex10_hoangkim.dfy

method square0(n: nat) returns (sqn: nat)
  ensures sqn == n * n
  decreases n
{
  sqn := 0;
  var i := 0;
  var x;
  while i < n
    invariant i <= n && sqn == i * i
    decreases n - i
  {
    x := 2 * i + 1;
    sqn := sqn + x;
    i := i + 1;
  }
}

method square1(n: nat) returns (sqn: nat)
  ensures sqn == n * n
  decreases n
{
  sqn := 0;
  var i := 0;
  while i == n
    invariant i <= n && sqn == i * i
  {
    var x := 2 * i + 1;
    sqn := sqn + x;
    i := i + 1;
  }
}

method q(x: nat, y: nat) returns (z: nat)
  requires y - x > 2
  ensures x < z * z < y
  decreases x, y

method strange()
  ensures 1 == 2
{
  var x := 4;
  var c: nat := q(x, 2 * x);
}

method test0()
{
  var x: int := *;
  assume x * x < 100;
  assert x <= 9;
}


method GeneratedTests_square0()
{
  // Test case for combination {1}:
  //   POST: sqn == n * n
  //   ENSURES: sqn == n * n
  {
    var n := 0;
    var sqn := square0(n);
    expect sqn == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST: sqn == n * n
  //   ENSURES: sqn == n * n
  {
    var n := 1;
    var sqn := square0(n);
    expect sqn == 1;
  }

  // Test case for combination {1}/Osqn>=2:
  //   POST: sqn == n * n
  //   ENSURES: sqn == n * n
  {
    var n := 2;
    var sqn := square0(n);
    expect sqn == 4;
  }

}

method GeneratedTests_square1()
{
  // Test case for combination {1}:
  //   POST: sqn == n * n
  //   ENSURES: sqn == n * n
  {
    var n := 0;
    var sqn := square1(n);
    expect sqn == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST: sqn == n * n
  //   ENSURES: sqn == n * n
  {
    var n := 1;
    var sqn := square1(n);
    expect sqn == 1;
  }

  // Test case for combination {1}/Osqn>=2:
  //   POST: sqn == n * n
  //   ENSURES: sqn == n * n
  {
    var n := 2;
    var sqn := square1(n);
    expect sqn == 4;
  }

}

method Main()
{
  GeneratedTests_square0();
  print "GeneratedTests_square0: all tests passed!\n";
  GeneratedTests_square1();
  print "GeneratedTests_square1: all tests passed!\n";
}
