// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\IntersectIntervalsRecursFunc.dfy
// Method: IntersectIntervals
// Generated: 2026-04-02 18:20:01

// Compute the intersection of a non-empty array of non-empty closed intervals. 
// If the intersection is empty, by convention returns (0.0, 0.0).
method IntersectIntervals(left: array<real>, right: array<real>) returns (l : real, r: real)
  requires left.Length == right.Length 
  requires left.Length > 0
  requires forall i :: 0 <= i < left.Length ==> left[i] < right[i]  
  ensures l == if Max(left) < Min(right) then Max(left) else 0.0
  ensures r == if Max(left) < Min(right) then Min(right) else 0.0
{
    l := left[0];
    r := right[0];
    for i := 1 to left.Length 
      invariant l == Max(left, i)
      invariant r == Min(right, i)
    {
        l := Max2(l, left[i]);
        r := Min2(r, right[i]);
    }
    if l >= r {
        l := 0.0;
        r := 0.0;
    }
}


function Max2(a: real, b: real) : real {
    if a > b then a else b
}

function Min2(a: real, b: real) : real {
    if a < b then a else b
}

// Computes the maximum of the left limit and the minimum of the right limit of a group of intervals.
function Max(a: array<real>, len : nat := a.Length) : (res: real) 
  reads a
  requires 1 <= len <= a.Length
  ensures exists i :: 0 <= i < len && res == a[i]  
  ensures forall i :: 0 <= i < len ==> res >= a[i]
{
    if len == 1 then a[0] else Max2(Max(a, len-1), a[len-1])
}

// Computes the minimum of an array.
function Min(a: array<real>, len : nat := a.Length) : (res: real) 
  reads a
  requires 1 <= len <= a.Length
  ensures exists i :: 0 <= i < len && res == a[i]  
  ensures forall i :: 0 <= i < len ==> res <= a[i]
{
    if len == 1 then a[0] else Min2(Min(a, len-1), a[len-1])
}



method GeneratedTests_IntersectIntervals()
{
  // Test case for combination {1}:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   POST: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [0.0];
    var right := new real[1] [0.5];
    var l, r := IntersectIntervals(left, right);
    expect l == if Max(left) < Min(right) then Max(left) else 0.0;
    expect r == if Max(left) < Min(right) then Min(right) else 0.0;
  }

  // Test case for combination {1}/Bleft=2,right=2:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   POST: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[2] [2437.0, 2438.0];
    var right := new real[2] [2438.0, 2439.0];
    var l, r := IntersectIntervals(left, right);
    expect l == if Max(left) < Min(right) then Max(left) else 0.0;
    expect r == if Max(left) < Min(right) then Min(right) else 0.0;
  }

  // Test case for combination {1}/Bleft=3,right=3:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   POST: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[3] [11797.0, 11796.5, 11797.5];
    var right := new real[3] [11797.5, 11798.0, 11798.5];
    var l, r := IntersectIntervals(left, right);
    expect l == if Max(left) < Min(right) then Max(left) else 0.0;
    expect r == if Max(left) < Min(right) then Min(right) else 0.0;
  }

}

method Main()
{
  GeneratedTests_IntersectIntervals();
  print "GeneratedTests_IntersectIntervals: all tests passed!\n";
}
