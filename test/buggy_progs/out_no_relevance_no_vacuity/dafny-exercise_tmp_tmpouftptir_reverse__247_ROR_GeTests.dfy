// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-exercise_tmp_tmpouftptir_reverse__247_ROR_Ge.dfy
// Method: Reverse
// Generated: 2026-04-24 23:35:14

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
  while i >= a.Length
    invariant 0 <= i <= a.Length
    invariant forall j: int {:trigger b[j]} :: 0 <= j < i ==> b[j] == a[a.Length - j - 1]
    decreases i - a.Length
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
  a := new char[] ['!'];
  b := Reverse(a);
  assert b[..] == a[..];
  print b[..], '\n';
}


method TestsForReverse()
{
  // Test case for combination {1}:
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
    var a := new char[2] ['(', '('];
    var old_a := a;
    var b := Reverse(a);
    expect b[..] == ['(', '('];
  }

  // Test case for combination {1}/R3:
  //   PRE:  a.Length > 0
  //   POST Q1: a == old(a)
  //   POST Q2: b.Length == a.Length
  //   POST Q3: forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  {
    var a := new char[1] ['}'];
    var old_a := a;
    var b := Reverse(a);
    expect b[..] == ['}'];
  }

  // Test case for combination {1}/R4:
  //   PRE:  a.Length > 0
  //   POST Q1: a == old(a)
  //   POST Q2: b.Length == a.Length
  //   POST Q3: forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  {
    var a := new char[1] ['|'];
    var old_a := a;
    var b := Reverse(a);
    expect b[..] == ['|'];
  }

  // Test case for combination {1}/R5:
  //   PRE:  a.Length > 0
  //   POST Q1: a == old(a)
  //   POST Q2: b.Length == a.Length
  //   POST Q3: forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  {
    var a := new char[1] ['{'];
    var old_a := a;
    var b := Reverse(a);
    expect b[..] == ['{'];
  }

  // Test case for combination {1}/R6:
  //   PRE:  a.Length > 0
  //   POST Q1: a == old(a)
  //   POST Q2: b.Length == a.Length
  //   POST Q3: forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  {
    var a := new char[1] ['z'];
    var old_a := a;
    var b := Reverse(a);
    expect b[..] == ['z'];
  }

  // Test case for combination {1}/R7:
  //   PRE:  a.Length > 0
  //   POST Q1: a == old(a)
  //   POST Q2: b.Length == a.Length
  //   POST Q3: forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  {
    var a := new char[1] ['f'];
    var old_a := a;
    var b := Reverse(a);
    expect b[..] == ['f'];
  }

  // Test case for combination {1}/R8:
  //   PRE:  a.Length > 0
  //   POST Q1: a == old(a)
  //   POST Q2: b.Length == a.Length
  //   POST Q3: forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  {
    var a := new char[1] ['e'];
    var old_a := a;
    var b := Reverse(a);
    expect b[..] == ['e'];
  }

  // Test case for combination {1}/R9:
  //   PRE:  a.Length > 0
  //   POST Q1: a == old(a)
  //   POST Q2: b.Length == a.Length
  //   POST Q3: forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  {
    var a := new char[1] ['d'];
    var old_a := a;
    var b := Reverse(a);
    expect b[..] == ['d'];
  }

  // Test case for combination {1}/R10:
  //   PRE:  a.Length > 0
  //   POST Q1: a == old(a)
  //   POST Q2: b.Length == a.Length
  //   POST Q3: forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  {
    var a := new char[1] ['c'];
    var old_a := a;
    var b := Reverse(a);
    expect b[..] == ['c'];
  }

}
