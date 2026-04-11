// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\FindMax.dfy
// Method: FindMax
// Generated: 2026-04-11 12:09:57

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
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[2] [0.0, -0.5];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {2}:
  //   PRE:  a.Length > 0
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[4] [-0.5, 0.0, 0.0, -38.5];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {3}:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: max == a[(a.Length - 1)]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[2] [-0.5, 0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[3] [0.0, -0.5, -0.25];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {1}/Omax>0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[4] [0.5, 0.0, -38.0, -7719.0];
    var max := FindMax(a);
    expect max == 0.5;
  }

  // Test case for combination {1}/Omax<0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[5] [-38.5, -39.0, -39.0, -39.0, -39.0];
    var max := FindMax(a);
    expect max == -38.5;
  }

  // Test case for combination {1}/Omax=0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[6] [0.0, -1.0, -39.0, -7720.0, -21239.0, -2438.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {2}/Omax>0:
  //   PRE:  a.Length > 0
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[3] [0.0, 0.5, -38.0];
    var max := FindMax(a);
    expect max == 0.5;
  }

  // Test case for combination {2}/Omax<0:
  //   PRE:  a.Length > 0
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[8] [-39.0, -38.5, -38.5, -38.5, -38.5, -38.5, -38.5, -39.0];
    var max := FindMax(a);
    expect max == -38.5;
  }

  // Test case for combination {2}/Omax=0:
  //   PRE:  a.Length > 0
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[7] [-1.0, 0.0, 0.0, 0.0, 0.0, 0.0, -39.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {3}/Omax>0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: max == a[(a.Length - 1)]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[4] [0.0, -38.0, -7719.0, 0.5];
    var max := FindMax(a);
    expect max == 0.5;
  }

  // Test case for combination {3}/Omax<0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: max == a[(a.Length - 1)]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[3] [-39.0, -39.0, -38.5];
    var max := FindMax(a);
    expect max == -38.5;
  }

  // Test case for combination {3}/Omax=0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: max == a[(a.Length - 1)]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[7] [-1.0, -39.0, -7720.0, -21239.0, -2438.0, -8856.0, 0.0];
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
