// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\in\FindMax.dfy
// Method: FindMax
// Generated: 2026-03-20 22:12:32

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



method GeneratedTests_FindMax()
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
    var a := new real[3] [0.5, 0.0, 0.25];
    var max := FindMax(a);
    expect max == 0.5;
  }

  // Test case for combination {2}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[3] [37.5, 38.0, 37.75];
    var max := FindMax(a);
    expect max == 38.0;
  }

  // Test case for combination {3}/Ba=2:
  //   PRE:  a.Length > 0
  //   POST: max == a[(a.Length - 1)]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[2] [0.0, 0.5];
    var max := FindMax(a);
    expect max == 0.5;
  }

  // Test case for combination {3}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: max == a[(a.Length - 1)]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[3] [0.0, 0.25, 0.5];
    var max := FindMax(a);
    expect max == 0.5;
  }

  // Test case for combination {1,3}/Ba=1:
  //   PRE:  a.Length > 0
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   POST: max == a[(a.Length - 1)]
  {
    var a := new real[1] [2.0];
    var max := FindMax(a);
    expect max == 2.0;
  }

  // Test case for combination {1}/R3:
  //   PRE:  a.Length > 0
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[4] [2475.5, 2475.0, 2475.0, 2475.25];
    var max := FindMax(a);
    expect max == 2475.5;
  }

  // Test case for combination {2}/R2:
  //   PRE:  a.Length > 0
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[4] [0.0, 0.0, -28100.0, 0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {2}/R3:
  //   PRE:  a.Length > 0
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[7] [19861.5, 22299.0, 15.0, -21936.0, 22299.0, 23.0, 22298.5];
    var max := FindMax(a);
    expect max == 22299.0;
  }

  // Test case for combination {1,2,3}/R1:
  //   PRE:  a.Length > 0
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: max == a[(a.Length - 1)]
  {
    var a := new real[4] [0.0, -21238.0, 0.0, 0.0];
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

  // Test case for combination {1,2}/R3:
  //   PRE:  a.Length > 0
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  {
    var a := new real[8] [460366.0, 10.0, 11.0, 460366.0, 14.0, 460366.0, 17.0, 460365.5];
    var max := FindMax(a);
    expect max == 460366.0;
  }

  // Test case for combination {3}/R3:
  //   PRE:  a.Length > 0
  //   POST: max == a[(a.Length - 1)]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[4] [7719.0, 4.0, 5.0, 7719.5];
    var max := FindMax(a);
    expect max == 7719.5;
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
    var a := new real[5] [0.0, 0.0, -11797.0, -2446.0, 0.0];
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
    var a := new real[6] [314719.0, 314719.0, 314719.0, 34.0, 30.0, 314719.0];
    var max := FindMax(a);
    expect max == 314719.0;
  }

}

method Main()
{
  GeneratedTests_FindMax();
  print "GeneratedTests_FindMax: all tests passed!\n";
}
