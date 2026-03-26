// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Secret.dfy
// Method: Guess
// Generated: 2026-03-26 22:52:31

class Secret {
    var secret: int
    var known: bool
    var count: int

    method Guess(g: int) returns (result: bool, guesses: int)
        modifies this
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


method GeneratedTests_Guess()
{
  // Test case for combination {1}:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   POST: guesses == count
  //   POST: g == old(secret)
  //   POST: result == true
  //   POST: known == true
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := false;
    obj.count := 0;
    var g := 0;
    var old_count := obj.count;
    var old_secret := obj.secret;
    var result, guesses := obj.Guess(g);
    expect obj.count == old_count + 1;
    expect guesses == obj.count;
    expect g == old_secret;
    expect result == true;
    expect obj.known == true;
  }

  // Test case for combination {2}:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   POST: guesses == count
  //   POST: !(g == old(secret))
  //   POST: result == false
  //   POST: known == false
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := false;
    obj.count := 0;
    var g := 1;
    var old_count := obj.count;
    var old_secret := obj.secret;
    var result, guesses := obj.Guess(g);
    expect obj.count == old_count + 1;
    expect guesses == obj.count;
    expect !(g == old_secret);
    expect result == false;
    expect obj.known == false;
  }

  // Test case for combination {2}:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   POST: guesses == count
  //   POST: !(g == old(secret))
  //   POST: result == false
  //   POST: known == false
  {
    var obj := new Secret;
    obj.secret := 3;
    obj.known := false;
    obj.count := 0;
    var g := 2;
    var old_count := obj.count;
    var old_secret := obj.secret;
    var result, guesses := obj.Guess(g);
    expect obj.count == old_count + 1;
    expect guesses == obj.count;
    expect !(g == old_secret);
    expect result == false;
    expect obj.known == false;
  }

}

method Main()
{
  GeneratedTests_Guess();
  print "GeneratedTests_Guess: all tests passed!\n";
}
