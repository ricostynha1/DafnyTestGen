// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny_tmp_tmp49a6ihvk_m4__713-713_AOI.dfy
// Method: DutchFlag
// Generated: 2026-04-24 19:45:26

// dafny_tmp_tmp49a6ihvk_m4.dfy

predicate Below(c: Color, d: Color)
  decreases c, d
{
  c == Red || c == d || d == Blue
}

method DutchFlag(a: array<Color>)
  modifies a
  ensures forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  ensures multiset(a[..]) == multiset(old(a[..]))
  decreases a
{
  var r, w, b := 0, 0, a.Length;
  while w < b
    invariant 0 <= r <= w <= b <= a.Length
    invariant forall i: int {:trigger a[i]} :: 0 <= i < r ==> a[i] == Red
    invariant forall i: int {:trigger a[i]} :: r <= i < w ==> a[i] == White
    invariant forall i: int {:trigger a[i]} :: b <= i < a.Length ==> a[i] == Blue
    invariant multiset(a[..]) == multiset(old(a[..]))
    decreases b - w
  {
    match a[w]
    case {:split false} Red() =>
      a[r], a[w] := a[w], a[r];
      r, w := r + -1, w + 1;
    case {:split false} White() =>
      w := w + 1;
    case {:split false} Blue() =>
      a[b - 1], a[w] := a[w], a[b - 1];
      b := b - 1;
  }
}

datatype Color = Red | White | Blue


method TestsForDutchFlag()
{
  // Test case for combination {1}:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[0] [];
    DutchFlag(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/O|a|=1:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[1] [White];
    DutchFlag(a);
    expect a[..] == [White];
    expect a[..] == [Color.White]; // observed from implementation
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[2] [Blue, White];
    DutchFlag(a);
    expect a[..] == [White, Blue];
    expect a[..] == [Color.White, Color.Blue]; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[1] [Red];
    DutchFlag(a);
    expect a[..] == [Red];
    expect a[..] == [Color.Red]; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[1] [Blue];
    DutchFlag(a);
    expect a[..] == [Blue];
    expect a[..] == [Color.Blue]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[2] [Red, White];
    DutchFlag(a);
    expect a[..] == [Red, White];
    expect a[..] == [Color.Red, Color.White]; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[2] [White, Red];
    DutchFlag(a);
    expect a[..] == [Red, White];
    expect a[..] == [Color.Red, Color.White]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[2] [Blue, Red];
    DutchFlag(a);
    expect a[..] == [Red, Blue];
    expect a[..] == [Color.Red, Color.Blue]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[2] [Red, Blue];
    DutchFlag(a);
    expect a[..] == [Red, Blue];
    expect a[..] == [Color.Red, Color.Blue]; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   POST Q1: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[2] [Red, Red];
    DutchFlag(a);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.DutchFlag(_IColor[] a) in C:\cygwin64\tmp\DafnyCBT_mn1e5dd0mdr\runner.cs:line 5911
    // runtime error: at _module.__default.TestCase__9() in C:\cygwin64\tmp\DafnyCBT_mn1e5dd0mdr\runner.cs:line 6141
    // expect a[..] == [Red, Red];
  }

}

method Main()
{
  TestsForDutchFlag();
  print "TestsForDutchFlag: all non-failing tests passed!\n";
}
