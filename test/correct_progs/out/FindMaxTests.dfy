// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\FindMax.dfy
// Method: FindMax
// Generated: 2026-04-20 09:02:02

// Finds the maximum value in a non-empty array.
method FindMax(a: array<real>) returns (max: real)
  requires a.Length > 0
  ensures exists k :: 0 <= k < a.Length && max == a[k]
  ensures forall k :: 0 <= k < a.Length ==> max >= a[k]
{
    max := a[0];
    for i := 1 to a.Length
      invariant exists k :: 0 <= k < i && max == a[k]
      invariant forall k :: 0 <= k < i ==> max >= a[k]
    {
        if (a[i] > max) {
            max := a[i];
        }
    } 
}



method TestsForFindMax()
{
  // Test case for combination {2}/Rel:
  //   PRE:  a.Length > 0
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: forall k: int :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k: int :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k: int :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[4] [0.0, -0.5, 0.0, -0.25];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {4}/Rel:
  //   PRE:  a.Length > 0
  //   POST: exists k, k_2 | 0 <= k && k < k_2 && k_2 <= (a.Length - 1) :: (max == a[k]) && (max == a[k_2])
  //   POST: forall k: int :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k: int :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k: int :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[4] [0.0, -0.5, -0.5, 0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {1}/Q|a|=1:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: max == a[0]
  //   POST: forall k: int :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k: int :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k: int :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[1] [2.0];
    var max := FindMax(a);
    expect max == 2.0;
  }

  // Test case for combination {1}/Omax<0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: max == a[0]
  //   POST: forall k: int :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k: int :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k: int :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[1] [-1.0];
    var max := FindMax(a);
    expect max == -1.0;
  }

}

method Main()
{
  TestsForFindMax();
  print "TestsForFindMax: all non-failing tests passed!\n";
}
