// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_557.dfy
// Method: ToggleCase
// Generated: 2026-04-23 20:40:20

// Returns a new string with the case of each character in the input string toggled.
method ToggleCase(s: string) returns (v: string)
  ensures IsMapSeq(s, v, Toggle) 
{
  v := [];
  for i := 0 to |s|
    invariant IsMapSeq(s[..i], v, Toggle)
  {
    v := v + [Toggle(s[i])];
  }
}

// Auxiliary function to toggle the case of a character.
function Toggle(c: char): char {
  if 'a' <= c <= 'z' then c - ('a' - 'A') 
  else if 'A' <= c <= 'Z' then c + ('a' - 'A')
  else c
}

// Checks if a sequence 't' is the result of applying a function 'f'
// to every element of a sequence 's'.
predicate IsMapSeq<T, E(==)>(s: seq<T>, t: seq<E>, f: T -> E) {
  |t| == |s| && forall i :: 0 <= i < |s| ==> t[i] == f(s[i])
}

// Test cases checked statically.
method ToggleCaseTest(){
  var out1 := ToggleCase("Python");
  assert out1=="pYTHON";

  var out2 := ToggleCase("LIttLE");
  assert out2=="liTTle";
}

method TestsForToggleCase()
{
  // Test case for combination {1}:
  //   POST Q1: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := [];
    var v := ToggleCase(s);
    expect IsMapSeq(s, v, Toggle);
    expect v == []; // observed from implementation
  }

  // Test case for combination {1}/O|s|=1:
  //   POST Q1: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := ['-'];
    var v := ToggleCase(s);
    expect IsMapSeq(s, v, Toggle);
    expect v == ['-']; // observed from implementation
  }

  // Test case for combination {1}/O|s|>=2:
  //   POST Q1: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := ['~', '`'];
    var v := ToggleCase(s);
    expect IsMapSeq(s, v, Toggle);
    expect v == ['~', '`']; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   POST Q1: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := ['~'];
    var v := ToggleCase(s);
    expect IsMapSeq(s, v, Toggle);
    expect v == ['~']; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   POST Q1: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := ['}'];
    var v := ToggleCase(s);
    expect IsMapSeq(s, v, Toggle);
    expect v == ['}']; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   POST Q1: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := [','];
    var v := ToggleCase(s);
    expect IsMapSeq(s, v, Toggle);
    expect v == [',']; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   POST Q1: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := ['|'];
    var v := ToggleCase(s);
    expect IsMapSeq(s, v, Toggle);
    expect v == ['|']; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   POST Q1: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := ['{'];
    var v := ToggleCase(s);
    expect IsMapSeq(s, v, Toggle);
    expect v == ['{']; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   POST Q1: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := ['+'];
    var v := ToggleCase(s);
    expect IsMapSeq(s, v, Toggle);
    expect v == ['+']; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   POST Q1: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := ['*'];
    var v := ToggleCase(s);
    expect IsMapSeq(s, v, Toggle);
    expect v == ['*']; // observed from implementation
  }

}

method Main()
{
  TestsForToggleCase();
  print "TestsForToggleCase: all non-failing tests passed!\n";
}
