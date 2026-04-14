// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\CombNK.dfy
// Method: CalcComb
// Generated: 2026-04-14 16:21:58

/* 
* Formal specification and verification of a dynamic programming algorithm for calculating
* the binomial coefficient C(n, k).
*/

// Initial recursive definition of C(n, k), based on the Pascal equality.
function Comb(n: nat, k: nat): nat 
  requires 0 <= k <= n
{
  if k == 0 || k == n then 1 else Comb(n-1, k) + Comb(n-1, k-1)  
}

// Iterative calcultion of C(n, k) in time O(k*(n-k)) and space O(n-k), using dynamic programming.
method CalcComb(n: nat, k: nat) returns (res: nat) 
  requires 0 <= k <= n
  ensures res == Comb(n, k)
{
  var maxj := n - k;
  var c := new nat[maxj + 1]; // contains the values of the ascending diagonal in the Pascal triangle

  // Initialize the left-most ascending diagonal of the Pascal triangle
  forall  j | 0 <= j <= maxj {
       c[j] := 1; // Comb(j, 0)
  }

  // At the begin of each iteration 'i', c[k] contains Comb(k + i - 1, i - 1)
  for i := 1 to k + 1 
    invariant forall j :: 0 <= j <= maxj ==> c[j] == Comb(j + i - 1, i - 1)
  {
    // Compute the values of the next ascending diagonal in the Pascal triangle
    for j := 1 to maxj + 1
        invariant forall k :: 0 <= k < j ==> c[k] == Comb(k + i, i) // from this iteration
        invariant forall k :: j <= k <= maxj ==> c[k] == Comb(k + i - 1, i - 1) // from previous iteration
    {
      // At this point c[j] contains Comb(j+i-1, i-1)  (not updated yet) 
      // and c[j-1] contains Comb(j-1+i, i) (already updated)
      c[j] := c[j] + c[j-1];   
      // At this point c[j] contains Comb(j+i, i)
    } 
  }
  return c[maxj];
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  0 <= k <= n
  //   POST: res == Comb(n, k)
  //   POST: res == 1
  //   ENSURES: res == Comb(n, k)
  {
    var n := 1;
    var k := 0;
    var res := CalcComb(n, k);
    expect res == 1;
  }

  // Test case for combination {2}:
  //   PRE:  0 <= k <= n
  //   POST: !(k == 0 || k == n)
  //   POST: res == Comb(n - 1, k) + Comb(n - 1, k - 1)
  //   ENSURES: res == Comb(n, k)
  {
    var n := 40;
    var k := 39;
    var res := CalcComb(n, k);
    expect res == 40;
  }

  // Test case for combination {1}/Bn=0,k==n:
  //   PRE:  0 <= k <= n
  //   POST: res == Comb(n, k)
  //   POST: res == 1
  //   ENSURES: res == Comb(n, k)
  {
    var n := 0;
    var k := 0;
    var res := CalcComb(n, k);
    expect res == 1;
  }

  // Test case for combination {1}/Bn=1,k==n:
  //   PRE:  0 <= k <= n
  //   POST: res == Comb(n, k)
  //   POST: res == 1
  //   ENSURES: res == Comb(n, k)
  {
    var n := 1;
    var k := 1;
    var res := CalcComb(n, k);
    expect res == 1;
  }

  // Test case for combination {1}/Ores=1:
  //   PRE:  0 <= k <= n
  //   POST: res == Comb(n, k)
  //   POST: res == 1
  //   ENSURES: res == Comb(n, k)
  {
    var n := 2;
    var k := 2;
    var res := CalcComb(n, k);
    expect res == 1;
  }

  // Test case for combination {2}/Ores>=2:
  //   PRE:  0 <= k <= n
  //   POST: !(k == 0 || k == n)
  //   POST: res == Comb(n - 1, k) + Comb(n - 1, k - 1)
  //   ENSURES: res == Comb(n, k)
  {
    var n := 7;
    var k := 6;
    var res := CalcComb(n, k);
    expect res == 7;
  }

  // Test case for combination {2}/Ores=1:
  //   PRE:  0 <= k <= n
  //   POST: !(k == 0 || k == n)
  //   POST: res == Comb(n - 1, k) + Comb(n - 1, k - 1)
  //   ENSURES: res == Comb(n, k)
  {
    var n := 6;
    var k := 5;
    var res := CalcComb(n, k);
    expect res == 6;
  }

  // Test case for combination {2}/Ores=0:
  //   PRE:  0 <= k <= n
  //   POST: !(k == 0 || k == n)
  //   POST: res == Comb(n - 1, k) + Comb(n - 1, k - 1)
  //   ENSURES: res == Comb(n, k)
  {
    var n := 4;
    var k := 3;
    var res := CalcComb(n, k);
    expect res == 4;
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
