// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_310.dfy
// Method: ToCharArray
// Generated: 2026-03-31 21:46:36

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

method GeneratedTests_ToCharArray()
{
  // Test case for combination {1}:
  //   POST: a[..] == s
  {
    var s: seq<char> := [];
    var a := ToCharArray(s);
    expect a[..] == s;
  }

  // Test case for combination {1}/Bs=1:
  //   POST: a[..] == s
  {
    var s: seq<char> := [' '];
    var a := ToCharArray(s);
    expect a[..] == s;
  }

  // Test case for combination {1}/Bs=2:
  //   POST: a[..] == s
  {
    var s: seq<char> := [' ', '!'];
    var a := ToCharArray(s);
    expect a[..] == s;
  }

  // Test case for combination {1}/Bs=3:
  //   POST: a[..] == s
  {
    var s: seq<char> := [' ', '!', '"'];
    var a := ToCharArray(s);
    expect a[..] == s;
  }

}

method Main()
{
  GeneratedTests_ToCharArray();
  print "GeneratedTests_ToCharArray: all tests passed!\n";
}
