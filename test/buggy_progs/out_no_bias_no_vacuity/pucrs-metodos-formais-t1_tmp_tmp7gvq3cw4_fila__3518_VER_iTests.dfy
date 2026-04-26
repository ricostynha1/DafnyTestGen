// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\pucrs-metodos-formais-t1_tmp_tmp7gvq3cw4_fila__3518_VER_i.dfy
// Method: enfileira
// Generated: 2026-04-24 22:47:08

// pucrs-metodos-formais-t1_tmp_tmp7gvq3cw4_fila.dfy

method OriginalMain()
{
  var fila := new Fila();
  fila.enfileira(1);
  fila.enfileira(2);
  fila.enfileira(3);
  fila.enfileira(4);
  assert fila.Conteudo == [1, 2, 3, 4];
  var q := fila.tamanho();
  assert q == 4;
  var e := fila.desenfileira();
  assert e == 1;
  assert fila.Conteudo == [2, 3, 4];
  assert fila.tamanho() == 3;
  assert fila.Conteudo == [2, 3, 4];
  var r := fila.contem(1);
  assert r == false;
  assert fila.a[0] == 2;
  var r2 := fila.contem(2);
  assert r2 == true;
  var vazia := fila.estaVazia();
  assert vazia == false;
  var outraFila := new Fila();
  vazia := outraFila.estaVazia();
  assert vazia == true;
  assert fila.Conteudo == [2, 3, 4];
  outraFila.enfileira(5);
  outraFila.enfileira(6);
  outraFila.enfileira(7);
  assert outraFila.Conteudo == [5, 6, 7];
  var concatenada := fila.concat(outraFila);
  assert concatenada.Conteudo == [2, 3, 4, 5, 6, 7];
}

class {:autocontracts} Fila {
  var a: array<int>
  var cauda: nat
  const defaultSize: nat
  var Conteudo: seq<int>

  predicate Valid()
    reads this, Repr
    ensures Valid() ==> this in Repr
    decreases Repr + {this}
  {
    this in Repr &&
    null !in Repr &&
    a in Repr &&
    defaultSize > 0 &&
    a.Length >= defaultSize &&
    0 <= cauda <= a.Length &&
    Conteudo == a[0 .. cauda]
  }

  constructor ()
    ensures Valid()
    ensures fresh(Repr)
    ensures Conteudo == []
    ensures defaultSize == 3
    ensures a.Length == 3
    ensures fresh(a)
  {
    defaultSize := 3;
    a := new int[3];
    cauda := 0;
    Conteudo := [];
    new;
    Repr := {this};
    if !(a in Repr) {
      Repr := Repr + {a};
    }
  }

  function tamanho(): nat
    requires Valid()
    reads Repr
    ensures tamanho() == |Conteudo|
    decreases Repr
  {
    cauda
  }

  function estaVazia(): bool
    requires Valid()
    reads Repr
    ensures estaVazia() <==> |Conteudo| == 0
    decreases Repr
  {
    cauda == 0
  }

  method enfileira(e: int)
    requires Valid()
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures Conteudo == old(Conteudo) + [e]
    decreases e
  {
    if cauda == a.Length {
      var novoArray := new int[cauda + defaultSize];
      var i := 0;
      forall i: int | 0 <= i < a.Length {
        novoArray[i] := a[i];
      }
      a := novoArray;
    }
    a[cauda] := e;
    cauda := cauda + 1;
    Conteudo := Conteudo + [e];
    if !(a in Repr) {
      Repr := Repr + {a};
    }
  }

  method desenfileira() returns (e: int)
    requires Valid()
    requires |Conteudo| > 0
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - old(Repr))
    ensures e == old(Conteudo)[0]
    ensures Conteudo == old(Conteudo)[1..]
  {
    e := a[0];
    cauda := cauda - 1;
    forall i: int | 0 <= i < cauda {
      a[i] := a[i + 1];
    }
    Conteudo := a[0 .. cauda];
    if !(a in Repr) {
      Repr := Repr + {a};
    }
  }

  method contem(e: int) returns (r: bool)
    requires Valid()
    ensures r <==> exists i: int {:trigger a[i]} :: 0 <= i < cauda && e == a[i]
    decreases e
  {
    var i := 0;
    r := false;
    while i < cauda
      invariant 0 <= i <= cauda
      invariant forall j: nat {:trigger a[j]} :: j < i ==> a[j] != e
      decreases cauda - i
    {
      if a[i] == e {
        r := true;
        return;
      }
      i := i + 1;
    }
    return r;
  }

  method concat(f2: Fila) returns (r: Fila)
    requires Valid()
    requires Valid()
    requires f2.Valid()
    ensures r.Conteudo == Conteudo + f2.Conteudo
    decreases f2
  {
    r := new Fila();
    var i := 0;
    while i < cauda
      invariant 0 <= i <= cauda
      invariant 0 <= i <= r.cauda
      invariant r.cauda <= r.a.Length
      invariant fresh(r.Repr)
      invariant r.Valid()
      invariant r.Conteudo == Conteudo[0 .. i]
      decreases cauda - i
    {
      var valor := a[i];
      r.enfileira(valor);
      i := i + 1;
    }
    var j := 0;
    while j < f2.cauda
      invariant 0 <= j <= f2.cauda
      invariant 0 <= j <= r.cauda
      invariant r.cauda <= r.a.Length
      invariant fresh(r.Repr)
      invariant r.Valid()
      invariant r.Conteudo == Conteudo + f2.Conteudo[0 .. j]
      decreases f2.cauda - j
    {
      var valor := f2.a[j];
      r.enfileira(valor);
      j := i + 1;
    }
  }

  var Repr: set<object?>
}


method TestsForenfileira()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Conteudo == old(Conteudo) + [e]
  {
    var obj := new Fila();
    var tmp_a := new int[1] [4];
    obj.a := tmp_a;
    obj.cauda := 0;
    obj.Conteudo := [];
    obj.Repr := {obj, obj.a};
    var e := 0;
    var old_Conteudo := obj.Conteudo;
    obj.enfileira(e);
    // actual runtime state: tmp_a=[0]
    // expect obj.Valid(); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Be=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Conteudo == old(Conteudo) + [e]
  {
    var obj := new Fila();
    var tmp_a := new int[1] [4];
    obj.a := tmp_a;
    obj.cauda := 0;
    obj.Conteudo := [];
    obj.Repr := {obj, obj.a};
    var e := 1;
    var old_Conteudo := obj.Conteudo;
    obj.enfileira(e);
    // actual runtime state: tmp_a=[1]
    // expect obj.Valid(); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Be=2:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Conteudo == old(Conteudo) + [e]
  {
    var obj := new Fila();
    var tmp_a := new int[1] [4];
    obj.a := tmp_a;
    obj.cauda := 0;
    obj.Conteudo := [];
    obj.Repr := {obj, obj.a};
    var e := 2;
    var old_Conteudo := obj.Conteudo;
    obj.enfileira(e);
    // actual runtime state: tmp_a=[2]
    // expect obj.Valid(); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Bcauda=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Conteudo == old(Conteudo) + [e]
  {
    var obj := new Fila();
    var tmp_a := new int[1] [4];
    obj.a := tmp_a;
    obj.cauda := 1;
    obj.Conteudo := [];
    obj.Repr := {obj, obj.a};
    var e := 0;
    var old_Conteudo := obj.Conteudo;
    obj.enfileira(e);
    // expect obj.Valid(); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/BdefaultSize=2:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Conteudo == old(Conteudo) + [e]
  {
    var obj := new Fila();
    var tmp_a := new int[2] [5, 6];
    obj.a := tmp_a;
    obj.cauda := 0;
    obj.Conteudo := [];
    obj.Repr := {obj, obj.a};
    var e := 0;
    var old_Conteudo := obj.Conteudo;
    obj.enfileira(e);
    // actual runtime state: tmp_a=[0, 6]
    // expect obj.Valid(); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/BdefaultSize=a_len-1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Conteudo == old(Conteudo) + [e]
  {
    var obj := new Fila();
    var tmp_a := new int[2] [9, 10];
    obj.a := tmp_a;
    obj.cauda := 0;
    obj.Conteudo := [15];
    obj.Repr := {obj, obj.a};
    var e := 0;
    var old_Conteudo := obj.Conteudo;
    obj.enfileira(e);
    // actual runtime state: tmp_a=[0, 10]
    // expect obj.Valid(); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oe<0:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Conteudo == old(Conteudo) + [e]
  {
    var obj := new Fila();
    var tmp_a := new int[1] [8];
    obj.a := tmp_a;
    obj.cauda := 0;
    obj.Conteudo := [];
    obj.Repr := {obj, obj.a};
    var e := -1;
    var old_Conteudo := obj.Conteudo;
    obj.enfileira(e);
    // actual runtime state: tmp_a=[-1]
    // expect obj.Valid(); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ocauda>=2:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Conteudo == old(Conteudo) + [e]
  {
    var obj := new Fila();
    var tmp_a := new int[2] [7, 11];
    obj.a := tmp_a;
    obj.cauda := 2;
    obj.Conteudo := [];
    obj.Repr := {obj, obj.a};
    var e := 0;
    var old_Conteudo := obj.Conteudo;
    obj.enfileira(e);
    // expect obj.Valid(); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|Conteudo|>=2:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Conteudo == old(Conteudo) + [e]
  {
    var obj := new Fila();
    var tmp_a := new int[1] [19];
    obj.a := tmp_a;
    obj.cauda := 0;
    obj.Conteudo := [13, 12];
    obj.Repr := {obj, obj.a};
    var e := 0;
    var old_Conteudo := obj.Conteudo;
    obj.enfileira(e);
    // actual runtime state: tmp_a=[0]
    // expect obj.Valid(); // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/R10:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: Valid()
  //   POST Q3: Valid()
  //   POST Q5: Conteudo == old(Conteudo) + [e]
  {
    var obj := new Fila();
    var tmp_a := new int[1] [18];
    obj.a := tmp_a;
    obj.cauda := 0;
    obj.Conteudo := [];
    obj.Repr := {obj, obj.a};
    var e := 14;
    var old_Conteudo := obj.Conteudo;
    obj.enfileira(e);
    // actual runtime state: tmp_a=[14]
    // expect obj.Valid(); // got false
  }

}

method TestsForcontem()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: r
  //   POST Q2: 0 <= (cauda - 1)
  //   POST Q3: e == a[0]
  {
    var obj := new Fila();
    var tmp_a := new int[1] [7];
    obj.a := tmp_a;
    obj.cauda := 1;
    obj.Conteudo := [7];
    obj.Repr := {obj, obj.a};
    var e := 7;
    var r := obj.contem(e);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {2}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: r
  //   POST Q2: exists i :: 1 <= i < (cauda - 1) && e == a[i]
  {
    var obj := new Fila();
    var tmp_a := new int[3] [21, 8, 34];
    obj.a := tmp_a;
    obj.cauda := 3;
    obj.Conteudo := [21, 8, 34];
    obj.Repr := {obj, obj.a};
    var e := 8;
    var r := obj.contem(e);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {4}:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: !r
  //   POST Q2: !exists i: int {:trigger a[i]} :: 0 <= i < cauda && e == a[i]
  {
    var obj := new Fila();
    var tmp_a := new int[1] [8];
    obj.a := tmp_a;
    obj.cauda := 0;
    obj.Conteudo := [];
    obj.Repr := {obj, obj.a};
    var e := 0;
    var r := obj.contem(e);
    expect r == false || r == true;
    expect r == false; // observed from implementation
  }

  // Test case for combination {1}/Bcauda=a_len-1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: r
  //   POST Q2: 0 <= (cauda - 1)
  //   POST Q3: e == a[0]
  {
    var obj := new Fila();
    var tmp_a := new int[2] [8, 9];
    obj.a := tmp_a;
    obj.cauda := 1;
    obj.Conteudo := [8];
    obj.Repr := {obj, obj.a};
    var e := 8;
    var r := obj.contem(e);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {1}/BdefaultSize=a_len-1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: r
  //   POST Q2: 0 <= (cauda - 1)
  //   POST Q3: e == a[0]
  {
    var obj := new Fila();
    var tmp_a := new int[2] [14, 13];
    obj.a := tmp_a;
    obj.cauda := 1;
    obj.Conteudo := [14];
    obj.Repr := {obj, obj.a};
    var e := 14;
    var r := obj.contem(e);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {2}/Be=1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: r
  //   POST Q2: exists i :: 1 <= i < (cauda - 1) && e == a[i]
  {
    var obj := new Fila();
    var tmp_a := new int[3] [20, 1, 33];
    obj.a := tmp_a;
    obj.cauda := 3;
    obj.Conteudo := [20, 1, 33];
    obj.Repr := {obj, obj.a};
    var e := 1;
    var r := obj.contem(e);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {2}/Be=2:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: r
  //   POST Q2: exists i :: 1 <= i < (cauda - 1) && e == a[i]
  {
    var obj := new Fila();
    var tmp_a := new int[3] [20, 2, 33];
    obj.a := tmp_a;
    obj.cauda := 3;
    obj.Conteudo := [20, 2, 33];
    obj.Repr := {obj, obj.a};
    var e := 2;
    var r := obj.contem(e);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {2}/Bcauda=a_len-1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: r
  //   POST Q2: exists i :: 1 <= i < (cauda - 1) && e == a[i]
  {
    var obj := new Fila();
    var tmp_a := new int[5] [22, 23, 14, 27, 17];
    obj.a := tmp_a;
    obj.cauda := 4;
    obj.Conteudo := [22, 23, 14, 27];
    obj.Repr := {obj, obj.a};
    var e := 14;
    var r := obj.contem(e);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {2}/BdefaultSize=a_len:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: r
  //   POST Q2: exists i :: 1 <= i < (cauda - 1) && e == a[i]
  {
    var obj := new Fila();
    var tmp_a := new int[4] [39, 40, 10, 29];
    obj.a := tmp_a;
    obj.cauda := 4;
    obj.Conteudo := [39, 40, 10, 29];
    obj.Repr := {obj, obj.a};
    var e := 10;
    var r := obj.contem(e);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

  // Test case for combination {2}/BdefaultSize=a_len-1:
  //   PRE:  Valid()
  //   PRE:  Valid()
  //   POST Q1: r
  //   POST Q2: exists i :: 1 <= i < (cauda - 1) && e == a[i]
  {
    var obj := new Fila();
    var tmp_a := new int[3] [28, 30, 31];
    obj.a := tmp_a;
    obj.cauda := 3;
    obj.Conteudo := [28, 30, 31];
    obj.Repr := {obj, obj.a};
    var e := 30;
    var r := obj.contem(e);
    expect r == true || r == false;
    expect r == true; // observed from implementation
  }

}

method Main()
{
  TestsForenfileira();
  print "TestsForenfileira: all non-failing tests passed!\n";
  TestsForcontem();
  print "TestsForcontem: all non-failing tests passed!\n";
}
