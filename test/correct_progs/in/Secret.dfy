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
