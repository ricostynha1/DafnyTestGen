// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\unsupported_progs\in\task_id_70.dfy
// Method: AllSequencesEqualLength
// Generated: 2026-04-03 21:53:48

// Checks if all sequences in a list of sequences have the same length.
method AllSequencesEqualLength<T>(list: seq<seq<T>>) returns (result: bool)
    ensures result <==> forall i, j :: 0 <= i < j < |list| ==> |list[i]| == |list[j]|
{
    if |list| == 0 {
        return true;
    }
    var firstLength := |list[0]|;
    for i := 1 to |list|
        invariant forall k :: 0 < k < i ==> |list[k]| == firstLength
    {
        if |list[i]| != firstLength {
            return false;
        }
    }
    return true;
}

method AllSequencesEqualLengthTest(){
    var s1: seq<seq<int>> := [[11, 22, 33], [44, 55, 66]];
    var res1:=AllSequencesEqualLength(s1);
    assert res1;
    
    var s2: seq<seq<int>> :=[[1, 2, 3], [4, 5, 6, 7]];
    var res2:=AllSequencesEqualLength(s2);
    assert |s2[0]| != |s2[1]|; // proof helper
    assert !res2;
    
    var s3: seq<seq<int>> :=[[1, 2], [3, 4]];
    var res3 := AllSequencesEqualLength(s3);
    assert res3;

}

method Passing()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: forall i, j :: 0 <= i < j < |list| ==> |list[i]| == |list[j]|
  {
    var list: seq<seq<int>> := [];
    var result := AllSequencesEqualLength<int>(list);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: !forall i, j :: 0 <= i < j < |list| ==> |list[i]| == |list[j]|
  {
    var list: seq<seq<int>> := [[], [11], [12], [13], [], [14], [], [24]];
    var result := AllSequencesEqualLength<int>(list);
    expect result == false;
  }

  // Test case for combination {1}/Blist=inner>=1:
  //   POST: result
  //   POST: forall i, j :: 0 <= i < j < |list| ==> |list[i]| == |list[j]|
  {
    var list: seq<seq<int>> := [[12]];
    var result := AllSequencesEqualLength<int>(list);
    expect result == true;
  }

  // Test case for combination {1}/Blist=inner>=2:
  //   POST: result
  //   POST: forall i, j :: 0 <= i < j < |list| ==> |list[i]| == |list[j]|
  {
    var list: seq<seq<int>> := [[11, 12], [17, 16]];
    var result := AllSequencesEqualLength<int>(list);
    expect result == true;
  }

  // Test case for combination {2}/Blist=3:
  //   POST: !result
  //   POST: !forall i, j :: 0 <= i < j < |list| ==> |list[i]| == |list[j]|
  {
    var list: seq<seq<int>> := [[6], [], [8, 11]];
    var result := AllSequencesEqualLength<int>(list);
    expect result == false;
  }

  // Test case for combination {2}/Blist=inner>=2:
  //   POST: !result
  //   POST: !forall i, j :: 0 <= i < j < |list| ==> |list[i]| == |list[j]|
  {
    var list: seq<seq<int>> := [[16, 17], [18, 19], [20, 21, 44], [14, 22, 45], [23, 24, 55], [15, 25], [47, 48]];
    var result := AllSequencesEqualLength<int>(list);
    expect result == false;
  }

  // Test case for combination {2}/Blist=inner>=1:
  //   POST: !result
  //   POST: !forall i, j :: 0 <= i < j < |list| ==> |list[i]| == |list[j]|
  {
    var list: seq<seq<int>> := [[16, 27], [17, 28], [18, 23], [19, 24], [26, 25], [15]];
    var result := AllSequencesEqualLength<int>(list);
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
