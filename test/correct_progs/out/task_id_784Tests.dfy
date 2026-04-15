// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_784.dfy
// Method: ProductFirstEvenOdd
// Generated: 2026-04-15 11:09:52

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

method Passing()
{
  // Test case for combination P{3}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,4}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 20903, 61225, 64573];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42479, 0, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 4875, 0, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{9}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42479, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{9,10,12}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [61227, 11707, -1, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{7,8,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [16731, 0, 0, 23597];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,7,8,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 0, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,7,8,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [64571, 20903, 25, 26, 0, 32, 0, 16733];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,7,8,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [17713, 0, 0, 24, 37, 64571, 16731];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,9,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42479, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,8,9,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 4875, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,8,10,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [17713, 23595, 28, 29, 30, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,8,9,10,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 61225, 0, 25, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 4875, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,8,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 4875, 29, 30, 31, 32, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,8,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42479, 4875, 29, 30, 31, 32, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,9,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42477, 0, 4877, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,8,9,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 27, 4875, 34, 35, 36, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,8,9,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 4875, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,10,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 29, 17711, 4875, 41, 42, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,8,10,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 27, 4875, 34, 35, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,9,10,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [4875, 16731, 26, 27, 0, 28, 29, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,9,10,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 4875, 29, 30, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,8,9,10,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 4875, 32, 33, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,4,6,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 16731, 23597];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,4,6,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 17711, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,7,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 20903, 64573];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,4,7,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 31843, 41075, 25, 26, 0, 47, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,6,7,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, -1, 41075, 25, 26, 0, 47, 23597];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,4,6,7,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, -1, 41075, 25, 26, 0, 53, 17713];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,4,6,7,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 29, 0, 23595, 30, 17713];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 17711, 0, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,4,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 27, 28, 11707, 42, -1, 61227];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,4,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 27, 28, 29, 0, -1, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,6,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 20903, 0, 64573];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,4,6,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 29, 30, 31, 0, 17711, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,4,6,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 42479, 25, 0, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 23595, 25, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 16731, 25, 0, 0, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,4,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 29, 30, 31, 17711, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 4875, 25, 0, 44, 45, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, -1, 41075, 25, 26, 0, 47, 17713];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, -1, 41075, 25, 26, 0, 53, 23597];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 27, 28, 29, 0, 16731, 23597];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,4,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 20901, 0, 25, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [64573, 61225, 25, 0, 37, 11707, 0, 20903];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 42479, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4875, -1, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,6,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 42479, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,6,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4875, -1, 25, 38, 39, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,8,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4875, -1, 25, 38, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,6,8,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4875, -1, 25, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 16733, 61227, 20901, 64571, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,6,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 16731, 23597, 25, 39, 0, 54, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,6,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4875, -1, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,8,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 23597, 25, 16731, 0, 37, 47, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,8,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 27, 28, 4875, 44, 45, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,9,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42477, 29, 17711, 4877, 37, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{8,9,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 27, 28, 4875, 37, 38, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,8,9,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 27, 28, 29, 4875, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,10,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 64573, 2285, 56201, 11709, 61225, 20901, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,10,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 2285, 56201, 11709, 61225, 20903, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,9,10,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42477, 4877, 32, 33, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{7,8,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [16731, 0, 64571, 25, 0, 38, 39, 23597];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,7,8,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42479, 0, 4875, 25, 0, 44, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,7,8,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [4875, 17711, 25, 26, 0, 0, -1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,7,8,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 17711, 0, 23595, 0, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,8,9,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 27, 28, 4875, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{8,10,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 4875, 29, 30, 31, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,12,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 29, 17711, 30, 4875, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,8,12,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 31, 4875, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,9,12,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42477, 0, 4877, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,4,6,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 61225, 20903, 25, 0, 64573];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,7,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 0, -1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,7,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 64573, 0, 25, 16733];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 42479, 0, 25, 26, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 11707, 25, 0, 26, 27, -1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [64573, 0, 0, 20903];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,6,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 61225, 0, 20901, 25, 26, 64573];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,6,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 11707, 25, -1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,6,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 61225, 25, 0, 26, 27, -1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,6,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 29, 30, 31, 32, 0, 20903, 64573];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [64573, 20901, 25, 0, 0, 61227, 44, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,7,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 0, 0, 0, 0, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,6,7,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 26, 4481, 0, 27, 57765];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,6,7,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, -1, 0, 25, 2285];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,7,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 17711, 0, 0, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [64573, 0, 0, 0, 20903];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 17711, 25, 26, 0, 37, 0, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [16733, 64571, 0, 0, 20903, 45, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{7,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [16731, 0, 0, 0, 23597];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,7,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 0, 0, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,7,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [4875, 17711, 25, 0, 0, -1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,6,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 17711, 4875, 27, 28, 29, 0, -1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,6,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 64571, 25, 0, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,7,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 27, 28, 20903, 64571, 16733];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,4,7,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 27, 20903, 0, 64571, 16733];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,6,7,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 16731, 25, 23595, 26, 17711];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 29, 30, 20903, 31, 32, 0, 64573];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 29, 16731, 30, 23595, 17713];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,4,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 64573, 0, 25, 26, 16733];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,4,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 20903, 64571, 16733];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 25, 17711, 26, 0, 41, 0, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,6,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 23595, 25, 26, 0, 27, 17711];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,6,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 29, 30, 0, 17711, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [16733, 20901, 0, 61227, 0, 64571];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,7,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 42479, 25, 0, 26, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,7,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 27, 20903, 64571, 0, 16733];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,7,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 27, 20903, 64571, 16733];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,7,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 25, 4875, 0, 0, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 25, 17711, 26, 0, 0, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 17711, 25, 26, 0, 0, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [64573, 61227, 0, 0, 20901];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{7,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [16731, 0, 64571, 25, 0, 38, 23597];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,7,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 4875, 0, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{6,7,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [4875, 17711, 0, 0, -1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,7,16}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 25, 26, 11707, 27, 28, 61225];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,6,7,16}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 29, 30, 31, -1, 11707, 61227];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,6,7,16}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 29, 0, 0, 41, 42479, 1];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,6,7,16}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [17713, 0, 0, 25, 38, 64571, 44, 16731];
    var product := ProductFirstEvenOdd(lst);
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 16733];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,3,4}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 20901, 61225, 64573];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{5,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-1, 0, 56203];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,6,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [11709, 0, 17891, 1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{9}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{9,10,12}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, -1, 31843, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 3;
    expect oddIndex == 0;
  }

  // Test case for combination P{7,8,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [17713, 0, 0, 1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{6,7,8,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [31845, 64557, 4893, 5997, 0, 61, 0, 52571];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 4;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,6,7,8,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [29363, 42475, 0, 33815, 0, 0, 70, 63783];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,9,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{6,8,9,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, 56201, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,6,8,10,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [17713, 565, 0, 50, 51, 0, 52, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,8,9,10,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [17713, 565, 0, 52, 53, 0, 54, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,6,8,9,10,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [17713, 31843, 0, 34, 35, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,6,8,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, 16731, 0, 34, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,6,8,9,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [17713, 23595, 0, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,8,10,12,13}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [17713, 29361, 0, 34, 35, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{3,4,6,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 4875, 11707];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{2,3,4,7,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 64557, 19453, 35, 36, 17893];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 3;
  }

  // Test case for combination P{2,4,6,7,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 19451, 64557, 35, 36, 17893];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 3;
  }

  // Test case for combination P{2,3,4,6,7,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 2647, 57763, 35, 31845];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 3;
  }

  // Test case for combination P{3,4,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 64559, 4893, 31, 32, 33, 23597];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{2,3,4,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 17711, 17891, 23597];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 3;
  }

  // Test case for combination P{2,3,4,6,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 4875, 17893, 0, -1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{3,4,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 5995, 29363, 31, 32, 16733];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{5,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [41077, 42477, 2647, 0, 39, 0, 66, 17891];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 3;
    expect oddIndex == 0;
  }

  // Test case for combination P{4,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 37175, -1, 35, 36, 17893];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 3;
  }

  // Test case for combination P{2,4,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 57763, 2649, 23597];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 3;
  }

  // Test case for combination P{3,4,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 17711, 41953, 23597];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 3;
  }

  // Test case for combination P{5,6,7,8,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [52573, 41953, 0, 29361, 40, 0, 5995];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{8,9,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, 0, 56203, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{2,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 64573, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{4,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, -1, 64571, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,6,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 77, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{4,6,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 63195, 30, 41171, 37, 38, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,4,6,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 22725, 30, 4893, 35, 36, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,8,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-2, 53645, 29, 19451, 36, -41954, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{4,8,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 58683, 29, 57763, 36, 63784, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,4,8,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 52571, 30, 5995, 31, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,6,8,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 23595, 30, 563, 0, 31, 32, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,4,6,8,10,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 64571, 30, 31843, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 20903, 64571, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{4,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, -1, 2285, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,4,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 17711, 20901, 64571, 16733, 23595, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,6,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 123239, 29, 33815, 36, 63784, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,4,6,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 23595, 0, 16733, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,8,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 120771, -2, 16733, 42, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{4,8,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 16731, 52571, 17891, 0, 36, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{5,8,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [4895, 1181, 33815, 1681, 0, 37177, -1, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 4;
    expect oddIndex == 0;
  }

  // Test case for combination P{2,6,8,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 23595, 0, 31845, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{5,9,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [2649, 4481, 64557, -1, 0, 19451, 43, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 4;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,8,9,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [11709, 31843, 0, 43, 44, 2285, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{2,4,10,12,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, -1, 31843, 41075, 563, 2287, 56201, 5994];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{5,7,8,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [41077, 62223, 24425, 0, 0, 64, 17891];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 3;
    expect oddIndex == 0;
  }

  // Test case for combination P{6,7,8,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [51815, -1, 11199, 24559, 0, 0, 2647];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 4;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,6,7,8,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [11709, 52571, 0, 17891, 0, 56201];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,8,9,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [17713, 562, 41075, -1, 33, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,8,12,13,14}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, 0, 32, 16731, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{4,6,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 23595, 17711];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{3,7,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 16731];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 3;
  }

  // Test case for combination P{2,3,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 4875, 31845];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 3;
  }

  // Test case for combination P{5,6,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [41955, -1, 13757, 43313, 0, 0, 51, 63783];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 4;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,7,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [17713, 0, 0, 0, 0, 0, 0, 1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{4,6,7,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 29361, 5995, 23597];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 3;
  }

  // Test case for combination P{5,6,7,8,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [64573, 0, 0, 43311, 1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-1, 0, 0, 0, 0, 0, 0, 56203];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{6,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, 29922, 0, 41075, 39, 64571];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,6,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [63785, 47223, 25235, -1, 0, 0, 43311];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 4;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,7,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-1, 0, 0, 0, 0, 0, 56203];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{6,7,8,13,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [11709, 41076, 31843, 30, 0, 56201];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{3,4,7,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 11707, -1, 2285, 56203];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{2,4,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 19451, 4483];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 3;
  }

  // Test case for combination P{3,4,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 17711, 31, 563];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{5,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [56203, 47223, 42475, 0, 0, 43, 44, 1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 3;
    expect oddIndex == 0;
  }

  // Test case for combination P{3,6,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 11707, 17711];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 3;
  }

  // Test case for combination P{5,6,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [31845, 17890, 30, -1, 0, 1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,7,8,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [11709, 64559, 36917, 0, 0, 56201];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 3;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [56203, 57763, 4481, 0, 52, 0, 2285];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 3;
    expect oddIndex == 0;
  }

  // Test case for combination P{6,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [41077, 0, 29, 43311, 43, 0, 17891];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,6,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [64573, 0, 31842, 17891, 1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,7,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [56203, -1, 0, 0, 1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{6,7,8,13,14,15}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [64573, 0, 0, 41077, 1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{2,3,7,16}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 4875, 34, 35, 36, 23595, 17711];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{2,3,6,7,16}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 4875, 31, 32, 2285, 11707];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{5,6,7,16}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-1, 36915, 52571, 0, 0, 45, 51815, 17891];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 3;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,7,8,16}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [17713, 0, 0, 0, 0, 1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
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
