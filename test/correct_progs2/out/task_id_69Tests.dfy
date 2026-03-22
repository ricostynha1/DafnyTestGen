// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_69.dfy
// Method: InSeq
// Generated: 2026-03-21 23:18:05

// Checks if a sequence 's' of elements of any type T contains a given value 'x' of type T.
method InSeq<T(==)>(s: seq<T>, x: T) returns (result: bool)
    ensures result <==> x in s
{
    result := false;
    for i := 0 to |s|
        invariant x !in s[..i]
    {
        if x == s[i] {
            return true;
        }
    }
    return false;
}

// Test cases checked statically
method InSeqTest(){
    var s1: seq<seq<int>> := [[2,4,3,5,7], [3,8]];
    var s2: seq<int> := [3,7];
    var res1 := InSeq(s1, s2);
    assert res1 == false;
    
    var s3: seq<seq<int>> := [[2,4,3,5,7],[4,3]];
    var s4: seq<int> := [4,3];
    var res2 := InSeq(s3,s4);
    assert res2 == true;
    
    var s5: seq<seq<int>> := [[2,4,3,5,7],[1,0]];
    var s6: seq<int> := [1,6];
    var res3 := InSeq(s5,s6);
    assert res3 == false;
}

method Passing()
{
  // Test case for combination {1}/Bs=1,x=0:
  //   POST: result
  //   POST: x in s
  {
    var s: seq<int> := [0];
    var x := 0;
    var result := InSeq<int>(s, x);
    expect result == true;
  }

  // Test case for combination {1}/Bs=1,x=1:
  //   POST: result
  //   POST: x in s
  {
    var s: seq<int> := [1];
    var x := 1;
    var result := InSeq<int>(s, x);
    expect result == true;
  }

  // Test case for combination {1}/Bs=2,x=0:
  //   POST: result
  //   POST: x in s
  {
    var s: seq<int> := [3, 0];
    var x := 0;
    var result := InSeq<int>(s, x);
    expect result == true;
  }

  // Test case for combination {1}/Bs=2,x=1:
  //   POST: result
  //   POST: x in s
  {
    var s: seq<int> := [3, 1];
    var x := 1;
    var result := InSeq<int>(s, x);
    expect result == true;
  }

  // Test case for combination {1}/Bs=3,x=0:
  //   POST: result
  //   POST: x in s
  {
    var s: seq<int> := [5, 4, 0];
    var x := 0;
    var result := InSeq<int>(s, x);
    expect result == true;
  }

  // Test case for combination {1}/Bs=3,x=1:
  //   POST: result
  //   POST: x in s
  {
    var s: seq<int> := [5, 4, 1];
    var x := 1;
    var result := InSeq<int>(s, x);
    expect result == true;
  }

  // Test case for combination {2}/Bs=0,x=0:
  //   POST: !(result)
  //   POST: !(x in s)
  {
    var s: seq<int> := [];
    var x := 0;
    var result := InSeq<int>(s, x);
    expect result == false;
  }

  // Test case for combination {2}/Bs=0,x=1:
  //   POST: !(result)
  //   POST: !(x in s)
  {
    var s: seq<int> := [];
    var x := 1;
    var result := InSeq<int>(s, x);
    expect result == false;
  }

  // Test case for combination {2}/Bs=1,x=0:
  //   POST: !(result)
  //   POST: !(x in s)
  {
    var s: seq<int> := [2];
    var x := 0;
    var result := InSeq<int>(s, x);
    expect result == false;
  }

  // Test case for combination {2}/Bs=1,x=1:
  //   POST: !(result)
  //   POST: !(x in s)
  {
    var s: seq<int> := [2];
    var x := 1;
    var result := InSeq<int>(s, x);
    expect result == false;
  }

  // Test case for combination {2}/Bs=2,x=0:
  //   POST: !(result)
  //   POST: !(x in s)
  {
    var s: seq<int> := [9, 3];
    var x := 0;
    var result := InSeq<int>(s, x);
    expect result == false;
  }

  // Test case for combination {2}/Bs=2,x=1:
  //   POST: !(result)
  //   POST: !(x in s)
  {
    var s: seq<int> := [9, 3];
    var x := 1;
    var result := InSeq<int>(s, x);
    expect result == false;
  }

  // Test case for combination {2}/Bs=3,x=0:
  //   POST: !(result)
  //   POST: !(x in s)
  {
    var s: seq<int> := [12, 14, 4];
    var x := 0;
    var result := InSeq<int>(s, x);
    expect result == false;
  }

  // Test case for combination {2}/Bs=3,x=1:
  //   POST: !(result)
  //   POST: !(x in s)
  {
    var s: seq<int> := [12, 14, 4];
    var x := 1;
    var result := InSeq<int>(s, x);
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
