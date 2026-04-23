// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_784__1152-1157_SWS.dfy
// Method: FirstEvenOddIndices
// Generated: 2026-04-22 21:45:07

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
      break;
      evenIndex := i;
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


method TestsForFirstEvenOddIndices()
{
  // Test case for combination P{2}/{1}/Rel:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: 0 <= evenIndex
  //   POST Q2: evenIndex < |lst|
  //   POST Q3: 0 <= oddIndex
  //   POST Q4: oddIndex < |lst|
  //   POST Q5: IsEven(lst[evenIndex])
  //   POST Q6: IsFirstEven(evenIndex, lst)
  //   POST Q7: IsOdd(lst[oddIndex])
  //   POST Q8: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-10, -5, -1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{4}/{1}/Rel:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: 0 <= evenIndex
  //   POST Q2: evenIndex < |lst|
  //   POST Q3: 0 <= oddIndex
  //   POST Q4: oddIndex < |lst|
  //   POST Q5: IsEven(lst[evenIndex])
  //   POST Q6: IsFirstEven(evenIndex, lst)
  //   POST Q7: IsOdd(lst[oddIndex])
  //   POST Q8: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-1, -10, -9, 41131];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    // actual runtime state: evenIndex=0
    // expect evenIndex == 1; // LHS=0, RHS=1
    // expect oddIndex == 0; // LHS=0, RHS=0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{7}/{1}/Rel:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: 0 <= evenIndex
  //   POST Q2: evenIndex < |lst|
  //   POST Q3: 0 <= oddIndex
  //   POST Q4: oddIndex < |lst|
  //   POST Q5: IsEven(lst[evenIndex])
  //   POST Q6: IsFirstEven(evenIndex, lst)
  //   POST Q7: IsOdd(lst[oddIndex])
  //   POST Q8: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-5, -1, -9, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    // actual runtime state: evenIndex=0
    // expect evenIndex == 3; // LHS=0, RHS=3
    // expect oddIndex == 0; // LHS=0, RHS=0
  }

  // Test case for combination P{5}/{1}/BevenIndex=0:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: 0 <= evenIndex
  //   POST Q2: evenIndex < |lst|
  //   POST Q3: 0 <= oddIndex
  //   POST Q4: oddIndex < |lst|
  //   POST Q5: IsEven(lst[evenIndex])
  //   POST Q6: IsFirstEven(evenIndex, lst)
  //   POST Q7: IsOdd(lst[oddIndex])
  //   POST Q8: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [10, -1, -10, 24747];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

}

method TestsForProductEvenOdd()
{
  // Test case for combination P{2}/{1}:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [6, -9, -9, 0];
    var product := ProductEvenOdd(lst);
    expect product == -54 || product == 0;
    expect product == -54; // observed from implementation
  }

  // Test case for combination P{3}/{1}:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 1];
    var product := ProductEvenOdd(lst);
    expect exists i: int, j: int   :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
    expect product == 0; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{4}/{1}:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-9, 8, 2, 1];
    var product := ProductEvenOdd(lst);
    // expect product == -72 || product == -18; // got 81
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{5}/{1}:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [3, -1, 10, -1];
    var product := ProductEvenOdd(lst);
    // expect product == 30; // got 9
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{7}/{1}:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-5, 10];
    var product := ProductEvenOdd(lst);
    // expect product == -50; // got 25
  }

}

method Main()
{
  TestsForFirstEvenOddIndices();
  print "TestsForFirstEvenOddIndices: all non-failing tests passed!\n";
  TestsForProductEvenOdd();
  print "TestsForProductEvenOdd: all non-failing tests passed!\n";
}
