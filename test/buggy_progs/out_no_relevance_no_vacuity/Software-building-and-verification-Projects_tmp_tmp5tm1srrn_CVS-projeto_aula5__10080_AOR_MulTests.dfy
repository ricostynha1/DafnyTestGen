// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\Software-building-and-verification-Projects_tmp_tmp5tm1srrn_CVS-projeto_aula5__10080_AOR_Mul.dfy
// Method: contains
// Generated: 2026-04-25 00:33:51

// Software-building-and-verification-Projects_tmp_tmp5tm1srrn_CVS-projeto_aula5.dfy

class Set {
  var store: array<int>
  var nelems: int
  var Repr: set<object>
  var elems: set<int>

  predicate RepInv()
    reads this, Repr
    decreases Repr + {this}
  {
    this in Repr &&
    store in Repr &&
    0 < store.Length &&
    0 <= nelems <= store.Length &&
    (forall i: int {:trigger store[i]} :: 
      0 <= i < nelems ==>
        store[i] in elems) &&
    forall x: int {:trigger x in elems} :: 
      x in elems ==>
        exists i: int {:trigger store[i]} :: 
          0 <= i < nelems &&
          store[i] == x
  }

  constructor (n: int)
    requires 0 < n
    ensures RepInv()
    ensures fresh(Repr - {this})
    decreases n
  {
    store := new int[n];
    Repr := {this, store};
    elems := {};
    nelems := 0;
  }

  function size(): int
    requires RepInv()
    reads Repr
    ensures RepInv()
    decreases Repr
  {
    nelems
  }

  function maxSize(): int
    requires RepInv()
    reads Repr
    ensures RepInv()
    decreases Repr
  {
    store.Length
  }

  method contains(v: int) returns (b: bool)
    requires RepInv()
    ensures RepInv()
    ensures b <==> v in elems
    decreases v
  {
    var i := find(v);
    return i >= 0;
  }

  method add(v: int)
    requires RepInv()
    requires size() < maxSize()
    modifies this, Repr
    ensures RepInv()
    ensures fresh(Repr - old(Repr))
    decreases v
  {
    var f: int := find(v);
    if f < 0 {
      store[nelems] := v;
      elems := elems + {v};
      assert forall i: int {:trigger store[i]} {:trigger (store[i])} :: 0 <= i < nelems ==> (store[i]) == store[i];
      nelems := nelems + 1;
    }
  }

  method find(x: int) returns (r: int)
    requires RepInv()
    ensures RepInv()
    ensures r < 0 ==> x !in elems
    ensures r >= 0 ==> x in elems
    decreases x
  {
    var i: int := 0;
    while i < nelems
      invariant 0 <= i <= nelems
      invariant forall j: int {:trigger store[j]} :: 0 <= j < i ==> x != store[j]
      decreases nelems - i
    {
      if store[i] == x {
        return i;
      }
      i := i + 1;
    }
    return -1;
  }

  method OriginalMain()
  {
    var s := new Set(10);
    if s.size() < s.maxSize() {
      s.add(2);
      var b := s.contains(2);
      if s.size() < s.maxSize() {
        s.add(3);
      }
    }
  }
}

class PositiveSet {
  var store: array<int>
  var nelems: int
  var Repr: set<object>
  var elems: set<int>

  predicate RepInv()
    reads this, Repr
    decreases Repr + {this}
  {
    this in Repr &&
    store in Repr &&
    0 < store.Length &&
    0 <= nelems <= store.Length &&
    (forall i: int {:trigger store[i]} :: 
      0 <= i < nelems ==>
        store[i] in elems) &&
    (forall x: int {:trigger x in elems} :: 
      x in elems ==>
        exists i: int {:trigger store[i]} :: 
          0 <= i < nelems &&
          store[i] == x) &&
    forall x: int {:trigger x in elems} :: 
      x in elems ==>
        x > 0
  }

  constructor (n: int)
    requires 0 < n
    ensures RepInv()
    ensures fresh(Repr - {this})
    decreases n
  {
    store := new int[n];
    Repr := {this, store};
    elems := {};
    nelems := 0;
  }

  function size(): int
    requires RepInv()
    reads Repr
    ensures RepInv()
    decreases Repr
  {
    nelems
  }

  function maxSize(): int
    requires RepInv()
    reads Repr
    ensures RepInv()
    decreases Repr
  {
    store.Length
  }

  method contains(v: int) returns (b: bool)
    requires RepInv()
    ensures RepInv()
    ensures b <==> v in elems
    decreases v
  {
    var i := find(v);
    return i >= 0;
  }

  method add(v: int)
    requires RepInv()
    requires size() < maxSize()
    modifies this, Repr
    ensures RepInv()
    ensures fresh(Repr - old(Repr))
    decreases v
  {
    if v > 0 {
      var f: int := find(v);
      if f < 0 {
        store[nelems] := v;
        elems := elems + {v};
        assert forall i: int {:trigger store[i]} {:trigger (store[i])} :: 0 <= i < nelems ==> (store[i]) == store[i];
        nelems := nelems + 1;
      }
    }
  }

  method find(x: int) returns (r: int)
    requires RepInv()
    ensures RepInv()
    ensures r < 0 ==> x !in elems
    ensures r >= 0 ==> x in elems
    decreases x
  {
    var i: int := 0;
    while i < nelems
      invariant 0 <= i <= nelems
      invariant forall j: int {:trigger store[j]} :: 0 <= j < i ==> x != store[j]
      decreases nelems - i
    {
      if store[i] == x {
        return i;
      }
      i := i + 1;
    }
    return -1;
  }

  method OriginalMain()
  {
    var s := new PositiveSet(10);
    if s.size() < s.maxSize() {
      s.add(2);
      var b := s.contains(2);
      if s.size() < s.maxSize() {
        s.add(3);
      }
    }
  }
}

class SavingsAccount {
  var cbalance: int
  var sbalance: int
  var Repr: set<object>

  predicate RepInv()
    reads this, Repr
    decreases Repr + {this}
  {
    this in Repr &&
    cbalance >= -sbalance / 2
  }

  predicate PositiveChecking()
    reads this, Repr
    decreases Repr + {this}
  {
    cbalance >= 0
  }

  constructor ()
    ensures fresh(Repr - {this})
    ensures RepInv()
  {
    Repr := {this};
    cbalance := 0;
    sbalance := 0;
  }

  method deposit(amount: int)
    requires amount > 0
    requires RepInv()
    modifies Repr
    ensures RepInv()
    decreases amount
  {
    cbalance := cbalance + amount;
  }

  method withdraw(amount: int)
    requires amount > 0
    requires RepInv()
    modifies Repr
    ensures RepInv()
    decreases amount
  {
    if cbalance - amount >= -sbalance / 2 {
      cbalance := cbalance - amount;
    }
  }

  method save(amount: int)
    requires amount > 0
    requires PositiveChecking()
    requires RepInv()
    modifies Repr
    ensures RepInv()
    decreases amount
  {
    if cbalance >= 0 {
      sbalance := sbalance + amount;
    }
  }

  method rescue(amount: int)
    requires amount > 0
    requires RepInv()
    modifies Repr
    ensures RepInv()
    decreases amount
  {
    if cbalance >= -(sbalance - amount) / 2 {
      sbalance := sbalance - amount;
    }
  }
}

class GrowingSet {
  var store: array<int>
  var nelems: int
  var Repr: set<object>
  var elems: set<int>

  predicate RepInv()
    reads this, Repr
    decreases Repr + {this}
  {
    this in Repr &&
    store in Repr &&
    0 < store.Length &&
    0 <= nelems <= store.Length &&
    (forall i: int {:trigger store[i]} :: 
      0 <= i < nelems ==>
        store[i] in elems) &&
    forall x: int {:trigger x in elems} :: 
      x in elems ==>
        exists i: int {:trigger store[i]} :: 
          0 <= i < nelems &&
          store[i] == x
  }

  constructor (n: int)
    requires 0 < n
    ensures RepInv()
    ensures fresh(Repr - {this})
    decreases n
  {
    store := new int[n];
    Repr := {this, store};
    elems := {};
    nelems := 0;
  }

  function size(): int
    requires RepInv()
    reads Repr
    ensures RepInv()
    decreases Repr
  {
    nelems
  }

  function maxSize(): int
    requires RepInv()
    reads Repr
    ensures RepInv()
    decreases Repr
  {
    store.Length
  }

  method contains(v: int) returns (b: bool)
    requires RepInv()
    ensures RepInv()
    ensures b <==> v in elems
    decreases v
  {
    var i := find(v);
    return i >= 0;
  }

  method add(v: int)
    requires RepInv()
    modifies Repr
    ensures RepInv()
    ensures fresh(Repr - old(Repr))
    decreases v
  {
    var f: int := find(v);
    assert forall i: int {:trigger store[i]} {:trigger (store[i])} :: 0 <= i < nelems ==> (store[i]) == store[i];
    if f < 0 {
      if nelems == store.Length {
        var tmp := new int[store.Length * 2];
        var i := 0;
        while i < store.Length
          invariant 0 <= i <= store.Length < tmp.Length
          invariant forall j: int {:trigger tmp[j]} {:trigger old(store[j])} :: 0 <= j < i ==> old(store[j]) == tmp[j]
          decreases store.Length - i
          modifies tmp
        {
          tmp[i] := store[i];
          i := i + 1;
        }
        Repr := (Repr - {store}) * {tmp};
        store := tmp;
      }
      store[nelems] := v;
      elems := elems + {v};
      assert forall i: int {:trigger store[i]} {:trigger (store[i])} :: 0 <= i < nelems ==> (store[i]) == store[i];
      nelems := nelems + 1;
    }
  }

  method find(x: int) returns (r: int)
    requires RepInv()
    ensures RepInv()
    ensures r < 0 ==> x !in elems
    ensures r >= 0 ==> x in elems
    decreases x
  {
    var i: int := 0;
    while i < nelems
      invariant 0 <= i <= nelems
      invariant forall j: int {:trigger store[j]} :: 0 <= j < i ==> x != store[j]
      decreases nelems - i
    {
      if store[i] == x {
        return i;
      }
      i := i + 1;
    }
    return -1;
  }

  method OriginalMain()
  {
    var s := new GrowingSet(10);
    if s.size() < s.maxSize() {
      s.add(2);
      var b := s.contains(2);
      if s.size() < s.maxSize() {
        s.add(3);
      }
    }
  }
}


method TestsForcontains()
{
  // Test case for combination {1}:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 10;
    var obj := new Set(n);
    var tmp_store := new int[2] [2, 2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {2}:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  {
    var n := 10;
    var obj := new Set(n);
    var tmp_store := new int[2] [3, 3];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    var b := obj.contains(v);
    expect b == false || b == true;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}/Bnelems=0:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 10;
    var obj := new Set(n);
    var tmp_store := new int[1] [-1];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := -10;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}/Bnelems=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 2;
    var obj := new Set(n);
    var tmp_store := new int[1] [-2];
    obj.store := tmp_store;
    obj.nelems := 1;
    obj.Repr := {obj, obj.store};
    var v := -1;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 1;
    var obj := new Set(n);
    var tmp_store := new int[2] [5, 4];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 2;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {2}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  {
    var n := 1;
    var obj := new Set(n);
    var tmp_store := new int[2] [5, -2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -10;
    var b := obj.contains(v);
    expect b == false || b == true;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}/Ov=0:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 10;
    var obj := new Set(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 0;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 10;
    var obj := new PositiveSet(n);
    var tmp_store := new int[2] [2, 2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {2}:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  {
    var n := 10;
    var obj := new PositiveSet(n);
    var tmp_store := new int[2] [3, 3];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    var b := obj.contains(v);
    expect b == false || b == true;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}/Bnelems=0:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 10;
    var obj := new PositiveSet(n);
    var tmp_store := new int[1] [-1];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := -10;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}/Bnelems=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 2;
    var obj := new PositiveSet(n);
    var tmp_store := new int[1] [-2];
    obj.store := tmp_store;
    obj.nelems := 1;
    obj.Repr := {obj, obj.store};
    var v := -1;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 1;
    var obj := new PositiveSet(n);
    var tmp_store := new int[2] [5, 4];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 2;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {2}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  {
    var n := 1;
    var obj := new PositiveSet(n);
    var tmp_store := new int[2] [5, -2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -10;
    var b := obj.contains(v);
    expect b == false || b == true;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}/Ov=0:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 10;
    var obj := new PositiveSet(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 0;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 10;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [2, 2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {2}:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  {
    var n := 10;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [3, 3];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    var b := obj.contains(v);
    expect b == false || b == true;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}/Bnelems=0:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 10;
    var obj := new GrowingSet(n);
    var tmp_store := new int[1] [-1];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := -10;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}/Bnelems=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 2;
    var obj := new GrowingSet(n);
    var tmp_store := new int[1] [-2];
    obj.store := tmp_store;
    obj.nelems := 1;
    obj.Repr := {obj, obj.store};
    var v := -1;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 1;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [5, 4];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 2;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

  // Test case for combination {2}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  {
    var n := 1;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [5, -2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -10;
    var b := obj.contains(v);
    expect b == false || b == true;
    expect b == false; // observed from implementation
  }

  // Test case for combination {1}/Ov=0:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: !b
  //   POST Q3: v !in elems
  //   POST Q4: 0 <= nelems
  //   POST Q5: nelems <= store.Length
  //   POST Q6: forall i: int {:trigger store[i]} :: 0 <= i && i < nelems ==> store[i] in elems
  //   POST Q7: forall x: int {:trigger x in elems} :: x in elems ==> exists i: int {:trigger store[i]} :: 0 <= i && i < nelems && store[i] == x
  //   POST Q8: b
  //   POST Q9: v in elems
  {
    var n := 10;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 0;
    var b := obj.contains(v);
    expect b == true || b == false;
    expect b == false; // observed from implementation
  }

}

method TestsForadd()
{
  // Test case for combination {1}:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 10;
    var obj := new Set(n);
    var tmp_store := new int[3] [-2, -1, -2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 2;
    obj.add(v);
    expect tmp_store[..] == [-2, -1, 2]; // observed from implementation
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 1;
    var obj := new Set(n);
    var tmp_store := new int[3] [-2, -1, -1];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    obj.add(v);
  }

  // Test case for combination {1}/Bn=2:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 2;
    var obj := new Set(n);
    var tmp_store := new int[3] [-2, -1, -1];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    obj.add(v);
  }

  // Test case for combination {1}/Ov=0:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 10;
    var obj := new Set(n);
    var tmp_store := new int[3] [-1, 2, 2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 0;
    obj.add(v);
    expect tmp_store[..] == [-1, 2, 0]; // observed from implementation
  }

  // Test case for combination {1}/O|store|=1:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 2;
    var obj := new Set(n);
    var tmp_store := new int[1] [-1];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 2;
    obj.add(v);
    expect tmp_store[..] == [2]; // observed from implementation
  }

  // Test case for combination {1}/O|elems|=1:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 2;
    var obj := new Set(n);
    var tmp_store := new int[3] [3, 3, 10];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    obj.add(v);
    expect tmp_store[..] == [3, 3, -1]; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 3;
    var obj := new Set(n);
    var tmp_store := new int[3] [-2, -1, -1];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    obj.add(v);
  }

  // Test case for combination {1}/R8:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 2;
    var obj := new Set(n);
    var tmp_store := new int[3] [3, 5, -7];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 2;
    obj.add(v);
    expect tmp_store[..] == [3, 5, 2]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 4;
    var obj := new Set(n);
    var tmp_store := new int[3] [3, 2, -10];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    obj.add(v);
    expect tmp_store[..] == [3, 2, -1]; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 5;
    var obj := new Set(n);
    var tmp_store := new int[3] [-2, 4, 4];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    obj.add(v);
    expect tmp_store[..] == [-2, 4, -1]; // observed from implementation
  }

  // Test case for combination {1}:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 10;
    var obj := new PositiveSet(n);
    var tmp_store := new int[3] [-2, -1, -2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 2;
    obj.add(v);
    expect tmp_store[..] == [-2, -1, 2]; // observed from implementation
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 1;
    var obj := new PositiveSet(n);
    var tmp_store := new int[3] [-2, -1, -1];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    obj.add(v);
  }

  // Test case for combination {1}/Bn=2:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 2;
    var obj := new PositiveSet(n);
    var tmp_store := new int[3] [-2, -1, -1];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    obj.add(v);
  }

  // Test case for combination {1}/Ov=0:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 10;
    var obj := new PositiveSet(n);
    var tmp_store := new int[3] [-1, 2, 2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 0;
    obj.add(v);
  }

  // Test case for combination {1}/O|store|=1:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 2;
    var obj := new PositiveSet(n);
    var tmp_store := new int[1] [-1];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 2;
    obj.add(v);
    expect tmp_store[..] == [2]; // observed from implementation
  }

  // Test case for combination {1}/O|elems|=1:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 2;
    var obj := new PositiveSet(n);
    var tmp_store := new int[3] [3, 3, 10];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    obj.add(v);
  }

  // Test case for combination {1}/R7:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 3;
    var obj := new PositiveSet(n);
    var tmp_store := new int[3] [-2, -1, -1];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    obj.add(v);
  }

  // Test case for combination {1}/R8:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 2;
    var obj := new PositiveSet(n);
    var tmp_store := new int[3] [3, 5, -7];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 2;
    obj.add(v);
    expect tmp_store[..] == [3, 5, 2]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 4;
    var obj := new PositiveSet(n);
    var tmp_store := new int[3] [3, 2, -10];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    obj.add(v);
  }

  // Test case for combination {1}/R10:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 5;
    var obj := new PositiveSet(n);
    var tmp_store := new int[3] [-2, 4, 4];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    obj.add(v);
  }

  // Test case for combination {1}:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 10;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [-1, -1];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -1;
    obj.add(v);
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 1;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [-2, -2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -10;
    obj.add(v);
  }

  // Test case for combination {1}/Bn=2:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 2;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [-2, -2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := -10;
    obj.add(v);
  }

  // Test case for combination {1}/Ov=0:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 10;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [-2, -2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 0;
    obj.add(v);
  }

  // Test case for combination {1}/Ov>0:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 3;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [-2, -2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 10;
    obj.add(v);
  }

  // Test case for combination {1}/O|store|=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 10;
    var obj := new GrowingSet(n);
    var tmp_store := new int[1] [-2];
    obj.store := tmp_store;
    obj.nelems := 1;
    obj.Repr := {obj, obj.store};
    var v := 2;
    obj.add(v);
  }

  // Test case for combination {1}/O|elems|=0:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 10;
    var obj := new GrowingSet(n);
    var tmp_store := new int[1] [10];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 2;
    obj.add(v);
    expect tmp_store[..] == [2]; // observed from implementation
  }

  // Test case for combination {1}/O|elems|>=2:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 4;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [3, 4];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 2;
    obj.add(v);
  }

  // Test case for combination {1}/R9:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 5;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [-1, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 2;
    obj.add(v);
  }

  // Test case for combination {1}/R10:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  {
    var n := 6;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [-2, -2];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var v := 2;
    obj.add(v);
  }

}

method TestsForfind()
{
  // Test case for combination {1}:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 10;
    var obj := new Set(n);
    var tmp_store := new int[2] [3, 3];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := 2;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {2}:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 10;
    var obj := new Set(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := -1;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/Bnelems=0:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 10;
    var obj := new Set(n);
    var tmp_store := new int[1] [-1];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var x := 2;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/Bnelems=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 10;
    var obj := new Set(n);
    var tmp_store := new int[1] [-2];
    obj.store := tmp_store;
    obj.nelems := 1;
    obj.Repr := {obj, obj.store};
    var x := -1;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 1;
    var obj := new Set(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := 2;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/Bn=2:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 2;
    var obj := new Set(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := 2;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {2}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 1;
    var obj := new Set(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := -1;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {2}/Bn=2:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 2;
    var obj := new Set(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := -1;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 10;
    var obj := new PositiveSet(n);
    var tmp_store := new int[2] [3, 3];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := 2;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {2}:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 10;
    var obj := new PositiveSet(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := -1;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/Bnelems=0:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 10;
    var obj := new PositiveSet(n);
    var tmp_store := new int[1] [-1];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var x := 2;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/Bnelems=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 10;
    var obj := new PositiveSet(n);
    var tmp_store := new int[1] [-2];
    obj.store := tmp_store;
    obj.nelems := 1;
    obj.Repr := {obj, obj.store};
    var x := -1;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 1;
    var obj := new PositiveSet(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := 2;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/Bn=2:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 2;
    var obj := new PositiveSet(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := 2;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {2}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 1;
    var obj := new PositiveSet(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := -1;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {2}/Bn=2:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 2;
    var obj := new PositiveSet(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := -1;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 10;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [3, 3];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := 2;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {2}:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 10;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := -1;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/Bnelems=0:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 10;
    var obj := new GrowingSet(n);
    var tmp_store := new int[1] [-1];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var x := 2;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/Bnelems=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 10;
    var obj := new GrowingSet(n);
    var tmp_store := new int[1] [-2];
    obj.store := tmp_store;
    obj.nelems := 1;
    obj.Repr := {obj, obj.store};
    var x := -1;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 1;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := 2;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {1}/Bn=2:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 2;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := 2;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {2}/Bn=1:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 1;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := -1;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

  // Test case for combination {2}/Bn=2:
  //   PRE:  RepInv()
  //   PRE:  0 < n
  //   POST Q1: RepInv()
  //   POST Q2: r < 0 ==> x !in elems
  //   POST Q3: r >= 0 ==> x in elems
  {
    var n := 2;
    var obj := new GrowingSet(n);
    var tmp_store := new int[2] [5, 5];
    obj.store := tmp_store;
    obj.nelems := 2;
    obj.Repr := {obj, obj.store};
    var x := -1;
    var r := obj.find(x);
    expect r < 0 ==> x !in obj.elems;
    expect r >= 0 ==> x in obj.elems;
    expect r == -1; // observed from implementation
  }

}

method TestsFordeposit()
{
  // Test case for combination {1}:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 10;
    obj.deposit(amount);
  }

  // Test case for combination {1}/Bamount=1:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 1;
    obj.deposit(amount);
  }

  // Test case for combination {1}/Bamount=2:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 2;
    obj.deposit(amount);
  }

  // Test case for combination {1}/Ocbalance=0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 0;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 10;
    obj.deposit(amount);
  }

  // Test case for combination {1}/Ocbalance>0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 10;
    obj.deposit(amount);
  }

  // Test case for combination {1}/Osbalance=0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := 0;
    obj.Repr := {obj};
    var amount := 10;
    obj.deposit(amount);
  }

  // Test case for combination {1}/Osbalance>0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := 10;
    obj.Repr := {obj};
    var amount := 10;
    obj.deposit(amount);
  }

  // Test case for combination {1}/R8:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 9;
    obj.deposit(amount);
  }

  // Test case for combination {1}/R9:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 8;
    obj.deposit(amount);
  }

  // Test case for combination {1}/R10:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := 10;
    obj.Repr := {obj};
    var amount := 10;
    obj.deposit(amount);
  }

}

method TestsForwithdraw()
{
  // Test case for combination {1}:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 10;
    obj.withdraw(amount);
  }

  // Test case for combination {1}/Bamount=1:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 1;
    obj.withdraw(amount);
  }

  // Test case for combination {1}/Bamount=2:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 2;
    obj.withdraw(amount);
  }

  // Test case for combination {1}/Ocbalance=0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 0;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 10;
    obj.withdraw(amount);
  }

  // Test case for combination {1}/Ocbalance>0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 10;
    obj.withdraw(amount);
  }

  // Test case for combination {1}/Osbalance=0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := 0;
    obj.Repr := {obj};
    var amount := 10;
    obj.withdraw(amount);
  }

  // Test case for combination {1}/Osbalance>0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := 10;
    obj.Repr := {obj};
    var amount := 10;
    obj.withdraw(amount);
  }

  // Test case for combination {1}/R8:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 9;
    obj.withdraw(amount);
  }

  // Test case for combination {1}/R9:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 8;
    obj.withdraw(amount);
  }

  // Test case for combination {1}/R10:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := 10;
    obj.Repr := {obj};
    var amount := 10;
    obj.withdraw(amount);
  }

}

method TestsForsave()
{
  // Test case for combination {1}:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 10;
    obj.save(amount);
  }

  // Test case for combination {1}/Bamount=1:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 1;
    obj.save(amount);
  }

  // Test case for combination {1}/Bamount=2:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 2;
    obj.save(amount);
  }

  // Test case for combination {1}/Osbalance=0:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := 0;
    obj.Repr := {obj};
    var amount := 10;
    obj.save(amount);
  }

  // Test case for combination {1}/Osbalance>0:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := 10;
    obj.Repr := {obj};
    var amount := 10;
    obj.save(amount);
  }

  // Test case for combination {1}/R6:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := 10;
    obj.Repr := {obj};
    var amount := 9;
    obj.save(amount);
  }

  // Test case for combination {1}/R7:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 9;
    obj.save(amount);
  }

  // Test case for combination {1}/R8:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 8;
    obj.save(amount);
  }

  // Test case for combination {1}/R9:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 9;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 2;
    obj.save(amount);
  }

  // Test case for combination {1}/R10:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 7;
    obj.save(amount);
  }

}

method TestsForrescue()
{
  // Test case for combination {1}:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 10;
    obj.rescue(amount);
  }

  // Test case for combination {1}/Bamount=1:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 1;
    obj.rescue(amount);
  }

  // Test case for combination {1}/Bamount=2:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 2;
    obj.rescue(amount);
  }

  // Test case for combination {1}/Ocbalance=0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 0;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 10;
    obj.rescue(amount);
  }

  // Test case for combination {1}/Ocbalance>0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 10;
    obj.rescue(amount);
  }

  // Test case for combination {1}/Osbalance=0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := 0;
    obj.Repr := {obj};
    var amount := 10;
    obj.rescue(amount);
  }

  // Test case for combination {1}/Osbalance>0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := 10;
    obj.Repr := {obj};
    var amount := 10;
    obj.rescue(amount);
  }

  // Test case for combination {1}/R8:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 9;
    obj.rescue(amount);
  }

  // Test case for combination {1}/R9:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 10;
    obj.sbalance := -10;
    obj.Repr := {obj};
    var amount := 8;
    obj.rescue(amount);
  }

  // Test case for combination {1}/R10:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST Q1: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := -10;
    obj.sbalance := 10;
    obj.Repr := {obj};
    var amount := 10;
    obj.rescue(amount);
  }

}

method Main()
{
  TestsForcontains();
  print "TestsForcontains: all non-failing tests passed!\n";
  TestsForadd();
  print "TestsForadd: all non-failing tests passed!\n";
  TestsForfind();
  print "TestsForfind: all non-failing tests passed!\n";
  TestsFordeposit();
  print "TestsFordeposit: all non-failing tests passed!\n";
  TestsForwithdraw();
  print "TestsForwithdraw: all non-failing tests passed!\n";
  TestsForsave();
  print "TestsForsave: all non-failing tests passed!\n";
  TestsForrescue();
  print "TestsForrescue: all non-failing tests passed!\n";
}
