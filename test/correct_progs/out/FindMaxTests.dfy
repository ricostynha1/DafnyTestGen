// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\FindMax.dfy
// Method: FindMax
// Generated: 2026-04-21 23:10:59

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
  //   POST Q1: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST Q2: forall k: int :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[4] [0.0, 25417.5, 25418.0, -6506.5];
    var max := FindMax(a);
    expect max == 25418.0;
  }

  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: max == a[0]
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[1] [0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {2}/V2:
  //   PRE:  a.Length > 0
  //   POST Q1: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST Q2: forall k: int :: 0 <= k < a.Length ==> max >= a[k]  // VACUOUS (forced true by other literals for this ins)
  {
    var a := new real[3] [0.0, 0.0, -5903.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {1}/Omax>0:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: max == a[0]
  //   POST Q3: forall k: int :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[1] [0.5];
    var max := FindMax(a);
    expect max == 0.5;
  }

}

method Main()
{
  TestsForFindMax();
  print "TestsForFindMax: all non-failing tests passed!\n";
}
