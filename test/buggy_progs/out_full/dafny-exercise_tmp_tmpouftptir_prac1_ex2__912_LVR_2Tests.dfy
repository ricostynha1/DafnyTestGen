// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-exercise_tmp_tmpouftptir_prac1_ex2__912_LVR_2.dfy
// Method: Deli
// Generated: 2026-04-24 09:56:26

// dafny-exercise_tmp_tmpouftptir_prac1_ex2.dfy

method Deli(a: array<char>, i: nat)
  requires a.Length > 0
  requires 0 <= i < a.Length
  modifies a
  ensures forall j: int {:trigger old(a[j])} {:trigger a[j]} :: 0 <= j < i ==> a[j] == old(a[j])
  ensures forall j: int {:trigger a[j]} :: i <= j < a.Length - 1 ==> a[j] == old(a[j + 1])
  ensures a[a.Length - 1] == '.'
  decreases a, i
{
  var c := i;
  while c < a.Length - 1
    invariant i <= c <= a.Length - 1
    invariant forall j: int {:trigger a[j]} :: i <= j < c ==> a[j] == old(a[j + 1])
    invariant forall j: int {:trigger old(a[j])} {:trigger a[j]} :: 0 <= j < i ==> a[j] == old(a[j])
    invariant forall j: int {:trigger old(a[j])} {:trigger a[j]} :: c <= j < a.Length ==> a[j] == old(a[j])
    decreases a.Length - 1 - c
  {
    a[c] := a[c + 1];
    c := c + 1;
  }
  a[c] := '.';
}

method DeliChecker()
{
  var z := new char[] ['b', 'r', 'o', 'o', 'm'];
  Deli(z, 1);
  assert z[..] == "boom.";
  Deli(z, 3);
  assert z[..] == "boo..";
  Deli(z, 4);
  assert z[..] == "boo..";
  Deli(z, 3);
  assert z[..] == "boo..";
  Deli(z, 0);
  Deli(z, 0);
  Deli(z, 0);
  assert z[..] == ".....";
  z := new char[] ['x'];
  Deli(z, 0);
  assert z[..] == ".";
}


method TestsForDeli()
{
  // Test case for combination {1}/Rel:
  //   PRE:  a.Length > 0
  //   PRE:  0 <= i < a.Length
  //   POST Q1: forall j: int {:trigger old(a[j])} {:trigger a[j]} :: 0 <= j < i ==> a[j] == old(a[j])
  //   POST Q2: forall j: int {:trigger a[j]} :: i <= j < a.Length - 1 ==> a[j] == old(a[j + 1])
  //   POST Q3: a[a.Length - 1] == '.'
  {
    var a := new char[3] ['t', '-', '/'];
    var i := 2;
    Deli(a, i);
    expect a[..] == ['t', '-', '.'];
    expect a[..] == t-.; // observed from implementation
  }

  // Test case for combination {1}/Bi=0:
  //   PRE:  a.Length > 0
  //   PRE:  0 <= i < a.Length
  //   POST Q1: forall j: int {:trigger old(a[j])} {:trigger a[j]} :: 0 <= j < i ==> a[j] == old(a[j])
  //   POST Q2: forall j: int {:trigger a[j]} :: i <= j < a.Length - 1 ==> a[j] == old(a[j + 1])
  //   POST Q3: a[a.Length - 1] == '.'
  {
    var a := new char[1] ['.'];
    var i := 0;
    Deli(a, i);
    expect a[..] == ['.'];
    expect a[..] == .; // observed from implementation
  }

  // Test case for combination {1}/Bi=1:
  //   PRE:  a.Length > 0
  //   PRE:  0 <= i < a.Length
  //   POST Q1: forall j: int {:trigger old(a[j])} {:trigger a[j]} :: 0 <= j < i ==> a[j] == old(a[j])
  //   POST Q2: forall j: int {:trigger a[j]} :: i <= j < a.Length - 1 ==> a[j] == old(a[j + 1])
  //   POST Q3: a[a.Length - 1] == '.'
  {
    var a := new char[2] ['~', '.'];
    var i := 1;
    Deli(a, i);
    expect a[..] == ['~', '.'];
    expect a[..] == ~.; // observed from implementation
  }

  // Test case for combination {1}/R3:
  //   PRE:  a.Length > 0
  //   PRE:  0 <= i < a.Length
  //   POST Q1: forall j: int {:trigger old(a[j])} {:trigger a[j]} :: 0 <= j < i ==> a[j] == old(a[j])
  //   POST Q2: forall j: int {:trigger a[j]} :: i <= j < a.Length - 1 ==> a[j] == old(a[j + 1])
  //   POST Q3: a[a.Length - 1] == '.'
  {
    var a := new char[3] ['%', '~', '-'];
    var i := 2;
    Deli(a, i);
    expect a[..] == ['%', '~', '.'];
    expect a[..] == %~.; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  a.Length > 0
  //   PRE:  0 <= i < a.Length
  //   POST Q1: forall j: int {:trigger old(a[j])} {:trigger a[j]} :: 0 <= j < i ==> a[j] == old(a[j])
  //   POST Q2: forall j: int {:trigger a[j]} :: i <= j < a.Length - 1 ==> a[j] == old(a[j + 1])
  //   POST Q3: a[a.Length - 1] == '.'
  {
    var a := new char[3] ['p', '}', '('];
    var i := 2;
    Deli(a, i);
    expect a[..] == ['p', '}', '.'];
    expect a[..] == p}.; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  a.Length > 0
  //   PRE:  0 <= i < a.Length
  //   POST Q1: forall j: int {:trigger old(a[j])} {:trigger a[j]} :: 0 <= j < i ==> a[j] == old(a[j])
  //   POST Q2: forall j: int {:trigger a[j]} :: i <= j < a.Length - 1 ==> a[j] == old(a[j + 1])
  //   POST Q3: a[a.Length - 1] == '.'
  {
    var a := new char[3] ['~', '-', '\U{0027}'];
    var i := 2;
    Deli(a, i);
    expect a[..] == ['~', '-', '.'];
    expect a[..] == ~-.; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  a.Length > 0
  //   PRE:  0 <= i < a.Length
  //   POST Q1: forall j: int {:trigger old(a[j])} {:trigger a[j]} :: 0 <= j < i ==> a[j] == old(a[j])
  //   POST Q2: forall j: int {:trigger a[j]} :: i <= j < a.Length - 1 ==> a[j] == old(a[j + 1])
  //   POST Q3: a[a.Length - 1] == '.'
  {
    var a := new char[3] ['2', 'o', '-'];
    var i := 2;
    Deli(a, i);
    expect a[..] == ['2', 'o', '.'];
    expect a[..] == 2o.; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  a.Length > 0
  //   PRE:  0 <= i < a.Length
  //   POST Q1: forall j: int {:trigger old(a[j])} {:trigger a[j]} :: 0 <= j < i ==> a[j] == old(a[j])
  //   POST Q2: forall j: int {:trigger a[j]} :: i <= j < a.Length - 1 ==> a[j] == old(a[j + 1])
  //   POST Q3: a[a.Length - 1] == '.'
  {
    var a := new char[3] ['#', ',', '-'];
    var i := 2;
    Deli(a, i);
    expect a[..] == ['#', ',', '.'];
    expect a[..] == #,.; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  a.Length > 0
  //   PRE:  0 <= i < a.Length
  //   POST Q1: forall j: int {:trigger old(a[j])} {:trigger a[j]} :: 0 <= j < i ==> a[j] == old(a[j])
  //   POST Q2: forall j: int {:trigger a[j]} :: i <= j < a.Length - 1 ==> a[j] == old(a[j + 1])
  //   POST Q3: a[a.Length - 1] == '.'
  {
    var a := new char[3] ['1', '|', '~'];
    var i := 2;
    Deli(a, i);
    expect a[..] == ['1', '|', '.'];
    expect a[..] == 1|.; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  a.Length > 0
  //   PRE:  0 <= i < a.Length
  //   POST Q1: forall j: int {:trigger old(a[j])} {:trigger a[j]} :: 0 <= j < i ==> a[j] == old(a[j])
  //   POST Q2: forall j: int {:trigger a[j]} :: i <= j < a.Length - 1 ==> a[j] == old(a[j + 1])
  //   POST Q3: a[a.Length - 1] == '.'
  {
    var a := new char[3] ['~', '+', '}'];
    var i := 2;
    Deli(a, i);
    expect a[..] == ['~', '+', '.'];
    expect a[..] == ~+.; // observed from implementation
  }

}

method Main()
{
  TestsForDeli();
  print "TestsForDeli: all non-failing tests passed!\n";
}
