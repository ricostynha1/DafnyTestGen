// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\correct_progs\in\MaxDistEqual.dfy
// Method: MaxDistEqual
// Generated: 2026-03-22 23:59:34

// Finds the maximum distance between equal elements in a non-empty array.
method MaxDistEqual(a: array<int>) returns (maxDist: nat)
  requires a.Length > 0
  ensures exists i :: 0 <= i < a.Length && i + maxDist < a.Length && a[i] == a[i + maxDist]
  ensures forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
{
  maxDist := 0;
  for i := 0 to a.Length
     invariant i == 0 ==> maxDist == 0
     invariant i > 0 ==> exists k :: 0 <= k < i && k + maxDist < a.Length && a[k] == a[k + maxDist]
     invariant forall k, l :: 0 <= k < l < a.Length && k < i && a[k] == a[l] ==> l - k <= maxDist
  {
    var j := a.Length - 1;
    while j > i + maxDist
     invariant i == 0  ==> a[0] == a[maxDist]
     invariant i > 0  ==> exists k :: 0 <= k < i && k + maxDist < a.Length && a[k] == a[k + maxDist]
     invariant forall k, l :: 0 <= k < l < a.Length && (k < i || (k == i && l > j)) && a[k] == a[l] ==> l - k <= maxDist
    {
      if (a[j] == a[i]) {
        maxDist := j - i;
        break;
      }
      j := j - 1;    
    }
  }
}



method Passing()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: 0 + maxDist < a.Length && a[0] == a[0 + maxDist]
  //   POST: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  {
    var a := new int[2] [9, 9];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 1;
  }

  // Test case for combination {2}:
  //   PRE:  a.Length > 0
  //   POST: exists i :: 1 <= i < (a.Length - 1) && i + maxDist < a.Length && a[i] == a[i + maxDist]
  //   POST: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  {
    var a := new int[4] [23, 10, 13, 13];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 1;
  }

  // Test case for combination {1,2}:
  //   PRE:  a.Length > 0
  //   POST: 0 + maxDist < a.Length && a[0] == a[0 + maxDist]
  //   POST: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  //   POST: exists i :: 1 <= i < (a.Length - 1) && i + maxDist < a.Length && a[i] == a[i + maxDist]
  {
    var a := new int[4] [9, 9, 29, 29];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 1;
  }

  // Test case for combination {1,3}:
  //   PRE:  a.Length > 0
  //   POST: 0 + maxDist < a.Length && a[0] == a[0 + maxDist]
  //   POST: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  //   POST: (a.Length - 1) + maxDist < a.Length && a[(a.Length - 1)] == a[(a.Length - 1) + maxDist]
  {
    var a := new int[1] [8];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 0;
  }

  // Test case for combination {1,2,3}:
  //   PRE:  a.Length > 0
  //   POST: 0 + maxDist < a.Length && a[0] == a[0 + maxDist]
  //   POST: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  //   POST: exists i :: 1 <= i < (a.Length - 1) && i + maxDist < a.Length && a[i] == a[i + maxDist]
  //   POST: (a.Length - 1) + maxDist < a.Length && a[(a.Length - 1)] == a[(a.Length - 1) + maxDist]
  {
    var a := new int[4] [8, 10, 12, 14];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 0;
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
