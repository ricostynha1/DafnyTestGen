// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\SENG2011_tmp_tmpgk5jq85q_p1__903-991_SDL.dfy
// Method: Reverse
// Generated: 2026-04-24 20:38:47

// SENG2011_tmp_tmpgk5jq85q_p1.dfy

method Reverse(a: array<char>) returns (b: array<char>)
  requires a.Length > 0
  ensures a.Length == b.Length
  ensures forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  decreases a
{
  b := new char[a.Length];
  var k := 0;
  while k < a.Length
    invariant 0 <= k <= a.Length
    invariant forall x: int {:trigger b[x]} :: 0 <= x < k ==> b[x] == a[a.Length - x - 1]
    decreases a.Length - k
  {
    b[k] := a[a.Length - 1 - k];
    k := k + 1;
  }
}

method Main()
{
  var a := new char[8];
  var b := Reverse(a);
  assert b[..] == ['r', 'e', 'v', 'e', 'r', 's', 'e', 'd'];
  print b[..];
  a := new char[1];
  a[0] := '!';
  b := Reverse(a);
  assert b[..] == ['!'];
  print b[..], '\n';
}


method TestsForReverse()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST Q1: a.Length == b.Length
  //   POST Q2: forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  {
    var a := new char[1] [' '];
    var b := Reverse(a);
    expect b[..] == [' '];
  }

  // Test case for combination {1}/O|a|>=2:
  //   PRE:  a.Length > 0
  //   POST Q1: a.Length == b.Length
  //   POST Q2: forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  {
    var a := new char[2] ['+', '+'];
    var b := Reverse(a);
    expect b[..] == ['+', '+'];
  }

  // Test case for combination {1}/R3:
  //   PRE:  a.Length > 0
  //   POST Q1: a.Length == b.Length
  //   POST Q2: forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  {
    var a := new char[1] ['!'];
    var b := Reverse(a);
    expect b[..] == ['!'];
  }

  // Test case for combination {1}/R4:
  //   PRE:  a.Length > 0
  //   POST Q1: a.Length == b.Length
  //   POST Q2: forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  {
    var a := new char[1] ['"'];
    var b := Reverse(a);
    expect b[..] == ['"'];
  }

  // Test case for combination {1}/R5:
  //   PRE:  a.Length > 0
  //   POST Q1: a.Length == b.Length
  //   POST Q2: forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  {
    var a := new char[1] ['#'];
    var b := Reverse(a);
    expect b[..] == ['#'];
  }

  // Test case for combination {1}/R6:
  //   PRE:  a.Length > 0
  //   POST Q1: a.Length == b.Length
  //   POST Q2: forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  {
    var a := new char[1] ['$'];
    var b := Reverse(a);
    expect b[..] == ['$'];
  }

  // Test case for combination {1}/R7:
  //   PRE:  a.Length > 0
  //   POST Q1: a.Length == b.Length
  //   POST Q2: forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  {
    var a := new char[1] ['%'];
    var b := Reverse(a);
    expect b[..] == ['%'];
  }

  // Test case for combination {1}/R8:
  //   PRE:  a.Length > 0
  //   POST Q1: a.Length == b.Length
  //   POST Q2: forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  {
    var a := new char[1] ['&'];
    var b := Reverse(a);
    expect b[..] == ['&'];
  }

  // Test case for combination {1}/R9:
  //   PRE:  a.Length > 0
  //   POST Q1: a.Length == b.Length
  //   POST Q2: forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  {
    var a := new char[1] ['\U{0027}'];
    var b := Reverse(a);
    expect b[..] == ['\U{0027}'];
  }

  // Test case for combination {1}/R10:
  //   PRE:  a.Length > 0
  //   POST Q1: a.Length == b.Length
  //   POST Q2: forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  {
    var a := new char[1] ['('];
    var b := Reverse(a);
    expect b[..] == ['('];
  }

}
