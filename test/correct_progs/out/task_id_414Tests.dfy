// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_414.dfy
// Method: AnyValueExists
// Generated: 2026-04-19 21:34:16

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

method TestsForAnyValueExists()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: exists x: int :: x in seq1 && x in seq2
  //   ENSURES: result <==> exists x: int :: x in seq1 && x in seq2
  {
    var seq1: seq<int> := [9];
    var seq2: seq<int> := [9];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: !exists x: int :: x in seq1 && x in seq2
  //   ENSURES: result <==> exists x: int :: x in seq1 && x in seq2
  {
    var seq1: seq<int> := [8];
    var seq2: seq<int> := [];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == false;
  }

  // Test case for combination {1}/O|seq1|>=2:
  //   POST: result
  //   POST: exists x: int :: x in seq1 && x in seq2
  //   ENSURES: result <==> exists x: int :: x in seq1 && x in seq2
  {
    var seq1: seq<int> := [10, 30];
    var seq2: seq<int> := [10];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == true;
  }

  // Test case for combination {1}/O|seq2|>=2:
  //   POST: result
  //   POST: exists x: int :: x in seq1 && x in seq2
  //   ENSURES: result <==> exists x: int :: x in seq1 && x in seq2
  {
    var seq1: seq<int> := [27, 12];
    var seq2: seq<int> := [12, 28];
    var result := AnyValueExists<int>(seq1, seq2);
    expect result == true;
  }

}

method Main()
{
  TestsForAnyValueExists();
  print "TestsForAnyValueExists: all non-failing tests passed!\n";
}
