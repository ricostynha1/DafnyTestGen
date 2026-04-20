// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_784.dfy
// Method: ProductFirstEvenOdd
// Generated: 2026-04-20 22:13:21

// Returns the product of the first even and first odd elements in the list.
// The list must contain at least one even and one odd element.
method ProductFirstEvenOdd(lst: seq<int>) returns (product : int)
    requires exists i :: 0 <= i < |lst| && IsEven(lst[i])
    requires exists i :: 0 <= i < |lst| && IsOdd(lst[i])
    ensures exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j] 
{
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    product := lst[evenIndex] * lst[oddIndex];
}

// Obtains the indices of the first even and odd elements in the list.
// The list must contain at least one even and one odd element.
method FirstEvenOddIndices(lst : seq<int>) returns (evenIndex: nat, oddIndex : nat)
    requires exists i :: 0 <= i < |lst| && IsEven(lst[i])
    requires exists i :: 0 <= i < |lst| && IsOdd(lst[i])
    ensures IsFirstEven(evenIndex, lst)
    ensures IsFirstOdd(oddIndex, lst)
{
    for i := 0 to |lst|
        invariant forall j :: 0 <= j < i ==> IsOdd(lst[j])
    {
        if IsEven(lst[i]) {
            evenIndex := i;
            break;
        }
    }

    for i := 0 to |lst|
        invariant forall j :: 0 <= j < i ==> IsEven(lst[j])
    {
        if IsOdd(lst[i]) {
            oddIndex := i;
            break;
        }
    }
}

// Checks if a number is even.
predicate IsEven(n: int) {
    n % 2 == 0
}

// Checks if a number is odd.
predicate IsOdd(n: int) {
    n % 2 != 0
}

// Checks if a given index locates the first even number in a sequence.
predicate IsFirstEven(evenIndex: nat, lst: seq<int>) {
    0 <= evenIndex < |lst| && IsEven(lst[evenIndex])
    && forall i :: 0 <= i < evenIndex ==> IsOdd(lst[i])
}

// Checks if a given index locates the first odd number in a sequence.
predicate IsFirstOdd(oddIndex: nat, lst: seq<int>) {
    0 <= oddIndex < |lst| && IsOdd(lst[oddIndex])
    &&  forall i :: 0 <= i < oddIndex ==> IsEven(lst[i])
}


// Test cases checked statically.
method ProductEvenOddTest(){
    var a1: seq<int> := [1, 3, 5, 7, 4, 1, 6, 8];
    assert IsEven(a1[4]); // proof helper
    assert IsOdd(a1[0]); // proof helper
    var out1 := ProductFirstEvenOdd(a1);
    assert out1 == 4;


    var a2: seq<int> := [1, 5, 7, 9, 10];
    assert IsEven(a2[4]); // proof helper
    assert IsOdd(a2[0]); // proof helper
    var out2 := ProductFirstEvenOdd(a2);
    assert out2 == 10;
}

method TestsForProductFirstEvenOdd()
{
  // Test case for combination P{2}/{1}:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 1, 3, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
    expect product == 0; // observed from implementation
  }

  // Test case for combination P{3}/{1}:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-8, -1];
    var product := ProductFirstEvenOdd(lst);
    expect product == 8;
  }

  // Test case for combination P{4}/{1}:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-7, 2, -9];
    var product := ProductFirstEvenOdd(lst);
    expect product == -14;
  }

  // Test case for combination P{5}/{1}:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [5, 4, -9, 2, -5, -41105];
    var product := ProductFirstEvenOdd(lst);
    expect product == 10 || product == 20;
  }

  // Test case for combination P{7}/{1}:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [1, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
    expect product == 0; // observed from implementation
  }

}

method TestsForFirstEvenOddIndices()
{
  // Test case for combination P{2}/{1}/Rel:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   POST: lst[evenIndex] % 2 == 0
  //   POST: forall i: int {:trigger lst[i]} :: 0 <= i && i < evenIndex ==> lst[i] % 2 != 0
  //   POST: 0 <= oddIndex
  //   POST: oddIndex < |lst|
  //   POST: lst[oddIndex] % 2 != 0
  //   POST: forall i: int {:trigger lst[i]} :: 0 <= i && i < oddIndex ==> lst[i] % 2 == 0
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [10, -5, -5];
    expect exists i: int :: 0 <= i < |lst| && IsEven(lst[i]); // PRE-CHECK
    expect exists i: int :: 0 <= i < |lst| && IsOdd(lst[i]); // PRE-CHECK
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{4}/{1}/Rel:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   POST: lst[evenIndex] % 2 == 0
  //   POST: forall i: int {:trigger lst[i]} :: 0 <= i && i < evenIndex ==> lst[i] % 2 != 0
  //   POST: 0 <= oddIndex
  //   POST: oddIndex < |lst|
  //   POST: lst[oddIndex] % 2 != 0
  //   POST: forall i: int {:trigger lst[i]} :: 0 <= i && i < oddIndex ==> lst[i] % 2 == 0
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-5, -2, -9];
    expect exists i: int :: 0 <= i < |lst| && IsEven(lst[i]); // PRE-CHECK
    expect exists i: int :: 0 <= i < |lst| && IsOdd(lst[i]); // PRE-CHECK
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{5}/{1}/Rel:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   POST: lst[evenIndex] % 2 == 0
  //   POST: forall i: int {:trigger lst[i]} :: 0 <= i && i < evenIndex ==> lst[i] % 2 != 0
  //   POST: 0 <= oddIndex
  //   POST: oddIndex < |lst|
  //   POST: lst[oddIndex] % 2 != 0
  //   POST: forall i: int {:trigger lst[i]} :: 0 <= i && i < oddIndex ==> lst[i] % 2 == 0
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-1, -10, -7, 1];
    expect exists i: int :: 0 <= i < |lst| && IsEven(lst[i]); // PRE-CHECK
    expect exists i: int :: 0 <= i < |lst| && IsOdd(lst[i]); // PRE-CHECK
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{7}/{1}/Rel:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   POST: lst[evenIndex] % 2 == 0
  //   POST: forall i: int {:trigger lst[i]} :: 0 <= i && i < evenIndex ==> lst[i] % 2 != 0
  //   POST: 0 <= oddIndex
  //   POST: oddIndex < |lst|
  //   POST: lst[oddIndex] % 2 != 0
  //   POST: forall i: int {:trigger lst[i]} :: 0 <= i && i < oddIndex ==> lst[i] % 2 == 0
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-7, -1, 4];
    expect exists i: int :: 0 <= i < |lst| && IsEven(lst[i]); // PRE-CHECK
    expect exists i: int :: 0 <= i < |lst| && IsOdd(lst[i]); // PRE-CHECK
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

}

method Main()
{
  TestsForProductFirstEvenOdd();
  print "TestsForProductFirstEvenOdd: all non-failing tests passed!\n";
  TestsForFirstEvenOddIndices();
  print "TestsForFirstEvenOddIndices: all non-failing tests passed!\n";
}
