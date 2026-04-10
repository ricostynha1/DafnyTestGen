// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_803.dfy
// Method: IsPerfectSquare
// Generated: 2026-04-10 22:37:12

// Checks if a natural number is a perfect square.
method  IsPerfectSquare(n: nat) returns(result: bool)
  ensures result <==> exists i ::  0 <= i <= n && i * i == n
{
    var i := 0;
    while i * i < n
        invariant forall k :: 0 <= k < i  ==> k * k < n
    {
        i := i + 1;
    }
    SquareMonotonic(i); // helper, call lemma 
    return i * i == n;
}

// Helper lemma to prove monotonicity of squares
lemma SquareMonotonic(i: nat)
    ensures forall j :: j > i ==> j * j > i * i
{
    forall j | j > i
        ensures j * j > i * i
    { } // proved automatically by Dafny
}

// Test cases checked statically
method IsPerfectSquareTest(){
    assert 0 * 0 == 0; // helper
    var r := IsPerfectSquare(0); assert r;

    assert 1 * 1 == 1; // helper
    r := IsPerfectSquare(1); assert r;
    
    r := IsPerfectSquare(2); assert !r;
    r := IsPerfectSquare(3); assert !r;

    assert 2 * 2 == 4; // helper (witness)
    r := IsPerfectSquare(4); assert r;

    r := IsPerfectSquare(1000001); assert !r;
}

method Passing()
{
  // Test case for combination {2}:
  //   POST: result
  //   POST: exists i :: 1 <= i < (n - 1) && i * i == n
  //   ENSURES: result <==> exists i :: 0 <= i <= n && i * i == n
  {
    var n := 4;
    var result := IsPerfectSquare(n);
    expect result == true;
  }

  // Test case for combination {4}:
  //   POST: !result
  //   POST: !exists i :: 0 <= i <= n && i * i == n
  //   ENSURES: result <==> exists i :: 0 <= i <= n && i * i == n
  {
    var n := 2;
    var result := IsPerfectSquare(n);
    expect result == false;
  }

  // Test case for combination {2}/Oresult=true:
  //   POST: result
  //   POST: exists i :: 1 <= i < (n - 1) && i * i == n
  //   ENSURES: result <==> exists i :: 0 <= i <= n && i * i == n
  {
    var n := 9;
    var result := IsPerfectSquare(n);
    expect result == true;
  }

  // Test case for combination {4}/Oresult=false:
  //   POST: !result
  //   POST: !exists i :: 0 <= i <= n && i * i == n
  //   ENSURES: result <==> exists i :: 0 <= i <= n && i * i == n
  {
    var n := 3;
    var result := IsPerfectSquare(n);
    expect result == false;
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
