// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\FlexWeek_tmp_tmpc_tfdj_3_ex4__2569_LVR_0.dfy
// Method: join
// Generated: 2026-04-25 00:10:48

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
  var a := new int[] [1, 0, 3];
  var b := new int[] [4, 5];
  var c := new int[] [1, 2, 3, 4, 5];
  var d := join(a, b);
  assert d[..] == a[..] + b[..];
  assert multiset(d[..]) == multiset(a[..] + b[..]);
  assert multiset(d[..]) == multiset(a[..]) + multiset(b[..]);
  assert d[..] == c[..];
  assert d[..] == c[..];
}


method TestsForjoin()
{
  // Test case for combination {1}:
  //   POST Q1: a[..] + b[..] == c[..]
  //   POST Q2: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST Q3: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST Q4: a.Length + b.Length == c.Length
  //   POST Q5: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST Q6: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  {
    var a := new int[1] [-9];
    var b := new int[1] [-10];
    var c := join(a, b);
    expect a[..] + b[..] == c[..];
    expect multiset(a[..] + b[..]) == multiset(c[..]);
    expect multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
    expect a.Length + b.Length == c.Length;
    expect forall i: int  :: 0 <= i < a.Length ==> c[i] == a[i];
    expect forall i_2: int, j_2: int :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2];
    expect c[..] == [-9, -10]; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: a[..] + b[..] == c[..]
  //   POST Q2: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST Q3: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST Q4: a.Length + b.Length == c.Length
  //   POST Q5: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST Q6: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  {
    var a := new int[0] [];
    var b := new int[1] [-10];
    var c := join(a, b);
    expect a[..] + b[..] == c[..];
    expect multiset(a[..] + b[..]) == multiset(c[..]);
    expect multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
    expect a.Length + b.Length == c.Length;
    expect forall i: int  :: 0 <= i < a.Length ==> c[i] == a[i];
    expect forall i_2: int, j_2: int :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2];
    expect c[..] == [-10]; // observed from implementation
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: a[..] + b[..] == c[..]
  //   POST Q2: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST Q3: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST Q4: a.Length + b.Length == c.Length
  //   POST Q5: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST Q6: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  {
    var a := new int[2] [-10, -5];
    var b := new int[1] [-4];
    var c := join(a, b);
    expect a[..] + b[..] == c[..];
    expect multiset(a[..] + b[..]) == multiset(c[..]);
    expect multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
    expect a.Length + b.Length == c.Length;
    expect forall i: int  :: 0 <= i < a.Length ==> c[i] == a[i];
    expect forall i_2: int, j_2: int :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2];
    expect c[..] == [-10, -5, -4]; // observed from implementation
  }

  // Test case for combination {1}/O|b|=0:
  //   POST Q1: a[..] + b[..] == c[..]
  //   POST Q2: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST Q3: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST Q4: a.Length + b.Length == c.Length
  //   POST Q5: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST Q6: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  {
    var a := new int[1] [-10];
    var b := new int[0] [];
    var c := join(a, b);
    expect a[..] + b[..] == c[..];
    expect multiset(a[..] + b[..]) == multiset(c[..]);
    expect multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
    expect a.Length + b.Length == c.Length;
    expect forall i: int  :: 0 <= i < a.Length ==> c[i] == a[i];
    expect forall i_2: int, j_2: int :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2];
    expect c[..] == [-10]; // observed from implementation
  }

  // Test case for combination {1}/O|b|>=2:
  //   POST Q1: a[..] + b[..] == c[..]
  //   POST Q2: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST Q3: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST Q4: a.Length + b.Length == c.Length
  //   POST Q5: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST Q6: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  {
    var a := new int[1] [-6];
    var b := new int[2] [-9, -7];
    var c := join(a, b);
    expect a[..] + b[..] == c[..];
    expect multiset(a[..] + b[..]) == multiset(c[..]);
    expect multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
    expect a.Length + b.Length == c.Length;
    expect forall i: int  :: 0 <= i < a.Length ==> c[i] == a[i];
    expect forall i_2: int, j_2: int :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2];
    expect c[..] == [-6, -9, -7]; // observed from implementation
  }

  // Test case for combination {1}/O|c|=0:
  //   POST Q1: a[..] + b[..] == c[..]
  //   POST Q2: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST Q3: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST Q4: a.Length + b.Length == c.Length
  //   POST Q5: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST Q6: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
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
    expect c[..] == []; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   POST Q1: a[..] + b[..] == c[..]
  //   POST Q2: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST Q3: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST Q4: a.Length + b.Length == c.Length
  //   POST Q5: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST Q6: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  {
    var a := new int[1] [-5];
    var b := new int[1] [9];
    var c := join(a, b);
    expect a[..] + b[..] == c[..];
    expect multiset(a[..] + b[..]) == multiset(c[..]);
    expect multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
    expect a.Length + b.Length == c.Length;
    expect forall i: int  :: 0 <= i < a.Length ==> c[i] == a[i];
    expect forall i_2: int, j_2: int :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2];
    expect c[..] == [-5, 9]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   POST Q1: a[..] + b[..] == c[..]
  //   POST Q2: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST Q3: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST Q4: a.Length + b.Length == c.Length
  //   POST Q5: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST Q6: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  {
    var a := new int[1] [-4];
    var b := new int[1] [8];
    var c := join(a, b);
    expect a[..] + b[..] == c[..];
    expect multiset(a[..] + b[..]) == multiset(c[..]);
    expect multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
    expect a.Length + b.Length == c.Length;
    expect forall i: int  :: 0 <= i < a.Length ==> c[i] == a[i];
    expect forall i_2: int, j_2: int :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2];
    expect c[..] == [-4, 8]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   POST Q1: a[..] + b[..] == c[..]
  //   POST Q2: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST Q3: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST Q4: a.Length + b.Length == c.Length
  //   POST Q5: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST Q6: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  {
    var a := new int[1] [-7];
    var b := new int[1] [-8];
    var c := join(a, b);
    expect a[..] + b[..] == c[..];
    expect multiset(a[..] + b[..]) == multiset(c[..]);
    expect multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
    expect a.Length + b.Length == c.Length;
    expect forall i: int  :: 0 <= i < a.Length ==> c[i] == a[i];
    expect forall i_2: int, j_2: int :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2];
    expect c[..] == [-7, -8]; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   POST Q1: a[..] + b[..] == c[..]
  //   POST Q2: multiset(a[..] + b[..]) == multiset(c[..])
  //   POST Q3: multiset(a[..]) + multiset(b[..]) == multiset(c[..])
  //   POST Q4: a.Length + b.Length == c.Length
  //   POST Q5: forall i: int {:trigger a[i]} {:trigger c[i]} :: 0 <= i < a.Length ==> c[i] == a[i]
  //   POST Q6: forall i_2: int, j_2: int {:trigger b[j_2], c[i_2]} :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2]
  {
    var a := new int[1] [-3];
    var b := new int[1] [-3];
    var c := join(a, b);
    expect a[..] + b[..] == c[..];
    expect multiset(a[..] + b[..]) == multiset(c[..]);
    expect multiset(a[..]) + multiset(b[..]) == multiset(c[..]);
    expect a.Length + b.Length == c.Length;
    expect forall i: int  :: 0 <= i < a.Length ==> c[i] == a[i];
    expect forall i_2: int, j_2: int :: a.Length <= i_2 < c.Length && 0 <= j_2 < b.Length && i_2 - j_2 == a.Length ==> c[i_2] == b[j_2];
    expect c[..] == [-3, -3]; // observed from implementation
  }

}

method Main()
{
  TestsForjoin();
  print "TestsForjoin: all non-failing tests passed!\n";
}
