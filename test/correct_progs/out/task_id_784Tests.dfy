// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_784.dfy
// Method: ProductFirstEvenOdd
// Generated: 2026-04-19 21:37:43

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
    var lst: seq<int> := [-6, 2, 3, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == -18 || product == 0 || product == 6;
  }

  // Test case for combination P{3}/{1}:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [392, 8, 47];
    var product := ProductFirstEvenOdd(lst);
    expect product == 376 || product == 18424;
  }

  // Test case for combination P{4}/{1}:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [142, -58, -1, 1];
    var product := ProductFirstEvenOdd(lst);
    expect product == 58 || product == -142;
  }

  // Test case for combination P{5}/{1}:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [7, 2, -1];
    var product := ProductFirstEvenOdd(lst);
    expect product == 14;
  }

  // Test case for combination P{9}/{1}:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-5, 2, -2];
    var product := ProductFirstEvenOdd(lst);
    expect product == -10 || product == 10;
  }

  // Test case for combination P{12}/{1}:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [22553, -1, 64726];
    var product := ProductFirstEvenOdd(lst);
    expect exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j];
    expect product == 1459765478; // observed from implementation
  }

  // Test case for combination P{12}/{1}/Q|lst|>=2:
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i: int :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  //   ENSURES: exists i: int, j: int :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-217225457420701840665071802721279059788778563700866464521433, -1, -1849406207080268745884275932154378539330689080648829724749134218751971668];
    var product := ProductFirstEvenOdd(lst);
    expect product == 401738109289696609463606717671140648162086453103689699606885687352792740763621722422203714111710953963988494524965263065838794760244;
  }

}

method TestsForFirstEvenOddIndices()
{
  // Test case for combination P{2}/{1}:
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
    var lst: seq<int> := [58834, 53051, 122149];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{5}/{1}:
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
    var lst: seq<int> := [37851, 13604, -1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{6}/{1}:
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
    var lst: seq<int> := [2, -1, -2, 8371];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{9}/{1}:
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
    var lst: seq<int> := [-100643, 88718];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{10}/{1}:
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
    var lst: seq<int> := [50315, 22249, 58835, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 3;
    expect oddIndex == 0;
  }

  // Test case for combination P{13}/{1}:
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
    var lst: seq<int> := [50315, 15386, 10244];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

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
    var lst: seq<int> := [0, 11707, 41075, 56203];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{3}/{1}/Rel:
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
    var lst: seq<int> := [0, 10887, 52571, 72713];
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
    var lst: seq<int> := [0, 563, 31843, -1];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
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
    var lst: seq<int> := [16733, 43311, 0, 64571];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{6}/{1}/Rel:
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
    var lst: seq<int> := [61225, 11707, 0, 39];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
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
    var lst: seq<int> := [-1, 0, 65137];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{8}/{1}/Rel:
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
    var lst: seq<int> := [64559, 0, 41, 37175];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 1;
    expect oddIndex == 0;
  }

  // Test case for combination P{9}/{1}/Rel:
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
    var lst: seq<int> := [-1, -36915, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{10}/{1}/Rel:
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
    var lst: seq<int> := [2647, 37175, 563, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 3;
    expect oddIndex == 0;
  }

  // Test case for combination P{12}/{1}/Rel:
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
    var lst: seq<int> := [-1, 41075, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{13}/{1}/Rel:
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
    var lst: seq<int> := [23597, 16731, 61224, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 2;
    expect oddIndex == 0;
  }

  // Test case for combination P{14}/{1}/Rel:
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
    var lst: seq<int> := [0, 63783, 56201, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{15}/{1}/Rel:
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
    var lst: seq<int> := [0, 68759, 0, 4481];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

  // Test case for combination P{16}/{1}/Rel:
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
    var lst: seq<int> := [25234, 83605, 5995, 0];
    var evenIndex, oddIndex := FirstEvenOddIndices(lst);
    expect evenIndex == 0;
    expect oddIndex == 1;
  }

}

method Main()
{
  TestsForProductFirstEvenOdd();
  print "TestsForProductFirstEvenOdd: all non-failing tests passed!\n";
  TestsForFirstEvenOddIndices();
  print "TestsForFirstEvenOddIndices: all non-failing tests passed!\n";
}
