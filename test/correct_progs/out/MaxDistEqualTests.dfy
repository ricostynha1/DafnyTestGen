// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\MaxDistEqual.dfy
// Method: MaxDistEqual
// Generated: 2026-04-15 11:03:54

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
  //   POST: 0 <= (a.Length - 1)
  //   POST: 0 + maxDist < a.Length && a[0] == a[0 + maxDist]
  //   POST: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  //   ENSURES: exists i :: 0 <= i < a.Length && i + maxDist < a.Length && a[i] == a[i + maxDist]
  //   ENSURES: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  {
    var a := new int[1] [10];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 0;
  }

  // Test case for combination {2}:
  //   PRE:  a.Length > 0
  //   POST: exists i :: 1 <= i < (a.Length - 1) && i + maxDist < a.Length && a[i] == a[i + maxDist]
  //   POST: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  //   ENSURES: exists i :: 0 <= i < a.Length && i + maxDist < a.Length && a[i] == a[i + maxDist]
  //   ENSURES: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  {
    var a := new int[4] [20, 14, 21, 22];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 0;
  }

  // Test case for combination {3}:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: (a.Length - 1) + maxDist < a.Length && a[(a.Length - 1)] == a[(a.Length - 1) + maxDist]
  //   POST: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  //   ENSURES: exists i :: 0 <= i < a.Length && i + maxDist < a.Length && a[i] == a[i + maxDist]
  //   ENSURES: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  {
    var a := new int[1] [9];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 0;
  }

  // Test case for combination {4}:
  //   PRE:  a.Length > 0
  //   POST: exists i, i_2 | 0 <= i && i < i_2 && i_2 <= (a.Length - 1) :: (i + maxDist < a.Length && a[i] == a[i + maxDist]) && (i_2 + maxDist < a.Length && a[i_2] == a[i_2 + maxDist])
  //   POST: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  //   ENSURES: exists i :: 0 <= i < a.Length && i + maxDist < a.Length && a[i] == a[i + maxDist]
  //   ENSURES: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  {
    var a := new int[2] [18, 14];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 0;
  }

  // Test case for combination {1}/Q|a|>=2:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: 0 + maxDist < a.Length && a[0] == a[0 + maxDist]
  //   POST: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  //   ENSURES: exists i :: 0 <= i < a.Length && i + maxDist < a.Length && a[i] == a[i + maxDist]
  //   ENSURES: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  {
    var a := new int[2] [10, 21];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 0;
  }

  // Test case for combination {2}/Q|a|>=2:
  //   PRE:  a.Length > 0
  //   POST: exists i :: 1 <= i < (a.Length - 1) && i + maxDist < a.Length && a[i] == a[i + maxDist]
  //   POST: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  //   ENSURES: exists i :: 0 <= i < a.Length && i + maxDist < a.Length && a[i] == a[i + maxDist]
  //   ENSURES: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  {
    var a := new int[3] [18, 11, 17];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 0;
  }

  // Test case for combination {3}/Q|a|>=2:
  //   PRE:  a.Length > 0
  //   POST: 0 <= (a.Length - 1)
  //   POST: (a.Length - 1) + maxDist < a.Length && a[(a.Length - 1)] == a[(a.Length - 1) + maxDist]
  //   POST: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  //   ENSURES: exists i :: 0 <= i < a.Length && i + maxDist < a.Length && a[i] == a[i + maxDist]
  //   ENSURES: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  {
    var a := new int[2] [16, 9];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 0;
  }

  // Test case for combination {4}/Q|a|>=2:
  //   PRE:  a.Length > 0
  //   POST: exists i, i_2 | 0 <= i && i < i_2 && i_2 <= (a.Length - 1) :: (i + maxDist < a.Length && a[i] == a[i + maxDist]) && (i_2 + maxDist < a.Length && a[i_2] == a[i_2 + maxDist])
  //   POST: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  //   ENSURES: exists i :: 0 <= i < a.Length && i + maxDist < a.Length && a[i] == a[i + maxDist]
  //   ENSURES: forall i, j :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  {
    var a := new int[3] [10, 17, 26];
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
