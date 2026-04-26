// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\formal_verication_dafny_tmp_tmpwgl2qz28_Challenges_ex7__2458_DCR_G.dfy
// Method: Exchanger
// Generated: 2026-04-24 22:29:29

// formal_verication_dafny_tmp_tmpwgl2qz28_Challenges_ex7.dfy

method Exchanger(s: seq<Bases>, x: nat, y: nat)
    returns (t: seq<Bases>)
  requires 0 < |s| && x < |s| && y < |s|
  ensures |t| == |s|
  ensures forall b: nat {:trigger s[b]} {:trigger t[b]} :: 0 <= b < |s| && b != x && b != y ==> t[b] == s[b]
  ensures t[x] == s[y] && s[x] == t[y]
  ensures multiset(s) == multiset(t)
  decreases s, x, y
{
  t := s;
  t := t[x := s[y]];
  t := t[y := s[x]];
  return t;
}

predicate below(first: Bases, second: Bases)
  decreases first, second
{
  first == second || first == A || (first == C && (second == G || second == T)) || (first == G && second == T) || second == T
}

predicate bordered(s: seq<Bases>)
  decreases s
{
  forall j: int, k: int {:trigger s[k], s[j]} :: 
    0 <= j < k < |s| ==>
      below(s[j], s[k])
}

method Sorter(bases: seq<Bases>) returns (sobases: seq<Bases>)
  requires 0 < |bases|
  ensures |sobases| == |bases|
  ensures bordered(sobases)
  ensures multiset(bases) == multiset(sobases)
  decreases bases
{
  sobases := bases;
  var c, next: nat := 0, 0;
  var g, t: nat := |bases|, |bases|;
  while next != g
    invariant 0 <= c <= next <= g <= t <= |bases|
    invariant |sobases| == |bases|
    invariant multiset(bases) == multiset(sobases)
    invariant forall i: nat {:trigger sobases[i]} :: 0 <= i < c ==> sobases[i] == A
    invariant forall i: nat {:trigger sobases[i]} :: c <= i < next ==> sobases[i] == C
    invariant forall i: nat {:trigger sobases[i]} :: g <= i < t ==> sobases[i] == G
    invariant forall i: nat {:trigger sobases[i]} :: t <= i < |bases| ==> sobases[i] == T
    decreases if next <= g then g - next else next - g
  {
    match sobases[next] {
      case {:split false} C() =>
        next := next + 1;
      case {:split false} A() =>
        sobases := Exchanger(sobases, next, c);
        c, next := c + 1, next + 1;
      case {:split false} G() =>
        g := g - 1;
        sobases := Exchanger(sobases, next, g);
      case {:split false} T() =>
        g, t := g - 1, t - 1;
        sobases := Exchanger(sobases, next, t);
        if g != t {
          sobases := Exchanger(sobases, next, g);
        }
    }
  }
  return sobases;
}

method Testerexchange()
{
  var a: seq<Bases> := [A, C, A, T];
  var b: seq<Bases> := Exchanger(a, 2, 3);
  assert b == [A, C, T, A];
  var c: seq<Bases> := [A, C, A, T, A, T, C];
  var d: seq<Bases> := Exchanger(c, 5, 1);
  assert d == [A, T, A, T, A, C, C];
  var e: seq<Bases> := [A, C, G, T, A, T, C];
  var f: seq<Bases> := Exchanger(e, 1, 1);
  assert f == [A, C, A, T, A, T, C];
  var g: seq<Bases> := [A, C];
  var h: seq<Bases> := Exchanger(g, 0, 1);
  assert h == [C, A];
}

method Testsort()
{
  var a: seq<Bases> := [G, A, T];
  assert a == [G, A, T];
  var b: seq<Bases> := Sorter(a);
  assert bordered(b);
  assert multiset(b) == multiset(a);
  var c: seq<Bases> := [G, A, T, T, A, C, G, C, T, A, C, G, T, T, G];
  assert c == [G, A, T, T, A, C, G, C, T, A, C, G, T, T, G];
  var d: seq<Bases> := Sorter(c);
  assert bordered(d);
  assert multiset(c) == multiset(d);
  var e: seq<Bases> := [A];
  assert e == [A];
  var f: seq<Bases> := Sorter(e);
  assert bordered(b);
  assert multiset(e) == multiset(f);
  var g: seq<Bases> := [A, C, G, T];
  assert g == [A, C, G, T];
  var h: seq<Bases> := Sorter(g);
  assert bordered(b);
  assert multiset(g) == multiset(h);
  var i: seq<Bases> := [A, T, C, T, T];
  assert i[0] == A && i[1] == T && i[2] == C && i[3] == T && i[4] == T;
  assert !bordered(i);
}

datatype Bases = A | C | G | T


method TestsForExchanger()
{
  // Test case for combination {1}/Rel:
  //   PRE:  0 < |s| && x < |s| && y < |s|
  //   POST Q1: |t| == |s|
  //   POST Q2: forall b: nat {:trigger s[b]} {:trigger t[b]} :: 0 <= b < |s| && b != x && b != y ==> t[b] == s[b]
  //   POST Q3: t[x] == s[y]
  //   POST Q4: s[x] == t[y]
  //   POST Q5: multiset(s) == multiset(t)
  {
    var s: seq<Bases> := [C];
    var x := 0;
    var y := 0;
    var t := Exchanger(s, x, y);
    expect t == [C];
    expect t[..] == [Bases.C]; // observed from implementation
  }

  // Test case for combination {1}/Bx=1:
  //   PRE:  0 < |s| && x < |s| && y < |s|
  //   POST Q1: |t| == |s|
  //   POST Q2: forall b: nat {:trigger s[b]} {:trigger t[b]} :: 0 <= b < |s| && b != x && b != y ==> t[b] == s[b]
  //   POST Q3: t[x] == s[y]
  //   POST Q4: s[x] == t[y]
  //   POST Q5: multiset(s) == multiset(t)
  {
    var s: seq<Bases> := [A, T];
    var x := 1;
    var y := 0;
    var t := Exchanger(s, x, y);
    expect t == [T, A];
    expect t[..] == [Bases.T, Bases.A]; // observed from implementation
  }

  // Test case for combination {1}/By=1:
  //   PRE:  0 < |s| && x < |s| && y < |s|
  //   POST Q1: |t| == |s|
  //   POST Q2: forall b: nat {:trigger s[b]} {:trigger t[b]} :: 0 <= b < |s| && b != x && b != y ==> t[b] == s[b]
  //   POST Q3: t[x] == s[y]
  //   POST Q4: s[x] == t[y]
  //   POST Q5: multiset(s) == multiset(t)
  {
    var s: seq<Bases> := [T, A];
    var x := 0;
    var y := 1;
    var t := Exchanger(s, x, y);
    expect t == [A, T];
    expect t[..] == [Bases.A, Bases.T]; // observed from implementation
  }

  // Test case for combination {1}/Ox>=2:
  //   PRE:  0 < |s| && x < |s| && y < |s|
  //   POST Q1: |t| == |s|
  //   POST Q2: forall b: nat {:trigger s[b]} {:trigger t[b]} :: 0 <= b < |s| && b != x && b != y ==> t[b] == s[b]
  //   POST Q3: t[x] == s[y]
  //   POST Q4: s[x] == t[y]
  //   POST Q5: multiset(s) == multiset(t)
  {
    var s: seq<Bases> := [C, G, A];
    var x := 2;
    var y := 1;
    var t := Exchanger(s, x, y);
    expect t == [C, A, G];
    expect t[..] == [Bases.C, Bases.A, Bases.G]; // observed from implementation
  }

  // Test case for combination {1}/Oy>=2:
  //   PRE:  0 < |s| && x < |s| && y < |s|
  //   POST Q1: |t| == |s|
  //   POST Q2: forall b: nat {:trigger s[b]} {:trigger t[b]} :: 0 <= b < |s| && b != x && b != y ==> t[b] == s[b]
  //   POST Q3: t[x] == s[y]
  //   POST Q4: s[x] == t[y]
  //   POST Q5: multiset(s) == multiset(t)
  {
    var s: seq<Bases> := [G, C, T];
    var x := 1;
    var y := 2;
    var t := Exchanger(s, x, y);
    expect t == [G, T, C];
    expect t[..] == [Bases.G, Bases.T, Bases.C]; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  0 < |s| && x < |s| && y < |s|
  //   POST Q1: |t| == |s|
  //   POST Q2: forall b: nat {:trigger s[b]} {:trigger t[b]} :: 0 <= b < |s| && b != x && b != y ==> t[b] == s[b]
  //   POST Q3: t[x] == s[y]
  //   POST Q4: s[x] == t[y]
  //   POST Q5: multiset(s) == multiset(t)
  {
    var s: seq<Bases> := [A];
    var x := 0;
    var y := 0;
    var t := Exchanger(s, x, y);
    expect t == [A];
    expect t[..] == [Bases.A]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  0 < |s| && x < |s| && y < |s|
  //   POST Q1: |t| == |s|
  //   POST Q2: forall b: nat {:trigger s[b]} {:trigger t[b]} :: 0 <= b < |s| && b != x && b != y ==> t[b] == s[b]
  //   POST Q3: t[x] == s[y]
  //   POST Q4: s[x] == t[y]
  //   POST Q5: multiset(s) == multiset(t)
  {
    var s: seq<Bases> := [G];
    var x := 0;
    var y := 0;
    var t := Exchanger(s, x, y);
    expect t == [G];
    expect t[..] == [Bases.G]; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  0 < |s| && x < |s| && y < |s|
  //   POST Q1: |t| == |s|
  //   POST Q2: forall b: nat {:trigger s[b]} {:trigger t[b]} :: 0 <= b < |s| && b != x && b != y ==> t[b] == s[b]
  //   POST Q3: t[x] == s[y]
  //   POST Q4: s[x] == t[y]
  //   POST Q5: multiset(s) == multiset(t)
  {
    var s: seq<Bases> := [T];
    var x := 0;
    var y := 0;
    var t := Exchanger(s, x, y);
    expect t == [T];
    expect t[..] == [Bases.T]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  0 < |s| && x < |s| && y < |s|
  //   POST Q1: |t| == |s|
  //   POST Q2: forall b: nat {:trigger s[b]} {:trigger t[b]} :: 0 <= b < |s| && b != x && b != y ==> t[b] == s[b]
  //   POST Q3: t[x] == s[y]
  //   POST Q4: s[x] == t[y]
  //   POST Q5: multiset(s) == multiset(t)
  {
    var s: seq<Bases> := [A, C];
    var x := 1;
    var y := 1;
    var t := Exchanger(s, x, y);
    expect t == [A, C];
    expect t[..] == [Bases.A, Bases.C]; // observed from implementation
  }

}

method TestsForSorter()
{
  // Test case for combination {1}/Rel:
  //   PRE:  0 < |bases|
  //   POST Q1: |sobases| == |bases|
  //   POST Q2: bordered(sobases)
  //   POST Q3: multiset(bases) == multiset(sobases)
  {
    var bases: seq<Bases> := [T, C];
    var sobases := Sorter(bases);
    expect |sobases| == |bases|;
    expect bordered(sobases);
    expect multiset(bases) == multiset(sobases);
    expect sobases == [Bases.C, Bases.T]; // observed from implementation
  }

  // Test case for combination {1}/O|bases|=1:
  //   PRE:  0 < |bases|
  //   POST Q1: |sobases| == |bases|
  //   POST Q2: bordered(sobases)
  //   POST Q3: multiset(bases) == multiset(sobases)
  {
    var bases: seq<Bases> := [T];
    var sobases := Sorter(bases);
    expect sobases == [G] || sobases == [C] || sobases == [A] || sobases == [T];
    expect sobases[..] == [Bases.T]; // observed from implementation
  }

}

method Main()
{
  TestsForExchanger();
  print "TestsForExchanger: all non-failing tests passed!\n";
  TestsForSorter();
  print "TestsForSorter: all non-failing tests passed!\n";
}
