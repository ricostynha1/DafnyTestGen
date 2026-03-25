// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Correctness_tmp_tmpwqvg5q_4_MethodCalls_q1__3231_LVR_2.dfy
// Method: ComputeFusc
// Generated: 2026-03-25 22:47:07

// Correctness_tmp_tmpwqvg5q_4_MethodCalls_q1.dfy

function fusc(n: int): nat
  decreases n

lemma rule1()
  ensures fusc(0) == 0

lemma rule2()
  ensures fusc(1) == 1

lemma rule3(n: nat)
  ensures fusc(2 * n) == fusc(n)
  decreases n

lemma rule4(n: nat)
  ensures fusc(2 * n + 1) == fusc(n) + fusc(n + 1)
  decreases n

method ComputeFusc(N: int) returns (b: int)
  requires N >= 0
  ensures b == fusc(N)
  decreases N
{
  b := 0;
  var n, a := N, 1;
  assert 0 <= n <= N;
  assert fusc(N) == a * fusc(n) + b * fusc(n + 1);
  while n != 0
    invariant 0 <= n <= N
    invariant fusc(N) == a * fusc(n) + b * fusc(n + 1)
    decreases n
  {
    ghost var d := n;
    assert fusc(N) == a * fusc(n) + b * fusc(n + 1);
    assert n != 0;
    assert (n % 2 != 0 && n % 2 == 0) || fusc(N) == a * fusc(n) + b * fusc(n + 1);
    assert n % 2 != 0 || n % 2 == 0 ==> fusc(N) == a * fusc(n) + b * fusc(n + 1);
    assert n % 2 != 0 || fusc(N) == a * fusc(n) + b * fusc(n + 1);
    assert n % 2 == 0 || fusc(N) == a * fusc(n) + b * fusc(n + 1);
    assert n % 2 == 0 ==> fusc(N) == a * fusc(n) + b * fusc(n + 1);
    assert n % 2 != 0 ==> fusc(N) == a * fusc(n) + b * fusc(n + 1);
    if n % 2 == 0 {
      rule4(n / 2);
      assert fusc(n / 2 + 1) == fusc(n + 1) - fusc(n / 2);
      rule3(n / 2);
      assert fusc(n / 2) == fusc(n);
      assert fusc(N) == (a + b) * fusc(n / 2) + b * fusc(n / 2 + 1);
      a := a + b;
      assert fusc(N) == a * fusc(n / 2) + b * fusc(n / 2 + 1);
      n := n / 2;
      assert fusc(N) == a * fusc(n) + b * fusc(n + 1);
    } else {
      rule4((n - 1) / 2);
      assert fusc(n) - fusc((n - 1) / 2) == fusc((n - 1) / 2 + 1);
      rule3((n - 1) / 2);
      assert fusc((n - 1) / 2) == fusc(n - 1);
      assert fusc((n - 1) / 2 + 1) == fusc((n + 1) / 2);
      rule3((n + 1) / 2);
      assert fusc((n + 1) / 2) == fusc(n + 1);
      assert fusc(N) == a * fusc(n) + b * fusc(n + 1);
      assert fusc(N) == b * fusc((n - 1) / 2 + 1) + a * fusc(n);
      assert fusc(N) == b * fusc(n) - b * fusc(n) + b * fusc((n - 1) / 2 + 1) + a * fusc(n);
      assert fusc(N) == b * fusc(n) - b * (fusc(n) - fusc((n - 1) / 2 + 1)) + a * fusc(n);
      assert fusc(N) == b * fusc(n) - b * fusc((n - 1) / 2) + a * fusc(n);
      assert fusc(N) == b * fusc(n) - b * fusc(n - 1) + a * fusc(n);
      assert fusc(N) == b * fusc(n) - b * fusc(n - 1) + a * fusc(n);
      assert fusc(N) == a * fusc(n - 1) + b * fusc(n) - b * fusc(n - 1) + a * fusc(n) - a * fusc(n - 1);
      assert fusc(N) == a * fusc(n - 1) + (b + a) * (fusc(n) - fusc(n - 1));
      assert fusc(N) == a * fusc(n - 1) + (b + a) * (fusc(n) - fusc((n - 1) / 2));
      assert fusc(N) == a * fusc((n - 1) / 2) + (b + a) * fusc((n - 1) / 2 + 1);
      b := b + a;
      assert fusc(N) == a * fusc((n - 1) / 2) + b * fusc((n - 1) / 2 + 1);
      n := (n - 2) / 2;
      assert fusc(N) == a * fusc(n) + b * fusc(n + 1);
    }
    assert n < d;
    assert fusc(N) == a * fusc(n) + b * fusc(n + 1);
  }
  assert n == 0;
  rule1();
  assert fusc(0) == 0;
  rule2();
  assert fusc(1) == 1;
  assert fusc(N) == a * fusc(0) + b * fusc(0 + 1);
  assert fusc(N) == a * 0 + b * 1;
  assert b == fusc(N);
}


method GeneratedTests_ComputeFusc()
{
  // Test case for combination {1}:
  //   PRE:  N >= 0
  //   POST: b == fusc(N)
  {
    var N := 0;
    var b := ComputeFusc(N);
    expect b == fusc(N);
  }

  // Test case for combination {1}:
  //   PRE:  N >= 0
  //   POST: b == fusc(N)
  {
    var N := 1;
    var b := ComputeFusc(N);
    expect b == fusc(N);
  }

  // Test case for combination {1}/R3:
  //   PRE:  N >= 0
  //   POST: b == fusc(N)
  {
    var N := 2;
    var b := ComputeFusc(N);
    expect b == fusc(N);
  }

}

method Main()
{
  GeneratedTests_ComputeFusc();
  print "GeneratedTests_ComputeFusc: all tests passed!\n";
}
