// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_644.dfy
// Method: Reverse
// Generated: 2026-04-08 19:10:48

// dafny-synthesis_task_id_644.dfy

method Reverse(a: array<int>)
  modifies a
  ensures forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  decreases a
{
  var l := a.Length - 1;
  var i := 0;
  while i < l - i
    invariant 0 <= i <= (l + 1) / 2
    invariant forall k: int {:trigger a[k]} :: 0 <= k < i || l - i < k <= l ==> a[k] == old(a[l - k])
    invariant forall k: int {:trigger old(a[k])} {:trigger a[k]} :: i <= k <= l - i ==> a[k] == old(a[k])
    decreases l - i - i
  {
    a[i], a[l - i] := a[l - i], a[i];
    i := i + 1;
  }
}

method ReverseUptoK(s: array<int>, k: int)
  requires 2 <= k <= s.Length
  modifies s
  ensures forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  ensures forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  decreases s, k
{
  var l := k - 1;
  var i := 0;
  while i < l - i
    invariant 0 <= i <= (l + 1) / 2
    invariant forall p: int {:trigger s[p]} :: 0 <= p < i || l - i < p <= l ==> s[p] == old(s[l - p])
    invariant forall p: int {:trigger old(s[p])} {:trigger s[p]} :: i <= p <= l - i ==> s[p] == old(s[p])
    invariant forall p: int {:trigger old(s[p])} {:trigger s[p]} :: k <= p < s.Length ==> s[p] == old(s[p])
    decreases l - i - i
  {
    s[i], s[l - i] := s[l - i], s[i];
    i := i + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[0] [];
    Reverse(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/Ba=1:
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [2];
    Reverse(a);
    expect a[..] == [2];
  }

  // Test case for combination {1}/Ba=2:
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[2] [4, 3];
    Reverse(a);
    expect a[..] == [3, 4];
  }

  // Test case for combination {1}/Ba=3:
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  //   ENSURES: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[3] [6, 5, 4];
    Reverse(a);
    expect a[..] == [4, 5, 6];
  }

  // Test case for combination {1}:
  //   PRE:  2 <= k <= s.Length
  //   POST: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  //   ENSURES: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   ENSURES: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [13, 9];
    var k := 2;
    ReverseUptoK(s, k);
    expect s[..] == [9, 13];
  }

  // Test case for combination {1}/Bs=3,k==s_pre_len:
  //   PRE:  2 <= k <= s.Length
  //   POST: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  //   ENSURES: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   ENSURES: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[3] [6, 5, 4];
    var k := 3;
    ReverseUptoK(s, k);
    expect s[..] == [4, 5, 6];
  }

  // Test case for combination {1}/Bs=3,k=2:
  //   PRE:  2 <= k <= s.Length
  //   POST: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  //   ENSURES: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   ENSURES: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[3] [5, 4, 6];
    var k := 2;
    ReverseUptoK(s, k);
    expect s[..] == [4, 5, 6];
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
