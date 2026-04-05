// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_644__928_VER_i.dfy
// Method: Reverse
// Generated: 2026-04-05 23:42:34

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
    s[i], s[l - i] := s[i - i], s[i];
    i := i + 1;
  }
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[0] [];
    var old_a := a[..];
    Reverse(a);
    expect forall k: int :: 0 <= k < a.Length ==> a[k] == old_a[a.Length - 1 - k];
  }

  // Test case for combination {1}/Ba=1:
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [2];
    var old_a := a[..];
    Reverse(a);
    expect forall k: int :: 0 <= k < a.Length ==> a[k] == old_a[a.Length - 1 - k];
  }

  // Test case for combination {1}/Ba=2:
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[2] [4, 3];
    var old_a := a[..];
    Reverse(a);
    expect forall k: int :: 0 <= k < a.Length ==> a[k] == old_a[a.Length - 1 - k];
  }

  // Test case for combination {1}/Ba=3:
  //   POST: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[3] [6, 5, 4];
    var old_a := a[..];
    Reverse(a);
    expect forall k: int :: 0 <= k < a.Length ==> a[k] == old_a[a.Length - 1 - k];
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  2 <= k <= s.Length
  //   POST: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [13, 9];
    var k := 2;
    var old_s := s[..];
    ReverseUptoK(s, k);
    // expect forall i: int :: 0 <= i < k ==> s[i] == old_s[k - 1 - i];
    // expect forall i: int  :: k <= i < s.Length ==> s[i] == old_s[i];
  }

  // Test case for combination {1}/Bs=3,k=2:
  //   PRE:  2 <= k <= s.Length
  //   POST: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[3] [5, 4, 6];
    var k := 2;
    var old_s := s[..];
    ReverseUptoK(s, k);
    // expect forall i: int :: 0 <= i < k ==> s[i] == old_s[k - 1 - i];
    // expect forall i: int  :: k <= i < s.Length ==> s[i] == old_s[i];
  }

  // Test case for combination {1}/Bs=3,k=3:
  //   PRE:  2 <= k <= s.Length
  //   POST: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[3] [6, 5, 4];
    var k := 3;
    var old_s := s[..];
    ReverseUptoK(s, k);
    // expect forall i: int :: 0 <= i < k ==> s[i] == old_s[k - 1 - i];
    // expect forall i: int  :: k <= i < s.Length ==> s[i] == old_s[i];
  }

}

method Main()
{
  Passing();
  Failing();
}
