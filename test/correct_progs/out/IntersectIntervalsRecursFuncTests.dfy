// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\IntersectIntervalsRecursFunc.dfy
// Method: IntersectIntervals
// Generated: 2026-04-17 19:27:48

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
        l := if l > left[i] then l else left[i];
        r := if r < right[i] then r else right[i];
    }
    if l >= r {
        l := 0.0;
        r := 0.0;
    }
}


// Computes the maximum of the left limit and the minimum of the right limit of a group of intervals.
function Max(a: array<real>, len : nat := a.Length) : (res: real) 
  reads a
  requires 1 <= len <= a.Length
  ensures exists i :: 0 <= i < len && res == a[i]  
  ensures forall i :: 0 <= i < len ==> res >= a[i]
{
    if len == 1 then a[0] 
    else if Max(a, len-1) > a[len-1] then Max(a, len-1) 
    else a[len-1]
}

// Computes the minimum of an array.
function Min(a: array<real>, len : nat := a.Length) : (res: real) 
  reads a
  requires 1 <= len <= a.Length
  ensures exists i :: 0 <= i < len && res == a[i]  
  ensures forall i :: 0 <= i < len ==> res <= a[i]
{
    if len == 1 then a[0] 
    else if Min(a, len-1) < a[len-1] then Min(a, len-1) 
    else a[len-1]
}



method TestsForIntersectIntervals()
{
  // Test case for combination {1}:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: r == Min(right)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [-0.5];
    var right := new real[1] [0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == -0.5;
    expect r == 0.0;
  }

  // Test case for combination {2}:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: !(Max(left) < Min(right))
  //   POST: l == 0.0
  //   POST: r == 0.0
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[2] [2436.5, -0.5];
    var right := new real[2] [2437.0, 0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == 0.0;
  }

  // Test case for combination {1}/Ol=0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: r == Min(right)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [0.0];
    var right := new real[1] [0.25];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == 0.25;
  }

  // Test case for combination {1}/Ol>0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: r == Min(right)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [0.0625];
    var right := new real[1] [0.125];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0625;
    expect r == 0.125;
  }

}

method Main()
{
  TestsForIntersectIntervals();
  print "TestsForIntersectIntervals: all non-failing tests passed!\n";
}
