// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\HATRA-2022-Paper_tmp_tmp5texxy8l_copilot_verification_Sort Array_sort_array__1867_ROR_Eq.dfy
// Method: sortArray
// Generated: 2026-04-25 00:16:51

// HATRA-2022-Paper_tmp_tmp5texxy8l_copilot_verification_Sort Array_sort_array.dfy

method sortArray(arr: array<int>) returns (arr_sorted: array<int>)
  requires 0 <= arr.Length < 10000
  modifies arr
  ensures sorted(arr_sorted, 0, arr_sorted.Length)
  ensures multiset(arr[..]) == multiset(arr_sorted[..])
  decreases arr
{
  var i := 0;
  while i < arr.Length
    invariant i <= arr.Length
    invariant sorted(arr, 0, i)
    invariant multiset(old(arr[..])) == multiset(arr[..])
    invariant forall u: int, v: int {:trigger arr[v], arr[u]} :: 0 <= u < i && i <= v < arr.Length ==> arr[u] <= arr[v]
    invariant pivot(arr, i)
    decreases arr.Length - i
  {
    var j := i;
    while j < arr.Length
      invariant j <= arr.Length
      invariant multiset(old(arr[..])) == multiset(arr[..])
      invariant pivot(arr, i)
      invariant forall u: int {:trigger arr[u]} :: i < u < j ==> arr[i] <= arr[u]
      invariant forall u: int {:trigger arr[u]} :: 0 <= u < i ==> arr[u] <= arr[i]
      invariant sorted(arr, 0, i + 1)
      decreases arr.Length - j
    {
      if arr[i] > arr[j] {
        var temp := arr[i];
        arr[i] := arr[j];
        arr[j] := temp;
      }
      j := j + 1;
    }
    i := i + 1;
  }
  return arr;
}

predicate sorted(arr: array<int>, start: int, end: int)
  requires 0 <= start <= end <= arr.Length
  reads arr
  decreases {arr}, arr, start, end
{
  forall i: int, j: int {:trigger arr[j], arr[i]} :: 
    start <= i <= j < end ==>
      arr[i] <= arr[j]
}

predicate pivot(arr: array<int>, pivot: int)
  requires 0 <= pivot <= arr.Length
  reads arr
  decreases {arr}, arr, pivot
{
  forall u: int, v: int {:trigger arr[v], arr[u]} :: 
    0 <= u < pivot < v == arr.Length ==>
      arr[u] <= arr[v]
}


method TestsForsortArray()
{
  // Test case for combination {1}:
  //   PRE:  0 <= arr.Length < 10000
  //   POST Q1: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST Q2: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[1] [-1];
    var arr_sorted := sortArray(arr);
    expect sorted(arr_sorted, 0, arr_sorted.Length);
    expect multiset(arr[..]) == multiset(arr_sorted[..]);
    expect arr_sorted[..] == [-1]; // observed from implementation
  }

  // Test case for combination {1}/O|arr|=0:
  //   PRE:  0 <= arr.Length < 10000
  //   POST Q1: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST Q2: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[0] [];
    var arr_sorted := sortArray(arr);
    expect arr_sorted[..] == [];
    expect arr[..] == [];
  }

  // Test case for combination {1}/O|arr|>=2:
  //   PRE:  0 <= arr.Length < 10000
  //   POST Q1: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST Q2: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[2] [10, -10];
    var arr_sorted := sortArray(arr);
    expect sorted(arr_sorted, 0, arr_sorted.Length);
    expect multiset(arr[..]) == multiset(arr_sorted[..]);
    expect arr_sorted[..] == [-10, 10]; // observed from implementation
    expect arr[..] == [-10, 10]; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  0 <= arr.Length < 10000
  //   POST Q1: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST Q2: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[1] [-10];
    var arr_sorted := sortArray(arr);
    expect sorted(arr_sorted, 0, arr_sorted.Length);
    expect multiset(arr[..]) == multiset(arr_sorted[..]);
    expect arr_sorted[..] == [-10]; // observed from implementation
  }

  // Test case for combination {1}/R5:
  //   PRE:  0 <= arr.Length < 10000
  //   POST Q1: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST Q2: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[1] [-9];
    var arr_sorted := sortArray(arr);
    expect sorted(arr_sorted, 0, arr_sorted.Length);
    expect multiset(arr[..]) == multiset(arr_sorted[..]);
    expect arr_sorted[..] == [-9]; // observed from implementation
  }

  // Test case for combination {1}/R6:
  //   PRE:  0 <= arr.Length < 10000
  //   POST Q1: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST Q2: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[1] [-8];
    var arr_sorted := sortArray(arr);
    expect sorted(arr_sorted, 0, arr_sorted.Length);
    expect multiset(arr[..]) == multiset(arr_sorted[..]);
    expect arr_sorted[..] == [-8]; // observed from implementation
  }

  // Test case for combination {1}/R7:
  //   PRE:  0 <= arr.Length < 10000
  //   POST Q1: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST Q2: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[1] [-7];
    var arr_sorted := sortArray(arr);
    expect sorted(arr_sorted, 0, arr_sorted.Length);
    expect multiset(arr[..]) == multiset(arr_sorted[..]);
    expect arr_sorted[..] == [-7]; // observed from implementation
  }

  // Test case for combination {1}/R8:
  //   PRE:  0 <= arr.Length < 10000
  //   POST Q1: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST Q2: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[1] [-2];
    var arr_sorted := sortArray(arr);
    expect sorted(arr_sorted, 0, arr_sorted.Length);
    expect multiset(arr[..]) == multiset(arr_sorted[..]);
    expect arr_sorted[..] == [-2]; // observed from implementation
  }

  // Test case for combination {1}/R9:
  //   PRE:  0 <= arr.Length < 10000
  //   POST Q1: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST Q2: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[1] [-6];
    var arr_sorted := sortArray(arr);
    expect sorted(arr_sorted, 0, arr_sorted.Length);
    expect multiset(arr[..]) == multiset(arr_sorted[..]);
    expect arr_sorted[..] == [-6]; // observed from implementation
  }

  // Test case for combination {1}/R10:
  //   PRE:  0 <= arr.Length < 10000
  //   POST Q1: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST Q2: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[1] [-5];
    var arr_sorted := sortArray(arr);
    expect sorted(arr_sorted, 0, arr_sorted.Length);
    expect multiset(arr[..]) == multiset(arr_sorted[..]);
    expect arr_sorted[..] == [-5]; // observed from implementation
  }

}

method Main()
{
  TestsForsortArray();
  print "TestsForsortArray: all non-failing tests passed!\n";
}
