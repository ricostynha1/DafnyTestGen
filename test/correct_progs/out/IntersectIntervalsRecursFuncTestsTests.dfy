// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\IntersectIntervalsRecursFuncTests.dfy
// Method: IntersectIntervals
// Generated: 2026-04-10 23:32:42

// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\IntersectIntervalsRecursFunc.dfy
// Method: IntersectIntervals
// Generated: 2026-04-10 23:07:50

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



method Passing()
{
  // Test case for combination {1}:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [-0.5];
    var right := new real[1] [0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == -0.5;
  }

  // Test case for combination {2}:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [0.0];
    var right := new real[1] [0.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Bleft=2,right=2:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[2] [8855.0, 8855.5];
    var right := new real[2] [8855.5, 8856.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Bleft=3,right=3:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[3] [-8366.0, -8365.5, -8365.75];
    var right := new real[3] [-8365.5, -8365.25, 0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Ol>0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[4] [0.0, 8854.0, 11796.0, 8364.0];
    var right := new real[4] [1.0, 8855.0, 11797.0, 8365.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Ol<0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[5] [0.0, 11796.0, 8364.0, 32284.0, 41062.0];
    var right := new real[5] [1.0, 11797.0, 8365.0, 32285.0, 41063.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Ol=0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[6] [0.0, 8364.5, 42735.0, 30611.5, 5852.5, 28099.5];
    var right := new real[6] [0.5, 8365.0, 42735.5, 30612.0, 5853.0, 28100.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Or>0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[7] [0.0, 32284.0, 10449.0, 30611.0, 33953.0, 1141.0, 20818.0];
    var right := new real[7] [1.0, 32285.0, 10450.0, 30612.0, 33954.0, 1142.0, 20819.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Or<0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[8] [0.0, 10449.0, 30611.0, 5852.0, 29242.0, 280.0, 36458.0, 8944.0];
    var right := new real[8] [1.0, 10450.0, 30612.0, 5853.0, 29243.0, 281.0, 36459.0, 8945.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {2}/Ol>0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[2] [0.0, 21237.5];
    var right := new real[2] [0.5, 21238.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {2}/Ol<0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[3] [0.0, 2436.5, 8854.5];
    var right := new real[3] [0.5, 2437.0, 8855.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {2}/Ol=0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[4] [0.0, 8854.5, 11796.5, 8364.5];
    var right := new real[4] [0.5, 8855.0, 11797.0, 8365.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {2}/Or>0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[5] [0.0, 11796.5, 8364.5, 32284.5, 41062.0];
    var right := new real[5] [0.5, 11797.0, 8365.0, 32285.0, 41062.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {2}/Or<0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[6] [0.0, 8364.5, 32284.5, 10449.5, 36465.0, 28099.5];
    var right := new real[6] [0.5, 8365.0, 32285.0, 10450.0, 36465.5, 28100.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {2}/Or=0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[7] [0.0, 32284.5, 10449.5, 30611.5, 33953.0, 1141.5, 20818.0];
    var right := new real[7] [0.5, 32285.0, 10450.0, 30612.0, 33953.5, 1142.0, 20818.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [-0.5];
    var right := new real[1] [0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == -0.5;
  }

  // Test case for combination {2}:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[1] [0.0];
    var right := new real[1] [0.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Bleft=2,right=2:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[2] [8855.0, 8855.5];
    var right := new real[2] [8855.5, 8856.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Bleft=3,right=3:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[3] [-8366.0, -8365.5, -8365.75];
    var right := new real[3] [-8365.5, -8365.25, 0.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Ol>0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[4] [0.0, 8854.0, 11796.0, 8364.0];
    var right := new real[4] [1.0, 8855.0, 11797.0, 8365.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Ol<0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[5] [0.0, 11796.0, 8364.0, 32284.0, 41062.0];
    var right := new real[5] [1.0, 11797.0, 8365.0, 32285.0, 41063.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Ol=0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[6] [0.0, 8364.5, 42735.0, 30611.5, 5852.5, 28099.5];
    var right := new real[6] [0.5, 8365.0, 42735.5, 30612.0, 5853.0, 28100.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Or>0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[7] [0.0, 32284.0, 10449.0, 30611.0, 33953.0, 1141.0, 20818.0];
    var right := new real[7] [1.0, 32285.0, 10450.0, 30612.0, 33954.0, 1142.0, 20819.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {1}/Or<0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[8] [0.0, 10449.0, 30611.0, 5852.0, 29242.0, 280.0, 36458.0, 8944.0];
    var right := new real[8] [1.0, 10450.0, 30612.0, 5853.0, 29243.0, 281.0, 36459.0, 8945.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {2}/Ol>0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[2] [0.0, 21237.5];
    var right := new real[2] [0.5, 21238.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {2}/Ol<0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[3] [0.0, 2436.5, 8854.5];
    var right := new real[3] [0.5, 2437.0, 8855.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {2}/Ol=0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[4] [0.0, 8854.5, 11796.5, 8364.5];
    var right := new real[4] [0.5, 8855.0, 11797.0, 8365.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {2}/Or>0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[5] [0.0, 11796.5, 8364.5, 32284.5, 41062.0];
    var right := new real[5] [0.5, 11797.0, 8365.0, 32285.0, 41062.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {2}/Or<0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[6] [0.0, 8364.5, 32284.5, 10449.5, 36465.0, 28099.5];
    var right := new real[6] [0.5, 8365.0, 32285.0, 10450.0, 36465.5, 28100.0];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
  }

  // Test case for combination {2}/Or=0:
  //   PRE:  left.Length == right.Length
  //   PRE:  left.Length > 0
  //   PRE:  forall i :: 0 <= i < left.Length ==> left[i] < right[i]
  //   POST: Max(left) < Min(right)
  //   POST: l == Max(left)
  //   POST: !(Max(left) < Min(right))
  //   ENSURES: l == if Max(left) < Min(right) then Max(left) else 0.0
  //   ENSURES: r == if Max(left) < Min(right) then Min(right) else 0.0
  {
    var left := new real[7] [0.0, 32284.5, 10449.5, 30611.5, 33953.0, 1141.5, 20818.0];
    var right := new real[7] [0.5, 32285.0, 10450.0, 30612.0, 33953.5, 1142.0, 20818.5];
    var l, r := IntersectIntervals(left, right);
    expect l == 0.0;
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
