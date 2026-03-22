// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_751.dfy
// Method: IsMinHeap
// Generated: 2026-03-21 23:19:39

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
  // Test case for combination {1}/Ba=2:
  //   POST: result
  //   POST: forall i :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[2] [1236, 1237];
    var result := IsMinHeap(a);
    expect result == true;
  }

  // Test case for combination {1}/Ba=3:
  //   POST: result
  //   POST: forall i :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[3] [1236, 1237, 1238];
    var result := IsMinHeap(a);
    expect result == true;
  }

  // Test case for combination {2}/Ba=3:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  {
    var a := new int[3] [5853, 5852, 5854];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {4}/Ba=3:
  //   POST: !(result)
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[3] [1796, 1797, 1795];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {2,4}/Ba=2:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[2] [3474, 3473];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {2,4}/Ba=3:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[3] [38, 36, 37];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {1}/R3:
  //   POST: result
  //   POST: forall i :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[4] [-12883, -6814, 118, -5497];
    var result := IsMinHeap(a);
    expect result == true;
  }

  // Test case for combination {2}/R2:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  {
    var a := new int[4] [3010, 3009, 10371, 9485];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {2}/R3:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  {
    var a := new int[6] [4366, -1451, 4367, -316, 596, 4367];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {3}/R1:
  //   POST: !(result)
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  {
    var a := new int[4] [4683, 12537, 1470, 19239];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {3}/R2:
  //   POST: !(result)
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  {
    var a := new int[5] [-449, 4048, 68, -3531, 5150];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {3}/R3:
  //   POST: !(result)
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  {
    var a := new int[7] [-5741, -3629, -3628, 81, -7134, -3629, 5903];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {2,3}/R1:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  {
    var a := new int[4] [8322, 2401, 8321, 4679];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {2,3}/R2:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  {
    var a := new int[5] [-2621, -2622, -6853, -8501, 590];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {2,3}/R3:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  {
    var a := new int[8] [-8337, -8338, -7005, -8774, -8339, 113, -7006, 384];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {4}/R3:
  //   POST: !(result)
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[4] [-8167, -8165, 1291, -8166];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {2,4}/R3:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[4] [2429, 2428, 10335, 2427];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {3,4}/R1:
  //   POST: !(result)
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[4] [7417, 11803, 7416, 11802];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {3,4}/R2:
  //   POST: !(result)
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[7] [5876, 5877, 5875, 113, 5872, 5873, 5874];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {3,4}/R3:
  //   POST: !(result)
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[8] [-8191, -5419, -5420, -5420, 55, 56, -5421, -8986];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {2,3,4}/R1:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[4] [1102, 1101, 1101, 1100];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {2,3,4}/R2:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[5] [3961, 3960, -3413, 1343, 3959];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {2,3,4}/R3:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[8] [8936, 8935, 6891, 7066, 108, 6890, 6890, 7065];
    var result := IsMinHeap(a);
    expect result == false;
  }

}

method Failing()
{
  // Test case for combination {4}/Ba=1:
  //   POST: !(result)
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[1] [7719];
    var result := IsMinHeap(a);
    // expect result == false;
  }

}

method Main()
{
  Passing();
  Failing();
}
