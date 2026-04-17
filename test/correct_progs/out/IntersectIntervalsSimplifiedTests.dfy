// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\IntersectIntervalsSimplified.dfy
// Method: IntersectIntervals
// Generated: 2026-04-17 13:33:20

// Compute the intersection of a non-empty array of non-empty closed intervals. 
method IntersectIntervals(left: array<real>, right: array<real>) returns (l : real, r: real)
  requires left.Length == right.Length 
  requires left.Length > 0
  requires forall i :: 0 <= i < left.Length ==> left[i] < right[i]  
  ensures IsMax(left, l) && IsMin(right, r) 
{
    l := left[0];
    r := right[0];
    for i := 1 to left.Length 
      invariant IsMax(left, l, i)
      invariant IsMin(right, r, i)
    {
        l := Max(l, left[i]);
        r := Min(r, right[i]);
    }
}


function Max(a: real, b: real) : real {
    if a > b then a else b
}

function Min(a: real, b: real) : real {
    if a < b then a else b
}

// Computes the maximum of the left limit and the minimum of the right limit of a group of intervals.
predicate IsMax(a: array<real>, max: real, len : nat := a.Length)
  requires 1 <= len <= a.Length
  reads a
{
  (exists i :: 0 <= i < len && max == a[i]) 
  && (forall i :: 0 <= i < len ==> max >= a[i])
}

// Computes the minimum of an array.
predicate IsMin(a: array<real>, min: real, len : nat := a.Length)
  requires 1 <= len <= a.Length
  reads a
{
  (exists i :: 0 <= i < len && min == a[i]) 
  && (forall i :: 0 <= i < len ==> min <= a[i])
}




method TestsForIntersectIntervals()
{
  // Test case for combination {1}:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: IsMax(left, l)
  //   POST: IsMin(right, r)
  //   POST: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST: 0 <= (right.Length - 1)
  //   POST: r == right[0]
  //   POST: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  //   ENSURES: IsMax(left, l) && IsMin(right, r)
  {
    var left := new real[1] [0.0];
    var right := new real[1] [0.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == 0.5;
  }

  // Test case for combination {2}:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: IsMax(left, l)
  //   POST: IsMin(right, r)
  //   POST: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST: exists i :: 1 <= i < (right.Length - 1) && r == right[i]
  //   POST: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  //   ENSURES: IsMax(left, l) && IsMin(right, r)
  {
    var left := new real[3] [-0.5, -0.5, -0.5];
    var right := new real[3] [0.0, 0.0, 0.5];
    var l, r := IntersectIntervals(left, right);
    expect l == -0.5;
    expect r == 0.0;
  }

  // Test case for combination {7}:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: exists i :: 1 <= i < (left.Length - 1) && l == left[i]
  //   POST: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST: 0 <= (right.Length - 1)
  //   POST: r == right[(right.Length - 1)]
  //   POST: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  //   ENSURES: IsMax(left, l) && IsMin(right, r)
  {
    var left := new real[3] [0.0, 0.0, -38.5];
    var right := new real[3] [0.5, 21238.5, -38.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == -38.0;
  }

  // Test case for combination {11}/Q|left|>=2:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: IsMax(left, l)
  //   POST: l == left[(left.Length - 1)]
  //   POST: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST: 0 <= (right.Length - 1)
  //   POST: r == right[(right.Length - 1)]
  //   POST: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  //   ENSURES: IsMax(left, l) && IsMin(right, r)
  {
    var left := new real[2] [0.0, 0.0];
    var right := new real[2] [7719.5, 0.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == 0.5;
  }

}

method Main()
{
  TestsForIntersectIntervals();
  print "TestsForIntersectIntervals: all non-failing tests passed!\n";
}
