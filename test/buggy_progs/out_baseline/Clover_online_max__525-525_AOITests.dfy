// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_online_max__525-525_AOI.dfy
// Method: onlineMax
// Generated: 2026-04-24 19:28:22

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
    var a := new int[2] [175, 400];
    var x := 1;
    var m, p := onlineMax(a, x);
    expect m == 175;
    expect p == 1;
  }

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
    var a := new int[4] [0, 45065, 45066, -400];
    var x := 1;
    var m, p := onlineMax(a, x);
    expect m == 0 || m == 0 || m == 0;
    expect p == 2 || p == 1 || p == 3;
    expect m == 0; // observed from implementation
    expect p == 1; // observed from implementation
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
    var a := new int[4] [0, 0, -1, 175];
    var x := 3;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 5965
    // runtime error: at _module.__default.TestCase__2() in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 6096
    // expect m == 0;
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
    var a := new int[8] [-2, 0, 0, 0, 15810, -29951, 15809, -17870];
    var x := 4;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 5965
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 6146
    // expect m == 0 || m == 0;
    // expect p == 4 || p == 7;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bx=2:
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
    var a := new int[3] [400, -175, 14];
    var x := 2;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 5965
    // runtime error: at _module.__default.TestCase__4() in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 6185
    // expect m == 400;
    // expect p == 2;
  }

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
    var a := new int[3] [175, 400, 17869];
    var x := 1;
    var m, p := onlineMax(a, x);
    expect m == 175 || m == 175;
    expect p == 2 || p == 1;
    expect m == 175; // observed from implementation
    expect p == 1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {3}/Bx=2:
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
    var a := new int[4] [-576, -576, 0, 31];
    var x := 2;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 5965
    // runtime error: at _module.__default.TestCase__6() in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 6270
    // expect m == -576 || m == -576;
    // expect p == 2 || p == 3;
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
    var a := new int[6] [-577, -577, -577, -577, -577, -578];
    var x := 4;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 5965
    // runtime error: at _module.__default.TestCase__7() in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 6312
    // expect m == -577;
    // expect p == 5;
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
    var a := new int[6] [-3, -3, -4, -404, 0, 43];
    var x := 3;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 5965
    // runtime error: at _module.__default.TestCase__8() in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 6360
    // expect m == -3 || m == -3;
    // expect p == 4 || p == 5;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {7}/Bx=2:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p
  //   POST Q2: p < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q4: 0 <= (x - 1)
  //   POST Q5: a[(x - 1)] == m
  //   POST Q6: p >= a.Length - 1
  //   POST Q7: !forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m
  {
    var a := new int[3] [-400, 175, 14];
    var x := 2;
    var m, p := onlineMax(a, x);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.onlineMax(BigInteger[] a, BigInteger x, BigInteger& m, BigInteger& p) in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 5965
    // runtime error: at _module.__default.TestCase__9() in C:\cygwin64\tmp\DafnyCBT_zp1klwyj0dj\runner.cs:line 6399
    // expect m == 175;
    // expect p == 2;
  }

}

method Main()
{
  TestsForonlineMax();
  print "TestsForonlineMax: all non-failing tests passed!\n";
}
