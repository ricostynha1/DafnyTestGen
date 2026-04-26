// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\tangent-finder_tmp_tmpgyzf44ve_circles__1360_ROR_Lt.dfy
// Method: Tangent
// Generated: 2026-04-24 17:09:24

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
      if r[k] < x[l] {
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


method TestsForTangent()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST Q1: b
  //   POST Q2: exists i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length && r[i] == x[j]
  {
    var r := new int[1] [9];
    var x := new int[1] [9];
    var b := Tangent(r, x);
    // expect b == true; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST Q1: !b
  //   POST Q2: forall i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length ==> r[i] != x[j]
  {
    var r := new int[1] [2];
    var x := new int[1] [10];
    var b := Tangent(r, x);
    // expect b == false; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|r|>=2:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST Q1: b
  //   POST Q2: exists i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length && r[i] == x[j]
  {
    var r := new int[2] [10, 10];
    var x := new int[3] [10, 10, 10];
    var b := Tangent(r, x);
    // expect b == true; // got false
  }

  // Test case for combination {2}/O|r|=0:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST Q1: !b
  //   POST Q2: forall i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length ==> r[i] != x[j]
  {
    var r := new int[0] [];
    var x := new int[1] [-10];
    var b := Tangent(r, x);
    expect b == false;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/O|r|>=2:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST Q1: !b
  //   POST Q2: forall i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length ==> r[i] != x[j]
  {
    var r := new int[2] [3, 10];
    var x := new int[1] [7];
    var b := Tangent(r, x);
    // expect b == false; // got true
  }

  // Test case for combination {2}/O|x|=0:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST Q1: !b
  //   POST Q2: forall i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length ==> r[i] != x[j]
  {
    var r := new int[1] [-10];
    var x := new int[0] [];
    var b := Tangent(r, x);
    expect b == false;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/O|x|>=2:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST Q1: !b
  //   POST Q2: forall i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length ==> r[i] != x[j]
  {
    var r := new int[1] [2];
    var x := new int[2] [7, 7];
    var b := Tangent(r, x);
    // expect b == false; // got true
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST Q1: b
  //   POST Q2: exists i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length && r[i] == x[j]
  {
    var r := new int[1] [3];
    var x := new int[1] [3];
    var b := Tangent(r, x);
    // expect b == true; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST Q1: b
  //   POST Q2: exists i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length && r[i] == x[j]
  {
    var r := new int[1] [10];
    var x := new int[1] [10];
    var b := Tangent(r, x);
    // expect b == true; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  forall i: int, j: int {:trigger x[j], x[i]} :: 0 <= i <= j < x.Length ==> x[i] <= x[j]
  //   PRE:  forall i: int, j: int {:trigger x[j], r[i]} :: (0 <= i < r.Length && 0 <= j < x.Length ==> r[i] >= 0) && (0 <= i < r.Length && 0 <= j < x.Length ==> x[j] >= 0)
  //   POST Q1: b
  //   POST Q2: exists i: int, j: int {:trigger x[j], r[i]} :: 0 <= i < r.Length && 0 <= j < x.Length && r[i] == x[j]
  {
    var r := new int[1] [2];
    var x := new int[1] [2];
    var b := Tangent(r, x);
    // expect b == true; // got false
  }

}

method Main()
{
  TestsForTangent();
  print "TestsForTangent: all non-failing tests passed!\n";
}
