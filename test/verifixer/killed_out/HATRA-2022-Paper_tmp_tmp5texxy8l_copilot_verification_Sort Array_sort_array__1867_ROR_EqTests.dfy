// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\HATRA-2022-Paper_tmp_tmp5texxy8l_copilot_verification_Sort Array_sort_array__1867_ROR_Eq.dfy
// Method: sortArray
// Generated: 2026-04-01 22:35:11

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


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  0 <= arr.Length < 10000
  //   POST: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[0] [];
    expect 0 <= arr.Length < 10000; // PRE-CHECK
    var arr_sorted := sortArray(arr);
    expect sorted(arr_sorted, 0, arr_sorted.Length);
    expect multiset(arr[..]) == multiset(arr_sorted[..]);
  }

  // Test case for combination {1}/Barr=1:
  //   PRE:  0 <= arr.Length < 10000
  //   POST: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[1] [3];
    expect 0 <= arr.Length < 10000; // PRE-CHECK
    var arr_sorted := sortArray(arr);
    expect sorted(arr_sorted, 0, arr_sorted.Length);
    expect multiset(arr[..]) == multiset(arr_sorted[..]);
  }

  // Test case for combination {1}/Barr=2:
  //   PRE:  0 <= arr.Length < 10000
  //   POST: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[2] [4, 3];
    expect 0 <= arr.Length < 10000; // PRE-CHECK
    var arr_sorted := sortArray(arr);
    expect sorted(arr_sorted, 0, arr_sorted.Length);
    expect multiset(arr[..]) == multiset(arr_sorted[..]);
  }

  // Test case for combination {1}/Barr=3:
  //   PRE:  0 <= arr.Length < 10000
  //   POST: sorted(arr_sorted, 0, arr_sorted.Length)
  //   POST: multiset(arr[..]) == multiset(arr_sorted[..])
  {
    var arr := new int[3] [5, 4, 6];
    expect 0 <= arr.Length < 10000; // PRE-CHECK
    var arr_sorted := sortArray(arr);
    expect sorted(arr_sorted, 0, arr_sorted.Length);
    expect multiset(arr[..]) == multiset(arr_sorted[..]);
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
