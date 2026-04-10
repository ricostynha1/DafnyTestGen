// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_751.dfy
// Method: IsMinHeap
// Generated: 2026-04-10 22:34:49

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

method Passing()
{
  // Test case for combination {1}:
  //   POST: result
  //   ENSURES: result <==> forall i :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[0] [];
    var result := IsMinHeap(a);
    expect result == true;
  }

  // Test case for combination {1}/Ba=1:
  //   POST: result
  //   ENSURES: result <==> forall i :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[1] [2];
    var result := IsMinHeap(a);
    expect result == true;
  }

  // Test case for combination {1}/Ba=2:
  //   POST: result
  //   ENSURES: result <==> forall i :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[2] [4, 3];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {1}/Ba=3:
  //   POST: result
  //   ENSURES: result <==> forall i :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[3] [5, 4, 6];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {1}/Oresult=true:
  //   POST: result
  //   ENSURES: result <==> forall i :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[4] [-38, 0, 7719, 21238];
    var result := IsMinHeap(a);
    expect result == true;
  }

  // Test case for combination {1}/Oresult=false:
  //   POST: result
  //   ENSURES: result <==> forall i :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[5] [15, 0, 38, -1, -7720];
    var result := IsMinHeap(a);
    expect result == false;
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
