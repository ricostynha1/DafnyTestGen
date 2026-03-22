// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_751.dfy
// Method: IsMinHeap
// Generated: 2026-03-22 21:19:44

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
  // Test case for combination {1}/Ba=0:
  //   POST: result
  //   POST: forall i :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[0] [];
    var result := IsMinHeap(a);
    expect result == true;
  }

  // Test case for combination {1}/Ba=1:
  //   POST: result
  //   POST: forall i :: 1 <= i < a.Length ==> a[Parent(i)] <= a[i]
  {
    var a := new int[1] [2];
    var result := IsMinHeap(a);
    expect result == true;
  }

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

  // Test case for combination {2}/R2:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  {
    var a := new int[4] [3010, 3009, 7628, 9919];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {2}/R3:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  {
    var a := new int[5] [7554, 6631, 9237, 10350, 7555];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {3}/R1:
  //   POST: !(result)
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  {
    var a := new int[4] [1107, 1108, 1106, 1108];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {3}/R2:
  //   POST: !(result)
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  {
    var a := new int[8] [-1395, 4330, 6203, -2245, 1557, 99, 5353, 454];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {3}/R3:
  //   POST: !(result)
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  {
    var a := new int[7] [5598, 5599, -1062, 5598, 5598, 94, 5853];
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
    var a := new int[8] [2805, 2804, 6401, 5781, 2803, 98, 6400, 5781];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {2,3}/R3:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  {
    var a := new int[7] [10842, 10841, 737, 101, 2001, 736, 8098];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {4}/R2:
  //   POST: !(result)
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[4] [7307, 7308, 7839, 7307];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {4}/R3:
  //   POST: !(result)
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[5] [5840, 5844, 6263, 10860, 5843];
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
    var a := new int[4] [3343, 12746, 3342, 12745];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {3,4}/R2:
  //   POST: !(result)
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[7] [-11635, -8831, -11636, 80, -10223, 96, -11637];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {3,4}/R3:
  //   POST: !(result)
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[6] [-9231, -6956, -18957, 54, -6957, -18958];
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
    var a := new int[8] [3512, 3511, 2276, 937, 85, 88, 92, -6129];
    var result := IsMinHeap(a);
    expect result == false;
  }

  // Test case for combination {2,3,4}/R3:
  //   POST: !(result)
  //   POST: !(a[Parent(1)] <= a[1])
  //   POST: exists i :: 2 <= i < (a.Length - 1) && !(a[Parent(i)] <= a[i])
  //   POST: !(a[Parent((a.Length - 1))] <= a[(a.Length - 1)])
  {
    var a := new int[5] [4683, 4682, 4682, 57, 4681];
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
