// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\not_supported\Dafny_tmp_tmp0wu8wmfr_Heimaverkefni 2_BinarySearchDec__873_AOR_Mod.dfy
// Method: SearchRecursive
// Generated: 2026-04-05 22:48:49

// Dafny_tmp_tmp0wu8wmfr_Heimaverkefni 2_BinarySearchDec.dfy

method SearchRecursive(a: seq<real>, i: int, j: int, x: real)
    returns (k: int)
  requires 0 <= i <= j <= |a|
  requires forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  ensures i <= k <= j
  ensures forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  ensures forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  decreases j - i
{
  if i == j {
    return i;
  }
  var m := i + (j - i) % 2;
  if a[m] < x {
    k := SearchRecursive(a, i, m, x);
  } else {
    k := SearchRecursive(a, m + 1, j, x);
  }
}

method SearchLoop(a: seq<real>, i: int, j: int, x: real)
    returns (k: int)
  requires 0 <= i <= j <= |a|
  requires forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  ensures i <= k <= j
  ensures forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  ensures forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  decreases a, i, j, x
{
  if i == j {
    return i;
  }
  var p := i;
  var q := j;
  while p != q
    invariant i <= p <= q <= j
    invariant forall r: int {:trigger a[r]} | i <= r < p :: a[r] >= x
    invariant forall r: int {:trigger a[r]} | q <= r < j :: a[r] < x
    decreases q - p
  {
    var m := p + (q - p) / 2;
    if a[m] < x {
      q := m;
    } else {
      p := m + 1;
    }
  }
  return p;
}

method Test(a: seq<real>, x: real)
  requires forall p: int, q: int {:trigger a[q], a[p]} | 0 <= p < q < |a| :: a[p] >= a[q]
  decreases a, x
{
  var k1 := SearchLoop(a, 0, |a|, x);
  assert forall r: int {:trigger a[r]} | 0 <= r < k1 :: a[r] >= x;
  assert forall r: int {:trigger a[r]} | k1 <= r < |a| :: a[r] < x;
  var k2 := SearchRecursive(a, 0, |a|, x);
  assert forall r: int {:trigger a[r]} | 0 <= r < k2 :: a[r] >= x;
  assert forall r: int {:trigger a[r]} | k2 <= r < |a| :: a[r] < x;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST: i <= k <= j
  //   POST: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [11.0];
    var i := 1;
    var j := 1;
    var x := 0.5;
    var k := SearchRecursive(a, i, j, x);
    expect k == 1;
  }

  // Test case for combination {1}/Bi=0,j=0,x=0.0:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST: i <= k <= j
  //   POST: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [];
    var i := 0;
    var j := 0;
    var x := 0.0;
    var k := SearchRecursive(a, i, j, x);
    expect k == 0;
  }

  // Test case for combination {1}/Bi==j,j=1,x=1.0:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST: i <= k <= j
  //   POST: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [2.0];
    var i := 1;
    var j := 1;
    var x := 1.0;
    var k := SearchRecursive(a, i, j, x);
    expect k == 1;
  }

  // Test case for combination {1}/Bi==j,j=1,x=0.0:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST: i <= k <= j
  //   POST: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [2.0];
    var i := 1;
    var j := 1;
    var x := 0.0;
    var k := SearchRecursive(a, i, j, x);
    expect k == 1;
  }

  // Test case for combination {1}:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST: i <= k <= j
  //   POST: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [11.0];
    var i := 1;
    var j := 1;
    var x := 0.5;
    var k := SearchLoop(a, i, j, x);
    expect k == 1;
  }

  // Test case for combination {1}/Bi=0,j=0,x=0.0:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST: i <= k <= j
  //   POST: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [];
    var i := 0;
    var j := 0;
    var x := 0.0;
    var k := SearchLoop(a, i, j, x);
    expect k == 0;
  }

  // Test case for combination {1}/Bi==j,j=1,x=1.0:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST: i <= k <= j
  //   POST: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [2.0];
    var i := 1;
    var j := 1;
    var x := 1.0;
    var k := SearchLoop(a, i, j, x);
    expect k == 1;
  }

  // Test case for combination {1}/Bi==j,j=1,x=0.0:
  //   PRE:  0 <= i <= j <= |a|
  //   PRE:  forall p: int, q: int {:trigger a[q], a[p]} :: i <= p < q < j ==> a[p] >= a[q]
  //   POST: i <= k <= j
  //   POST: forall r: int {:trigger a[r]} | i <= r < k :: a[r] >= x
  //   POST: forall r: int {:trigger a[r]} | k <= r < j :: a[r] < x
  {
    var a: seq<real> := [2.0];
    var i := 1;
    var j := 1;
    var x := 0.0;
    var k := SearchLoop(a, i, j, x);
    expect k == 1;
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
