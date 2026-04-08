// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Metodos_Formais_tmp_tmpql2hwcsh_Arrays_explicacao__1364-1364_EVR_int.dfy
// Method: buscar
// Generated: 2026-04-08 16:20:17

// Metodos_Formais_tmp_tmpql2hwcsh_Arrays_explicacao.dfy

method buscar(a: array<int>, x: int) returns (r: int)
  ensures r < 0 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  ensures 0 <= r < a.Length ==> a[r] == x
  decreases a, x
{
  r := 0;
  while r < a.Length
    invariant 0 <= r <= a.Length
    invariant forall i: int {:trigger a[i]} :: 0 <= i < r ==> a[i] != x
    decreases a.Length - r
  {
    if a[r] == x {
      return 0;
    }
    r := r + 1;
  }
  return -1;
}


method Passing()
{
  // Test case for combination {6}:
  //   POST: !(r < 0)
  //   POST: 0 < a.Length
  //   POST: !(a[0] != x)
  //   POST: 0 <= r < a.Length
  //   POST: a[r] == x
  //   ENSURES: r < 0 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   ENSURES: 0 <= r < a.Length ==> a[r] == x
  {
    var a := new int[1] [4];
    var x := 4;
    var r := buscar(a, x);
    expect r == 0;
  }

  // Test case for combination {6}/Or=0:
  //   POST: !(r < 0)
  //   POST: 0 < a.Length
  //   POST: !(a[0] != x)
  //   POST: 0 <= r < a.Length
  //   POST: a[r] == x
  //   ENSURES: r < 0 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   ENSURES: 0 <= r < a.Length ==> a[r] == x
  {
    var a := new int[2] [15, 13];
    var x := 15;
    var r := buscar(a, x);
    expect r == 0;
  }

}

method Failing()
{
  // Test case for combination {9}:
  //   POST: !(r < 0)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(a[i] != x)
  //   POST: 0 <= r < a.Length
  //   POST: a[r] == x
  //   ENSURES: r < 0 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   ENSURES: 0 <= r < a.Length ==> a[r] == x
  {
    var a := new int[3] [17, 8, 25];
    var x := 8;
    var r := buscar(a, x);
    // expect r == 1;
  }

  // Test case for combination {9}/Or>0:
  //   POST: !(r < 0)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(a[i] != x)
  //   POST: 0 <= r < a.Length
  //   POST: a[r] == x
  //   ENSURES: r < 0 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   ENSURES: 0 <= r < a.Length ==> a[r] == x
  {
    var a := new int[4] [19, 18, 18, 16];
    var x := 18;
    var r := buscar(a, x);
    // expect !(r < 0);
    // expect exists i :: 1 <= i < (a.Length - 1) && !(a[i] != x);
    // expect 0 <= r < a.Length;
    // expect a[r] == x;
  }

  // Test case for combination {12}/Or>0:
  //   POST: !(r < 0)
  //   POST: 0 < a.Length
  //   POST: !(a[(a.Length - 1)] != x)
  //   POST: 0 <= r < a.Length
  //   POST: a[r] == x
  //   ENSURES: r < 0 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   ENSURES: 0 <= r < a.Length ==> a[r] == x
  {
    var a := new int[2] [18, 10];
    var x := 10;
    var r := buscar(a, x);
    // expect r == 1;
  }

}

method Main()
{
  Passing();
  Failing();
}
