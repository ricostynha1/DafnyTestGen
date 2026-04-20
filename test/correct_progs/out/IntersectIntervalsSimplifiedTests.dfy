// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\IntersectIntervalsSimplified.dfy
// Method: IntersectIntervals
// Generated: 2026-04-20 09:02:55

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
  // Test case for combination {2}/Rel:
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
    var left := new real[4] [-18102.25, -18102.25, -18102.25, -18102.25];
    var right := new real[4] [11692.0, 0.0, 0.5, 0.25];
    var l, r := IntersectIntervals(left, right);
    expect l == -18102.25;
    expect r == 0.0;
  }

  // Test case for combination {4}/Rel:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: IsMax(left, l)
  //   POST: IsMin(right, r)
  //   POST: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST: exists i, i_2 | 0 <= i && i < i_2 && i_2 <= (right.Length - 1) :: (r == right[i]) && (r == right[i_2])
  //   POST: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  //   ENSURES: IsMax(left, l) && IsMin(right, r)
  {
    var left := new real[4] [0.0, -0.5, -29794.0, -11692.5];
    var right := new real[4] [0.5, 0.0, 0.5, 0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == 0.0;
  }

  // Test case for combination {6}/Rel:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: exists i :: 1 <= i < (left.Length - 1) && l == left[i]
  //   POST: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST: exists i :: 1 <= i < (right.Length - 1) && r == right[i]
  //   POST: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  //   ENSURES: IsMax(left, l) && IsMin(right, r)
  {
    var left := new real[4] [-46025.0, -39326.0, -39327.5, -39326.5];
    var right := new real[4] [-39326.0, -39325.5, -39327.0, 25189.5];
    var l, r := IntersectIntervals(left, right);
    expect l == -39326.0;
    expect r == -39327.0;
  }

  // Test case for combination {8}/Rel:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: exists i :: 1 <= i < (left.Length - 1) && l == left[i]
  //   POST: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST: exists i, i_2 | 0 <= i && i < i_2 && i_2 <= (right.Length - 1) :: (r == right[i]) && (r == right[i_2])
  //   POST: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  //   ENSURES: IsMax(left, l) && IsMin(right, r)
  {
    var left := new real[4] [36881.0, 36881.0, 36881.5, 19231.0];
    var right := new real[4] [36882.5, 36882.0, 36882.0, 36882.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 36881.5;
    expect r == 36882.0;
  }

  // Test case for combination {10}/Rel:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: IsMax(left, l)
  //   POST: l == left[(left.Length - 1)]
  //   POST: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST: exists i :: 1 <= i < (right.Length - 1) && r == right[i]
  //   POST: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  //   ENSURES: IsMax(left, l) && IsMin(right, r)
  {
    var left := new real[4] [0.0, -21677.5, -6699.0, 25189.0];
    var right := new real[4] [0.5, -21677.0, 25190.0, 25189.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 25189.0;
    expect r == -21677.0;
  }

  // Test case for combination {12}/Rel:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: IsMax(left, l)
  //   POST: l == left[(left.Length - 1)]
  //   POST: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST: exists i, i_2 | 0 <= i && i < i_2 && i_2 <= (right.Length - 1) :: (r == right[i]) && (r == right[i_2])
  //   POST: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  //   ENSURES: IsMax(left, l) && IsMin(right, r)
  {
    var left := new real[4] [0.0, -6699.0, -21677.0, 25189.0];
    var right := new real[4] [25190.0, 25191.0, 25191.0, 25190.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 25189.0;
    expect r == 25190.0;
  }

  // Test case for combination {14}/Rel:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: exists i, i_2 | 0 <= i && i < i_2 && i_2 <= (left.Length - 1) :: (l == left[i]) && (l == left[i_2])
  //   POST: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST: exists i :: 1 <= i < (right.Length - 1) && r == right[i]
  //   POST: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  //   ENSURES: IsMax(left, l) && IsMin(right, r)
  {
    var left := new real[4] [54531.0, 54531.0, 54531.0, 54531.0];
    var right := new real[4] [54531.5, 54531.5, 54532.5, 54532.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 54531.0;
    expect r == 54531.5;
  }

  // Test case for combination {16}/Rel:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: exists i, i_2 | 0 <= i && i < i_2 && i_2 <= (left.Length - 1) :: (l == left[i]) && (l == left[i_2])
  //   POST: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST: exists i, i_2 | 0 <= i && i < i_2 && i_2 <= (right.Length - 1) :: (r == right[i]) && (r == right[i_2])
  //   POST: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  //   ENSURES: IsMax(left, l) && IsMin(right, r)
  {
    var left := new real[5] [-0.5, -0.5, -1.0, -17651.0, -0.5];
    var right := new real[5] [0.5, 0.0, 0.0, 25189.0, 0.5];
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
    var left := new real[3] [0.0, 0.0, -29794.5];
    var right := new real[3] [0.5, 17650.5, -29794.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == -29794.0;
  }

  // Test case for combination {1}/Q|left|=1:
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

}

method Main()
{
  TestsForIntersectIntervals();
  print "TestsForIntersectIntervals: all non-failing tests passed!\n";
}
