// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_808.dfy
// Method: Contains
// Generated: 2026-04-20 15:03:44

// Checks if a sequence 's' contains a value 'x'.
method Contains<T(==)>(s: seq<T>, x: T) returns (result: bool)
  ensures result <==> x in s
{
  result := false;
  for i := 0 to |s|
    invariant x !in s[..i]
  {
    if s[i] == x {
      return true;
    }
  }
  return false;
}

// Test cases checked statically
method ContainsTest(){
  var s1: seq<int> := [10, 4, 5, 6, 8];
  var res1 := Contains(s1,6);
  assert res1;

  var s2: seq<int> := [1, 2, 3, 4, 5, 6];
  var res2 := Contains(s2, 7);
  assert !res2;

  var s3: seq<char> := ['a', 'c', 'd'];
  var res3:=Contains(s3, 'c');
  assert res3;
}



method TestsForContains()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: x in s
  //   ENSURES: result <==> x in s
  {
    var s: seq<int> := [8];
    var x := 8;
    var result := Contains<int>(s, x);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: !(x in s)
  //   ENSURES: result <==> x in s
  {
    var s: seq<int> := [];
    var x := 8;
    var result := Contains<int>(s, x);
    expect result == false;
  }

  // Test case for combination {1}/O|s|>=2:
  //   POST: result
  //   POST: x in s
  //   ENSURES: result <==> x in s
  {
    var s: seq<int> := [10, 20];
    var x := 10;
    var result := Contains<int>(s, x);
    expect result == true;
  }

  // Test case for combination {1}/Ox=0:
  //   POST: result
  //   POST: x in s
  //   ENSURES: result <==> x in s
  {
    var s: seq<int> := [0];
    var x := 0;
    var result := Contains<int>(s, x);
    expect result == true;
  }

}

method Main()
{
  TestsForContains();
  print "TestsForContains: all non-failing tests passed!\n";
}
