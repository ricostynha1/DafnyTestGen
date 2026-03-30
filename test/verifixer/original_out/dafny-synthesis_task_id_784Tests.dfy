// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-synthesis_task_id_784.dfy
// Method: FirstEvenOddIndices
// Generated: 2026-03-26 14:58:15

// dafny-synthesis_task_id_784.dfy

predicate IsEven(n: int)
  decreases n
{
  n % 2 == 0
}

predicate IsOdd(n: int)
  decreases n
{
  n % 2 != 0
}

predicate IsFirstEven(evenIndex: int, lst: seq<int>)
  requires 0 <= evenIndex < |lst|
  requires IsEven(lst[evenIndex])
  decreases evenIndex, lst
{
  forall i: int {:trigger lst[i]} :: 
    0 <= i < evenIndex ==>
      IsOdd(lst[i])
}

predicate IsFirstOdd(oddIndex: int, lst: seq<int>)
  requires 0 <= oddIndex < |lst|
  requires IsOdd(lst[oddIndex])
  decreases oddIndex, lst
{
  forall i: int {:trigger lst[i]} :: 
    0 <= i < oddIndex ==>
      IsEven(lst[i])
}

method FirstEvenOddIndices(lst: seq<int>) returns (evenIndex: int, oddIndex: int)
  requires |lst| >= 2
  requires exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  requires exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  ensures 0 <= evenIndex < |lst|
  ensures 0 <= oddIndex < |lst|
  ensures IsEven(lst[evenIndex]) && IsFirstEven(evenIndex, lst)
  ensures IsOdd(lst[oddIndex]) && IsFirstOdd(oddIndex, lst)
  decreases lst
{
  for i: int := 0 to |lst|
    invariant 0 <= i <= |lst|
    invariant forall j: int {:trigger lst[j]} :: 0 <= j < i ==> IsOdd(lst[j])
  {
    if IsEven(lst[i]) {
      evenIndex := i;
      break;
    }
  }
  for i: int := 0 to |lst|
    invariant 0 <= i <= |lst|
    invariant forall j: int {:trigger lst[j]} :: 0 <= j < i ==> IsEven(lst[j])
  {
    if IsOdd(lst[i]) {
      oddIndex := i;
      break;
    }
  }
}

method ProductEvenOdd(lst: seq<int>) returns (product: int)
  requires |lst| >= 2
  requires exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  requires exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  ensures exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  decreases lst
{
  var evenIndex, oddIndex := FirstEvenOddIndices(lst);
  product := lst[evenIndex] * lst[oddIndex];
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: 0 <= evenIndex < |lst|
  //   POST: 0 <= oddIndex < |lst|
  //   POST: IsEven(lst[evenIndex]) && IsFirstEven(evenIndex, lst)
  //   POST: IsOdd(lst[oddIndex]) && IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [3, 4];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect 0 <= evenIndex < |lst|;
    expect 0 <= oddIndex < |lst|;
    expect IsEven(lst[evenIndex]) && IsFirstEven(evenIndex, lst);
    expect IsOdd(lst[oddIndex]) && IsFirstOdd(oddIndex, lst);
  }

  // Test case for combination {1}:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: 0 <= evenIndex < |lst|
  //   POST: 0 <= oddIndex < |lst|
  //   POST: IsEven(lst[evenIndex]) && IsFirstEven(evenIndex, lst)
  //   POST: IsOdd(lst[oddIndex]) && IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [4, 5, 6];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect 0 <= evenIndex < |lst|;
    expect 0 <= oddIndex < |lst|;
    expect IsEven(lst[evenIndex]) && IsFirstEven(evenIndex, lst);
    expect IsOdd(lst[oddIndex]) && IsFirstOdd(oddIndex, lst);
  }

  // Test case for combination {1}/R3:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: 0 <= evenIndex < |lst|
  //   POST: 0 <= oddIndex < |lst|
  //   POST: IsEven(lst[evenIndex]) && IsFirstEven(evenIndex, lst)
  //   POST: IsOdd(lst[oddIndex]) && IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [5, 6, 7, 8];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect 0 <= evenIndex < |lst|;
    expect 0 <= oddIndex < |lst|;
    expect IsEven(lst[evenIndex]) && IsFirstEven(evenIndex, lst);
    expect IsOdd(lst[oddIndex]) && IsFirstOdd(oddIndex, lst);
  }

  // Test case for combination {1}:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [3, 4];
    var product := ProductEvenOdd(lst);
    expect exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination {1}:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [4, 5, 6];
    var product := ProductEvenOdd(lst);
    expect exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination {1}/R3:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [5, 6, 7, 8];
    var product := ProductEvenOdd(lst);
    expect exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
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
