// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_751.dfy
// Method: IsMinHeap
// Generated: 2026-04-20 22:12:51

// Check if an array of integers represents a min heap.
method IsMinHeap(a: array<int>) returns (result: bool)
  ensures result <==> forall i :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
{
  if a.Length > 0 {
    for i := 1 to a.Length 
      invariant forall k :: 1 <= k < i ==> a[Parent(k)] <= a[k]
    {
      if a[Parent(i)] > a[i] {
        return false;
      }
    }
  }
  return true;
}

// Auxiliary function that gives the parent index of a non-root node (with index > 0) in a heap.
function Parent(i: nat): nat
  requires i > 0
{ 
  (i-1)/2 
}

// Test cases checked statically.
method IsMinHeapTest(){
  // Totally sorted
  var a1:= new int[] [1, 2, 3, 4, 5, 6];
  var res1:=IsMinHeap(a1);
  assert res1;

  // Partially sorted
  var a2:= new int[] [2, 4, 3, 5, 10, 15];
  var res2 := IsMinHeap(a2);
  assert res2;

  // Not partially sorted
  var a3:= new int[] [2, 10, 4, 5, 3, 15];
  var res3 := IsMinHeap(a3);
  assert Parent(3) == 1 && a3[1] > a3[3]; // proof helper (counter-example)
  assert !res3;


}

method TestsForIsMinHeap()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: forall i: int :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  //   ENSURES: result <==> forall i: int :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[1] [-10];
    var result := IsMinHeap(a);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: 1 <= (a.Length - 1)
  //   POST: !(a[Parent(1)] <= a[1])
  //   ENSURES: result <==> forall i: int :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[2] [10, 9];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {3}:
  //   POST: !result
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  //   ENSURES: result <==> forall i: int :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[6] [-9, 7, -10, 6, 6, -11];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {1}/O|a|=0:
  //   POST: result
  //   POST: forall i: int :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  //   ENSURES: result <==> forall i: int :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[0] [];
    var result := IsMinHeap(a);
    expect result == true;
  }

}

method Main()
{
  TestsForIsMinHeap();
  print "TestsForIsMinHeap: all non-failing tests passed!\n";
}
