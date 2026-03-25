// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-exercise_tmp_tmpouftptir_reverse.dfy
// Method: Reverse
// Generated: 2026-03-25 22:37:51

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

method OriginalMain()
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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: a == old(a)
  //   POST: b.Length == a.Length
  //   POST: forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  {
    var a := new char[1] [' '];
    var old_a := a;
    var b := Reverse(a);
  }

  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: a == old(a)
  //   POST: b.Length == a.Length
  //   POST: forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  {
    var a := new char[2] ['U', ' '];
    var old_a := a;
    var b := Reverse(a);
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: a == old(a)
  //   POST: b.Length == a.Length
  //   POST: forall i: int {:trigger b[i]} :: 0 <= i < a.Length ==> b[i] == a[a.Length - i - 1]
  {
    var a := new char[3] [' ', '!', '"'];
    var old_a := a;
    var b := Reverse(a);
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
