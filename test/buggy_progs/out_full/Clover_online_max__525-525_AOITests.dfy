// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Clover_online_max__525-525_AOI.dfy
// Method: onlineMax
// Generated: 2026-04-24 09:29:03

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
  // Test case for combination {1}/Rel:
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
    var a := new int[3] [-1, -10, -1];
    var x := 2;
    var m, p := onlineMax(a, x);
    expect m == -1;
    expect p == 2;
  }

  // Test case for combination {3}/Rel:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p < a.Length
  //   POST Q2: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q3: exists i: int {:trigger a[i]} :: 0 <= i < x && a[i] == m
  //   POST Q4: x <= p < a.Length - 1 ==> forall i: int {:trigger a[i]} :: 0 <= i < p ==> a[i] < a[p]
  //   POST Q5: (forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m) ==> p == a.Length - 1
  {
    var a := new int[4] [-6, -7, -4, -5];
    var x := 2;
    var m, p := onlineMax(a, x);
    expect x <= p < a.Length;
    expect forall i: int :: 0 <= i < x ==> a[i] <= m;
    expect exists i: int :: 0 <= i < x && a[i] == m;
    expect x <= p < a.Length - 1 ==> forall i: int :: 0 <= i < p ==> a[i] < a[p];
    expect (forall i: int :: x <= i && i < a.Length && a[i] <= m) ==> p == a.Length - 1;
  }

  // Test case for combination {4}/Rel:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p
  //   POST Q2: p < a.Length
  //   POST Q3: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q4: exists i :: 1 <= i < (x - 1) && a[i] == m
  //   POST Q5: p >= a.Length - 1
  //   POST Q6: !forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m
  {
    var a := new int[4] [-5, -5, -7, -7];
    var x := 3;
    var m, p := onlineMax(a, x);
    expect m == -5;
    expect p == 3;
  }

  // Test case for combination {6}/Rel:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p < a.Length
  //   POST Q2: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q3: exists i: int {:trigger a[i]} :: 0 <= i < x && a[i] == m
  //   POST Q4: x <= p < a.Length - 1 ==> forall i: int {:trigger a[i]} :: 0 <= i < p ==> a[i] < a[p]
  //   POST Q5: (forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m) ==> p == a.Length - 1
  {
    var a := new int[5] [-6, -6, -7, -5, -7];
    var x := 3;
    var m, p := onlineMax(a, x);
    expect x <= p < a.Length;
    expect forall i: int :: 0 <= i < x ==> a[i] <= m;
    expect exists i: int :: 0 <= i < x && a[i] == m;
    expect x <= p < a.Length - 1 ==> forall i: int :: 0 <= i < p ==> a[i] < a[p];
    expect (forall i: int :: x <= i && i < a.Length && a[i] <= m) ==> p == a.Length - 1;
  }

  // Test case for combination {7}/Rel:
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
    var a := new int[3] [-4, -4, -10];
    var x := 2;
    var m, p := onlineMax(a, x);
    expect m == -4;
    expect p == 2;
  }

  // Test case for combination {9}/Rel:
  //   PRE:  1 <= x < a.Length
  //   PRE:  a.Length != 0
  //   POST Q1: x <= p < a.Length
  //   POST Q2: forall i: int {:trigger a[i]} :: 0 <= i < x ==> a[i] <= m
  //   POST Q3: exists i: int {:trigger a[i]} :: 0 <= i < x && a[i] == m
  //   POST Q4: x <= p < a.Length - 1 ==> forall i: int {:trigger a[i]} :: 0 <= i < p ==> a[i] < a[p]
  //   POST Q5: (forall i: int {:trigger a[i]} :: x <= i && i < a.Length && a[i] <= m) ==> p == a.Length - 1
  {
    var a := new int[4] [-6, -6, -1, -5];
    var x := 2;
    var m, p := onlineMax(a, x);
    expect x <= p < a.Length;
    expect forall i: int :: 0 <= i < x ==> a[i] <= m;
    expect exists i: int :: 0 <= i < x && a[i] == m;
    expect x <= p < a.Length - 1 ==> forall i: int :: 0 <= i < p ==> a[i] < a[p];
    expect (forall i: int :: x <= i && i < a.Length && a[i] <= m) ==> p == a.Length - 1;
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
    var a := new int[4] [-7, -9, -1, 400];
    var x := 2;
    var m, p := onlineMax(a, x);
    expect m == -7 || m == -7;
    expect p == 3 || p == 2;
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
  }

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
    var a := new int[5] [-9, -9, 10, 11, 9];
    var x := 2;
    var m, p := onlineMax(a, x);
    expect m == -9 || m == -9 || m == -9;
    expect p == 3 || p == 2 || p == 4;
  }

}

method Main()
{
  TestsForonlineMax();
  print "TestsForonlineMax: all tests passed!\n";
}
