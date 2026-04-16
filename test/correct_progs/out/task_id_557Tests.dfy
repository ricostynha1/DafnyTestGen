// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_557.dfy
// Method: ToggleCase
// Generated: 2026-04-16 22:35:41

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

method Passing()
{
  // Test case for combination {1}:
  //   POST: IsMapSeq(s, v, Toggle)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == Toggle(s[i])
  //   ENSURES: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := [];
    var v := ToggleCase(s);
    expect v == [];
  }

  // Test case for combination {1}/Q|s|>=2:
  //   POST: IsMapSeq(s, v, Toggle)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == Toggle(s[i])
  //   ENSURES: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := ['Z', '"'];
    var v := ToggleCase(s);
    expect IsMapSeq(s, v, Toggle);
    expect forall i: int  :: 0 <= i && i < |s| ==> v[i] == Toggle(s[i]);
  }

  // Test case for combination {1}/Q|s|=1:
  //   POST: IsMapSeq(s, v, Toggle)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == Toggle(s[i])
  //   ENSURES: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := ['F'];
    var v := ToggleCase(s);
    expect IsMapSeq(s, v, Toggle);
    expect forall i: int  :: 0 <= i && i < |s| ==> v[i] == Toggle(s[i]);
  }

  // Test case for combination {1}/Bs=3:
  //   POST: IsMapSeq(s, v, Toggle)
  //   POST: forall i: int {:trigger s[i]} {:trigger v[i]} :: 0 <= i && i < |s| ==> v[i] == Toggle(s[i])
  //   ENSURES: IsMapSeq(s, v, Toggle)
  {
    var s: seq<char> := ['F', 'G', 'H'];
    var v := ToggleCase(s);
    expect IsMapSeq(s, v, Toggle);
    expect forall i: int  :: 0 <= i && i < |s| ==> v[i] == Toggle(s[i]);
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
