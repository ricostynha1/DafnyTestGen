// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Programmverifikation-und-synthese_tmp_tmppurk6ime_PVS_Assignment_ex_10_Hoangkim_ex10_hoangkim.dfy
// Method: square0
// Generated: 2026-03-25 22:40:54

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
  while i < n
    invariant i <= n && sqn == i * i
    decreases n - i
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
  {
    var n := 0;
    var sqn := square0(n);
    expect sqn == 0;
  }

  // Test case for combination {1}:
  //   POST: sqn == n * n
  {
    var n := 1;
    var sqn := square0(n);
    expect sqn == 1;
  }

  // Test case for combination {1}/R3:
  //   POST: sqn == n * n
  {
    var n := 3;
    var sqn := square0(n);
    expect sqn == 9;
  }

}

method GeneratedTests_square1()
{
  // Test case for combination {1}:
  //   POST: sqn == n * n
  {
    var n := 0;
    var sqn := square1(n);
    expect sqn == 0;
  }

  // Test case for combination {1}:
  //   POST: sqn == n * n
  {
    var n := 1;
    var sqn := square1(n);
    expect sqn == 1;
  }

  // Test case for combination {1}/R3:
  //   POST: sqn == n * n
  {
    var n := 3;
    var sqn := square1(n);
    expect sqn == 9;
  }

}

method GeneratedTests_q()
{
  // Test case for combination {1}:
  //   PRE:  y - x > 2
  //   POST: x < z * z < y
  {
    var x := 0;
    var y := 7;
    var z := q(x, y);
    expect z == 1;
  }

  // Test case for combination {1}:
  //   PRE:  y - x > 2
  //   POST: x < z * z < y
  {
    var x := 2;
    var y := 7;
    var z := q(x, y);
    expect z == 2;
  }

  // Test case for combination {1}/R3:
  //   PRE:  y - x > 2
  //   POST: x < z * z < y
  {
    var x := 2;
    var y := 5;
    var z := q(x, y);
    expect z == 2;
  }

}

method Main()
{
  GeneratedTests_square0();
  print "GeneratedTests_square0: all tests passed!\n";
  GeneratedTests_square1();
  print "GeneratedTests_square1: all tests passed!\n";
  GeneratedTests_q();
  print "GeneratedTests_q: all tests passed!\n";
}
