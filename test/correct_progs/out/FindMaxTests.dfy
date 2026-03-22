// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs\in\FindMax.dfy
// Method: FindMax
// Generated: 2026-03-22 20:20:48

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



method Passing()
{
  // Test case for combination {1,3}/R2:
  //   PRE:  a.Length > 0
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   POST: max == a[(a.Length - 1)]
  {
    var a := new real[2] [0.0, 0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[3] [0.0, -39.0, 0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {1,2,3}/R2:
  //   PRE:  a.Length > 0
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: max == a[(a.Length - 1)]
  {
    var a := new real[3] [0.0, 0.0, 0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {3}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: max == a[(a.Length - 1)]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[3] [-39.0, 0.0, 0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {1,3}/Ba=1:
  //   PRE:  a.Length > 0
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   POST: max == a[(a.Length - 1)]
  {
    var a := new real[1] [0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {1,2,3}/R1:
  //   PRE:  a.Length > 0
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: max == a[(a.Length - 1)]
  {
    var a := new real[4] [0.0, 0.0, 0.0, 0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {2}/R3:
  //   PRE:  a.Length > 0
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[6] [0.0, 0.0, -13505.0, 0.0, -11649.0, 0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {1,2}/R3:
  //   PRE:  a.Length > 0
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  {
    var a := new real[5] [0.0, -6878.0, 0.0, -20034.0, -12456.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {2,3}/R1:
  //   PRE:  a.Length > 0
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   POST: max == a[(a.Length - 1)]
  {
    var a := new real[4] [0.0, 0.0, -8855.0, 0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {2,3}/R3:
  //   PRE:  a.Length > 0
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   POST: max == a[(a.Length - 1)]
  {
    var a := new real[5] [0.0, -20537.0, -1142.0, 0.0, 0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {1,2,3}/R3:
  //   PRE:  a.Length > 0
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: max == a[(a.Length - 1)]
  {
    var a := new real[5] [0.0, -1102.0, 0.0, 0.0, 0.0];
    var max := FindMax(a);
    expect max == 0.0;
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
