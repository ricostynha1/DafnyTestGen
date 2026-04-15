// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\FindMax.dfy
// Method: FindMax
// Generated: 2026-04-15 09:01:53

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
    var a := new real[1] [0.0];
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
    var a := new real[3] [0.0, 0.0, -38.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {4}:
  //   PRE:  a.Length > 0
  //   POST: exists k, k_2 :: 0 <= k < k_2 <= (a.Length - 1) && max == a[k] && max == a[k_2]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[2] [0.0, 0.0];
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
    var a := new real[2] [0.5, 0.0];
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
    var a := new real[3] [-39.0, -39.0, -39.0];
    var max := FindMax(a);
    expect max == -39.0;
  }

  // Test case for combination {1}/Omax=0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: max == a[0]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[4] [0.0, -38.0, -7719.0, -21238.0];
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
    var a := new real[4] [0.0, -38.0, 0.5, -7719.0];
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
    var a := new real[8] [-39.0, -39.0, -39.0, -39.0, -39.0, -39.0, -39.0, -39.0];
    var max := FindMax(a);
    expect max == -39.0;
  }

  // Test case for combination {2}/Omax=0:
  //   PRE:  a.Length > 0
  //   POST: exists k :: 1 <= k < (a.Length - 1) && max == a[k]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[6] [-38.0, -7719.0, -21238.0, -2437.0, 0.0, -8855.0];
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
    var a := new real[2] [0.0, 0.5];
    var max := FindMax(a);
    expect max == 0.5;
  }

  // Test case for combination {3}/Omax=0:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: max == a[(a.Length - 1)]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[4] [-38.0, -7719.0, -21238.0, 0.0];
    var max := FindMax(a);
    expect max == 0.0;
  }

  // Test case for combination {4}/Omax>0:
  //   PRE:  a.Length > 0
  //   POST: exists k, k_2 :: 0 <= k < k_2 <= (a.Length - 1) && max == a[k] && max == a[k_2]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[3] [0.5, 0.5, 0.0];
    var max := FindMax(a);
    expect max == 0.5;
  }

  // Test case for combination {4}/Omax<0:
  //   PRE:  a.Length > 0
  //   POST: exists k, k_2 :: 0 <= k < k_2 <= (a.Length - 1) && max == a[k] && max == a[k_2]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[4] [-39.0, -39.0, -39.0, -39.0];
    var max := FindMax(a);
    expect max == -39.0;
  }

  // Test case for combination {4}/Omax=0:
  //   PRE:  a.Length > 0
  //   POST: exists k, k_2 :: 0 <= k < k_2 <= (a.Length - 1) && max == a[k] && max == a[k_2]
  //   POST: forall k :: 0 <= k < a.Length ==> max >= a[k]
  //   ENSURES: exists k :: 0 <= k < a.Length && max == a[k]
  //   ENSURES: forall k :: 0 <= k < a.Length ==> max >= a[k]
  {
    var a := new real[5] [0.0, 0.0, -38.0, -7719.0, -21238.0];
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
