// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_251.dfy
// Method: InsertBeforeEach
// Generated: 2026-03-24 21:26:20

// Given a list s = [e1, e2, ...] and an element x, 
// returns a new list [x, e1, x, e2, ...].
method InsertBeforeEach<T>(s: seq<T>, x: T) returns (v: seq<T>)
  ensures |v| == 2 * |s|
  ensures forall i :: 0 <= i < |s| ==> v[2*i] == x && v[2*i + 1] == s[i]
{
  v := [];
  for i := 0 to |s|
    invariant |v| == 2 * i
    invariant forall j :: 0 <= j < i ==> v[2*j] == x && v[2*j + 1] == s[j]
  {
    v := v + [x, s[i]];
  }
}

// Test cases checked statically
method InsertBeforeEachTest(){
  var res1 := InsertBeforeEach(["Red", "Green", "Black"], "c");
  assert res1[2*0] == res1[2*1] == res1[2*2] == "c"; // proof helper
  assert res1 == ["c", "Red", "c", "Green", "c", "Black"];

  var res2 := InsertBeforeEach(["python", "java"], "program");
  assert res2[2*0] == res2[2*1] == "program"; // proof helper
  assert res2 == ["program", "python", "program", "java"];

}

method Passing()
{
  // Test case for combination {1}:
  //   POST: |v| == 2 * |s|
  //   POST: forall i :: 0 <= i < |s| ==> v[2 * i] == x && v[2 * i + 1] == s[i]
  {
    var s: seq<int> := [];
    var x := 0;
    var v := InsertBeforeEach<int>(s, x);
    expect v == [];
  }

  // Test case for combination {1}/Bs=0,x=1:
  //   POST: |v| == 2 * |s|
  //   POST: forall i :: 0 <= i < |s| ==> v[2 * i] == x && v[2 * i + 1] == s[i]
  {
    var s: seq<int> := [];
    var x := 1;
    var v := InsertBeforeEach<int>(s, x);
    expect v == [];
  }

  // Test case for combination {1}/Bs=1,x=0:
  //   POST: |v| == 2 * |s|
  //   POST: forall i :: 0 <= i < |s| ==> v[2 * i] == x && v[2 * i + 1] == s[i]
  {
    var s: seq<int> := [3];
    var x := 0;
    var v := InsertBeforeEach<int>(s, x);
    expect v == [0, 3];
  }

  // Test case for combination {1}/Bs=1,x=1:
  //   POST: |v| == 2 * |s|
  //   POST: forall i :: 0 <= i < |s| ==> v[2 * i] == x && v[2 * i + 1] == s[i]
  {
    var s: seq<int> := [3];
    var x := 1;
    var v := InsertBeforeEach<int>(s, x);
    expect v == [1, 3];
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
