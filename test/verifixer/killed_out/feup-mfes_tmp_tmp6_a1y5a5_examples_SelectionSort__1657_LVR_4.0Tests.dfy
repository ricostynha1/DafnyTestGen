// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\feup-mfes_tmp_tmp6_a1y5a5_examples_SelectionSort__1657_LVR_4.0.dfy
// Method: selectionSort
// Generated: 2026-03-25 22:52:44

// feup-mfes_tmp_tmp6_a1y5a5_examples_SelectionSort.dfy

predicate isSorted(a: array<real>, from: nat, to: nat)
  requires 0 <= from <= to <= a.Length
  reads a
  decreases {a}, a, from, to
{
  forall i: int, j: int {:trigger a[j], a[i]} :: 
    from <= i < j < to ==>
      a[i] <= a[j]
}

method selectionSort(a: array<real>)
  modifies a
  ensures isSorted(a, 0, a.Length)
  ensures multiset(a[..]) == multiset(old(a[..]))
  decreases a
{
  var i := 0;
  while i < a.Length - 1
    invariant 0 <= i <= a.Length
    invariant isSorted(a, 0, i)
    invariant forall lhs: int, rhs: int {:trigger a[rhs], a[lhs]} :: 0 <= lhs < i <= rhs < a.Length ==> a[lhs] <= a[rhs]
    invariant multiset(a[..]) == multiset(old(a[..]))
    decreases a.Length - 1 - i
  {
    var j := findMin(a, i, a.Length);
    a[i], a[j] := a[j], a[i];
    i := i + 1;
  }
}

method findMin(a: array<real>, from: nat, to: nat)
    returns (index: nat)
  requires 0 <= from < to <= a.Length
  ensures from <= index < to
  ensures forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  decreases a, from, to
{
  var i := from + 1;
  index := from;
  while i < to
    invariant from <= index < i <= to
    invariant forall k: int {:trigger a[k]} :: from <= k < i ==> a[k] >= a[index]
    decreases a.Length - i
  {
    if a[i] < a[index] {
      index := i;
    }
    i := i + 1;
  }
}

method testSelectionSort()
{
  var a := new real[5] [9.0, 4.0, 6.0, 4.0, 8.0];
  assert a[..] == [9.0, 4.0, 6.0, 3.0, 8.0];
  selectionSort(a);
  assert a[..] == [3.0, 4.0, 6.0, 8.0, 9.0];
}

method testFindMin()
{
  var a := new real[5] [9.0, 5.0, 6.0, 4.0, 8.0];
  var m := findMin(a, 0, 5);
  assert a[3] == 4.0;
  assert m == 3;
}


method Passing()
{
  // Test case for combination {1}:
  //   POST: isSorted(a, 0, a.Length)
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[0] [];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a[..]);
  }

  // Test case for combination {1}:
  //   POST: isSorted(a, 0, a.Length)
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[1] [3.0];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a[..]);
  }

  // Test case for combination {1}/Ba=2:
  //   POST: isSorted(a, 0, a.Length)
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[2] [3.0, 2.0];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a[..]);
  }

  // Test case for combination {1}/Ba=3:
  //   POST: isSorted(a, 0, a.Length)
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new real[3] [3.0, 2.0, 4.0];
    var old_a := a[..];
    selectionSort(a);
    expect isSorted(a, 0, a.Length);
    expect multiset(a[..]) == multiset(old_a[..]);
  }

  // Test case for combination {1}:
  //   PRE:  0 <= from < to <= a.Length
  //   POST: from <= index < to
  //   POST: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[1] [0.0];
    var from := 0;
    var to := 1;
    var index := findMin(a, from, to);
    expect index == 0;
  }

  // Test case for combination {1}:
  //   PRE:  0 <= from < to <= a.Length
  //   POST: from <= index < to
  //   POST: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[2] [0.0, 12.0];
    var from := 0;
    var to := 1;
    var index := findMin(a, from, to);
    expect index == 0;
  }

  // Test case for combination {1}/Ba=3,from=0,to==a:
  //   PRE:  0 <= from < to <= a.Length
  //   POST: from <= index < to
  //   POST: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[3] [0.0, 0.25, 0.5];
    var from := 0;
    var to := 1;
    var index := findMin(a, from, to);
    expect index == 0;
  }

  // Test case for combination {1}/Ba=2,from=1,to==a:
  //   PRE:  0 <= from < to <= a.Length
  //   POST: from <= index < to
  //   POST: forall k: int {:trigger a[k]} :: from <= k < to ==> a[k] >= a[index]
  {
    var a := new real[2] [4.0, 0.0];
    var from := 1;
    var to := 2;
    var index := findMin(a, from, to);
    expect index == 1;
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
