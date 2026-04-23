// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_644.dfy
// Method: Reverse
// Generated: 2026-04-22 21:33:19

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


method TestsForReverse()
{
  // Test case for combination {1}:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [2];
    Reverse(a);
    expect a[..] == [2];
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[0] [];
    Reverse(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[2] [3, 3];
    Reverse(a);
    expect a[..] == [3, 3];
  }

  // Test case for combination {1}/Oa≠old:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[2] [-3, -4];
    Reverse(a);
    expect a[..] == [-4, -3];
  }

}

method TestsForReverseUptoK()
{
  // Test case for combination {1}/Rel:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [9, -10];
    var k := 2;
    ReverseUptoK(s, k);
    expect s[..] == [-10, 9];
  }

  // Test case for combination {1}/Bk=3:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[4] [-2, -10, -1, 16];
    var k := 3;
    ReverseUptoK(s, k);
    expect s[..] == [-1, -10, -2, 16];
  }

  // Test case for combination {1}/Os=old:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [-5, -5];
    var k := 2;
    ReverseUptoK(s, k);
    expect s[..] == [-5, -5];
  }

  // Test case for combination {1}/R3:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [-1, 8];
    var k := 2;
    ReverseUptoK(s, k);
    expect s[..] == [8, -1];
  }

}

method Main()
{
  TestsForReverse();
  print "TestsForReverse: all non-failing tests passed!\n";
  TestsForReverseUptoK();
  print "TestsForReverseUptoK: all non-failing tests passed!\n";
}
