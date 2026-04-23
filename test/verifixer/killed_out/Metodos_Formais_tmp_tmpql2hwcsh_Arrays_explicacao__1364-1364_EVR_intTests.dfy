// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Metodos_Formais_tmp_tmpql2hwcsh_Arrays_explicacao__1364-1364_EVR_int.dfy
// Method: buscar
// Generated: 2026-04-22 21:51:50

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


method TestsForbuscar()
{
  // Test case for combination {2}/Rel:
  //   POST Q1: r < 0 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   POST Q2: 0 <= r < a.Length ==> a[r] == x
  {
    var a := new int[2] [-10, -1];
    var x := -10;
    var r := buscar(a, x);
    expect r < 0 ==> forall i: int :: 0 <= i < a.Length ==> a[i] != x;
    expect 0 <= r < a.Length ==> a[r] == x;
    expect r == 0; // observed from implementation
  }

  // Test case for combination {1}:
  //   POST Q1: r < 0 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   POST Q2: 0 <= r < a.Length ==> a[r] == x
  {
    var a := new int[1] [6];
    var x := -10;
    var r := buscar(a, x);
    expect r < 0 ==> forall i: int :: 0 <= i < a.Length ==> a[i] != x;
    expect 0 <= r < a.Length ==> a[r] == x;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {3}:
  //   POST Q1: r < 0 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   POST Q2: 0 <= r < a.Length ==> a[r] == x
  {
    var a := new int[1] [-10];
    var x := -9;
    var r := buscar(a, x);
    expect r < 0 ==> forall i: int :: 0 <= i < a.Length ==> a[i] != x;
    expect 0 <= r < a.Length ==> a[r] == x;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: r < 0 ==> forall i: int {:trigger a[i]} :: 0 <= i < a.Length ==> a[i] != x
  //   POST Q2: 0 <= r < a.Length ==> a[r] == x
  {
    var a := new int[0] [];
    var x := -10;
    var r := buscar(a, x);
    expect r < 0 ==> forall i: int :: 0 <= i < a.Length ==> a[i] != x;
    expect 0 <= r < a.Length ==> a[r] == x;
    expect r == -1; // observed from implementation
  }

}

method Main()
{
  TestsForbuscar();
  print "TestsForbuscar: all non-failing tests passed!\n";
}
