// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Dafny_Verify_tmp_tmphq7j0row_Test_Cases_solved_1_select__497-499_AOI.dfy
// Method: SelectionSort
// Generated: 2026-04-08 16:48:14

// Dafny_Verify_tmp_tmphq7j0row_Test_Cases_solved_1_select.dfy

method SelectionSort(a: array<int>)
  modifies a
  ensures forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  ensures multiset(a[..]) == old(multiset(a[..]))
  decreases a
{
  var n := 0;
  while n != a.Length
    invariant 0 <= n <= a.Length
    invariant forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length && j < n ==> a[i] <= a[j]
    invariant forall i: int {:trigger a[i]} :: 0 <= i < n ==> forall j: int {:trigger a[j]} :: n <= j < a.Length ==> a[i] <= a[j]
    invariant multiset(a[..]) == old(multiset(a[..]))
    decreases if n <= a.Length then a.Length - n else n - a.Length
  {
    var mindex, m := n, n;
    while m != -a.Length
      invariant n <= mindex < a.Length
      invariant n <= m <= a.Length
      invariant forall i: int {:trigger a[i]} :: n <= i < m ==> a[mindex] <= a[i]
      invariant multiset(a[..]) == old(multiset(a[..]))
      decreases if m <= -a.Length then -a.Length - m else m - -a.Length
    {
      if a[m] < a[mindex] {
        mindex := m;
      }
      m := m + 1;
    }
    if a[mindex] < a[n] {
      a[mindex], a[n] := a[n], a[mindex];
    }
    n := n + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: multiset(a[..]) == old(multiset(a[..]))
  //   ENSURES: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   ENSURES: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[0] [];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    expect a[..] == [];
  }

}

method Failing()
{
  // Test case for combination {1}/Ba=1:
  //   POST: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: multiset(a[..]) == old(multiset(a[..]))
  //   ENSURES: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   ENSURES: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[1] [2];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

  // Test case for combination {1}/Ba=2:
  //   POST: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: multiset(a[..]) == old(multiset(a[..]))
  //   ENSURES: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   ENSURES: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[2] [6, 5];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

  // Test case for combination {1}/Ba=3:
  //   POST: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   POST: multiset(a[..]) == old(multiset(a[..]))
  //   ENSURES: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  //   ENSURES: multiset(a[..]) == old(multiset(a[..]))
  {
    var a := new int[3] [8, 7, 9];
    var old_multiset_a := multiset(a[..]);
    SelectionSort(a);
    // expect forall i: int, j: int :: 0 <= i < j < a.Length ==> a[i] <= a[j];
    // expect multiset(a[..]) == old_multiset_a;
  }

}

method Main()
{
  Passing();
  Failing();
}
