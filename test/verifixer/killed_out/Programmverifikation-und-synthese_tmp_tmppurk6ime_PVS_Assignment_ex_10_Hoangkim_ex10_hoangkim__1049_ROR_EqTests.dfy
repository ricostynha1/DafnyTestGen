// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Programmverifikation-und-synthese_tmp_tmppurk6ime_PVS_Assignment_ex_10_Hoangkim_ex10_hoangkim__1049_ROR_Eq.dfy
// Method: square0
// Generated: 2026-04-22 21:56:04

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


method TestsForsquare0()
{
  // Test case for combination {1}:
  //   POST Q1: sqn == n * n
  {
    var n := 10;
    var sqn := square0(n);
    expect sqn == 100;
  }

  // Test case for combination {1}/Bn=0:
  //   POST Q1: sqn == n * n
  {
    var n := 0;
    var sqn := square0(n);
    expect sqn == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST Q1: sqn == n * n
  {
    var n := 1;
    var sqn := square0(n);
    expect sqn == 1;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: sqn == n * n
  {
    var n := 9;
    var sqn := square0(n);
    expect sqn == 81;
  }

}

method TestsForsquare1()
{
  // Test case for combination {1}:
  //   POST Q1: sqn == n * n
  {
    var n := 10;
    var sqn := square1(n);
    expect sqn == 100;
  }

  // Test case for combination {1}/Bn=0:
  //   POST Q1: sqn == n * n
  {
    var n := 0;
    var sqn := square1(n);
    expect sqn == 0;
  }

  // Test case for combination {1}/Bn=1:
  //   POST Q1: sqn == n * n
  {
    var n := 1;
    var sqn := square1(n);
    expect sqn == 1;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: sqn == n * n
  {
    var n := 9;
    var sqn := square1(n);
    expect sqn == 81;
  }

}

method TestsForq()
{
  // Test case for combination {1}/Rel:
  //   PRE:  y - x > 2
  //   POST Q1: x < z * z
  //   POST Q2: z * z < y
  {
    var x := 3;
    var y := 6;
    // var z := q(x, y);
    // expect z == 2;
  }

  // Test case for combination {1}/Bx=4:
  //   PRE:  y - x > 2
  //   POST Q1: x < z * z
  //   POST Q2: z * z < y
  {
    var x := 4;
    var y := 10;
    // var z := q(x, y);
    // expect z == 3;
  }

  // Test case for combination {1}/Bz=1:
  //   PRE:  y - x > 2
  //   POST Q1: x < z * z
  //   POST Q2: z * z < y
  {
    var x := 0;
    var y := 10;
    // var z := q(x, y);
    // expect z == 1 || z == 2 || z == 3;
  }

  // Test case for combination {1}/Ox=1:
  //   PRE:  y - x > 2
  //   POST Q1: x < z * z
  //   POST Q2: z * z < y
  {
    var x := 1;
    var y := 10;
    // var z := q(x, y);
    // expect z == 2 || z == 3;
  }

}

method Main()
{
  TestsForsquare0();
  print "TestsForsquare0: all tests passed!\n";
  TestsForsquare1();
  print "TestsForsquare1: all tests passed!\n";
  TestsForq();
  print "TestsForq: all tests passed!\n";
}
