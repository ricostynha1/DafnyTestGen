// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_310.dfy
// Method: ToCharArray
// Generated: 2026-04-23 20:37:31

// Converts a string (sequence of characters) to an array of characters.
method ToCharArray(s: string) returns (a: array<char>)
  ensures a[..] == s
{
  a := new char[|s|];
  for i := 0 to |s|
    invariant a[..i] == s[..i]
  {
    a[i] := s[i];
  }
}

// Test cases checked statically.
method ToCharArrayTest(){
  var e1: seq<char> := ['p', 'y', 't', 'h', 'o', 'n',' ','3', '.', '0'];
  var res1 := ToCharArray("python 3.0");
  assert res1[..] == ['p','y','t','h','o','n',' ','3','.','0'];

  var e2: seq<char> := ['i', 't', 'e', 'm', '1'];
  var res2:=ToCharArray("item1");
  assert res2[..] == ['i','t','e','m','1'];

  var e3: seq<char> := ['1', '5', '.', '1', '0'];
  var res3:=ToCharArray("15.10");
  assert res3[..] == ['1','5','.','1','0'];
}

method TestsForToCharArray()
{
  // Test case for combination {1}:
  //   POST Q1: a[..] == s
  {
    var s: seq<char> := [];
    var a := ToCharArray(s);
    expect a[..] == [];
  }

  // Test case for combination {1}/O|s|=1:
  //   POST Q1: a[..] == s
  {
    var s: seq<char> := ['~'];
    var a := ToCharArray(s);
    expect a[..] == ['~'];
  }

  // Test case for combination {1}/O|s|>=2:
  //   POST Q1: a[..] == s
  {
    var s: seq<char> := ['~', 'H'];
    var a := ToCharArray(s);
    expect a[..] == ['~', 'H'];
  }

  // Test case for combination {1}/R4:
  //   POST Q1: a[..] == s
  {
    var s: seq<char> := ['}'];
    var a := ToCharArray(s);
    expect a[..] == ['}'];
  }

  // Test case for combination {1}/R5:
  //   POST Q1: a[..] == s
  {
    var s: seq<char> := ['|'];
    var a := ToCharArray(s);
    expect a[..] == ['|'];
  }

  // Test case for combination {1}/R6:
  //   POST Q1: a[..] == s
  {
    var s: seq<char> := ['{'];
    var a := ToCharArray(s);
    expect a[..] == ['{'];
  }

  // Test case for combination {1}/R7:
  //   POST Q1: a[..] == s
  {
    var s: seq<char> := ['z'];
    var a := ToCharArray(s);
    expect a[..] == ['z'];
  }

  // Test case for combination {1}/R8:
  //   POST Q1: a[..] == s
  {
    var s: seq<char> := ['y'];
    var a := ToCharArray(s);
    expect a[..] == ['y'];
  }

  // Test case for combination {1}/R9:
  //   POST Q1: a[..] == s
  {
    var s: seq<char> := ['x'];
    var a := ToCharArray(s);
    expect a[..] == ['x'];
  }

  // Test case for combination {1}/R10:
  //   POST Q1: a[..] == s
  {
    var s: seq<char> := ['w'];
    var a := ToCharArray(s);
    expect a[..] == ['w'];
  }

}

method Main()
{
  TestsForToCharArray();
  print "TestsForToCharArray: all tests passed!\n";
}
