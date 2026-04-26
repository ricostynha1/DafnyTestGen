// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_644__928_VER_i.dfy
// Method: Reverse
// Generated: 2026-04-24 16:28:02

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


method TestsForReverse()
{
  // Test case for combination {1}:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [-10];
    Reverse(a);
    expect a[..] == [-10];
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
    var a := new int[2] [-9, -10];
    Reverse(a);
    expect a[..] == [-10, -9];
  }

  // Test case for combination {1}/R4:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [-8];
    Reverse(a);
    expect a[..] == [-8];
  }

  // Test case for combination {1}/R5:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [-9];
    Reverse(a);
    expect a[..] == [-9];
  }

  // Test case for combination {1}/R6:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [-6];
    Reverse(a);
    expect a[..] == [-6];
  }

  // Test case for combination {1}/R7:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [-2];
    Reverse(a);
    expect a[..] == [-2];
  }

  // Test case for combination {1}/R8:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [-7];
    Reverse(a);
    expect a[..] == [-7];
  }

  // Test case for combination {1}/R9:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [-5];
    Reverse(a);
    expect a[..] == [-5];
  }

  // Test case for combination {1}/R10:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [-3];
    Reverse(a);
    expect a[..] == [-3];
  }

}

method TestsForReverseUptoK()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [2, -10];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[2, 2]
    // expect s[..] == [-10, 2]; // LHS=[2, 2], RHS=[-10, 2]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bk=3:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[4] [-10, -1, -9, 16];
    var k := 3;
    ReverseUptoK(s, k);
    // actual runtime state: s=[-10, -1, -10, 16]
    // expect s[..] == [-9, -1, -10, 16]; // LHS=[-10, -1, -10, 16], RHS=[-9, -1, -10, 16]
  }

  // Test case for combination {1}/Os=old:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [-9, -9];
    var k := 2;
    ReverseUptoK(s, k);
    expect s[..] == [-9, -9];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [-8, -10];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[-8, -8]
    // expect s[..] == [-10, -8]; // LHS=[-8, -8], RHS=[-10, -8]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [-7, 8];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[-7, -7]
    // expect s[..] == [8, -7]; // LHS=[-7, -7], RHS=[8, -7]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [-8, -7];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[-8, -8]
    // expect s[..] == [-7, -8]; // LHS=[-8, -8], RHS=[-7, -8]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [-6, -8];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[-6, -6]
    // expect s[..] == [-8, -6]; // LHS=[-6, -6], RHS=[-8, -6]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [-3, -2];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[-3, -3]
    // expect s[..] == [-2, -3]; // LHS=[-3, -3], RHS=[-2, -3]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [-4, -6];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[-4, -4]
    // expect s[..] == [-6, -4]; // LHS=[-4, -4], RHS=[-6, -4]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [10, -10];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[10, 10]
    // expect s[..] == [-10, 10]; // LHS=[10, 10], RHS=[-10, 10]
  }

}

method Main()
{
  TestsForReverse();
  print "TestsForReverse: all non-failing tests passed!\n";
  TestsForReverseUptoK();
  print "TestsForReverseUptoK: all non-failing tests passed!\n";
}
