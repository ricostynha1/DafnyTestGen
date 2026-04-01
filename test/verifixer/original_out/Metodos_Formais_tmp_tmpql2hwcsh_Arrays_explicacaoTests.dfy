// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Metodos_Formais_tmp_tmpql2hwcsh_Arrays_explicacao.dfy
// Method: buscar
// Generated: 2026-04-01 22:29:36

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
      return r;
    }
    r := r + 1;
  }
  return -1;
}


method Passing()
{
  // Test case for combination {3}:
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   POST: !(0 <= r < a.Length)
  {
    var a := new int[1] [10];
    var x := 8;
    var r := buscar(a, x);
    // expect r == -1; // (actual runtime value — not uniquely determined by spec)
    expect forall i: int :: 0 <= i < a.Length ==> a[i] != x;
    expect !(0 <= r < a.Length);
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   POST: !(r < 0)
  //   POST: !(0 <= r < a.Length)
  {
    var a := new int[1] [10];
    var x := 10;
    var r := buscar(a, x);
    // expect !(r < 0);
    // expect !(0 <= r < a.Length);
  }

  // Test case for combination {1,3}:
  //   POST: !(r < 0)
  //   POST: !(0 <= r < a.Length)
  //   POST: forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  {
    var a := new int[1] [12];
    var x := 10;
    var r := buscar(a, x);
    // expect !(r < 0);
    // expect !(0 <= r < a.Length);
    // expect forall i: int :: 0 <= i < a.Length ==> a[i] != x;
  }

}

method Main()
{
  Passing();
  Failing();
}
