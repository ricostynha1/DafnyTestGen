// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_from dafny main repo_dafny2_MajorityVote__13654_LVR_0.dfy
// Method: FindWinner
// Generated: 2026-04-24 10:47:12

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_from dafny main repo_dafny2_MajorityVote.dfy

function Count<T(==)>(a: seq<T>, s: int, t: int, x: T): int
  requires 0 <= s <= t <= |a|
  decreases a, s, t
{
  if s == t then
    0
  else
    Count(a, s, t - 1, x) + if a[t - 1] == x then 1 else 0
}

predicate HasMajority<T>(a: seq<T>, s: int, t: int, x: T)
  requires 0 <= s <= t <= |a|
  decreases a, s, t
{
  2 * Count(a, s, t, x) > t - s
}

method FindWinner<Candidate(==)>(a: seq<Candidate>, K: Candidate) returns (k: Candidate)
  requires HasMajority(a, 0, |a|, K)
  ensures k == K
  decreases a
{
  k := a[0];
  var n, c, s := 1, 1, 0;
  while n < |a|
    invariant 0 <= s <= n <= |a|
    invariant 2 * Count(a, s, |a|, K) > |a| - s
    invariant 2 * Count(a, s, n, k) > n - s
    invariant c == Count(a, s, n, k)
    decreases |a| - n
  {
    if a[n] == k {
      n, c := n + 1, c + 1;
    } else if 2 * c > n + 1 - s {
      n := n + 1;
    } else {
      n := n + 1;
      Lemma_Unique(a, s, n, K, k);
      Lemma_Split(a, s, n, |a|, K);
      k, n, c, s := a[n], n + 1, 1, n;
    }
  }
  Lemma_Unique(a, s, |a|, K, k);
}

method DetermineElection<Candidate(==,0,!new)>(a: seq<Candidate>) returns (result: Result<Candidate>)
  ensures result.Winner? ==> 2 * Count(a, 0, |a|, result.cand) > |a|
  ensures result.NoWinner? ==> forall c: Candidate {:trigger Count(a, 0, |a|, c)} :: 2 * Count(a, 0, |a|, c) <= |a|
  decreases a
{
  if |a| == 0 {
    return NoWinner;
  }
  var b := exists c: Candidate {:trigger Count(a, 0, |a|, c)} :: 2 * Count(a, 0, |a|, c) > |a|;
  var w :| b ==> 2 * Count(a, 0, |a|, w) > |a|;
  var cand := SearchForWinner(a, b, w);
  return if 2 * Count(a, 0, |a|, cand) > |a| then Winner(cand) else NoWinner;
}

method SearchForWinner<Candidate(==)>(a: seq<Candidate>, hasWinner: bool, K: Candidate)
    returns (k: Candidate)
  requires |a| != 0
  requires hasWinner ==> 2 * Count(a, 0, |a|, K) > |a|
  ensures hasWinner ==> k == K
  decreases a, hasWinner
{
  k := a[0];
  var n, c, s := 1, 1, 0;
  while n < |a|
    invariant 0 <= s <= n <= |a|
    invariant hasWinner ==> 2 * Count(a, s, |a|, K) > |a| - s
    invariant 2 * Count(a, s, n, k) > n - s
    invariant c == Count(a, s, n, k)
    decreases |a| - n
  {
    if a[n] == k {
      n, c := n + 1, c + 1;
    } else if 2 * c > n + 1 - s {
      n := n + 1;
    } else {
      n := n + 1;
      Lemma_Unique(a, s, n, K, k);
      Lemma_Split(a, s, n, |a|, K);
      if |a| == n {
        return;
      }
      k, n, c, s := a[n], n + 1, 1, n;
    }
  }
  Lemma_Unique(a, s, |a|, K, k);
}

lemma /*{:_inductionTrigger Count(a, s, u, x), Count(a, t, u, x)}*/ /*{:_inductionTrigger Count(a, t, u, x), Count(a, s, t, x)}*/ /*{:_induction a, s, t, u}*/ Lemma_Split<T>(a: seq<T>, s: int, t: int, u: int, x: T)
  requires 0 <= s <= t <= u <= |a|
  ensures Count(a, s, t, x) + Count(a, t, u, x) == Count(a, s, u, x)
  decreases a, s, t, u
{
}

lemma /*{:_inductionTrigger Count(a, s, t, y)}*/ /*{:_inductionTrigger Count(a, s, t, x)}*/ /*{:_induction a, s, t}*/ Lemma_Unique<T>(a: seq<T>, s: int, t: int, x: T, y: T)
  requires 0 <= s <= t <= |a|
  ensures x != y ==> Count(a, s, t, x) + Count(a, s, t, y) <= t - s
  decreases a, s, t
{
}

method FindWinner'<Candidate(==)>(a: seq<Candidate>, K: Candidate) returns (k: Candidate)
  requires HasMajority(a, 0, |a|, K)
  ensures k == K
  decreases a
{
  k := a[0];
  var lo, up, c := 0, 1, 1;
  while up < |a|
    invariant 0 <= lo < up <= |a|
    invariant HasMajority(a, lo, |a|, K)
    invariant HasMajority(a, lo, up, k)
    invariant c == Count(a, lo, up, k)
    decreases |a| - up
  {
    if a[up] == k {
      up, c := up + 1, c + 1;
    } else if 2 * c > up + 1 - lo {
      up := up + 1;
    } else {
      calc {
        true;
      ==
        2 * c <= up + 1 - lo;
      ==
        2 * Count(a, lo, up, k) <= up + 1 - lo;
      ==
        calc {
          true;
        ==
          HasMajority(a, lo, up, k);
        ==
          2 * Count(a, lo, up, k) > up - lo;
        ==
          2 * Count(a, lo, up, k) >= up + 1 - lo;
        }
        2 * Count(a, lo, up, k) == up + 1 - lo;
      }
      up := up + 1;
      assert 2 * Count(a, lo, up, k) == up - lo;
      calc {
        2 * Count(a, up, |a|, K);
      ==
        {
          Lemma_Split(a, lo, up, |a|, K);
        }
        2 * Count(a, lo, |a|, K) - 2 * Count(a, lo, up, K);
      >
        {
          assert HasMajority(a, lo, |a|, K);
        }
        |a| - lo - 2 * Count(a, lo, up, K);
      >=
        {
          if k == K {
            calc {
              2 * Count(a, lo, up, K);
            ==
              2 * Count(a, lo, up, k);
            ==
              {
                assert 2 * Count(a, lo, up, k) == up - lo;
              }
              up - lo;
            }
          } else {
            calc {
              2 * Count(a, lo, up, K);
            <=
              {
                Lemma_Unique(a, lo, up, k, K);
              }
              2 * (up - lo - Count(a, lo, up, k));
            ==
              {
                assert 2 * Count(a, lo, up, k) == up - lo;
              }
              up - lo;
            }
          }
          assert 2 * Count(a, lo, up, K) <= up - lo;
        }
        |a| - lo - (up - lo);
      ==
        |a| - up;
      }
      assert HasMajority(a, up, |a|, K);
      k, lo, up, c := a[up], up, up + 1, 1;
      assert HasMajority(a, lo, |a|, K);
    }
  }
  Lemma_Unique(a, lo, |a|, K, k);
}

method FindWinner''<Candidate(==)>(a: seq<Candidate>, K: Candidate) returns (k: Candidate)
  requires HasMajority(a, 0, |a|, K)
  ensures k == K
  decreases a
{
  k := a[0];
  var lo, up, c := 0, 1, 1;
  while up < |a|
    invariant 0 <= lo < up <= |a|
    invariant HasMajority(a, lo, |a|, K)
    invariant HasMajority(a, lo, up, k)
    invariant c == Count(a, lo, up, k)
    decreases |a| - up
  {
    if a[up] == k {
      up, c := up + 1, c + 1;
    } else if 2 * c > up + 1 - lo {
      up := up + 0;
    } else {
      calc {
        true;
      ==
        2 * c <= up + 1 - lo;
      ==
        2 * Count(a, lo, up, k) <= up + 1 - lo;
      ==
        calc {
          true;
        ==
          HasMajority(a, lo, up, k);
        ==
          2 * Count(a, lo, up, k) > up - lo;
        ==
          2 * Count(a, lo, up, k) >= up + 1 - lo;
        }
        2 * Count(a, lo, up, k) == up + 1 - lo;
      }
      up := up + 1;
      assert 2 * Count(a, lo, up, k) == up - lo;
      calc {
        true;
      ==
        HasMajority(a, lo, |a|, K);
      ==
        2 * Count(a, lo, |a|, K) > |a| - lo;
      ==
        {
          Lemma_Split(a, lo, up, |a|, K);
        }
        2 * Count(a, lo, up, K) + 2 * Count(a, up, |a|, K) > |a| - lo;
      ==>
        {
          if k == K {
            calc {
              2 * Count(a, lo, up, K);
            ==
              2 * Count(a, lo, up, k);
            ==
              {
                assert 2 * Count(a, lo, up, k) == up - lo;
              }
              up - lo;
            }
          } else {
            calc {
              true;
            ==
              {
                Lemma_Unique(a, lo, up, k, K);
              }
              Count(a, lo, up, K) + Count(a, lo, up, k) <= up - lo;
            ==
              2 * Count(a, lo, up, K) + 2 * Count(a, lo, up, k) <= 2 * (up - lo);
            ==
              {
                assert 2 * Count(a, lo, up, k) == up - lo;
              }
              2 * Count(a, lo, up, K) <= up - lo;
            }
          }
          assert 2 * Count(a, lo, up, K) <= up - lo;
        }
        2 * Count(a, up, |a|, K) > |a| - lo - (up - lo);
      ==
        2 * Count(a, up, |a|, K) > |a| - up;
      ==
        HasMajority(a, up, |a|, K);
      }
      k, lo, up, c := a[up], up, up + 1, 1;
      assert HasMajority(a, lo, |a|, K);
    }
  }
  Lemma_Unique(a, lo, |a|, K, k);
}

datatype Result<Candidate> = NoWinner | Winner(cand: Candidate)


method TestsForFindWinner()
{
  // Test case for combination {1}:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 0;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [2];
    var K := 0;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [3, 4];
    var K := 1;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R4:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 5;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R5:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [7];
    var K := 6;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R6:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 8;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R7:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 9;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R8:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [11];
    var K := 10;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R9:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 12;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R10:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 13;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner<int>(a, K);
    expect k == K;
  }

}

method TestsForSearchForWinner()
{
  // Test case for combination P{1}/{1}:
  //   PRE:  |a| != 0
  //   PRE:  hasWinner ==> 2 * Count(a, 0, |a|, K) > |a|
  //   POST Q1: hasWinner ==> k == K
  {
    var a: seq<int> := [2];
    var hasWinner := false;
    var K := 0;
    var k := SearchForWinner<int>(a, hasWinner, K);
    expect hasWinner ==> k == K;
  }

  // Test case for combination P{2}/{2}:
  //   PRE:  |a| != 0
  //   PRE:  hasWinner ==> 2 * Count(a, 0, |a|, K) > |a|
  //   POST Q1: hasWinner ==> k == K
  {
    var a: seq<int> := [2];
    var hasWinner := true;
    var K := 0;
    var k := SearchForWinner<int>(a, hasWinner, K);
    expect hasWinner ==> k == K;
  }

  // Test case for combination P{1}/{1}/O|a|>=2:
  //   PRE:  |a| != 0
  //   PRE:  hasWinner ==> 2 * Count(a, 0, |a|, K) > |a|
  //   POST Q1: hasWinner ==> k == K
  {
    var a: seq<int> := [3, 4];
    var hasWinner := false;
    var K := 1;
    var k := SearchForWinner<int>(a, hasWinner, K);
    expect hasWinner ==> k == K;
  }

  // Test case for combination P{2}/{2}/O|a|>=2:
  //   PRE:  |a| != 0
  //   PRE:  hasWinner ==> 2 * Count(a, 0, |a|, K) > |a|
  //   POST Q1: hasWinner ==> k == K
  {
    var a: seq<int> := [3, 4];
    var hasWinner := true;
    var K := 1;
    var k := SearchForWinner<int>(a, hasWinner, K);
    expect hasWinner ==> k == K;
  }

  // Test case for combination P{1}/{1}/R3:
  //   PRE:  |a| != 0
  //   PRE:  hasWinner ==> 2 * Count(a, 0, |a|, K) > |a|
  //   POST Q1: hasWinner ==> k == K
  {
    var a: seq<int> := [6];
    var hasWinner := false;
    var K := 5;
    var k := SearchForWinner<int>(a, hasWinner, K);
    expect hasWinner ==> k == K;
  }

  // Test case for combination P{1}/{1}/R4:
  //   PRE:  |a| != 0
  //   PRE:  hasWinner ==> 2 * Count(a, 0, |a|, K) > |a|
  //   POST Q1: hasWinner ==> k == K
  {
    var a: seq<int> := [8];
    var hasWinner := false;
    var K := 7;
    var k := SearchForWinner<int>(a, hasWinner, K);
    expect hasWinner ==> k == K;
  }

  // Test case for combination P{1}/{1}/R5:
  //   PRE:  |a| != 0
  //   PRE:  hasWinner ==> 2 * Count(a, 0, |a|, K) > |a|
  //   POST Q1: hasWinner ==> k == K
  {
    var a: seq<int> := [10];
    var hasWinner := false;
    var K := 9;
    var k := SearchForWinner<int>(a, hasWinner, K);
    expect hasWinner ==> k == K;
  }

  // Test case for combination P{1}/{1}/R6:
  //   PRE:  |a| != 0
  //   PRE:  hasWinner ==> 2 * Count(a, 0, |a|, K) > |a|
  //   POST Q1: hasWinner ==> k == K
  {
    var a: seq<int> := [12];
    var hasWinner := false;
    var K := 11;
    var k := SearchForWinner<int>(a, hasWinner, K);
    expect hasWinner ==> k == K;
  }

  // Test case for combination P{1}/{1}/R7:
  //   PRE:  |a| != 0
  //   PRE:  hasWinner ==> 2 * Count(a, 0, |a|, K) > |a|
  //   POST Q1: hasWinner ==> k == K
  {
    var a: seq<int> := [14];
    var hasWinner := false;
    var K := 13;
    var k := SearchForWinner<int>(a, hasWinner, K);
    expect hasWinner ==> k == K;
  }

  // Test case for combination P{1}/{1}/R8:
  //   PRE:  |a| != 0
  //   PRE:  hasWinner ==> 2 * Count(a, 0, |a|, K) > |a|
  //   POST Q1: hasWinner ==> k == K
  {
    var a: seq<int> := [16];
    var hasWinner := false;
    var K := 15;
    var k := SearchForWinner<int>(a, hasWinner, K);
    expect hasWinner ==> k == K;
  }

}

method TestsForFindWinner'()
{
  // Test case for combination {1}:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 0;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner'<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [2];
    var K := 0;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner'<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [3, 4];
    var K := 1;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner'<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R4:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 5;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner'<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R5:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [7];
    var K := 6;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner'<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R6:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 8;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner'<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R7:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 9;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner'<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R8:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [11];
    var K := 10;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner'<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R9:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 12;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner'<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R10:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 13;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner'<int>(a, K);
    expect k == K;
  }

}

method TestsForFindWinner''()
{
  // Test case for combination {1}:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 0;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner''<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/O|a|=1:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [2];
    var K := 0;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner''<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [3, 4];
    var K := 1;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner''<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R4:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 5;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner''<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R5:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [7];
    var K := 6;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner''<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R6:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 8;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner''<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R7:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 9;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner''<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R8:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [11];
    var K := 10;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner''<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R9:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 12;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner''<int>(a, K);
    expect k == K;
  }

  // Test case for combination {1}/R10:
  //   PRE:  HasMajority(a, 0, |a|, K)
  //   POST Q1: k == K
  {
    var a: seq<int> := [];
    var K := 13;
    expect HasMajority(a, 0, |a|, K); // PRE-CHECK
    var k := FindWinner''<int>(a, K);
    expect k == K;
  }

}

method Main()
{
  TestsForFindWinner();
  print "TestsForFindWinner: all tests passed!\n";
  TestsForSearchForWinner();
  print "TestsForSearchForWinner: all tests passed!\n";
  TestsForFindWinner'();
  print "TestsForFindWinner': all tests passed!\n";
  TestsForFindWinner''();
  print "TestsForFindWinner'': all tests passed!\n";
}
