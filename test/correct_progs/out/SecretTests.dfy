// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Secret.dfy
// Method: Guess
// Generated: 2026-04-08 10:21:43

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   POST: guesses == count
  //   POST: g == old(secret)
  //   POST: result == true
  //   POST: known == true
  //   ENSURES: count == old(count) + 1 && guesses == count
  //   ENSURES: if g == old(secret) then result == true && known == true else result == false && known == false
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := false;
    obj.count := 0;
    var g := 0;
    var result, guesses := obj.Guess(g);
    expect result == true;
    expect guesses == 1;
    expect obj.known == true;
    expect obj.count == 1;
  }

  // Test case for combination {2}:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   POST: guesses == count
  //   POST: !(g == old(secret))
  //   POST: result == false
  //   POST: known == false
  //   ENSURES: count == old(count) + 1 && guesses == count
  //   ENSURES: if g == old(secret) then result == true && known == true else result == false && known == false
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := false;
    obj.count := 0;
    var g := 1;
    var result, guesses := obj.Guess(g);
    expect result == false;
    expect guesses == 1;
    expect obj.known == false;
    expect obj.count == 1;
  }

  // Test case for combination {1}/Bg=0,secret=0,count=1:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   POST: guesses == count
  //   POST: g == old(secret)
  //   POST: result == true
  //   POST: known == true
  //   ENSURES: count == old(count) + 1 && guesses == count
  //   ENSURES: if g == old(secret) then result == true && known == true else result == false && known == false
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := false;
    obj.count := 1;
    var g := 0;
    var result, guesses := obj.Guess(g);
    expect result == true;
    expect guesses == 2;
    expect obj.known == true;
    expect obj.count == 2;
  }

  // Test case for combination {1}/Bg=1,secret=1,count=0:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   POST: guesses == count
  //   POST: g == old(secret)
  //   POST: result == true
  //   POST: known == true
  //   ENSURES: count == old(count) + 1 && guesses == count
  //   ENSURES: if g == old(secret) then result == true && known == true else result == false && known == false
  {
    var obj := new Secret;
    obj.secret := 1;
    obj.known := false;
    obj.count := 0;
    var g := 1;
    var result, guesses := obj.Guess(g);
    expect result == true;
    expect guesses == 1;
    expect obj.known == true;
    expect obj.count == 1;
  }

  // Test case for combination {1}/Oknown=true:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   POST: guesses == count
  //   POST: g == old(secret)
  //   POST: result == true
  //   POST: known == true
  //   ENSURES: count == old(count) + 1 && guesses == count
  //   ENSURES: if g == old(secret) then result == true && known == true else result == false && known == false
  {
    var obj := new Secret;
    obj.secret := 0;
    obj.known := false;
    obj.count := 2;
    var g := 0;
    var result, guesses := obj.Guess(g);
    expect result == true;
    expect guesses == 3;
    expect obj.known == true;
    expect obj.count == 3;
  }

  // Test case for combination {2}/Oguesses>0:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   POST: guesses == count
  //   POST: !(g == old(secret))
  //   POST: result == false
  //   POST: known == false
  //   ENSURES: count == old(count) + 1 && guesses == count
  //   ENSURES: if g == old(secret) then result == true && known == true else result == false && known == false
  {
    var obj := new Secret;
    obj.secret := -1;
    obj.known := false;
    obj.count := 1;
    var g := -2;
    var result, guesses := obj.Guess(g);
    expect result == false;
    expect guesses == 2;
    expect obj.known == false;
    expect obj.count == 2;
  }

  // Test case for combination {2}/Oknown=false:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   POST: guesses == count
  //   POST: !(g == old(secret))
  //   POST: result == false
  //   POST: known == false
  //   ENSURES: count == old(count) + 1 && guesses == count
  //   ENSURES: if g == old(secret) then result == true && known == true else result == false && known == false
  {
    var obj := new Secret;
    obj.secret := -2;
    obj.known := false;
    obj.count := 0;
    var g := 0;
    var result, guesses := obj.Guess(g);
    expect result == false;
    expect guesses == 1;
    expect obj.known == false;
    expect obj.count == 1;
  }

  // Test case for combination {2}/Ocount>0:
  //   PRE:  known == false
  //   PRE:  count >= 0
  //   POST: count == old(count) + 1
  //   POST: guesses == count
  //   POST: !(g == old(secret))
  //   POST: result == false
  //   POST: known == false
  //   ENSURES: count == old(count) + 1 && guesses == count
  //   ENSURES: if g == old(secret) then result == true && known == true else result == false && known == false
  {
    var obj := new Secret;
    obj.secret := -3;
    obj.known := false;
    obj.count := 0;
    var g := -4;
    var result, guesses := obj.Guess(g);
    expect result == false;
    expect guesses == 1;
    expect obj.known == false;
    expect obj.count == 1;
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
