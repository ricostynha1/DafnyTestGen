// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_809.dfy
// Method: IsSmaller
// Generated: 2026-03-21 23:28:51

// Given two sequences of integers of equal length, checks if the 
// elements in the first sequence are smaller than the elements in the
// second sequence.
method IsSmaller(a: seq<int>, b: seq<int>) returns (result: bool)
  requires |a| == |b|
  ensures result <==> forall i :: 0 <= i < |a| ==> a[i] < b[i]
{
  for i := 0 to |a|
    invariant forall k :: 0 <= k < i ==> a[k] < b[k]
  {
    if a[i] >= b[i] {
      return false;
    }
  }
  return true;
}

method TestIsSmaller(){
  var s1: seq<int> := [2, 3, 4];
  var s2: seq<int> := [1, 2, 3];
  var res1 := IsSmaller(s1, s2);
  assert s1[0] > s2[0]; // helper
  assert res1 == false;

  var s3: seq<int> := [3, 4, 5];
  var s4: seq<int> := [4, 5, 6];
  var res2 := IsSmaller(s3, s4);
  assert res2 == true;

  var s5: seq<int> := [1, 2, 4];
  var s6: seq<int> := [2, 3, 4];
  var res3 := IsSmaller(s5, s6);
  assert s5[2] <= s6[2]; // helper
  assert res3 == false;
}

method Passing()
{
  // Test case for combination {1}/Ba=1,b=1:
  //   PRE:  |a| == |b|
  //   POST: result
  //   POST: forall i :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [7719];
    var b: seq<int> := [7720];
    var result := IsSmaller(a, b);
    expect result == true;
  }

  // Test case for combination {1}/Ba=2,b=2:
  //   PRE:  |a| == |b|
  //   POST: result
  //   POST: forall i :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [1796, 1797];
    var b: seq<int> := [1797, 1798];
    var result := IsSmaller(a, b);
    expect result == true;
  }

  // Test case for combination {1}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: result
  //   POST: forall i :: 0 <= i < |a| ==> a[i] < b[i]
  {
    var a: seq<int> := [-8407, 449, 1627];
    var b: seq<int> := [-8406, 450, 2247];
    var result := IsSmaller(a, b);
    expect result == true;
  }

  // Test case for combination {2}/Ba=2,b=2:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[0] < b[0])
  {
    var a: seq<int> := [2281, 2282];
    var b: seq<int> := [-5438, 2283];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {2}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[0] < b[0])
  {
    var a: seq<int> := [-24871, -16505, -8406];
    var b: seq<int> := [-26013, -16504, -8405];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {3}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  {
    var a: seq<int> := [625, 1236, 627];
    var b: seq<int> := [626, 627, 628];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {2,3}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[0] < b[0])
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  {
    var a: seq<int> := [1887, 1888, 1886];
    var b: seq<int> := [1887, 1888, 1889];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {4}/Ba=2,b=2:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  {
    var a: seq<int> := [8245, 8855];
    var b: seq<int> := [8246, -8330];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {4}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  {
    var a: seq<int> := [607, 608, 609];
    var b: seq<int> := [608, 6463, 609];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {2,4}/Ba=1,b=1:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[0] < b[0])
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  {
    var a: seq<int> := [-5734];
    var b: seq<int> := [-14099];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {2,4}/Ba=2,b=2:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[0] < b[0])
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  {
    var a: seq<int> := [0, 5854];
    var b: seq<int> := [0, 5854];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {2,4}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[0] < b[0])
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  {
    var a: seq<int> := [4010, 4620, 6418];
    var b: seq<int> := [-1843, 4621, 4622];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {3,4}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  {
    var a: seq<int> := [4679, 13539, 4681];
    var b: seq<int> := [4680, 4679, 4681];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {2,3,4}/Ba=3,b=3:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[0] < b[0])
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  {
    var a: seq<int> := [-688, -686, -687];
    var b: seq<int> := [-688, -686, -687];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {2}/R3:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[0] < b[0])
  {
    var a: seq<int> := [2563, 3704, -4252, 1322];
    var b: seq<int> := [281, 4679, 1653, 1323];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {3}/R2:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  {
    var a: seq<int> := [448, 1796, 33, 5853];
    var b: seq<int> := [449, -6569, 36, 5854];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {3}/R3:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  {
    var a: seq<int> := [-10502, 3150, 72, 118, 170, 3151, 154, -3973];
    var b: seq<int> := [-3971, -3974, 129, 155, 177, 1557, 259, -3972];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {2,3}/R2:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[0] < b[0])
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  {
    var a: seq<int> := [1236, 8221, 1594, 608];
    var b: seq<int> := [-4684, 1343, -5284, 609];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {2,3}/R3:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[0] < b[0])
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  {
    var a: seq<int> := [8869, 98, 6283, 88, 608];
    var b: seq<int> := [-4684, 103, 4630, 87, 609];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {4}/R3:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  {
    var a: seq<int> := [1796, 27, 28, 9464];
    var b: seq<int> := [1797, 49, 50, 609];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {3,4}/R2:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  {
    var a: seq<int> := [608, 9725, 974, 8365];
    var b: seq<int> := [609, 7450, -914, 6083];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {3,4}/R3:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  {
    var a: seq<int> := [608, 72, 590, 67, 6283];
    var b: seq<int> := [609, 94, -250, 61, 3286];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {2,3,4}/R2:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[0] < b[0])
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  {
    var a: seq<int> := [7719, 9531, 29, 1108];
    var b: seq<int> := [7719, 9531, 29, 1108];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {2,3,4}/R3:
  //   PRE:  |a| == |b|
  //   POST: !(result)
  //   POST: !(a[0] < b[0])
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] < b[i])
  //   POST: !(a[(|a| - 1)] < b[(|a| - 1)])
  {
    var a: seq<int> := [2439, 2437, 119, 171, 246, 247, 248, 2438];
    var b: seq<int> := [-1074, -1073, 120, 172, 242, 243, 241, -1072];
    var result := IsSmaller(a, b);
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
