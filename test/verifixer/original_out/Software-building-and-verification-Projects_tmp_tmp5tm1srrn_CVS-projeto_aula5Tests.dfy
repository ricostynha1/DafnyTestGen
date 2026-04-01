// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Software-building-and-verification-Projects_tmp_tmp5tm1srrn_CVS-projeto_aula5.dfy
// Method: contains
// Generated: 2026-04-01 22:33:50

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
        Repr := Repr - {store} + {tmp};
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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   POST: RepInv()
  {
    var n := 0;
    var obj := new Set(n);
    var tmp_store := new int[1] [24];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 0;
    expect obj.RepInv(); // PRE-CHECK
    expect obj.size() < obj.maxSize(); // PRE-CHECK
    obj.add(v);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bv=0,nelems=0,n=0,elems=0:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   POST: RepInv()
  {
    var n := 0;
    var obj := new Set(n);
    var tmp_store := new int[1] [19];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 0;
    expect obj.RepInv(); // PRE-CHECK
    expect obj.size() < obj.maxSize(); // PRE-CHECK
    obj.add(v);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bv=1,nelems=0,n=0,elems=2:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   POST: RepInv()
  {
    var n := 0;
    var obj := new Set(n);
    var tmp_store := new int[1] [11];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 1;
    expect obj.RepInv(); // PRE-CHECK
    expect obj.size() < obj.maxSize(); // PRE-CHECK
    obj.add(v);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bv=1,nelems=0,n=1,elems=0:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   POST: RepInv()
  {
    var n := 1;
    var obj := new Set(n);
    var tmp_store := new int[1] [19];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 1;
    expect obj.RepInv(); // PRE-CHECK
    expect obj.size() < obj.maxSize(); // PRE-CHECK
    obj.add(v);
    expect obj.RepInv();
  }

  // Test case for combination {1}:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   POST: RepInv()
  {
    var n := 0;
    var obj := new PositiveSet(n);
    var tmp_store := new int[1] [24];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 0;
    expect obj.RepInv(); // PRE-CHECK
    expect obj.size() < obj.maxSize(); // PRE-CHECK
    obj.add(v);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bv=0,nelems=0,n=0,elems=0:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   POST: RepInv()
  {
    var n := 0;
    var obj := new PositiveSet(n);
    var tmp_store := new int[1] [19];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 0;
    expect obj.RepInv(); // PRE-CHECK
    expect obj.size() < obj.maxSize(); // PRE-CHECK
    obj.add(v);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bv=1,nelems=0,n=0,elems=2:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   POST: RepInv()
  {
    var n := 0;
    var obj := new PositiveSet(n);
    var tmp_store := new int[1] [11];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 1;
    expect obj.RepInv(); // PRE-CHECK
    expect obj.size() < obj.maxSize(); // PRE-CHECK
    obj.add(v);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bv=1,nelems=0,n=1,elems=0:
  //   PRE:  RepInv()
  //   PRE:  size() < maxSize()
  //   POST: RepInv()
  {
    var n := 1;
    var obj := new PositiveSet(n);
    var tmp_store := new int[1] [19];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 1;
    expect obj.RepInv(); // PRE-CHECK
    expect obj.size() < obj.maxSize(); // PRE-CHECK
    obj.add(v);
    expect obj.RepInv();
  }

  // Test case for combination {1}:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 0;
    obj.sbalance := 0;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.deposit(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bamount=1,cbalance=0,sbalance=1:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 0;
    obj.sbalance := 1;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.deposit(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bamount=1,cbalance=1,sbalance=0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 1;
    obj.sbalance := 0;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.deposit(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bamount=1,cbalance=1,sbalance=1:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 1;
    obj.sbalance := 1;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.deposit(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 0;
    obj.sbalance := 0;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.withdraw(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bamount=1,cbalance=0,sbalance=1:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 0;
    obj.sbalance := 1;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.withdraw(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bamount=1,cbalance=1,sbalance=0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 1;
    obj.sbalance := 0;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.withdraw(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bamount=1,cbalance=1,sbalance=1:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 1;
    obj.sbalance := 1;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.withdraw(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 0;
    obj.sbalance := 0;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.PositiveChecking(); // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.save(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bamount=1,cbalance=0,sbalance=1:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 0;
    obj.sbalance := 1;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.PositiveChecking(); // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.save(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bamount=1,cbalance=1,sbalance=0:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 1;
    obj.sbalance := 0;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.PositiveChecking(); // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.save(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bamount=1,cbalance=1,sbalance=1:
  //   PRE:  amount > 0
  //   PRE:  PositiveChecking()
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 1;
    obj.sbalance := 1;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.PositiveChecking(); // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.save(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 0;
    obj.sbalance := 0;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.rescue(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bamount=1,cbalance=0,sbalance=1:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 0;
    obj.sbalance := 1;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.rescue(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bamount=1,cbalance=1,sbalance=0:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 1;
    obj.sbalance := 0;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.rescue(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bamount=1,cbalance=1,sbalance=1:
  //   PRE:  amount > 0
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var obj := new SavingsAccount();
    obj.cbalance := 1;
    obj.sbalance := 1;
    obj.Repr := {obj};
    var amount := 1;
    expect amount > 0; // PRE-CHECK
    expect obj.RepInv(); // PRE-CHECK
    obj.rescue(amount);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bv=0,nelems=0,n=0,elems=0:
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var n := 0;
    var obj := new GrowingSet(n);
    var tmp_store := new int[1] [19];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 0;
    expect obj.RepInv(); // PRE-CHECK
    obj.add(v);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bv=1,nelems=0,n=0,elems=2:
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var n := 0;
    var obj := new GrowingSet(n);
    var tmp_store := new int[1] [11];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 1;
    expect obj.RepInv(); // PRE-CHECK
    obj.add(v);
    expect obj.RepInv();
  }

  // Test case for combination {1}/Bv=1,nelems=0,n=1,elems=0:
  //   PRE:  RepInv()
  //   POST: RepInv()
  {
    var n := 1;
    var obj := new GrowingSet(n);
    var tmp_store := new int[1] [19];
    obj.store := tmp_store;
    obj.nelems := 0;
    obj.Repr := {obj, obj.store};
    var v := 1;
    expect obj.RepInv(); // PRE-CHECK
    obj.add(v);
    expect obj.RepInv();
  }

}

method Failing()
{
  // (no failing tests)
}

method Main()
{
  Passing();
  Failing();
}
