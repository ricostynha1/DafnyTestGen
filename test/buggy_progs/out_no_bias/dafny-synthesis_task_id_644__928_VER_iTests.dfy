// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_644__928_VER_i.dfy
// Method: Reverse
// Generated: 2026-04-24 12:05:13

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
    var a := new int[0] [];
    Reverse(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/O|a|=1:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [2];
    Reverse(a);
    expect a[..] == [2];
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[2] [12, 8];
    Reverse(a);
    expect a[..] == [8, 12];
  }

  // Test case for combination {1}/R4:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [9];
    Reverse(a);
    expect a[..] == [9];
  }

  // Test case for combination {1}/R5:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [10];
    Reverse(a);
    expect a[..] == [10];
  }

  // Test case for combination {1}/R6:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [11];
    Reverse(a);
    expect a[..] == [11];
  }

  // Test case for combination {1}/R7:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [13];
    Reverse(a);
    expect a[..] == [13];
  }

  // Test case for combination {1}/R8:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [14];
    Reverse(a);
    expect a[..] == [14];
  }

  // Test case for combination {1}/R9:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [15];
    Reverse(a);
    expect a[..] == [15];
  }

  // Test case for combination {1}/R10:
  //   POST Q1: forall k: int {:trigger a[k]} :: 0 <= k < a.Length ==> a[k] == old(a[a.Length - 1 - k])
  {
    var a := new int[1] [16];
    Reverse(a);
    expect a[..] == [16];
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
    var s := new int[2] [13, 9];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[13, 13]
    // expect s[..] == [9, 13]; // LHS=[13, 13], RHS=[9, 13]
  }

  // Test case for combination {1}/Bk=3:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[3] [11, 9, 11];
    var k := 3;
    ReverseUptoK(s, k);
    expect s[..] == [11, 9, 11];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bk=s_pre_len-1:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[4] [17, 15, 10, 34];
    var k := 3;
    ReverseUptoK(s, k);
    // actual runtime state: s=[17, 15, 17, 34]
    // expect s[..] == [10, 15, 17, 34]; // LHS=[17, 15, 17, 34], RHS=[10, 15, 17, 34]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R3:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [18, 12];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[18, 18]
    // expect s[..] == [12, 18]; // LHS=[18, 18], RHS=[12, 18]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R4:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [20, 13];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[20, 20]
    // expect s[..] == [13, 20]; // LHS=[20, 20], RHS=[13, 20]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R5:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [22, 14];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[22, 22]
    // expect s[..] == [14, 22]; // LHS=[22, 22], RHS=[14, 22]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R6:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [24, 16];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[24, 24]
    // expect s[..] == [16, 24]; // LHS=[24, 24], RHS=[16, 24]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R7:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [26, 19];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[26, 26]
    // expect s[..] == [19, 26]; // LHS=[26, 26], RHS=[19, 26]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R8:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [28, 21];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[28, 28]
    // expect s[..] == [21, 28]; // LHS=[28, 28], RHS=[21, 28]
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R9:
  //   PRE:  2 <= k <= s.Length
  //   POST Q1: forall i: int {:trigger s[i]} :: 0 <= i < k ==> s[i] == old(s[k - 1 - i])
  //   POST Q2: forall i: int {:trigger old(s[i])} {:trigger s[i]} :: k <= i < s.Length ==> s[i] == old(s[i])
  {
    var s := new int[2] [30, 23];
    var k := 2;
    ReverseUptoK(s, k);
    // actual runtime state: s=[30, 30]
    // expect s[..] == [23, 30]; // LHS=[30, 30], RHS=[23, 30]
  }

}

method Main()
{
  TestsForReverse();
  print "TestsForReverse: all non-failing tests passed!\n";
  TestsForReverseUptoK();
  print "TestsForReverseUptoK: all non-failing tests passed!\n";
}
