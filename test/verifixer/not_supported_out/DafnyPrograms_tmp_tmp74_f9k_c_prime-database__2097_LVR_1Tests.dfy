// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\not_supported\DafnyPrograms_tmp_tmp74_f9k_c_prime-database__2097_LVR_1.dfy
// Method: InsertPrime
// Generated: 2026-03-28 21:52:27

// DafnyPrograms_tmp_tmp74_f9k_c_prime-database.dfy

predicate prime(n: nat)
  decreases n
{
  n > 1 &&
  forall nr: int {:trigger n % nr} | 1 < nr < n :: 
    n % nr != 0
}

method testingMethod()
{
  assert !(forall nr: int {:trigger 15 % nr} | 1 < nr < 15 :: 15 % nr != 0) ==> exists nr: int {:trigger 15 % nr} | 1 < nr < 15 :: 15 % nr == 0;
  assert 15 % 3 == 0;
  assert exists nr: int {:trigger 15 % nr} | 1 < nr < 15 :: 15 % nr == 0;
  var pm := new PrimeMap();
  pm.InsertPrime(13);
  pm.InsertNumber(17);
  pm.InsertNumber(15);
  assert pm.database.Keys == {17, 15, 13};
  var result: Answer := pm.IsPrime?(17);
  assert result == Yes;
  var result2: Answer := pm.IsPrime?(15);
  assert result2 == No;
  var result3: Answer := pm.IsPrime?(454);
  assert result3 == Unknown;
  var result4: Answer := pm.IsPrime?(13);
  assert result4 == Yes;
}

datatype Answer = Yes | No | Unknown

class {:autocontracts} PrimeMap {
  var database: map<nat, bool>

  predicate Valid()
    reads this, this, Repr
    ensures Valid() ==> this in Repr
    decreases Repr + {this, this}
  {
    this in Repr &&
    null !in Repr &&
    forall i: nat {:trigger prime(i)} {:trigger database[i]} {:trigger i in database.Keys} | i in database.Keys :: 
      database[i] == true <==> prime(i)
  }

  constructor ()
    ensures Valid()
    ensures fresh(Repr)
    ensures database == map[]
  {
    database := map[];
    new;
    Repr := {this};
  }

  method InsertPrime(n: nat)
    requires Valid()
    requires prime(n)
    modifies this
    ensures Valid()
    ensures fresh(Repr - (Repr))
    ensures database.Keys == (database.Keys) + {n}
    ensures database == database[n := true]
    decreases n
  {
    database := database[n := true];
  }

  method InsertNumber(n: nat)
    requires Valid()
    modifies this
    ensures Valid()
    ensures fresh(Repr - (Repr))
    ensures database.Keys == (database.Keys) + {n}
    ensures prime(n) <==> database == database[n := true]
    ensures !prime(n) <==> database == database[n := false]
    decreases n
  {
    var prime: bool;
    prime := testPrimeness(n);
    database := database[n := prime];
  }

  method IsPrime?(n: nat) returns (answer: Answer)
    requires Valid()
    modifies Repr
    ensures Valid()
    ensures fresh(Repr - (Repr))
    ensures database.Keys == (database.Keys)
    ensures n in database && prime(n) <==> answer == Yes
    ensures n in database && !prime(n) <==> answer == No
    ensures !(n in database) <==> answer == Unknown
    decreases n
  {
    if !(n in database) {
      return Unknown;
    } else if database[n] == true {
      return Yes;
    } else if database[n] == false {
      return No;
    }
  }

  method testPrimeness(n: nat) returns (result: bool)
    requires Valid()
    requires n >= 0
    ensures result <==> prime(n)
    decreases n
  {
    if n == 1 || n == 1 {
      return false;
    }
    var i := 2;
    result := true;
    while i < n
      invariant i >= 2 && i <= n
      invariant result <==> forall j: int {:trigger n % j} | 1 < j <= i - 1 :: n % j != 0
      decreases n - i
    {
      if n % i == 0 {
        result := false;
      }
      i := i + 1;
    }
  }

  var Repr: set<object?>
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   PRE:  prime(n)
  //   POST: Valid()
  //   POST: database.Keys == old(database.Keys) + {n}
  //   POST: database == database[n := true]
  {
    var obj := new PrimeMap();
    var tmp_database: map<nat, bool> := map[];
    obj.database := tmp_database;
    obj.Repr := {obj};
    var n := 2;
    var old_database_Keys := obj.database.Keys;
    expect obj.Valid(); // PRE-CHECK
    expect prime(n); // PRE-CHECK
    obj.InsertPrime(n);
    expect obj.Valid();
    expect obj.database.Keys == old_database_Keys + {n};
    expect obj.database == obj.database[n := true];
  }

  // Test case for combination {1}:
  //   PRE:  Valid()
  //   POST: Valid()
  //   POST: database.Keys == old(database.Keys)
  //   POST: n in database && prime(n) <==> answer == Yes
  //   POST: n in database && !prime(n) <==> answer == No
  //   POST: !(n in database) <==> answer == Unknown
  {
    var obj := new PrimeMap();
    var tmp_database: map<nat, bool> := map[];
    obj.database := tmp_database;
    obj.Repr := {obj};
    var n := 0;
    var old_database_Keys := obj.database.Keys;
    expect obj.Valid(); // PRE-CHECK
    var answer := obj.IsPrime?(n);
    expect obj.Valid();
    expect obj.database.Keys == old_database_Keys;
    expect n in obj.database && prime(n) <==> answer == Yes;
    expect n in obj.database && !prime(n) <==> answer == No;
    expect !(n in obj.database) <==> answer == Unknown;
  }

  // Test case for combination {1}/Bn=0,database=1:
  //   PRE:  Valid()
  //   POST: Valid()
  //   POST: database.Keys == old(database.Keys)
  //   POST: n in database && prime(n) <==> answer == Yes
  //   POST: n in database && !prime(n) <==> answer == No
  //   POST: !(n in database) <==> answer == Unknown
  {
    var obj := new PrimeMap();
    var tmp_database: map<nat, bool> := map[6 := false];
    obj.database := tmp_database;
    obj.Repr := {obj};
    var n := 0;
    var old_database_Keys := obj.database.Keys;
    expect obj.Valid(); // PRE-CHECK
    var answer := obj.IsPrime?(n);
    expect obj.Valid();
    expect obj.database.Keys == old_database_Keys;
    expect n in obj.database && prime(n) <==> answer == Yes;
    expect n in obj.database && !prime(n) <==> answer == No;
    expect !(n in obj.database) <==> answer == Unknown;
  }

  // Test case for combination {1}/Bn=0,database=2:
  //   PRE:  Valid()
  //   POST: Valid()
  //   POST: database.Keys == old(database.Keys)
  //   POST: n in database && prime(n) <==> answer == Yes
  //   POST: n in database && !prime(n) <==> answer == No
  //   POST: !(n in database) <==> answer == Unknown
  {
    var obj := new PrimeMap();
    var tmp_database: map<nat, bool> := map[4 := false, 6 := false];
    obj.database := tmp_database;
    obj.Repr := {obj};
    var n := 0;
    var old_database_Keys := obj.database.Keys;
    expect obj.Valid(); // PRE-CHECK
    var answer := obj.IsPrime?(n);
    expect obj.Valid();
    expect obj.database.Keys == old_database_Keys;
    expect n in obj.database && prime(n) <==> answer == Yes;
    expect n in obj.database && !prime(n) <==> answer == No;
    expect !(n in obj.database) <==> answer == Unknown;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   PRE:  Valid()
  //   POST: Valid()
  //   POST: database.Keys == old(database.Keys) + {n}
  //   POST: prime(n) <==> database == database[n := true]
  //   POST: !prime(n) <==> database == database[n := false]
  {
    var obj := new PrimeMap();
    var tmp_database: map<nat, bool> := map[];
    obj.database := tmp_database;
    obj.Repr := {obj};
    var n := 0;
    var old_database_Keys := obj.database.Keys;
    // expect obj.Valid(); // PRE-CHECK
    obj.InsertNumber(n);
    // expect obj.Valid();
    // expect obj.database.Keys == old_database_Keys + {n};
    // expect prime(n) <==> obj.database == obj.database[n := true];
    // expect !prime(n) <==> obj.database == obj.database[n := false];
  }

}

method Main()
{
  Passing();
  Failing();
}
