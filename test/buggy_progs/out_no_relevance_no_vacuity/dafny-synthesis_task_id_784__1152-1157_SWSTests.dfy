// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_784__1152-1157_SWS.dfy
// Method: FirstEvenOddIndices
// Generated: 2026-04-24 23:56:52

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
  // Test case for combination P{2}/{1}:
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
    var lst: seq<int> := [-2, -1, -9];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{4}/{1}:
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
    var lst: seq<int> := [-9, -10, 2, -1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    // actual runtime state: evenIndex=0
    // expect evenIndex == 1; // LHS=0, RHS=1
    // expect oddIndex == 0; // LHS=0, RHS=0
  }

  // Test case for combination P{5}/{1}:
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
    var lst: seq<int> := [-10, -9, 4, 4673];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{7}/{1}:
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
    var lst: seq<int> := [-9, -10];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    // actual runtime state: evenIndex=0
    // expect evenIndex == 1; // LHS=0, RHS=1
    // expect oddIndex == 0; // LHS=0, RHS=0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{8}/{1}:
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
    var lst: seq<int> := [3, -1, 10];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    // actual runtime state: evenIndex=0
    // expect evenIndex == 2; // LHS=0, RHS=2
    // expect oddIndex == 0; // LHS=0, RHS=0
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{5}/{1}/BevenIndex=1:
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
    var lst: seq<int> := [-9, -8, -5, -64817];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    // actual runtime state: evenIndex=0
    // expect evenIndex == 1; // LHS=0, RHS=1
    // expect oddIndex == 0; // LHS=0, RHS=0
  }

  // Test case for combination P{8}/{1}/BevenIndex=0:
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
    var lst: seq<int> := [-10, -9, -2];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{8}/{1}/BevenIndex=1:
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
    var lst: seq<int> := [-9, -10, -3, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    // actual runtime state: evenIndex=0
    // expect evenIndex == 1; // LHS=0, RHS=1
    // expect oddIndex == 0; // LHS=0, RHS=0
  }

  // Test case for combination P{2}/{1}/R2:
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
    var lst: seq<int> := [10, -7, -9, 14199];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2}/{1}/R3:
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
    var lst: seq<int> := [8, -9, -9];
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
    var lst: seq<int> := [0, 1, 1, 0];
    var product := ProductEvenOdd(lst);
    expect exists i: int, j: int   :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
    expect product == 0; // observed from implementation
  }

  // Test case for combination P{3}/{1}:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [2, -10, -1];
    var product := ProductEvenOdd(lst);
    expect product == 10 || product == -2;
    expect product == -2; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{4}/{1}:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [7, -10, 2];
    var product := ProductEvenOdd(lst);
    // expect product == -70 || product == 14; // got 49
  }

  // Test case for combination P{5}/{1}:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 1, 0, 0, 0];
    var product := ProductEvenOdd(lst);
    expect exists i: int, j: int   :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
    expect product == 0; // observed from implementation
  }

  // Test case for combination P{2}/{1}/Oproduct>0:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-8, 2, 3, -12];
    var product := ProductEvenOdd(lst);
    expect product == 6 || product == -24 || product == -36;
    expect product == -24; // observed from implementation
  }

  // Test case for combination P{2}/{1}/Oproduct<0:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-6, 7, 9, -28];
    var product := ProductEvenOdd(lst);
    expect product == -42 || product == -196;
    expect product == -42; // observed from implementation
  }

  // Test case for combination P{3}/{1}/Oproduct=0:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [4, 2, -10, 1, 0, 1];
    var product := ProductEvenOdd(lst);
    expect product == 0 || product == 4 || product == 2 || product == -10;
    expect product == 4; // observed from implementation
  }

  // Test case for combination P{3}/{1}/Oproduct<0:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [10, -9];
    var product := ProductEvenOdd(lst);
    expect product == -90;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{4}/{1}/Oproduct=0:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [3, 3, -2, 0];
    var product := ProductEvenOdd(lst);
    // expect product == 0 || product == -6; // got 9
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination P{4}/{1}/Oproduct>0:
  //   PRE:  |lst| >= 2
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int {:trigger lst[i]} :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST Q1: exists i: int, j: int {:trigger IsFirstOdd(j, lst), IsFirstEven(i, lst)} {:trigger IsFirstOdd(j, lst), lst[i]} {:trigger lst[j], IsFirstEven(i, lst)} {:trigger lst[j], lst[i]} :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, -2];
    var product := ProductEvenOdd(lst);
    // actual runtime state: product=1
    // expect exists i: int, j: int   :: 0 <= i < |lst| && IsEven(lst[i]) && IsFirstEven(i, lst) && 0 <= j < |lst| && IsOdd(lst[j]) && IsFirstOdd(j, lst) && product == lst[i] * lst[j]; // got false
  }

}

method Main()
{
  TestsForFirstEvenOddIndices();
  print "TestsForFirstEvenOddIndices: all non-failing tests passed!\n";
  TestsForProductEvenOdd();
  print "TestsForProductEvenOdd: all non-failing tests passed!\n";
}
