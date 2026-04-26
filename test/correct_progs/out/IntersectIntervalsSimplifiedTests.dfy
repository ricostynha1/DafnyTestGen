// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\IntersectIntervalsSimplified.dfy
// Method: IntersectIntervals
// Generated: 2026-04-23 20:26:01

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
  // Test case for combination {1}/Rel:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: IsMax(left, l)
  //   POST Q2: IsMin(right, r)
  //   POST Q3: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST Q4: 0 <= (right.Length - 1)
  //   POST Q5: r == right[0]
  //   POST Q6: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  {
    var left := new real[1] [-0.5];
    var right := new real[1] [0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == -0.5;
    expect r == 0.0;
  }

  // Test case for combination {2}/Rel:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: IsMax(left, l)
  //   POST Q2: IsMin(right, r)
  //   POST Q3: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST Q4: exists i :: 1 <= i < (right.Length - 1) && r == right[i]
  //   POST Q5: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  {
    var left := new real[4] [-4140.25, -4140.25, -4140.25, -4140.25];
    var right := new real[4] [3453.0, 0.0, 0.5, 0.25];
    var l, r := IntersectIntervals(left, right);
    expect l == -4140.25;
    expect r == 0.0;
  }

  // Test case for combination {4}/Rel:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: exists i :: 1 <= i < (left.Length - 1) && l == left[i]
  //   POST Q2: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST Q3: 0 <= (right.Length - 1)
  //   POST Q4: r == right[0]
  //   POST Q5: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  {
    var left := new real[4] [0.0, 0.0, 13852.0, 13851.75];
    var right := new real[4] [0.25, 0.25, 13852.25, 42631.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 13852.0;
    expect r == 0.25;
  }

  // Test case for combination {6}/Rel:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: exists i :: 1 <= i < (left.Length - 1) && l == left[i]
  //   POST Q2: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST Q3: 0 <= (right.Length - 1)
  //   POST Q4: r == right[(right.Length - 1)]
  //   POST Q5: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  {
    var left := new real[4] [0.0, -4140.0, 0.0, -7593.5];
    var right := new real[4] [0.5, -4139.5, 13851.5, -7593.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == -7593.0;
  }

  // Test case for combination {1}/O|left|>=2:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: IsMax(left, l)
  //   POST Q2: IsMin(right, r)
  //   POST Q3: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST Q4: 0 <= (right.Length - 1)
  //   POST Q5: r == right[0]
  //   POST Q6: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  {
    var left := new real[2] [-18642.0, -18642.0];
    var right := new real[2] [0.0, 0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == -18642.0;
    expect r == 0.0;
  }

  // Test case for combination {1}/Ol=0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: IsMax(left, l)
  //   POST Q2: IsMin(right, r)
  //   POST Q3: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST Q4: 0 <= (right.Length - 1)
  //   POST Q5: r == right[0]
  //   POST Q6: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
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
  //   POST Q1: IsMax(left, l)
  //   POST Q2: IsMin(right, r)
  //   POST Q3: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST Q4: 0 <= (right.Length - 1)
  //   POST Q5: r == right[0]
  //   POST Q6: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
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
  //   POST Q1: IsMax(left, l)
  //   POST Q2: IsMin(right, r)
  //   POST Q3: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST Q4: 0 <= (right.Length - 1)
  //   POST Q5: r == right[0]
  //   POST Q6: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  {
    var left := new real[1] [-2.0];
    var right := new real[1] [-1.0];
    var l, r := IntersectIntervals(left, right);
    expect l == -2.0;
    expect r == -1.0;
  }

  // Test case for combination {2}/Ol=0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: IsMax(left, l)
  //   POST Q2: IsMin(right, r)
  //   POST Q3: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST Q4: exists i :: 1 <= i < (right.Length - 1) && r == right[i]
  //   POST Q5: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  {
    var left := new real[3] [0.0, -2417.5, -28779.5];
    var right := new real[3] [0.5, -2417.0, 0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
    expect r == -2417.0;
  }

  // Test case for combination {2}/Ol>0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i: int :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST Q1: IsMax(left, l)
  //   POST Q2: IsMin(right, r)
  //   POST Q3: forall i: int {:trigger left[i]} :: 0 <= i && i < left.Length ==> l >= left[i]
  //   POST Q4: exists i :: 1 <= i < (right.Length - 1) && r == right[i]
  //   POST Q5: forall i: int {:trigger right[i]} :: 0 <= i && i < right.Length ==> r <= right[i]
  {
    var left := new real[4] [0.125, 0.0, -0.25, 0.0];
    var right := new real[4] [0.25, 7593.125, -0.125, 18641.125];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.125;
    expect r == -0.125;
  }

}

method Main()
{
  TestsForIntersectIntervals();
  print "TestsForIntersectIntervals: all non-failing tests passed!\n";
}
