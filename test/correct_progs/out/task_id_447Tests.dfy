// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_447.dfy
// Method: CubeElements
// Generated: 2026-04-20 14:59:02

// Returns an array of the cubes of the elements of the input array.
method CubeElements(a: array<int>) returns (cubed: array<int>)
    ensures fresh(cubed)
    ensures cubed.Length == a.Length
    ensures forall i :: 0 <= i < a.Length ==> cubed[i] == cube(a[i])
{
    cubed := new int[a.Length];
    for i := 0 to a.Length
        invariant forall j :: 0 <= j < i ==> cubed[j] == cube(a[j])
    {
        cubed[i] := cube(a[i]);
    }
}

function cube(x: int) : int {
     x * x * x
}


// Test cases checked statically.
method CubeElementsTest(){
  var a1 := new int[] [1, 2, 3, 4, 5];
  var res1 := CubeElements(a1);
  assert res1[..] == [1, 8, 27, 64, 125];

  var a2 := new int[] [2, 1, 0, -1, -2];
  var res2 := CubeElements(a2);
  assert res2[..] == [8, 1, 0, -1, -8];
}

method TestsForCubeElements()
{
  // Test case for combination {1}/Rel:
  //   POST: cubed.Length == a.Length
  //   POST: forall i: int :: 0 <= i < a.Length ==> cubed[i] == cube(a[i])
  //   ENSURES: cubed.Length == a.Length
  //   ENSURES: forall i: int :: 0 <= i < a.Length ==> cubed[i] == cube(a[i])
  {
    var a := new int[1] [5];
    var cubed := CubeElements(a);
    expect cubed[..] == [125];
  }

  // Test case for combination {1}/Q|a|>=2:
  //   POST: cubed.Length == a.Length
  //   POST: forall i: int :: 0 <= i < a.Length ==> cubed[i] == cube(a[i])
  //   ENSURES: cubed.Length == a.Length
  //   ENSURES: forall i: int :: 0 <= i < a.Length ==> cubed[i] == cube(a[i])
  {
    var a := new int[2] [-4, -6];
    var cubed := CubeElements(a);
    expect cubed[..] == [-64, -216];
  }

  // Test case for combination {1}/Q|a|=0:
  //   POST: cubed.Length == a.Length
  //   POST: forall i: int :: 0 <= i < a.Length ==> cubed[i] == cube(a[i])
  //   ENSURES: cubed.Length == a.Length
  //   ENSURES: forall i: int :: 0 <= i < a.Length ==> cubed[i] == cube(a[i])
  {
    var a := new int[0] [];
    var cubed := CubeElements(a);
    expect cubed[..] == [];
  }

  // Test case for combination {1}/Q|a|>=2/R3:
  //   POST: cubed.Length == a.Length
  //   POST: forall i: int :: 0 <= i < a.Length ==> cubed[i] == cube(a[i])
  //   ENSURES: cubed.Length == a.Length
  //   ENSURES: forall i: int :: 0 <= i < a.Length ==> cubed[i] == cube(a[i])
  {
    var a := new int[2] [-2, 6];
    var cubed := CubeElements(a);
    expect cubed[..] == [-8, 216];
  }

}

method Main()
{
  TestsForCubeElements();
  print "TestsForCubeElements: all non-failing tests passed!\n";
}
