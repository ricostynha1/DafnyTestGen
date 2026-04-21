// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Secret.dfy
// Method: Guess
// Generated: 2026-04-21 22:51:09

class Secret {
    var secret: int
    var known: bool
    var count: int

    method Guess(g: int) returns (result: bool, guesses: int)
        modifies this`count, this`known
        requires known == false
        requires count >= 0
        ensures count == old(count) + 1 && guesses == count
        ensures if g == old(secret) then result == true && known == true else result == false && known == false
    {
        count := count + 1;
        guesses := count;
        if g == secret {
            known := true;
            result := true;
        } else {
            result := false;
        }
    }
}


method TestsForGuess()
{
  // Test case for combination {1}/Rel:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  //   POST Q2: guesses == count
  //   POST Q3: g == old(secret)
  //   POST Q4: result == true
  //   POST Q5: known == true
  {
    var obj := new Secret;
    obj.secret := -10;
    obj.known := false;
    obj.count := 10;
    var g := -10;
    var result, guesses := obj.Guess(g);
    expect result == true;
    expect guesses == 11;
    expect obj.known == true;
    expect obj.count == 11;
    expect obj[..] == _module.Secret; // observed from implementation
  }

  // Test case for combination {2}/Rel:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  //   POST Q2: guesses == count
  //   POST Q3: g != old(secret)
  //   POST Q4: result == false
  //   POST Q5: known == false
  {
    var obj := new Secret;
    obj.secret := -9;
    obj.known := false;
    obj.count := 10;
    var g := -10;
    var result, guesses := obj.Guess(g);
    expect result == false;
    expect guesses == 11;
    expect obj.known == false;
    expect obj.count == 11;
    expect obj[..] == _module.Secret; // observed from implementation
  }

  // Test case for combination {1}/Og=0:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  //   POST Q2: guesses == count
  //   POST Q3: g == old(secret)
  //   POST Q4: result == true
  //   POST Q5: known == true
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := false;
    obj.count := 10;
    var g := 0;
    var result, guesses := obj.Guess(g);
    expect result == true;
    expect guesses == 11;
    expect obj.known == true;
    expect obj.count == 11;
    expect obj[..] == _module.Secret; // observed from implementation
  }

  // Test case for combination {1}/Og>0:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST Q1: count == old(count) + 1
  //   POST Q2: guesses == count
  //   POST Q3: g == old(secret)
  //   POST Q4: result == true
  //   POST Q5: known == true
  {
    var obj := new Secret;
    obj.secret := 10;
    obj.known := false;
    obj.count := 10;
    var g := 10;
    var result, guesses := obj.Guess(g);
    expect result == true;
    expect guesses == 11;
    expect obj.known == true;
    expect obj.count == 11;
    expect obj[..] == _module.Secret; // observed from implementation
  }

}

method Main()
{
  TestsForGuess();
  print "TestsForGuess: all non-failing tests passed!\n";
}
