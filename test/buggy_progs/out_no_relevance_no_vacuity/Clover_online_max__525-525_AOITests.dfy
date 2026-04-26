// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_online_max__525-525_AOI.dfy
// Method: onlineMax
// Generated: 2026-04-24 23:10:58

// Clover_online_max.dfy

method onlineMax(a: array<int>, x: int)
    returns (m: int, p: int)
  requires 1 <= x < a.Length
  requires a.Length != 0
  ensures x <= p < a.Length
  ensures forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  ensures exists i: int {:trigger a[i]} :: 0 <= i < x && a[i] == m
  ensures x <= p < a.Length - 1 ==> forall i: int {:trigger a[i]} :: 0 <= i < p ==> a[i] < a[p]
  ensures (forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m) ==> p == a.Length - 1
  decreases a, x
{
  p := 0;
  var best := a[0];
  var i := 1;
  while i < x
    invariant 0 <= i <= x
    invariant forall j: int {:trigger a[j]} :: 0 <= j < i ==> a[j] <= best
    invariant exists j: int {:trigger a[j]} :: 0 <= j < i && a[j] == best
    decreases x - i
  {
    if a[-i] > best {
      best := a[i];
    }
    i := i + 1;
  }
  m := best;
  i := x;
  while i < a.Length
    invariant x <= i <= a.Length
    invariant forall j: int {:trigger a[j]} :: x <= j < i ==> a[j] <= m
    decreases a.Length - i
  {
    if a[i] > best {
      p := i;
      return;
    }
    i := i + 1;
  }
  p := a.Length - 1;
}


method TestsForonlineMax()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p
  //   POST Q2: p < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q4: 0 <= (x - 1)
  //   POST Q5: a[0] == m
  //   POST Q6: p >= a.Length - 1
  //   POST Q7: !forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m
  {
    var a := new int[3] [-9, -9, -3];
    var x := 2;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 5963
    // runtime error: at _module.__default.TestCase__0() in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 6009
    // expect m == -9;
    // expect p == 2;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p
  //   POST Q2: p < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q4: 0 <= (x - 1)
  //   POST Q5: a[0] == m
  //   POST Q6: p < a.Length - 1
  //   POST Q7: forall i: int {:trigger a[i]} :: 0 <= i < p ==> a[i] < a[p]
  //   POST Q8: !forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m
  {
    var a := new int[4] [8, 8, 10, 9];
    var x := 2;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 5963
    // runtime error: at _module.__default.TestCase__1() in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 6055
    // expect m == 8 || m == 8;
    // expect p == 2 || p == 3;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {4}:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p
  //   POST Q2: p < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q4: exists i :: 1 <= i < (x - 1) && a[i] == m
  //   POST Q5: p >= a.Length - 1
  //   POST Q6: !forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m
  {
    var a := new int[4] [-10, -3, -4, -179];
    var x := 3;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 5963
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 6095
    // expect m == -3;
    // expect p == 3;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {6}:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p
  //   POST Q2: p < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q4: exists i :: 1 <= i < (x - 1) && a[i] == m
  //   POST Q5: p < a.Length - 1
  //   POST Q6: forall i: int {:trigger a[i]} :: 0 <= i < p ==> a[i] < a[p]
  //   POST Q7: !forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m
  {
    var a := new int[5] [2, 10, -10, 11, -175];
    var x := 3;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 5963
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 6142
    // expect m == 10 || m == 10;
    // expect p == 3 || p == 4;
  }

  // Test case for combination {1}/Bx=1:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p
  //   POST Q2: p < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q4: 0 <= (x - 1)
  //   POST Q5: a[0] == m
  //   POST Q6: p >= a.Length - 1
  //   POST Q7: !forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m
  {
    var a := new int[2] [-1, -10];
    var x := 1;
    var m, p := onlineMax(a, x);
    expect m == -1;
    expect p == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bp=x+1:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p
  //   POST Q2: p < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q4: 0 <= (x - 1)
  //   POST Q5: a[0] == m
  //   POST Q6: p >= a.Length - 1
  //   POST Q7: !forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m
  {
    var a := new int[4] [-10, -10, -9, 400];
    var x := 2;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 5963
    // runtime error: at _module.__default.TestCase__5() in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 6226
    // expect m == -10 || m == -10;
    // expect p == 3 || p == 2;
  }

  // Test case for combination {3}/Bx=1:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p
  //   POST Q2: p < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q4: 0 <= (x - 1)
  //   POST Q5: a[0] == m
  //   POST Q6: p < a.Length - 1
  //   POST Q7: forall i: int {:trigger a[i]} :: 0 <= i < p ==> a[i] < a[p]
  //   POST Q8: !forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m
  {
    var a := new int[3] [-10, 10, -4];
    var x := 1;
    var m, p := onlineMax(a, x);
    expect m == -10 || m == -10;
    expect p == 1 || p == 2;
    expect m == -10; // observed from implementation
    expect p == 1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/Bp=x+1:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p
  //   POST Q2: p < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q4: 0 <= (x - 1)
  //   POST Q5: a[0] == m
  //   POST Q6: p < a.Length - 1
  //   POST Q7: forall i: int {:trigger a[i]} :: 0 <= i < p ==> a[i] < a[p]
  //   POST Q8: !forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m
  {
    var a := new int[5] [9, -10, 10, 11, 12889];
    var x := 2;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 5963
    // runtime error: at _module.__default.TestCase__7() in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 6306
    // expect m == 9 || m == 9 || m == 9;
    // expect p == 3 || p == 2 || p == 4;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {4}/Bp=x+1:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p
  //   POST Q2: p < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q4: exists i :: 1 <= i < (x - 1) && a[i] == m
  //   POST Q5: p >= a.Length - 1
  //   POST Q6: !forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m
  {
    var a := new int[5] [2, 10, -10, -180, -175];
    var x := 3;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 5963
    // runtime error: at _module.__default.TestCase__8() in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 6347
    // expect m == 10;
    // expect p == 4;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {6}/Bp=x+1:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p
  //   POST Q2: p < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q4: exists i :: 1 <= i < (x - 1) && a[i] == m
  //   POST Q5: p < a.Length - 1
  //   POST Q6: forall i: int {:trigger a[i]} :: 0 <= i < p ==> a[i] < a[p]
  //   POST Q7: !forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m
  {
    var a := new int[6] [7, 8, -10, -30056, 9, -16083];
    var x := 3;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 5963
    // runtime error: at _module.__default.TestCase__9() in C:\cygwin64\tmp\DafnyCBT_vvn0luvts3r\runner.cs:line 6395
    // expect m == 8 || m == 8;
    // expect p == 4 || p == 5;
  }

}

method Main()
{
  TestsForonlineMax();
  print "TestsForonlineMax: all non-failing tests passed!\n";
}
