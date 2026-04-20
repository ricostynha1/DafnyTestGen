// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\IntersectIntervalsSimplified.dfy
// Method: IntersectIntervals
// Generated: 2026-04-20 14:54:51

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
    var left := new real[4] [-26557.25, -26557.25, -26557.25, -26557.25];
    var right := new real[4] [0.0, 0.0, 0.5, 0.25];
    var l, r := IntersectIntervals(left, right);
    expect l == -26557.25;
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
    var left := new real[4] [36147.0, 36146.5, 9590.0, 36146.5];
    var right := new real[4] [36147.5, 36147.0, 36147.5, 36147.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 36147.0;
    expect r == 36147.0;
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
    var left := new real[4] [98142.0, 98142.0, 18481.0, 25965.0];
    var right := new real[4] [98142.5, 98142.5, 18481.5, 25965.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 98142.0;
    expect r == 18481.5;
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
    var left := new real[4] [67552.5, 67552.5, 67552.0, 67552.25];
    var right := new real[4] [67553.0, 67552.75, 67552.75, 67553.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 67552.5;
    expect r == 67552.75;
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
    var left := new real[4] [-9306.0, -9306.0, -9306.0, -9306.0];
    var right := new real[4] [31408.0, 31408.0, 31410.0, 31409.0];
    var l, r := IntersectIntervals(left, right);
    expect l == -9306.0;
    expect r == 31408.0;
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
    var left := new real[4] [9306.0, -31405.0, 9306.0, 9306.0];
    var right := new real[4] [9307.0, 9308.0, 9308.0, 9307.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 9306.0;
    expect r == 9307.0;
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
    var left := new real[4] [4333.5, 53309.25, 4333.5, 53309.25];
    var right := new real[4] [4334.0, 53309.5, 4333.75, 53309.75];
    var l, r := IntersectIntervals(left, right);
    expect l == 53309.25;
    expect r == 4333.75;
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
    var left := new real[5] [0.0, 0.25, 0.0, 0.25, 0.25];
    var right := new real[5] [0.5, 0.75, 0.5, 0.75, 0.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.25;
    expect r == 0.5;
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
    var left := new real[1] [-1.0];
    var right := new real[1] [0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == -1.0;
    expect r == 0.0;
  }

}

method Main()
{
  TestsForIntersectIntervals();
  print "TestsForIntersectIntervals: all non-failing tests passed!\n";
}
