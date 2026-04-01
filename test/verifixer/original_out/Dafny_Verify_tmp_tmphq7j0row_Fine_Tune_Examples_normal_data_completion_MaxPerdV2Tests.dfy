// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Dafny_Verify_tmp_tmphq7j0row_Fine_Tune_Examples_normal_data_completion_MaxPerdV2.dfy
// Method: max
// Generated: 2026-04-01 13:49:58

// Dafny_Verify_tmp_tmphq7j0row_Fine_Tune_Examples_normal_data_completion_MaxPerdV2.dfy

function contains(v: int, a: array<int>, n: int): bool
  requires n <= a.Length
  reads a
  decreases {a}, v, a, n
{
  exists j: int {:trigger a[j]} :: 
    0 <= j < n &&
    a[j] == v
}

function upper_bound(v: int, a: array<int>, n: int): bool
  requires n <= a.Length
  reads a
  decreases {a}, v, a, n
{
  forall j: int {:trigger a[j]} :: 
    0 <= j < n ==>
      a[j] <= v
}

function is_max(m: int, a: array<int>, n: int): bool
  requires n <= a.Length
  reads a
  decreases {a}, m, a, n
{
  contains(m, a, n) &&
  upper_bound(m, a, n)
}

method max(a: array<int>, n: int) returns (max: int)
  requires 0 < n <= a.Length
  ensures is_max(max, a, n)
  decreases a, n
{
  var i: int := 1;
  max := a[0];
  while i < n
    invariant i <= n
    invariant is_max(max, a, i)
    decreases n - i
  {
    if a[i] > max {
      max := a[i];
    }
    i := i + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  0 < n <= a.Length
  //   POST: is_max(max, a, n)
  {
    var a := new int[1] [4];
    var n := 1;
    expect 0 < n <= a.Length; // PRE-CHECK
    var max := max(a, n);
    // expect max == 4; // (actual runtime value — not uniquely determined by spec)
    expect is_max(max, a, n);
  }

  // Test case for combination {1}/Ba=2,n=1:
  //   PRE:  0 < n <= a.Length
  //   POST: is_max(max, a, n)
  {
    var a := new int[2] [4, 3];
    var n := 1;
    expect 0 < n <= a.Length; // PRE-CHECK
    var max := max(a, n);
    // expect max == 4; // (actual runtime value — not uniquely determined by spec)
    expect is_max(max, a, n);
  }

  // Test case for combination {1}/Ba=2,n=2:
  //   PRE:  0 < n <= a.Length
  //   POST: is_max(max, a, n)
  {
    var a := new int[2] [4, 3];
    var n := 2;
    expect 0 < n <= a.Length; // PRE-CHECK
    var max := max(a, n);
    // expect max == 4; // (actual runtime value — not uniquely determined by spec)
    expect is_max(max, a, n);
  }

  // Test case for combination {1}/Ba=3,n=1:
  //   PRE:  0 < n <= a.Length
  //   POST: is_max(max, a, n)
  {
    var a := new int[3] [5, 4, 6];
    var n := 1;
    expect 0 < n <= a.Length; // PRE-CHECK
    var max := max(a, n);
    // expect max == 5; // (actual runtime value — not uniquely determined by spec)
    expect is_max(max, a, n);
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
