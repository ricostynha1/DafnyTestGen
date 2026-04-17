// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_230.dfy
// Method: ReplaceBlanksWithChar
// Generated: 2026-04-17 13:36:18

// Replaces all blank characters in a string by a given character.
method ReplaceBlanksWithChar(s: string, ch: char) returns (v: string)
  ensures IsMapSeq(s, v, c => if c == ' ' then ch else c)
{
  v := [];
  for i := 0 to |s|
    invariant IsMapSeq(s[..i], v, c => if c == ' ' then ch else c)
  {
    if s[i] == ' ' {
      v := v + [ch];
    }
    else {
      v := v + [s[i]];
    }
  }
}

// Checks if a sequence 't' is the result of applying a function 'f'
// to every element of a sequence 's'.
predicate IsMapSeq<T, E(==)>(s: seq<T>, t: seq<E>, f: T -> E) {
  |t| == |s| && forall i :: 0 <= i < |s| ==> t[i] == f(s[i])
}

// Test cases checked statically.
method ReplaceBlanksWithCharTest(){
  var res1 := ReplaceBlanksWithChar("hello people",'@');
  assert res1 == "hello@people";
  
  var res2 := ReplaceBlanksWithChar("python program language",'$');
  assert res2 == "python$program$language";
  
  var res3 := ReplaceBlanksWithChar("blank space",'-');
  assert res3=="blank-space";
}

method TestsForReplaceBlanksWithChar()
{
  // Test case for combination {1}:
  //   POST: IsMapSeq(s, v, (c: char) => if c == ' ' then ch else c)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == if s[i] == ' ' then ch else s[i]
  //   ENSURES: IsMapSeq(s, v, (c: char) => if c == ' ' then ch else c)
  {
    var s: seq<char> := [];
    var ch := ' ';
    var v := ReplaceBlanksWithChar(s, ch);
    expect v == [];
  }

  // Test case for combination {1}/Q|s|>=2:
  //   POST: IsMapSeq(s, v, (c: char) => if c == ' ' then ch else c)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == if s[i] == ' ' then ch else s[i]
  //   ENSURES: IsMapSeq(s, v, (c: char) => if c == ' ' then ch else c)
  {
    var s: seq<char> := [' ', ' '];
    var ch := '!';
    var v := ReplaceBlanksWithChar(s, ch);
    expect v == ['!', '!'];
  }

  // Test case for combination {1}/Q|s|=1:
  //   POST: IsMapSeq(s, v, (c: char) => if c == ' ' then ch else c)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == if s[i] == ' ' then ch else s[i]
  //   ENSURES: IsMapSeq(s, v, (c: char) => if c == ' ' then ch else c)
  {
    var s: seq<char> := [' '];
    var ch := 'F';
    var v := ReplaceBlanksWithChar(s, ch);
    expect v == ['F'];
  }

}

method Main()
{
  TestsForReplaceBlanksWithChar();
  print "TestsForReplaceBlanksWithChar: all non-failing tests passed!\n";
}
