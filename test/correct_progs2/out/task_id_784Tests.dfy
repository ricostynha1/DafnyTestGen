// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_784.dfy
// Method: ProductFirstEvenOdd
// Generated: 2026-03-21 23:23:00

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
  // Test case for combination P{3}/{1}/Blst=2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-2, -1];
    var product := ProductFirstEvenOdd(lst);
    expect product == 2;
  }

  // Test case for combination P{2,3}/{1}/Blst=3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-4, -5, -7];
    var product := ProductFirstEvenOdd(lst);
    expect product == 20;
  }

  // Test case for combination P{3,6}/{1}/Blst=3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [2, 4, 5];
    var product := ProductFirstEvenOdd(lst);
    expect product == 10;
  }

  // Test case for combination P{4,6}/{1}/Blst=3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0, -3];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
  }

  // Test case for combination P{7}/{1}/Blst=2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
  }

  // Test case for combination P{4,7}/{1}/Blst=3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1683, -2, -1682];
    var product := ProductFirstEvenOdd(lst);
    expect product == 3366;
  }

  // Test case for combination P{2,8}/{1}/Blst=3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [0, -3, -4];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
  }

  // Test case for combination P{7,8}/{1}/Blst=3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-5, -3, -2];
    var product := ProductFirstEvenOdd(lst);
    expect product == 10;
  }

  // Test case for combination P{2,3}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [2278, 1, 55, 563];
    var product := ProductFirstEvenOdd(lst);
    expect product == 2278;
  }

  // Test case for combination P{2,3}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-2, -3, -7, 3175, 7969];
    var product := ProductFirstEvenOdd(lst);
    expect product == 6;
  }

  // Test case for combination P{3,5}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [9270, -1, 18804, 11707];
    var product := ProductFirstEvenOdd(lst);
    expect product == -9270;
  }

  // Test case for combination P{2,3,5}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-2, -1, 11808, 97, -3, 101, 171, -5];
    var product := ProductFirstEvenOdd(lst);
    expect product == 2;
  }

  // Test case for combination P{4,6}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [1, -2, 1070, 16197];
    var product := ProductFirstEvenOdd(lst);
    expect product == -2;
  }

  // Test case for combination P{4,5,6}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [1, 3777, 2, 11841];
    var product := ProductFirstEvenOdd(lst);
    expect product == 2;
  }

  // Test case for combination P{4,7}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [1, 14132, 1070, 16196];
    var product := ProductFirstEvenOdd(lst);
    expect product == 14132;
  }

  // Test case for combination P{4,8}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, -2, 70, 9359, 8827, 137, 668];
    var product := ProductFirstEvenOdd(lst);
    expect product == 2;
  }

  // Test case for combination P{7,8}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [13757, 563, 77, 0];
    var product := ProductFirstEvenOdd(lst);
    expect product == 0;
  }

  // Test case for combination P{7,8}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 563, 97, 15047, -2];
    var product := ProductFirstEvenOdd(lst);
    expect product == 2;
  }

}

method Failing()
{
  // Test case for combination P{3,5}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [224, 1948, -1, 11058, 117, 11809, 111, 13345];
    var product := ProductFirstEvenOdd(lst);
    // expect product == -1948;
  }

  // Test case for combination P{3,5}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [18804, 2, 4777, 4173, 10162, 125, 11707];
    var product := ProductFirstEvenOdd(lst);
    // expect product == 9554;
  }

  // Test case for combination P{2,3,5}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [4564, 2646, 1, 1071];
    var product := ProductFirstEvenOdd(lst);
    // expect product == 2646;
  }

  // Test case for combination P{2,3,5}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [13344, 17708, 1608, 13232, 1, 15047, 563];
    var product := ProductFirstEvenOdd(lst);
    // expect product == 13232;
  }

  // Test case for combination P{2,6}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [3636, 2646, -1, 5995];
    var product := ProductFirstEvenOdd(lst);
    // expect product == -2646;
  }

  // Test case for combination P{2,6}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [18526, 1948, 7268, 110, 11808, -3, 4471, 17891];
    var product := ProductFirstEvenOdd(lst);
    // expect product == -5844;
  }

  // Test case for combination P{2,6}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [8192, 3608, 238, 1, -2, 11808, 5495];
    var product := ProductFirstEvenOdd(lst);
    // expect product == -2;
  }

  // Test case for combination P{3,6}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [16730, 17890, 562, 1];
    var product := ProductFirstEvenOdd(lst);
    // expect product == 17890;
  }

  // Test case for combination P{4,6}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 90, 15046, 110, 746, 104, 16197];
    var product := ProductFirstEvenOdd(lst);
    // expect product == -746;
  }

  // Test case for combination P{4,5,6}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [1, 8643, 9359, 131, 8642, 5528, 160, 563];
    var product := ProductFirstEvenOdd(lst);
    // expect product == 5528;
  }

  // Test case for combination P{4,5,6}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-3, 71, 72, 4186, 9359, 3306, 13757];
    var product := ProductFirstEvenOdd(lst);
    // expect product == -12558;
  }

  // Test case for combination P{4,7}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [1, 4120, 118, 158, 188, -2, 8642, -4];
    var product := ProductFirstEvenOdd(lst);
    // expect product == -4;
  }

  // Test case for combination P{5,7}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 3777, 6424, 0];
    var product := ProductFirstEvenOdd(lst);
    // expect product == 0;
  }

  // Test case for combination P{5,7}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [4037, 10847, 10847, 190, 17217, -14320, 261, 0];
    var product := ProductFirstEvenOdd(lst);
    // expect product == 0;
  }

  // Test case for combination P{5,7}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [11005, 3307, 8383, 9359, 14820, 0, 1140];
    var product := ProductFirstEvenOdd(lst);
    // expect product == 0;
  }

  // Test case for combination P{4,5,7}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [1, 3777, 19062, 2];
    var product := ProductFirstEvenOdd(lst);
    // expect product == 2;
  }

  // Test case for combination P{4,5,7}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-3, 7646, 10655, 9359, 3188, 7004];
    var product := ProductFirstEvenOdd(lst);
    // expect product == -9564;
  }

  // Test case for combination P{4,5,7}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [-1, 68, 7487, 5850, 9366, 9359, 6304];
    var product := ProductFirstEvenOdd(lst);
    // expect product == -5850;
  }

  // Test case for combination P{2,5,8}/{1}/R1:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [4564, 2646, -1, 3634];
    var product := ProductFirstEvenOdd(lst);
    // expect product == -3634;
  }

  // Test case for combination P{2,5,8}/{1}/R2:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [15400, 17042, 17926, -2, 1, -1, 11282, 17890];
    var product := ProductFirstEvenOdd(lst);
    // expect product == -2;
  }

  // Test case for combination P{2,5,8}/{1}/R3:
  //   PRE:  exists i :: 0 <= i < |lst| && IsEven(lst[i])
  //   PRE:  exists i :: 0 <= i < |lst| && IsOdd(lst[i])
  //   POST: exists i, j :: 0 <= i < |lst| && IsFirstEven(i, lst) && 0 <= j < |lst| && IsFirstOdd(j, lst) && product == lst[i] * lst[j]
  {
    var lst: seq<int> := [7154, 5102, 842, 8082, -3, 19985, 1446];
    var product := ProductFirstEvenOdd(lst);
    // expect product == -15306;
  }

}

method Main()
{
  Passing();
  Failing();
}
