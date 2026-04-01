// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\FlexWeek_tmp_tmpc_tfdj_3_ex4.dfy
// Method: join
// Generated: 2026-04-01 22:28:52

// FlexWeek_tmp_tmpc_tfdj_3_ex4.dfy

method join(a: array<int>, b: array<int>) returns (c: array<int>)
  ensures a[..] + b[..] == c[..]
  ensures multiset(a[..] + b[..]) == multiset(c[..])
  ensures multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  ensures a.Length + b.Length == c.Length
  ensures forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  ensures forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  decreases a, b
{
  c := new int[a.Length + b.Length];
  var i := 0;
  while i < a.Length
    invariant 0 <= i <= a.Length
    invariant c[..i] == a[..i]
    invariant multiset(c[..i]) == multiset(a[..i])
    invariant forall k: int {:trigger a[k]} {:trigger c[k]} :: 0 <= k < i < a.Length ==> c[k] == a[k]
    decreases a.Length - i
  {
    c[i] := a[i];
    i := i + 1;
  }
  i := a.Length;
  var j := 0;
  while i < c.Length && j < b.Length
    invariant 0 <= j <= b.Length
    invariant 0 <= a.Length <= i <= c.Length
    invariant c[..a.Length] == a[..a.Length]
    invariant c[a.Length .. i] == b[..j]
    invariant c[..a.Length] + c[a.Length .. i] == a[..a.Length] + b[..j]
    invariant multiset(c[a.Length .. i]) == multiset(b[..j])
    invariant multiset(c[..a.Length] + c[a.Length .. i]) == multiset(a[..a.Length] + b[..j])
    invariant forall k: int {:trigger a[k]} {:trigger c[k]} :: 0 <= k < a.Length ==> c[k] == a[k]
    invariant forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < i && 0 <= j_2 < j && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
    invariant forall k_2: int, i_2: int, j_2: int {:trigger a[k_2], b[j_2], c[i_2]} {:trigger c[k_2], b[j_2], c[i_2]} :: (0 <= k_2 < a.Length && a.Length <= i_2 < i && 0 <= j_2 < j && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]) && (0 <= k_2 < a.Length && a.Length <= i_2 < i && 0 <= j_2 < j && i_2 - j_2 == a.Length ==> c[k_2] == a[k_2])
    decreases c.Length - i, if i < c.Length then b.Length - j else 0 - 1
  {
    c[i] := b[j];
    i := i + 1;
    j := j + 1;
  }
  assert a[..] + b[..] == c[..];
  assert multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
}

method Check()
{
  var a := new int[] [1, 2, 3];
  var b := new int[] [4, 5];
  var c := new int[] [1, 2, 3, 4, 5];
  var d := join(a, b);
  assert d[..] == a[..] + b[..];
  assert multiset(d[..]) == multiset(a[..] + b[..]);
  assert multiset(d[..]) == multiset(a[..]) + multiset(b[..]);
  assert d[..] == c[..];
  assert d[..] == c[..];
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: a[..] + b[..] == c[..]
  //   POST: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST: a.Length + b.Length == c.Length
  //   POST: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  {
    var a := new int[0] [];
    var b := new int[0] [];
    var c := join(a, b);
    expect a[..] + b[..] == c[..];
    expect multiset(a[..] + b[..]) == multiset(c[..]);
    expect multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
    expect a.Length + b.Length == c.Length;
    expect forall i: int  :: 0 <= i < a.Length ==> c[i] == a[i];
    expect forall i_2: int, j_2: int :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2];
  }

  // Test case for combination {1}/Ba=0,b=1:
  //   POST: a[..] + b[..] == c[..]
  //   POST: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST: a.Length + b.Length == c.Length
  //   POST: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  {
    var a := new int[0] [];
    var b := new int[1] [2];
    var c := join(a, b);
    expect a[..] + b[..] == c[..];
    expect multiset(a[..] + b[..]) == multiset(c[..]);
    expect multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
    expect a.Length + b.Length == c.Length;
    expect forall i: int  :: 0 <= i < a.Length ==> c[i] == a[i];
    expect forall i_2: int, j_2: int :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2];
  }

  // Test case for combination {1}/Ba=0,b=2:
  //   POST: a[..] + b[..] == c[..]
  //   POST: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST: a.Length + b.Length == c.Length
  //   POST: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  {
    var a := new int[0] [];
    var b := new int[2] [4, 3];
    var c := join(a, b);
    expect a[..] + b[..] == c[..];
    expect multiset(a[..] + b[..]) == multiset(c[..]);
    expect multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
    expect a.Length + b.Length == c.Length;
    expect forall i: int  :: 0 <= i < a.Length ==> c[i] == a[i];
    expect forall i_2: int, j_2: int :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2];
  }

  // Test case for combination {1}/Ba=0,b=3:
  //   POST: a[..] + b[..] == c[..]
  //   POST: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST: a.Length + b.Length == c.Length
  //   POST: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  {
    var a := new int[0] [];
    var b := new int[3] [5, 4, 6];
    var c := join(a, b);
    expect a[..] + b[..] == c[..];
    expect multiset(a[..] + b[..]) == multiset(c[..]);
    expect multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
    expect a.Length + b.Length == c.Length;
    expect forall i: int  :: 0 <= i < a.Length ==> c[i] == a[i];
    expect forall i_2: int, j_2: int :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2];
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
