// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\SENG2011_tmp_tmpgk5jq85q_p1__903-991_SDL.dfy
// Method: Reverse
// Generated: 2026-04-01 22:41:28

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

method OriginalMain()
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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  a.Length > 0
  //   POST: a.Length == b.Length
  //   POST: forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  {
    var a := new char[1] [' '];
    expect a.Length > 0; // PRE-CHECK
    var b := Reverse(a);
    expect a.Length == b.Length;
    expect forall x: int :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1];
  }

  // Test case for combination {1}/Ba=2:
  //   PRE:  a.Length > 0
  //   POST: a.Length == b.Length
  //   POST: forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  {
    var a := new char[2] [' ', '!'];
    expect a.Length > 0; // PRE-CHECK
    var b := Reverse(a);
    expect a.Length == b.Length;
    expect forall x: int :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1];
  }

  // Test case for combination {1}/Ba=3:
  //   PRE:  a.Length > 0
  //   POST: a.Length == b.Length
  //   POST: forall x: int {:trigger b[x]} :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1]
  {
    var a := new char[3] [' ', '!', '"'];
    expect a.Length > 0; // PRE-CHECK
    var b := Reverse(a);
    expect a.Length == b.Length;
    expect forall x: int :: 0 <= x < a.Length ==> b[x] == a[a.Length - x - 1];
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
