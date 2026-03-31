// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_447.dfy
// Method: CubeElements
// Generated: 2026-03-31 21:46:43

// Returns an array of the cubes of the elements of the input array.
method CubeElements(a: array<int>) returns (cubed: array<int>)
    ensures fresh(cubed)
    ensures  IsMapSeq(a[..], cubed[..], cube)
{
    cubed := new int[a.Length];
    for i := 0 to a.Length
        invariant IsMapSeq(a[..i], cubed[..i], cube)
    {
        cubed[i] := cube(a[i]);
    }
}

function cube(x: int) : int {
     x * x * x
}

// Checks if a sequence 't' is the result of applying a function 'f'
// to every element of a sequence 's'.
predicate IsMapSeq<T, E(==)>(s: seq<T>, t: seq<E>, f: T -> E) 
{
  |t| == |s| && forall i :: 0 <= i < |s| ==> t[i] == f(s[i])
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

method GeneratedTests_CubeElements()
{
  // Test case for combination {1}:
  //   POST: IsMapSeq(a[..], cubed[..], cube)
  {
    var a := new int[0] [];
    var cubed := CubeElements(a);
    expect IsMapSeq(a[..], cubed[..], cube);
  }

  // Test case for combination {1}/Ba=1:
  //   POST: IsMapSeq(a[..], cubed[..], cube)
  {
    var a := new int[1] [2];
    var cubed := CubeElements(a);
    expect IsMapSeq(a[..], cubed[..], cube);
  }

  // Test case for combination {1}/Ba=2:
  //   POST: IsMapSeq(a[..], cubed[..], cube)
  {
    var a := new int[2] [4, 3];
    var cubed := CubeElements(a);
    expect IsMapSeq(a[..], cubed[..], cube);
  }

  // Test case for combination {1}/Ba=3:
  //   POST: IsMapSeq(a[..], cubed[..], cube)
  {
    var a := new int[3] [5, 4, 6];
    var cubed := CubeElements(a);
    expect IsMapSeq(a[..], cubed[..], cube);
  }

}

method Main()
{
  GeneratedTests_CubeElements();
  print "GeneratedTests_CubeElements: all tests passed!\n";
}
