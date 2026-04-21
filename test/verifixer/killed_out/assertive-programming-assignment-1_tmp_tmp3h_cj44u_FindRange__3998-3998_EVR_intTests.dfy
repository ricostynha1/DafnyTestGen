// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\assertive-programming-assignment-1_tmp_tmp3h_cj44u_FindRange__3998-3998_EVR_int.dfy
// Method: FindRange
// Generated: 2026-04-08 16:40:08

// assertive-programming-assignment-1_tmp_tmp3h_cj44u_FindRange.dfy

method OriginalMain()
{
  var q := [1, 2, 2, 5, 10, 10, 10, 23];
  assert Sorted(q);
  assert 10 in q;
  var i, j := FindRange(q, 10);
  print "The number of occurrences of 10 in the sorted sequence [1,2,2,5,10,10,10,23] is ";
  print j - i;
  print " (starting at index ";
  print i;
  print " and ending in ";
  print j;
  print ").\n";
  assert i == 4 && j == 7 by {
    assert q[0] <= q[1] <= q[2] <= q[3] < 10;
    assert q[4] == q[5] == q[6] == 10;
    assert 10 < q[7];
  }
  q := [0, 1, 2];
  assert Sorted(q);
  i, j := FindRange(q, 10);
  print "The number of occurrences of 10 in the sorted sequence [0,1,2] is ";
  print j - i;
  print " (starting at index ";
  print i;
  print " and ending in ";
  print j;
  print ").\n";
  q := [10, 11, 12];
  assert Sorted(q);
  i, j := FindRange(q, 1);
  print "The number of occurrences of 1  in the sorted sequence [10,11,12] is ";
  print j - i;
  print " (starting at index ";
  print i;
  print " and ending in ";
  print j;
  print ").\n";
  q := [1, 11, 22];
  assert Sorted(q);
  i, j := FindRange(q, 10);
  print "The number of occurrences of 10 in the sorted sequence [1,11,22] is ";
  print j - i;
  print " (starting at index ";
  print i;
  print " and ending in ";
  print j;
  print ").\n";
  q := [1, 11, 22];
  assert Sorted(q);
  i, j := FindRange(q, 11);
  print "The number of occurrences of 11 in the sorted sequence [1,11,22] is ";
  print j - i;
  print " (starting at index ";
  print i;
  print " and ending in ";
  print j;
  print ").\n";
  q := [1, 11, 11];
  assert Sorted(q);
  i, j := FindRange(q, 11);
  print "The number of occurrences of 11 in the sorted sequence [1,11,11] is ";
  print j - i;
  print " (starting at index ";
  print i;
  print " and ending in ";
  print j;
  print ").\n";
  q := [11, 11, 14];
  assert Sorted(q);
  i, j := FindRange(q, 11);
  print "The number of occurrences of 11 in the sorted sequence [11 ,11, 14] is ";
  print j - i;
  print " (starting at index ";
  print i;
  print " and ending in ";
  print j;
  print ").\n";
  q := [1, 11, 11, 11, 13];
  assert Sorted(q);
  i, j := FindRange(q, 11);
  print "The number of occurrences of 11 in the sorted sequence [1,11,11,11,13] is ";
  print j - i;
  print " (starting at index ";
  print i;
  print " and ending in ";
  print j;
  print ").\n";
  q := [];
  assert Sorted(q);
  i, j := FindRange(q, 11);
  print "The number of occurrences of 11 in the sorted sequence [] is ";
  print j - i;
  print " (starting at index ";
  print i;
  print " and ending in ";
  print j;
  print ").\n";
  q := [11];
  assert Sorted(q);
  i, j := FindRange(q, 10);
  print "The number of occurrences of 10 in the sorted sequence [11] is ";
  print j - i;
  print " (starting at index ";
  print i;
  print " and ending in ";
  print j;
  print ").\n";
  q := [11];
  assert Sorted(q);
  i, j := FindRange(q, 11);
  print "The number of occurrences of 11 in the sorted sequence [11] is ";
  print j - i;
  print " (starting at index ";
  print i;
  print " and ending in ";
  print j;
  print ").\n";
}

predicate Sorted(q: seq<int>)
  decreases q
{
  forall i: int, j: int {:trigger q[j], q[i]} :: 
    0 <= i <= j < |q| ==>
      q[i] <= q[j]
}

method {:verify true} FindRange(q: seq<int>, key: int)
    returns (left: nat, right: nat)
  requires Sorted(q)
  ensures left <= right <= |q|
  ensures forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  ensures forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  ensures forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  decreases q, key
{
  left := BinarySearch(q, key, 0, |q|, (n: int, m: int) => n >= 0);
  right := BinarySearch(q, key, left, |q|, (n: int, m: int) => n > m);
}

predicate RangeSatisfiesComparer(q: seq<int>, key: int, lowerBound: nat, upperBound: nat, comparer: (int, int) -> bool)
  requires 0 <= lowerBound <= upperBound <= |q|
  decreases q, key, lowerBound, upperBound
{
  forall i: int {:trigger q[i]} :: 
    lowerBound <= i < upperBound ==>
      comparer(q[i], key)
}

predicate RangeSatisfiesComparerNegation(q: seq<int>, key: int, lowerBound: nat, upperBound: nat, comparer: (int, int) -> bool)
  requires 0 <= lowerBound <= upperBound <= |q|
  decreases q, key, lowerBound, upperBound
{
  RangeSatisfiesComparer(q, key, lowerBound, upperBound, (n1: int, n2: int) => !comparer(n1, n2))
}

method BinarySearch(q: seq<int>, key: int, lowerBound: nat, upperBound: nat, comparer: (int, int) -> bool)
    returns (index: nat)
  requires Sorted(q)
  requires 0 <= lowerBound <= upperBound <= |q|
  requires RangeSatisfiesComparerNegation(q, key, 0, lowerBound, comparer)
  requires RangeSatisfiesComparer(q, key, upperBound, |q|, comparer)
  requires (forall n1: int, n2: int {:trigger comparer(n1, n2)} :: comparer(n1, n2) == (n1 > n2)) || forall n1: int, n2: int {:trigger comparer(n1, n2)} :: comparer(n1, n2) == (n1 >= n2)
  ensures lowerBound <= index <= upperBound
  ensures RangeSatisfiesComparerNegation(q, key, 0, index, comparer)
  ensures RangeSatisfiesComparer(q, key, index, |q|, comparer)
  decreases q, key, lowerBound, upperBound
{
  var low: nat := lowerBound;
  var high: nat := upperBound;
  while low < high
    invariant lowerBound <= low <= high <= upperBound
    invariant RangeSatisfiesComparerNegation(q, key, 0, low, comparer)
    invariant RangeSatisfiesComparer(q, key, high, |q|, comparer)
    decreases high - low
  {
    var middle := low + (high - low) / 2;
    if comparer(q[middle], key) {
      high := middle;
    } else {
      low := middle + 1;
    }
  }
  index := high;
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  Sorted(q)
  //   POST: left <= right <= |q|
  //   POST: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   POST: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   POST: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  //   ENSURES: left <= right <= |q|
  //   ENSURES: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   ENSURES: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   ENSURES: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  {
    var q: seq<int> := [7719];
    var key := -1;
    var left, right := FindRange(q, key);
    expect left == 0;
    expect right == 0;
  }

  // Test case for combination {1}/Bq=0,key=0:
  //   PRE:  Sorted(q)
  //   POST: left <= right <= |q|
  //   POST: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   POST: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   POST: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  //   ENSURES: left <= right <= |q|
  //   ENSURES: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   ENSURES: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   ENSURES: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  {
    var q: seq<int> := [];
    var key := 0;
    var left, right := FindRange(q, key);
    expect left == 0;
    expect right == 0;
  }

  // Test case for combination {1}/Bq=0,key=1:
  //   PRE:  Sorted(q)
  //   POST: left <= right <= |q|
  //   POST: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   POST: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   POST: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  //   ENSURES: left <= right <= |q|
  //   ENSURES: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   ENSURES: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   ENSURES: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  {
    var q: seq<int> := [];
    var key := 1;
    var left, right := FindRange(q, key);
    expect left == 0;
    expect right == 0;
  }

  // Test case for combination {1}/Bq=1,key=0:
  //   PRE:  Sorted(q)
  //   POST: left <= right <= |q|
  //   POST: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   POST: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   POST: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  //   ENSURES: left <= right <= |q|
  //   ENSURES: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   ENSURES: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   ENSURES: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  {
    var q: seq<int> := [39];
    var key := 0;
    var left, right := FindRange(q, key);
    expect left == 0;
    expect right == 0;
  }

  // Test case for combination {1}/Oleft>=2:
  //   PRE:  Sorted(q)
  //   POST: left <= right <= |q|
  //   POST: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   POST: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   POST: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  //   ENSURES: left <= right <= |q|
  //   ENSURES: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   ENSURES: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   ENSURES: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  {
    var q: seq<int> := [-7722, -7722];
    var key := -7721;
    var left, right := FindRange(q, key);
    expect left == 2;
    expect right == 2;
  }

  // Test case for combination {1}/Oleft=1:
  //   PRE:  Sorted(q)
  //   POST: left <= right <= |q|
  //   POST: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   POST: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   POST: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  //   ENSURES: left <= right <= |q|
  //   ENSURES: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   ENSURES: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   ENSURES: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  {
    var q: seq<int> := [-3];
    var key := -2;
    var left, right := FindRange(q, key);
    expect left == 1;
    expect right == 1;
  }

  // Test case for combination {1}/Oleft=0:
  //   PRE:  Sorted(q)
  //   POST: left <= right <= |q|
  //   POST: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   POST: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   POST: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  //   ENSURES: left <= right <= |q|
  //   ENSURES: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   ENSURES: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   ENSURES: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  {
    var q: seq<int> := [38];
    var key := -7722;
    var left, right := FindRange(q, key);
    expect left == 0;
    expect right == 0;
  }

  // Test case for combination {1}/Oright>=2:
  //   PRE:  Sorted(q)
  //   POST: left <= right <= |q|
  //   POST: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   POST: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   POST: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  //   ENSURES: left <= right <= |q|
  //   ENSURES: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   ENSURES: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   ENSURES: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  {
    var q: seq<int> := [-15442, -15442];
    var key := -15441;
    var left, right := FindRange(q, key);
    expect left == 2;
    expect right == 2;
  }

  // Test case for combination {1}/Oright=1:
  //   PRE:  Sorted(q)
  //   POST: left <= right <= |q|
  //   POST: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   POST: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   POST: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  //   ENSURES: left <= right <= |q|
  //   ENSURES: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   ENSURES: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   ENSURES: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  {
    var q: seq<int> := [-7724];
    var key := -7723;
    var left, right := FindRange(q, key);
    expect left == 1;
    expect right == 1;
  }

  // Test case for combination {1}/Oright=0:
  //   PRE:  Sorted(q)
  //   POST: left <= right <= |q|
  //   POST: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   POST: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   POST: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  //   ENSURES: left <= right <= |q|
  //   ENSURES: forall i: int {:trigger q[i]} :: 0 <= i < left ==> q[i] < key
  //   ENSURES: forall i: int {:trigger q[i]} :: left <= i < right ==> q[i] == key
  //   ENSURES: forall i: int {:trigger q[i]} :: right <= i < |q| ==> q[i] > key
  {
    var q: seq<int> := [41];
    var key := 40;
    var left, right := FindRange(q, key);
    expect left == 0;
    expect right == 0;
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
