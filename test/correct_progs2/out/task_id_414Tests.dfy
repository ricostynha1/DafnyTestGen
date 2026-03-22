// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_414.dfy
// Method: AnyValueExists
// Generated: 2026-03-21 23:05:14

// Checks if two sequences have at least one element in common.
method AnyValueExists<T(==)>(seq1: seq<T>, seq2: seq<T>) returns (result: bool)
  ensures result <==> (exists x :: x in seq1 && x in seq2)
{
  result := false;
  for i := 0 to |seq1|
    invariant ! (exists x :: x in seq1[..i] && x in seq2)
  {
    if seq1[i] in seq2 {
      result := true;
      return result;
    }
  }
  return result;
}

// Test cases checked statically.
method AnyValueExistsTest(){
  var s1: seq<int> := [1,2,3];
  var s2: seq<int> := [4,5,6];
  var res1 := AnyValueExists(s1, s2);
  assert !res1;

  var s3: seq<int> := [1,4,5];
  var s4: seq<int> := [1,4,5];
  var res2 := AnyValueExists(s3, s4);
  assert 1 in s3 && 1 in s4; // proof helper (example)
  assert res2;

  var s5: seq<int> := [];
  var res3 := AnyValueExists(s5,s5);
  assert !res3;
}

method Passing()
{
  // Test case for combination {1}/Bseq1=1,seq2=1:
  //   POST: result
  //   POST: exists x :: x in seq1 && x in seq2
  {
    var seq1: seq<int> := [2];
    var seq2: seq<int> := [2];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == true;
  }

  // Test case for combination {1}/Bseq1=1,seq2=2:
  //   POST: result
  //   POST: exists x :: x in seq1 && x in seq2
  {
    var seq1: seq<int> := [3];
    var seq2: seq<int> := [3, 4];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == true;
  }

  // Test case for combination {1}/Bseq1=1,seq2=3:
  //   POST: result
  //   POST: exists x :: x in seq1 && x in seq2
  {
    var seq1: seq<int> := [4];
    var seq2: seq<int> := [6, 5, 4];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == true;
  }

  // Test case for combination {1}/Bseq1=2,seq2=1:
  //   POST: result
  //   POST: exists x :: x in seq1 && x in seq2
  {
    var seq1: seq<int> := [3, 4];
    var seq2: seq<int> := [3];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == true;
  }

  // Test case for combination {1}/Bseq1=2,seq2=2:
  //   POST: result
  //   POST: exists x :: x in seq1 && x in seq2
  {
    var seq1: seq<int> := [4, 3];
    var seq2: seq<int> := [5, 4];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == true;
  }

  // Test case for combination {1}/Bseq1=2,seq2=3:
  //   POST: result
  //   POST: exists x :: x in seq1 && x in seq2
  {
    var seq1: seq<int> := [6, 4];
    var seq2: seq<int> := [6, 5, 7];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == true;
  }

  // Test case for combination {1}/Bseq1=3,seq2=1:
  //   POST: result
  //   POST: exists x :: x in seq1 && x in seq2
  {
    var seq1: seq<int> := [6, 5, 4];
    var seq2: seq<int> := [4];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == true;
  }

  // Test case for combination {1}/Bseq1=3,seq2=2:
  //   POST: result
  //   POST: exists x :: x in seq1 && x in seq2
  {
    var seq1: seq<int> := [5, 4, 6];
    var seq2: seq<int> := [7, 6];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == true;
  }

  // Test case for combination {1}/Bseq1=3,seq2=3:
  //   POST: result
  //   POST: exists x :: x in seq1 && x in seq2
  {
    var seq1: seq<int> := [5, 4, 6];
    var seq2: seq<int> := [8, 7, 4];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == true;
  }

  // Test case for combination {2}/Bseq1=0,seq2=0:
  //   POST: !(result)
  //   POST: !(exists x :: x in seq1 && x in seq2)
  {
    var seq1: seq<int> := [];
    var seq2: seq<int> := [];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == false;
  }

  // Test case for combination {2}/Bseq1=0,seq2=1:
  //   POST: !(result)
  //   POST: !(exists x :: x in seq1 && x in seq2)
  {
    var seq1: seq<int> := [];
    var seq2: seq<int> := [2];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == false;
  }

  // Test case for combination {2}/Bseq1=0,seq2=2:
  //   POST: !(result)
  //   POST: !(exists x :: x in seq1 && x in seq2)
  {
    var seq1: seq<int> := [];
    var seq2: seq<int> := [4, 3];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == false;
  }

  // Test case for combination {2}/Bseq1=0,seq2=3:
  //   POST: !(result)
  //   POST: !(exists x :: x in seq1 && x in seq2)
  {
    var seq1: seq<int> := [];
    var seq2: seq<int> := [5, 4, 6];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == false;
  }

  // Test case for combination {2}/Bseq1=1,seq2=0:
  //   POST: !(result)
  //   POST: !(exists x :: x in seq1 && x in seq2)
  {
    var seq1: seq<int> := [2];
    var seq2: seq<int> := [];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == false;
  }

  // Test case for combination {2}/Bseq1=1,seq2=1:
  //   POST: !(result)
  //   POST: !(exists x :: x in seq1 && x in seq2)
  {
    var seq1: seq<int> := [2];
    var seq2: seq<int> := [3];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == false;
  }

  // Test case for combination {2}/Bseq1=1,seq2=2:
  //   POST: !(result)
  //   POST: !(exists x :: x in seq1 && x in seq2)
  {
    var seq1: seq<int> := [9];
    var seq2: seq<int> := [8, 13];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == false;
  }

  // Test case for combination {2}/Bseq1=2,seq2=0:
  //   POST: !(result)
  //   POST: !(exists x :: x in seq1 && x in seq2)
  {
    var seq1: seq<int> := [4, 3];
    var seq2: seq<int> := [];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == false;
  }

  // Test case for combination {2}/Bseq1=3,seq2=0:
  //   POST: !(result)
  //   POST: !(exists x :: x in seq1 && x in seq2)
  {
    var seq1: seq<int> := [5, 4, 6];
    var seq2: seq<int> := [];
    var result := AnyValueExists<int>(seq1, seq2);
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
