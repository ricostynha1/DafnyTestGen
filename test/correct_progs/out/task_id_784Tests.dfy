// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_784.dfy
// Method: ProductFirstEvenOdd
// Generated: 2026-04-10 22:36:33

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
    var lst: seq<int> := [0, 42479];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 15439, 77];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,5}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4875, 0, 42479];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,5}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 15439, 0, 77];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 42479];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 23595, 24, 31, 32, 33, 0, 15439];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42479, 0, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,5,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 15439, 30, 31, 32, 33, 0, 77];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,5,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 26, 27, 0, 28, 29, 4875, 42479];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,5,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, -1, 0, 33, 34, 35, 17711];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,5,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 17711, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{7}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42479, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,7}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42479, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,7}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42477, 0, 4877, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,5,7}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 4875, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 77, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,5,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 77, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,5,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 29, 0, 23595, 27, 28, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42479, 4875, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 4875, 28, 0, 49, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == -28;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [15439, 42477, 28, 29, 30, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 432292;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,5,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [16733, 25, 0, 28, 64573, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4875, 17713, 42477];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 64571, 23595, 16733, 20901, 61225, 11707, 17711];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3}/{1}/Oproduct=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 5997, 17893, 52571, 41953, 29361, 31843];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
  }

  // Test case for combination P{3,5}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 16731, 0, 33, 34, 35, 17713];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,5}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4875, 0, 33, 34, -1];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,5}/{1}/Oproduct=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4875, 0, 24, -1];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
  }

  // Test case for combination P{2,3,5}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4877, 0, 33, 34, 42477];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,3,5}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4877, 0, 24, 42477];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,6}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4877, 30, 31, 32, 0, 42477];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,6}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 4877, 30, 31, 0, 42477];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,6}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 0, 42479];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,6}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 0, 0, 0, 0, 0, -1];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{3,6}/{1}/Oproduct=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 0, 0, 0, 0, 0, -1];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
  }

  // Test case for combination P{4,6}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42479, 0, 0, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,6}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 0, 0, 0, 0, 0, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,6}/{1}/Oproduct=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 0, 0, 0, 0, 17711];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
  }

  // Test case for combination P{4,5,6}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 17711, 30, 31, 32, 0, 52, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect product == -30;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,5,6}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 17711, 30, 31, 32, 0, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect product == -30;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,5,6}/{1}/Oproduct=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 17711, 0, 33, 34, 4875];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
  }

  // Test case for combination P{4,7}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42479, 0, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,7}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 0, 0, 0, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,7}/{1}/Oproduct=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, 0, 0, 0, 0, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
  }

  // Test case for combination P{5,7}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42477, 4877, 28, 29, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 1189356;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,7}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [77, 15439, 0, 23, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{5,7}/{1}/Oproduct=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [42477, 4877, 0, 30, 31, 32, 33, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
  }

  // Test case for combination P{4,5,7}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 4875, 0, 23, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,5,7}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 4875, 0, 32, 33, 34, 35, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,8}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 42477, 4877, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,8}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 16731, 17711, 23597, 64571, 20901, 61225, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,8}/{1}/Oproduct=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 565, 56203, 2285, 41075, 31843, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
  }

  // Test case for combination P{4,8}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 4875, 22, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == -22;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,8}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 24, 25, 26, 0, 37, 23595, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == -24;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{4,8}/{1}/Oproduct=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 4875, 24, 25, 0, 26, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == -24;
  }

  // Test case for combination P{2,5,8}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 77, 30, 31, 32, 33, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,5,8}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 42479, 30, 31, 32, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{2,5,8}/{1}/Oproduct=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, 42479, 30, 31, 0, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
  }

  // Test case for combination P{7,8}/{1}/Oproduct>0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 4875, 17711, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{7,8}/{1}/Oproduct<0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [17893, 41953, 5995, 29361, 63785, 43311, 51813, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
    expect exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
  }

  // Test case for combination P{7,8}/{1}/Oproduct=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 52571, 31843, 17889, 29361, 5995, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
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

  // Test case for combination P{2,3}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 23595, 51813, 16733];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{3,5}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 17711, 23597];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{2,3,5}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 20901, 0, 16733];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{3,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 64573];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 3;
  }

  // Test case for combination P{2,3,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 16731, -1, 29, 0, 50, 20903];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{4,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, 0, 0, 16731];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{2,5,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 16731, 30, 31, 0, 45, 46, 20903];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{3,5,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 20901, 36, 37, 38, 39, 0, 16733];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,3,5,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 20901, 33, 0, 34, 16733];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{4,5,6}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [17713, 0, 20901, 23595];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{7}/{1}:
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

  // Test case for combination P{4,7}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [16733, 0, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,7}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, 0, -1, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{2,8}/{1}:
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

  // Test case for combination P{2,5,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 77, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{4,5,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, 64571, 0, 0, 34, 35, 36, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, 2649, 57763, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 3;
    expect oddIndex == 0;
  }

  // Test case for combination P{4,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, -1, 0, 35, 0, 36, 37, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{4,5,7,8}/{1}:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [11709, -1, 563, 2285, 56201, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 5;
    expect oddIndex == 0;
  }

  // Test case for combination P{2,3}/{1}/OevenIndex=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 16731, 23595];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,3}/{1}/OoddIndex=1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 17893, 5997, 29361, 41955, 63783, 52571];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{3,5}/{1}/OevenIndex=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 16731, 35, 36, 37, 0, 23595];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{3,5}/{1}/OoddIndex>=2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 64573, 44, 45, 20903];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{3,5}/{1}/OoddIndex=1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, -1, 0, 27, 4875];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,3,5}/{1}/OevenIndex=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 17713, 20901, 0, 23595];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,3,5}/{1}/OoddIndex>=2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 64573, 35, 36, 37, 38, 20903];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{2,6}/{1}/OevenIndex=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 23597, 11707, 30, 0, 64571];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,6}/{1}/OoddIndex>=2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 64573, 35, 20903];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{2,6}/{1}/OoddIndex=1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, -1, 27, 28, 29, 0, 4875];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{3,6}/{1}/OevenIndex=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 23595];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{3,6}/{1}/OoddIndex>=2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 0, 0, 0, 0, 0, 42477];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 7;
  }

  // Test case for combination P{4,6}/{1}/OevenIndex=1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-1, 0, 4875];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{4,6}/{1}/OoddIndex=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [23597, 0, 0, 0, 0, 0, 0, 16731];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{4,5,6}/{1}/OevenIndex>=2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [16733, 20903, 0, 35, 36, 37, 0, 64571];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{4,5,6}/{1}/OevenIndex=1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [16733, 0, 29, 30, 31, 20903, 64571];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{4,5,6}/{1}/OoddIndex=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [17713, 16731, 85472, 36, 37, 23595];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{4,7}/{1}/OevenIndex=1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [42479, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{4,7}/{1}/OoddIndex=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [16733, 0, 0, 0, 0, 0, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,7}/{1}/OevenIndex>=2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-1, 4875, 0, 35, 36, 0, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,7}/{1}/OevenIndex=1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-1, 0, 4875, 32, 33, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{5,7}/{1}/OoddIndex=0:
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

  // Test case for combination P{4,5,7}/{1}/OevenIndex>=2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-1, 4875, 0, 42, 43, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{4,5,7}/{1}/OevenIndex=1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-1, 0, 4875, 27, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{2,8}/{1}/OevenIndex=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 23597, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,8}/{1}/OoddIndex=1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 11709, 56201, -1, 41075, 563, 2285, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,5,8}/{1}/OevenIndex=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 16733, 35, 36, 0, 55, 56, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{2,5,8}/{1}/OoddIndex>=2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 0, 42477, 37, 38, 4875, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 2;
  }

  // Test case for combination P{2,5,8}/{1}/OoddIndex=1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [0, 42479, 0, 32, 33, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{7,8}/{1}/OevenIndex>=2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [-1, 4875, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{7,8}/{1}/OoddIndex=0:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: IsFirstEven(evenIndex, lst)
  //   POST: IsFirstOdd(oddIndex, lst)
  //   ENSURES: IsFirstEven(evenIndex, lst)
  //   ENSURES: IsFirstOdd(oddIndex, lst)
  {
    var lst: seq<int> := [5997, 29361, 41953, 63783, 43304];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 4;
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
