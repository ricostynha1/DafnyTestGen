// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Recaman.dfy
// Method: Contains
// Generated: 2026-04-10 23:12:12

/* the Recaman's sequence is defined as: 
    R(0) = 0
    For n > 0, R(n) = R(n-1) - n if positive and not already in the sequence, otherwise R(n) = R(n-1) + n.
*/

function R(n: nat): nat {
    if n == 0 then 0 
    else if R(n-1) - n > 0 && ! exists k ::  0 <= k < n && R(k) == R(n-1) - n then R(n-1) - n
    else R(n-1) + n
}

method Contains(x: int, a: array<nat>, len: nat) returns (res: bool)
  requires len <= a.Length
  ensures res <==> x in a[..len]
{
    for i := 0 to len
        invariant x !in a[0..i]
    {
        if a[i] == x {
            return true;
        }
    }
    return false;
}

// Returns the n-th term of Recaman's sequence
method Recaman(n: nat) returns (res: nat)
 ensures res == R(n)
{
    var a: array<nat> := new nat[n+1];
    a[0] := 0;
    for i := 1 to n + 1  
      invariant forall k :: 0 <= k < i ==> a[k] == R(k) 
    {
       var x  := a[i-1] - i;
       if x > 0 {
           var c := Contains(x, a, i);
           if ! c {
             a[i] := x;
           } 
           else {
             a[i] := a[i-1] + i;
           }
       } 
        else {
            a[i] := a[i-1] + i;
        }
    }
    return a[n];
}



method Passing()
{
  // Test case for combination {1}:
  //   PRE:  len <= a.Length
  //   POST: res
  //   POST: x in a[..len]
  //   ENSURES: res <==> x in a[..len]
  {
    var x := 7719;
    var a := new nat[1] [7719];
    var len := 1;
    var res := Contains(x, a, len);
    expect res == true;
  }

  // Test case for combination {2}:
  //   PRE:  len <= a.Length
  //   POST: !res
  //   POST: !(x in a[..len])
  //   ENSURES: res <==> x in a[..len]
  {
    var x := 0;
    var a := new nat[0] [];
    var len := 0;
    var res := Contains(x, a, len);
    expect res == false;
  }

  // Test case for combination {1}/Bx=0,a=1,len==a_len:
  //   PRE:  len <= a.Length
  //   POST: res
  //   POST: x in a[..len]
  //   ENSURES: res <==> x in a[..len]
  {
    var x := 0;
    var a := new nat[1] [0];
    var len := 1;
    var res := Contains(x, a, len);
    expect res == true;
  }

  // Test case for combination {1}/Bx=0,a=2,len==a_len:
  //   PRE:  len <= a.Length
  //   POST: res
  //   POST: x in a[..len]
  //   ENSURES: res <==> x in a[..len]
  {
    var x := 0;
    var a := new nat[2] [0, 39];
    var len := 2;
    var res := Contains(x, a, len);
    expect res == true;
  }

  // Test case for combination {1}/Ores=true:
  //   PRE:  len <= a.Length
  //   POST: res
  //   POST: x in a[..len]
  //   ENSURES: res <==> x in a[..len]
  {
    var x := 7720;
    var a := new nat[1] [7720];
    var len := 1;
    var res := Contains(x, a, len);
    expect res == true;
  }

  // Test case for combination {2}/Ores=false:
  //   PRE:  len <= a.Length
  //   POST: !res
  //   POST: !(x in a[..len])
  //   ENSURES: res <==> x in a[..len]
  {
    var x := 8;
    var a := new nat[0] [];
    var len := 0;
    var res := Contains(x, a, len);
    expect res == false;
  }

  // Test case for combination {1}:
  //   POST: res == R(n)
  //   POST: res == 0
  //   ENSURES: res == R(n)
  {
    var n := 0;
    var res := Recaman(n);
    expect res == 0;
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
