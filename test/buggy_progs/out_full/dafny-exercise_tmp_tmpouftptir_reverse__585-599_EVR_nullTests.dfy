// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-exercise_tmp_tmpouftptir_reverse__585-599_EVR_null.dfy
// Method: Reverse
// Generated: 2026-04-24 09:56:31

// dafny-exercise_tmp_tmpouftptir_reverse.dfy

method Reverse(a: array<char>) returns (b: array<char>)
  requires a.Length > 0
  ensures a == old(a)
  ensures b.Length == a.Length
  ensures forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  decreases a
{
  b := new char[a.Length];
  var i := 0;
  while i < a.Length
    invariant 0 <= i <= a.Length
    invariant forall j: int {:trigger b[j]} :: 0 <= j < i ==> b[j] == a[a.Length - j - 1]
    decreases a.Length - i
  {
    b[i] := a[a.Length - i - 1];
    i := i + 1;
  }
}

method Main()
{
  var a := new char[] ['s', 'k', 'r', 'o', 'w', 't', 'i'];
  var b := Reverse(a);
  assert b[..] == ['i', 't', 'w', 'o', 'r', 'k', 's'];
  print b[..];
  a := null;
  b := Reverse(a);
  assert b[..] == a[..];
  print b[..], '\n';
}


method TestsForReverse()
{
  // Test case for combination {1}/Rel:
  //   PRE:  a.Length > 0
  //   POST Q1: a == old(a)
  //   POST Q2: b.Length == a.Length
  //   POST Q3: forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  {
    var a := new char[1] ['~'];
    var old_a := a;
    var b := Reverse(a);
    expect b[..] == ['~'];
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: a == old(a)
  //   POST Q2: b.Length == a.Length
  //   POST Q3: forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  {
    var a := new char[2] ['f', 'f'];
    var old_a := a;
    var b := Reverse(a);
    expect b[..] == ['f', 'f'];
  }

}
