// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_470.dfy
// Method: PairwiseAddition
// Generated: 2026-04-21 23:15:10

// Takes an array of integers and returns an array of the sums of 
// each pair of adjacent elements.
method PairwiseAddition(a: array<int>) returns (result: array<int>)
  requires a.Length % 2 == 0
  ensures result.Length == a.Length / 2
  ensures forall i :: 0 <= i < result.Length ==> result[i] == a[2*i] + a[2*i + 1]
{
  result := new int[a.Length / 2];
  var i := 0;
  while i < a.Length / 2
    invariant 0 <= i <= a.Length / 2
    invariant forall k :: 0 <= k < i ==> result[k] == a[2*k] + a[2*k + 1]
  {
    result[i] := a[2*i] + a[2*i + 1];
    i := i + 1;
  }
}

method PairwiseAdditionTest(){
  var s1 := new int[] [1, 5, 7, 8];
  var res1 := PairwiseAddition(s1);
  assert res1[..] == [6, 15];

  var s2 := new int[] [2, 6, 8, 9];
  var res2 := PairwiseAddition(s2);
  assert res2[..] == [8, 17];

  var s3 := new int[] [1, 2, 3]; 
  //@invalid var res3 := PairwiseAddition(s3); // invalid odd length array
}


method TestsForPairwiseAddition()
{
  // Test case for combination {1}/Rel:
  //   PRE:  a.Length % 2 == 0
  //   POST Q1: result.Length == a.Length / 2
  //   POST Q2: forall i: int :: 0 <= i < result.Length ==> result[i] == a[2 * i] + a[2 * i + 1]
  {
    var a := new int[2] [9, 3];
    var result := PairwiseAddition(a);
    expect result[..] == [12];
  }

  // Test case for combination {1}/O|a|=0:
  //   PRE:  a.Length % 2 == 0
  //   POST Q1: result.Length == a.Length / 2
  //   POST Q2: forall i: int :: 0 <= i < result.Length ==> result[i] == a[2 * i] + a[2 * i + 1]
  {
    var a := new int[0] [];
    var result := PairwiseAddition(a);
    expect result[..] == [];
  }

  // Test case for combination {1}/O|result|>=2:
  //   PRE:  a.Length % 2 == 0
  //   POST Q1: result.Length == a.Length / 2
  //   POST Q2: forall i: int :: 0 <= i < result.Length ==> result[i] == a[2 * i] + a[2 * i + 1]
  {
    var a := new int[4] [-3, -10, 10, 26345];
    var result := PairwiseAddition(a);
    expect result[..] == [-13, 26355];
  }

}

method Main()
{
  TestsForPairwiseAddition();
  print "TestsForPairwiseAddition: all non-failing tests passed!\n";
}
