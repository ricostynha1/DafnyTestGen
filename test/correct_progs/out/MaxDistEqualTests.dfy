// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\MaxDistEqual.dfy
// Method: MaxDistEqual
// Generated: 2026-04-21 23:36:48

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



method TestsForMaxDistEqual()
{
  // Test case for combination {1}/Rel:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: 0 + maxDist < a.Length && a[0] == a[0 + maxDist]
  //   POST Q3: forall i: int, j: int :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  {
    var a := new int[2] [-10, -10];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 1;
  }

  // Test case for combination {2}/Rel:
  //   PRE:  a.Length > 0
  //   POST Q1: exists i :: 1 <= i < (a.Length - 1) && i + maxDist < a.Length && a[i] == a[i + maxDist]
  //   POST Q2: forall i: int, j: int :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  {
    var a := new int[3] [-1, 5, 5];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 1;
  }

  // Test case for combination {3}:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: (a.Length - 1) + maxDist < a.Length && a[(a.Length - 1)] == a[(a.Length - 1) + maxDist]
  //   POST Q3: forall i: int, j: int :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist
  {
    var a := new int[1] [-2];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 0;
  }

  // Test case for combination {1}/V3:
  //   PRE:  a.Length > 0
  //   POST Q1: 0 <= (a.Length - 1)
  //   POST Q2: 0 + maxDist < a.Length && a[0] == a[0 + maxDist]
  //   POST Q3: forall i: int, j: int :: 0 <= i < j < a.Length && a[i] == a[j] ==> j - i <= maxDist  // VACUOUS (forced true by other literals for this ins)
  {
    var a := new int[1] [-1];
    var maxDist := MaxDistEqual(a);
    expect maxDist == 0;
  }

}

method Main()
{
  TestsForMaxDistEqual();
  print "TestsForMaxDistEqual: all non-failing tests passed!\n";
}
