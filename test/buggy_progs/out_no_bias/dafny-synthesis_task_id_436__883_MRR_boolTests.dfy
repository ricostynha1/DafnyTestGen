// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_436__883_MRR_bool.dfy
// Method: FindNegativeNumbers
// Generated: 2026-04-24 12:02:48

// dafny-synthesis_task_id_436.dfy

predicate IsNegative(n: int)
  decreases n
{
  n < 0
}

method FindNegativeNumbers(arr: array<int>) returns (negativeList: seq<int>)
  ensures forall i: int {:trigger negativeList[i]} :: (0 <= i < |negativeList| ==> IsNegative(negativeList[i])) && (0 <= i < |negativeList| ==> negativeList[i] in arr[..])
  ensures forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length && IsNegative(arr[i]) ==> arr[i] in negativeList
  decreases arr
{
  negativeList := [];
  for i: int := 0 to arr.Length
    invariant 0 <= i <= arr.Length
    invariant 0 <= |negativeList| <= i
    invariant forall k: int {:trigger negativeList[k]} :: (0 <= k < |negativeList| ==> IsNegative(negativeList[k])) && (0 <= k < |negativeList| ==> negativeList[k] in arr[..])
    invariant forall k: int {:trigger arr[k]} :: 0 <= k < i && IsNegative(arr[k]) ==> arr[k] in negativeList
  {
    if false {
      negativeList := negativeList + [arr[i]];
    }
  }
}


method TestsForFindNegativeNumbers()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: forall i: int {:trigger negativeList[i]} :: (0 <= i < |negativeList| ==> IsNegative(negativeList[i])) && (0 <= i < |negativeList| ==> negativeList[i] in arr[..])
  //   POST Q2: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length && IsNegative(arr[i]) ==> arr[i] in negativeList
  {
    var arr := new int[2] [-401, 1];
    var negativeList := FindNegativeNumbers(arr);
    expect forall i: int :: (0 <= i < |negativeList| ==> IsNegative(negativeList[i])) && (0 <= i < |negativeList| ==> negativeList[i] in arr[..]);
    expect forall i: int :: 0 <= i < arr.Length && IsNegative(arr[i]) ==> arr[i] in negativeList;
  }

  // Test case for combination {1}/V2:
  //   POST Q1: forall i: int {:trigger negativeList[i]} :: (0 <= i < |negativeList| ==> IsNegative(negativeList[i])) && (0 <= i < |negativeList| ==> negativeList[i] in arr[..])
  //   POST Q2: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length && IsNegative(arr[i]) ==> arr[i] in negativeList  // VACUOUS (forced true by other literals for this ins)
  {
    var arr := new int[0] [];
    var negativeList := FindNegativeNumbers(arr);
    expect negativeList == [];
  }

  // Test case for combination {1}/O|arr|=1:
  //   POST Q1: forall i: int {:trigger negativeList[i]} :: (0 <= i < |negativeList| ==> IsNegative(negativeList[i])) && (0 <= i < |negativeList| ==> negativeList[i] in arr[..])
  //   POST Q2: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length && IsNegative(arr[i]) ==> arr[i] in negativeList
  {
    var arr := new int[1] [-1];
    var negativeList := FindNegativeNumbers(arr);
    expect forall i: int :: (0 <= i < |negativeList| ==> IsNegative(negativeList[i])) && (0 <= i < |negativeList| ==> negativeList[i] in arr[..]);
    expect forall i: int :: 0 <= i < arr.Length && IsNegative(arr[i]) ==> arr[i] in negativeList;
  }

  // Test case for combination {1}/O|negativeList|>=2:
  //   POST Q1: forall i: int {:trigger negativeList[i]} :: (0 <= i < |negativeList| ==> IsNegative(negativeList[i])) && (0 <= i < |negativeList| ==> negativeList[i] in arr[..])
  //   POST Q2: forall i: int {:trigger arr[i]} :: 0 <= i < arr.Length && IsNegative(arr[i]) ==> arr[i] in negativeList
  {
    var arr := new int[3] [-2, -3, -2];
    var negativeList := FindNegativeNumbers(arr);
    expect forall i: int :: (0 <= i < |negativeList| ==> IsNegative(negativeList[i])) && (0 <= i < |negativeList| ==> negativeList[i] in arr[..]);
    expect forall i: int :: 0 <= i < arr.Length && IsNegative(arr[i]) ==> arr[i] in negativeList;
  }

}

method Main()
{
  TestsForFindNegativeNumbers();
  print "TestsForFindNegativeNumbers: all tests passed!\n";
}
