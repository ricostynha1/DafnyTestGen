// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\IntersectIntervalsRecursFunc.dfy
// Method: IntersectIntervals
// Generated: 2026-04-23 20:25:40

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
  //   POST Q1: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   POST Q2: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [-1.0];
    var right := new real[1] [0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == -1.0;
    expect r == 0.0;
  }

  // Test case for combination {4}:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   POST Q2: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[2] [-0.5, 1.0];
    var right := new real[2] [0.0, 1.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == 0.0;
  }

  // Test case for combination {1}/Ol=0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   POST Q2: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [0.0];
    var right := new real[1] [0.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == 0.5;
  }

  // Test case for combination {1}/Ol>0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   POST Q2: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [0.125];
    var right := new real[1] [0.25];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.125;
    expect r == 0.25;
  }

  // Test case for combination {1}/Or<0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   POST Q2: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [-1.5];
    var right := new real[1] [-0.5];
    var l, r := IntersectIntervals(left, right);
    expect l == -1.5;
    expect r == -0.5;
  }

  // Test case for combination {4}/Ol=0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   POST Q2: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[2] [28778.75, 0.0];
    var right := new real[2] [28779.0, 0.25];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == 0.0;
  }

  // Test case for combination {4}/Ol<0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   POST Q2: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[2] [4003.75, -0.25];
    var right := new real[2] [4004.0, 0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == 0.0;
  }

  // Test case for combination {4}/Or<0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   POST Q2: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[2] [13850.0, -2.0];
    var right := new real[2] [13851.0, -1.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == 0.0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   POST Q2: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [-2.0];
    var right := new real[1] [1.5];
    var l, r := IntersectIntervals(left, right);
    expect l == -2.0;
    expect r == 1.5;
  }

  // Test case for combination {1}/R6:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   POST Q2: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [0.375];
    var right := new real[1] [0.625];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.375;
    expect r == 0.625;
  }

}

method Main()
{
  TestsForIntersectIntervals();
  print "TestsForIntersectIntervals: all non-failing tests passed!\n";
}
