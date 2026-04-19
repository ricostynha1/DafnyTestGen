// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\IntersectIntervalsSimplified.dfy
// Method: IntersectIntervals
// Generated: 2026-04-19 21:53:00

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
    var left := new real[1] [-1.0];
    var right := new real[1] [0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == -1.0;
    expect r == 0.0;
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
    var left := new real[3] [-0.5, -0.5, -10485.5];
    var right := new real[3] [0.0, 0.0, 6378.0];
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
    var left := new real[3] [0.0, 0.0, -30353.5];
    var right := new real[3] [0.5, 16863.5, -30353.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == -30353.0;
  }

  // Test case for combination {10}:
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
    var left := new real[3] [0.0, -16863.5, 0.0];
    var right := new real[3] [0.5, -16863.0, 27349.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == -16863.0;
  }

  // Test case for combination {12}:
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
    var left := new real[2] [-1.0, -1.0];
    var right := new real[2] [0.0, 0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == -1.0;
    expect r == 0.0;
  }

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
    var left := new real[4] [-38.25, -38.25, -38.25, -38.25];
    var right := new real[4] [0.0, 0.0, 0.5, 0.25];
    var l, r := IntersectIntervals(left, right);
    expect l == -38.25;
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
    var left := new real[4] [0.0, -0.5, -38.0, -7719.5];
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
    var left := new real[4] [2437.0, 2437.0, -11800.0, -20654.0];
    var right := new real[4] [2438.0, 10803.0, -11799.0, -11798.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 2437.0;
    expect r == -11799.0;
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
    var left := new real[4] [31394.0, 31393.5, 31394.0, 31393.5];
    var right := new real[4] [31395.0, 31394.5, 31394.5, 31395.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 31394.0;
    expect r == 31394.5;
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
    var left := new real[4] [0.0, -0.5, -8855.0, 2437.0];
    var right := new real[4] [0.5, 0.0, 2438.0, 2437.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 2437.0;
    expect r == 0.0;
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
    var left := new real[4] [0.0, 2437.0, -8855.0, 2437.0];
    var right := new real[4] [2439.0, 2438.0, 2439.0, 2438.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 2437.0;
    expect r == 2438.0;
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
    var left := new real[4] [7717.0, 7717.0, 7717.0, -1138.0];
    var right := new real[4] [7718.0, 7718.0, 7722.0, 28956.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 7717.0;
    expect r == 7718.0;
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
    var left := new real[5] [2437.0, 2437.0, 2436.75, 2436.5, 2437.0];
    var right := new real[5] [2437.5, 2437.25, 2437.25, 11292.5, 2437.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 2437.0;
    expect r == 2437.25;
  }

}

method Main()
{
  TestsForIntersectIntervals();
  print "TestsForIntersectIntervals: all non-failing tests passed!\n";
}
