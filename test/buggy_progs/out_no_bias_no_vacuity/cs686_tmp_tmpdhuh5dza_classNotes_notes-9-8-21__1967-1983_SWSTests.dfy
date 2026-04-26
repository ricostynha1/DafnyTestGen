// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\cs686_tmp_tmpdhuh5dza_classNotes_notes-9-8-21__1967-1983_SWS.dfy
// Method: Init
// Generated: 2026-04-24 21:44:23

// cs686_tmp_tmpdhuh5dza_classNotes_notes-9-8-21.dfy

method Q1()
{
  var a := new int[6];
  a[0], a[1], a[2], a[3], a[4], a[5] := 1, 0, 0, 0, 1, 1;
  var b := new int[3];
  b[0], b[1], b[2] := 1, 0, 1;
  var j, k := 1, 3;
  var p, r := 4, 5;
  assert forall i: int {:trigger a[i]} :: j <= i <= k ==> a[i] == 0;
  assert forall i: int {:trigger a[i]} :: if j <= i <= k then a[i] == 0 else true;
  assert forall i: int {:trigger a[i]} :: (0 <= i < a.Length && a[i] == 0 ==> j <= i) && (0 <= i < a.Length && a[i] == 0 ==> i <= k);
  assert a[0] == 1;
  assert !forall i: int {:trigger a[i]} :: (0 <= i < a.Length && a[i] == 1 ==> p <= i) && (0 <= i < a.Length && a[i] == 1 ==> i <= r);
  assert a[1] == 0 && a[2] == 0;
  assert exists i: int, j: int {:trigger a[j], a[i]} :: 0 <= i < j < a.Length && a[i] == 0 && a[j] == 0;
  assert !exists i: int, j: int, k: int {:trigger b[k], b[j], b[i]} :: 0 <= i < j < k < b.Length && b[i] == 0 && b[j] == 0 && b[k] == k;
}

class Secret {
  var secret: int
  var known: bool
  var count: int

  method Init(x: int)
    requires 1 <= x <= 10
    modifies `secret, `known, `count
    ensures secret == x
    ensures known == false
    ensures count == 0
    decreases x
  {
    known := false;
    count := 0;
    secret := x;
  }

  method Guess(g: int) returns (result: bool, guesses: int)
    requires known == false
    modifies `known, `count
    ensures if g == secret then result == true && known == true else result == false && known == false
    ensures count == old(count) + 1 && guesses == count
    decreases g
  {
    if g == secret {
      known := true;
      result := true;
    } else {
      result := false;
    }
    guesses := count;
    count := count + 1;
  }

  method OriginalMain()
  {
    var testObject: Secret := new Secret.Init(5);
    assert 1 <= testObject.secret <= 10;
    assert testObject.secret == 5;
    var x, y := testObject.Guess(0);
    assert x == false && y == 1;
    x, y := testObject.Guess(5);
    assert x == true && y == 2;
  }
}


method TestsForInit()
{
  // Test case for combination {1}:
  //   PRE:  1 <= x <= 10
  //   POST Q1: secret == x
  //   POST Q2: known == false
  //   POST Q3: count == 0
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := false;
    obj.count := 0;
    var x := 1;
    obj.Init(x);
    expect obj.secret == 1;
    expect obj.known == false;
    expect obj.count == 0;
  }

  // Test case for combination {1}/Osecret>0:
  //   PRE:  1 <= x <= 10
  //   POST Q1: secret == x
  //   POST Q2: known == false
  //   POST Q3: count == 0
  {
    var obj := new Secret;
    obj.secret := 1;
    obj.known := false;
    obj.count := 0;
    var x := 2;
    obj.Init(x);
    expect obj.secret == 2;
    expect obj.known == false;
    expect obj.count == 0;
  }

  // Test case for combination {1}/Osecret<0:
  //   PRE:  1 <= x <= 10
  //   POST Q1: secret == x
  //   POST Q2: known == false
  //   POST Q3: count == 0
  {
    var obj := new Secret;
    obj.secret := -1;
    obj.known := false;
    obj.count := 0;
    var x := 1;
    obj.Init(x);
    expect obj.secret == 1;
    expect obj.known == false;
    expect obj.count == 0;
  }

  // Test case for combination {1}/Oknown=true:
  //   PRE:  1 <= x <= 10
  //   POST Q1: secret == x
  //   POST Q2: known == false
  //   POST Q3: count == 0
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := true;
    obj.count := 0;
    var x := 1;
    obj.Init(x);
    expect obj.secret == 1;
    expect obj.known == false;
    expect obj.count == 0;
  }

  // Test case for combination {1}/Ocount>0:
  //   PRE:  1 <= x <= 10
  //   POST Q1: secret == x
  //   POST Q2: known == false
  //   POST Q3: count == 0
  {
    var obj := new Secret;
    obj.secret := -2;
    obj.known := false;
    obj.count := 1;
    var x := 1;
    obj.Init(x);
    expect obj.secret == 1;
    expect obj.known == false;
    expect obj.count == 0;
  }

  // Test case for combination {1}/Ocount<0:
  //   PRE:  1 <= x <= 10
  //   POST Q1: secret == x
  //   POST Q2: known == false
  //   POST Q3: count == 0
  {
    var obj := new Secret;
    obj.secret := -3;
    obj.known := false;
    obj.count := -1;
    var x := 1;
    obj.Init(x);
    expect obj.secret == 1;
    expect obj.known == false;
    expect obj.count == 0;
  }

  // Test case for combination {1}/R7:
  //   PRE:  1 <= x <= 10
  //   POST Q1: secret == x
  //   POST Q2: known == false
  //   POST Q3: count == 0
  {
    var obj := new Secret;
    obj.secret := -4;
    obj.known := false;
    obj.count := -2;
    var x := 3;
    obj.Init(x);
    expect obj.secret == 3;
    expect obj.known == false;
    expect obj.count == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  1 <= x <= 10
  //   POST Q1: secret == x
  //   POST Q2: known == false
  //   POST Q3: count == 0
  {
    var obj := new Secret;
    obj.secret := -5;
    obj.known := false;
    obj.count := -3;
    var x := 4;
    obj.Init(x);
    expect obj.secret == 4;
    expect obj.known == false;
    expect obj.count == 0;
  }

  // Test case for combination {1}/R9:
  //   PRE:  1 <= x <= 10
  //   POST Q1: secret == x
  //   POST Q2: known == false
  //   POST Q3: count == 0
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := false;
    obj.count := -4;
    var x := 1;
    obj.Init(x);
    expect obj.secret == 1;
    expect obj.known == false;
    expect obj.count == 0;
  }

  // Test case for combination {1}/R10:
  //   PRE:  1 <= x <= 10
  //   POST Q1: secret == x
  //   POST Q2: known == false
  //   POST Q3: count == 0
  {
    var obj := new Secret;
    obj.secret := -6;
    obj.known := false;
    obj.count := -5;
    var x := 1;
    obj.Init(x);
    expect obj.secret == 1;
    expect obj.known == false;
    expect obj.count == 0;
  }

}

method TestsForGuess()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Rel:
  //   PRE:  known == false
  //   POST Q1: g == secret
  //   POST Q2: result == true
  //   POST Q3: known == true
  //   POST Q4: count == old(count) + 1
  //   POST Q5: guesses == count
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := false;
    obj.count := 0;
    var g := 0;
    var result, guesses := obj.Guess(g);
    // actual runtime state: obj=_module.Secret, guesses=0
    // expect result == true; // LHS=true, RHS=true
    // expect guesses == 1; // LHS=0, RHS=1
    // expect obj.known == true; // LHS=true, RHS=true
    // expect obj.count == 1; // LHS=1, RHS=1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Rel:
  //   PRE:  known == false
  //   POST Q1: g != secret
  //   POST Q2: result == false
  //   POST Q3: known == false
  //   POST Q4: count == old(count) + 1
  //   POST Q5: guesses == count
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := false;
    obj.count := -2;
    var g := 1;
    var result, guesses := obj.Guess(g);
    // actual runtime state: obj=_module.Secret, guesses=-2
    // expect result == false; // LHS=false, RHS=false
    // expect guesses == -1; // LHS=-2, RHS=-1
    // expect obj.known == false; // LHS=false, RHS=false
    // expect obj.count == -1; // LHS=-1, RHS=-1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Og>0:
  //   PRE:  known == false
  //   POST Q1: g == secret
  //   POST Q2: result == true
  //   POST Q3: known == true
  //   POST Q4: count == old(count) + 1
  //   POST Q5: guesses == count
  {
    var obj := new Secret;
    obj.secret := 1;
    obj.known := false;
    obj.count := -1;
    var g := 1;
    var result, guesses := obj.Guess(g);
    // actual runtime state: obj=_module.Secret, guesses=-1
    // expect result == true; // LHS=true, RHS=true
    // expect guesses == 0; // LHS=-1, RHS=0
    // expect obj.known == true; // LHS=true, RHS=true
    // expect obj.count == 0; // LHS=0, RHS=0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Og<0:
  //   PRE:  known == false
  //   POST Q1: g == secret
  //   POST Q2: result == true
  //   POST Q3: known == true
  //   POST Q4: count == old(count) + 1
  //   POST Q5: guesses == count
  {
    var obj := new Secret;
    obj.secret := -1;
    obj.known := false;
    obj.count := -1;
    var g := -1;
    var result, guesses := obj.Guess(g);
    // actual runtime state: obj=_module.Secret, guesses=-1
    // expect result == true; // LHS=true, RHS=true
    // expect guesses == 0; // LHS=-1, RHS=0
    // expect obj.known == true; // LHS=true, RHS=true
    // expect obj.count == 0; // LHS=0, RHS=0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Ocount>0:
  //   PRE:  known == false
  //   POST Q1: g == secret
  //   POST Q2: result == true
  //   POST Q3: known == true
  //   POST Q4: count == old(count) + 1
  //   POST Q5: guesses == count
  {
    var obj := new Secret;
    obj.secret := -2;
    obj.known := false;
    obj.count := 1;
    var g := -2;
    var result, guesses := obj.Guess(g);
    // actual runtime state: obj=_module.Secret, guesses=1
    // expect result == true; // LHS=true, RHS=true
    // expect guesses == 2; // LHS=1, RHS=2
    // expect obj.known == true; // LHS=true, RHS=true
    // expect obj.count == 2; // LHS=2, RHS=2
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oguesses<0:
  //   PRE:  known == false
  //   POST Q1: g == secret
  //   POST Q2: result == true
  //   POST Q3: known == true
  //   POST Q4: count == old(count) + 1
  //   POST Q5: guesses == count
  {
    var obj := new Secret;
    obj.secret := 2;
    obj.known := false;
    obj.count := -2;
    var g := 2;
    var result, guesses := obj.Guess(g);
    // actual runtime state: obj=_module.Secret, guesses=-2
    // expect result == true; // LHS=true, RHS=true
    // expect guesses == -1; // LHS=-2, RHS=-1
    // expect obj.known == true; // LHS=true, RHS=true
    // expect obj.count == -1; // LHS=-1, RHS=-1
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Og=0:
  //   PRE:  known == false
  //   POST Q1: g != secret
  //   POST Q2: result == false
  //   POST Q3: known == false
  //   POST Q4: count == old(count) + 1
  //   POST Q5: guesses == count
  {
    var obj := new Secret;
    obj.secret := 1;
    obj.known := false;
    obj.count := -1;
    var g := 0;
    var result, guesses := obj.Guess(g);
    // actual runtime state: obj=_module.Secret, guesses=-1
    // expect result == false; // LHS=false, RHS=false
    // expect guesses == 0; // LHS=-1, RHS=0
    // expect obj.known == false; // LHS=false, RHS=false
    // expect obj.count == 0; // LHS=0, RHS=0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Og<0:
  //   PRE:  known == false
  //   POST Q1: g != secret
  //   POST Q2: result == false
  //   POST Q3: known == false
  //   POST Q4: count == old(count) + 1
  //   POST Q5: guesses == count
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := false;
    obj.count := -1;
    var g := -1;
    var result, guesses := obj.Guess(g);
    // actual runtime state: obj=_module.Secret, guesses=-1
    // expect result == false; // LHS=false, RHS=false
    // expect guesses == 0; // LHS=-1, RHS=0
    // expect obj.known == false; // LHS=false, RHS=false
    // expect obj.count == 0; // LHS=0, RHS=0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Osecret<0:
  //   PRE:  known == false
  //   POST Q1: g != secret
  //   POST Q2: result == false
  //   POST Q3: known == false
  //   POST Q4: count == old(count) + 1
  //   POST Q5: guesses == count
  {
    var obj := new Secret;
    obj.secret := -1;
    obj.known := false;
    obj.count := -1;
    var g := -2;
    var result, guesses := obj.Guess(g);
    // actual runtime state: obj=_module.Secret, guesses=-1
    // expect result == false; // LHS=false, RHS=false
    // expect guesses == 0; // LHS=-1, RHS=0
    // expect obj.known == false; // LHS=false, RHS=false
    // expect obj.count == 0; // LHS=0, RHS=0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/Ocount=0:
  //   PRE:  known == false
  //   POST Q1: g != secret
  //   POST Q2: result == false
  //   POST Q3: known == false
  //   POST Q4: count == old(count) + 1
  //   POST Q5: guesses == count
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := false;
    obj.count := 0;
    var g := 1;
    var result, guesses := obj.Guess(g);
    // actual runtime state: obj=_module.Secret, guesses=0
    // expect result == false; // LHS=false, RHS=false
    // expect guesses == 1; // LHS=0, RHS=1
    // expect obj.known == false; // LHS=false, RHS=false
    // expect obj.count == 1; // LHS=1, RHS=1
  }

}

method Main()
{
  TestsForInit();
  print "TestsForInit: all non-failing tests passed!\n";
  TestsForGuess();
  print "TestsForGuess: all non-failing tests passed!\n";
}
