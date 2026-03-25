// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny_tmp_tmp49a6ihvk_m4__713-713_AOI.dfy
// Method: DutchFlag
// Generated: 2026-03-25 22:48:06

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


method GeneratedTests_DutchFlag()
{
  // Test case for combination {1}:
  //   POST: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[0] [];
    var old_a := a[..];
    DutchFlag(a);
    expect forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j]);
    expect multiset(a[..]) == multiset(old_a[..]);
  }

  // Test case for combination {1}:
  //   POST: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[1] [6];
    var old_a := a[..];
    DutchFlag(a);
    expect forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j]);
    expect multiset(a[..]) == multiset(old_a[..]);
  }

  // Test case for combination {1}/Ba=2:
  //   POST: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[2] [4, 3];
    var old_a := a[..];
    DutchFlag(a);
    expect forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j]);
    expect multiset(a[..]) == multiset(old_a[..]);
  }

  // Test case for combination {1}/Ba=3:
  //   POST: forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j])
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new Color[3] [5, 4, 6];
    var old_a := a[..];
    DutchFlag(a);
    expect forall i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length ==> Below(a[i], a[j]);
    expect multiset(a[..]) == multiset(old_a[..]);
  }

}

method Main()
{
  GeneratedTests_DutchFlag();
  print "GeneratedTests_DutchFlag: all tests passed!\n";
}
