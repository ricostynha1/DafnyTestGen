// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\PartitionOddEven.dfy
// Method: PartitionOddEven
// Generated: 2026-04-21 23:01:28

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



method TestsForPartitionOddEven()
{
  // Test case for combination {1}/Rel:
  //   POST Q1: !exists i: int, j: int :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new nat[2] [9, 10];
    PartitionOddEven(a);
    expect a[..] == [9, 10];
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: !exists i: int, j: int :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new nat[0] [];
    PartitionOddEven(a);
    expect a[..] == [];
  }

  // Test case for combination {1}/O|a|=1:
  //   POST Q1: !exists i: int, j: int :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new nat[1] [10];
    PartitionOddEven(a);
    expect a[..] == [10];
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/Oa≠old:
  //   POST Q1: !exists i: int, j: int :: 0 <= i < j < a.Length && IsEven(a[i]) && IsOdd(a[j])
  //   POST Q2: multiset(a[..]) == multiset(old(a[..]))
  {
    var a := new nat[2] [8, 10];
    PartitionOddEven(a);
    // expect a[..] == [10, 8]; // LHS=[8, 10], RHS=[10, 8]
  }

}

method Main()
{
  TestsForPartitionOddEven();
  print "TestsForPartitionOddEven: all non-failing tests passed!\n";
}
