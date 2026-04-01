// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\tangent-finder_tmp_tmpgyzf44ve_circles.dfy
// Method: Tangent
// Generated: 2026-04-01 13:55:00

// tangent-finder_tmp_tmpgyzf44ve_circles.dfy

method Tangent(r: array<int>, x: array<int>) returns (b: bool)
  requires forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  requires forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  ensures !b ==> forall i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length ==> r[i] != x[j]
  ensures b ==> exists i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length && r[i] == x[j]
  decreases r, x
{
  var tempB, tangentMissing, k, l := false, false, 0, 0;
  while k != r.Length && !tempB
    invariant 0 <= k <= r.Length
    invariant tempB ==> exists i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length && r[i] == x[j]
    invariant !tempB ==> forall i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < k && 0 <= j < x.Length ==> r[i] != x[j]
    decreases r.Length - k
  {
    l := 0;
    tangentMissing := false;
    while l != x.Length && !tangentMissing
      invariant 0 <= l <= x.Length
      invariant tempB ==> exists i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length && r[i] == x[j]
      invariant !tempB ==> forall i: int {:trigger x[i]} :: 0 <= i < l ==> r[k] != x[i]
      invariant tangentMissing ==> forall i: int {:trigger x[i]} :: l <= i < x.Length ==> r[k] != x[i]
      decreases x.Length - l, !tempB, !tangentMissing
    {
      if r[k] == x[l] {
        tempB := true;
      }
      if r[k] < x[l] {
        tangentMissing := true;
      }
      l := l + 1;
    }
    k := k + 1;
  }
  b := tempB;
}


method GeneratedTests_Tangent()
{
  // Test case for combination {2}:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST: b
  //   POST: exists i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length && r[i] == x[j]
  {
    var r := new int[1] [281];
    var x := new int[1] [281];
    expect forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]; // PRE-CHECK
    expect forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0); // PRE-CHECK
    var b := Tangent(r, x);
    expect b == true;
  }

  // Test case for combination {3}:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST: forall i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length ==> r[i] != x[j]
  //   POST: !b
  {
    var r := new int[0] [];
    var x := new int[0] [];
    expect forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]; // PRE-CHECK
    expect forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0); // PRE-CHECK
    var b := Tangent(r, x);
    expect b == false;
  }

  // Test case for combination {2}/Br=2,x=1:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST: b
  //   POST: exists i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length && r[i] == x[j]
  {
    var r := new int[2] [5853, 5];
    var x := new int[1] [5853];
    expect forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]; // PRE-CHECK
    expect forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0); // PRE-CHECK
    var b := Tangent(r, x);
    expect b == true;
  }

  // Test case for combination {2}/Br=3,x=2:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST: b
  //   POST: exists i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length && r[i] == x[j]
  {
    var r := new int[3] [6, 818, 590];
    var x := new int[2] [590, 818];
    expect forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]; // PRE-CHECK
    expect forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0); // PRE-CHECK
    var b := Tangent(r, x);
    expect b == true;
  }

}

method Main()
{
  GeneratedTests_Tangent();
  print "GeneratedTests_Tangent: all tests passed!\n";
}
