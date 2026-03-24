// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\PartitionOddEven.dfy
// Method: PartitionOddEven
// Generated: 2026-03-24 22:21:10

// Rearranges the elements in an array 'a' of natural numbers,
// so that all odd numbers appear before all even numbers.
// That is, there is no even number preceding an odd number. 
method PartitionOddEven(a: array<nat>) 
  modifies a
  ensures ! exists i, j :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j])  
  ensures multiset(a[..]) == multiset(old(a[..]))
{
    var i := 0; // odd numbers are placed to the left of i
    var j := a.Length - 1; // even numbers are placed to the right of j
    while i <= j
      invariant 0 <= i <= j + 1 <= a.Length
      invariant multiset(a[..]) == old(multiset(a[..]))
      invariant forall k :: 0 <= k < i ==> IsOdd(a[k])
      invariant forall k :: j < k < a.Length ==> IsEven(a[k])
     {
        if IsEven(a[i]) && IsOdd(a[j]) { a[i], a[j] := a[j], a[i]; } // swap
        if IsOdd(a[i]) { i := i + 1; }
        if IsEven(a[j]) { j := j - 1; }
    }
}
 
predicate IsOdd(n: nat) { 
  n % 2 == 1 
}

predicate IsEven(n: nat) { 
  n % 2 == 0 
}



method Passing()
{
  // Test case for combination {1}:
  //   POST: !exists i, j :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j])
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new nat[0] [];
    var old_a := a[..];
    PartitionOddEven(a);
    expect !exists i, j :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j]);
    expect multiset(a[..]) == multiset(old_a[..]);
  }

  // Test case for combination {1}/Ba=1:
  //   POST: !exists i, j :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j])
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new nat[1] [3];
    var old_a := a[..];
    PartitionOddEven(a);
    expect !exists i, j :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j]);
    expect multiset(a[..]) == multiset(old_a[..]);
  }

  // Test case for combination {1}/Ba=2:
  //   POST: !exists i, j :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j])
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new nat[2] [4, 3];
    var old_a := a[..];
    PartitionOddEven(a);
    expect !exists i, j :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j]);
    expect multiset(a[..]) == multiset(old_a[..]);
  }

  // Test case for combination {1}/Ba=3:
  //   POST: !exists i, j :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j])
  //   POST: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new nat[3] [5, 4, 6];
    var old_a := a[..];
    PartitionOddEven(a);
    expect !exists i, j :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j]);
    expect multiset(a[..]) == multiset(old_a[..]);
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
