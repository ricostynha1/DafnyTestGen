// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\Recaman.dfy
// Method: Contains
// Generated: 2026-04-21 22:51:01

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



method TestsForContains()
{
  // Test case for combination {1}:
  //   PRE:  len <= a.Length
  //   POST Q1: res
  //   POST Q2: x in a[..len]
  {
    var x := 10;
    var a := new nat[2] [9, 10];
    var len := 2;
    var res := Contains(x, a, len);
    expect res == true;
  }

  // Test case for combination {2}:
  //   PRE:  len <= a.Length
  //   POST Q1: !res
  //   POST Q2: x !in a[..len]
  {
    var x := -1;
    var a := new nat[2] [3, 10];
    var len := 2;
    var res := Contains(x, a, len);
    expect res == false;
  }

  // Test case for combination {1}/Blen=1:
  //   PRE:  len <= a.Length
  //   POST Q1: res
  //   POST Q2: x in a[..len]
  {
    var x := 10;
    var a := new nat[1] [10];
    var len := 1;
    var res := Contains(x, a, len);
    expect res == true;
  }

  // Test case for combination {1}/Blen=a_len-1:
  //   PRE:  len <= a.Length
  //   POST Q1: res
  //   POST Q2: x in a[..len]
  {
    var x := 9;
    var a := new nat[3] [5, 9, 6];
    var len := 2;
    var res := Contains(x, a, len);
    expect res == true;
  }

}

method TestsForRecaman()
{
  // Test case for combination {1}:
  //   POST Q1: res == R(n)
  //   POST Q2: res == 0
  {
    var n := 0;
    var res := Recaman(n);
    expect res == 0;
  }

  // Test case for combination {2}:
  //   POST Q1: n != 0
  //   POST Q2: R(n - 1) - n > 0 && !exists k: int {:trigger R(k)} :: 0 <= k && k < n && R(k) == R(n - 1) - n
  //   POST Q3: res == R(n - 1) - n
  {
    var n := 2;
    var res := Recaman(n);
    expect res == 3;
  }

  // Test case for combination {2}/Bn=1:
  //   POST Q1: n != 0
  //   POST Q2: R(n - 1) - n > 0 && !exists k: int {:trigger R(k)} :: 0 <= k && k < n && R(k) == R(n - 1) - n
  //   POST Q3: res == R(n - 1) - n
  {
    var n := 1;
    var res := Recaman(n);
    expect res == 1;
  }

  // Test case for combination {2}/R3:
  //   POST Q1: n != 0
  //   POST Q2: R(n - 1) - n > 0 && !exists k: int {:trigger R(k)} :: 0 <= k && k < n && R(k) == R(n - 1) - n
  //   POST Q3: res == R(n - 1) - n
  {
    var n := 10;
    var res := Recaman(n);
    expect res == 11;
  }

}

method Main()
{
  TestsForContains();
  print "TestsForContains: all non-failing tests passed!\n";
  TestsForRecaman();
  print "TestsForRecaman: all non-failing tests passed!\n";
}
