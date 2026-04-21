// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_2.dfy
// Method: SharedElements
// Generated: 2026-04-20 22:29:09

// Obtains the set of elements (without duplicates) shared between two arrays. 
method SharedElements<T(==)>(a: array<T>, b: array<T>) returns (result: set<T>)
  ensures forall x :: x in result ==> x in a[..] && x in b[..]
  ensures forall x :: x in a[..] && x in b[..] ==> x in result
{
  result := {};
  for i := 0 to a.Length // loop through the first array
    invariant forall x :: x in result ==> x in a[..i] && x in b[..]
    invariant forall x :: x in a[..i] && x in b[..] ==> x in result
  {
    if a[i] !in result && a[i] in b[..] {
      result := result + {a[i]};
    }
  }
}


// Test cases checked statically.
method SharedElementsTest(){
  // arrays with shared elements and no duplicates
  var a1:= new int[] [3, 4, 5, 6];
  var a2:= new int[] [5, 7, 4, 10];
  assert a1[1] == a2[2] == 4; // proof helper
  assert a1[2] == a2[0] == 5; // proof helper
  var res1 := SharedElements(a1, a2);
  assert res1 == {4, 5};

  // arrays with duplicates and shared elements 
  var a3:= new int[] [1, 3, 3, 4];
  var a4:= new int[] [4, 4, 3, 7];
  assert a3[1] == a4[2] == 3; // proof helper
  assert a3[3] == a4[0] == 4; // proof helper
  var res2 := SharedElements(a3, a4);
  assert res2 == {3, 4};

  // arrays with no shared elements
  var a5:= new int[] [11, 12, 13];
  var a6:= new int[] [17, 15, 14];
  var res3 := SharedElements(a5, a6);
  assert res3 == {};
}

method TestsForSharedElements()
{
  // Test case for combination {1}/Rel:
  //   POST: forall x: int :: x in result ==> x in a[..] && x in b[..]
  //   POST: forall x: int :: x in a[..] && x in b[..] ==> x in result
  //   ENSURES: forall x: int :: x in result ==> x in a[..] && x in b[..]
  //   ENSURES: forall x: int :: x in a[..] && x in b[..] ==> x in result
  {
    var a := new int[1] [-2];
    var b := new int[1] [-2];
    var result := SharedElements<int>(a, b);
    expect result == {-2};
  }

  // Test case for combination {1}/O|a|=0:
  //   POST: forall x: int :: x in result ==> x in a[..] && x in b[..]
  //   POST: forall x: int :: x in a[..] && x in b[..] ==> x in result
  //   ENSURES: forall x: int :: x in result ==> x in a[..] && x in b[..]
  //   ENSURES: forall x: int :: x in a[..] && x in b[..] ==> x in result
  {
    var a := new int[0] [];
    var b := new int[0] [];
    var result := SharedElements<int>(a, b);
    expect result == {};
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST: forall x: int :: x in result ==> x in a[..] && x in b[..]
  //   POST: forall x: int :: x in a[..] && x in b[..] ==> x in result
  //   ENSURES: forall x: int :: x in result ==> x in a[..] && x in b[..]
  //   ENSURES: forall x: int :: x in a[..] && x in b[..] ==> x in result
  {
    var a := new int[2] [3, 4];
    var b := new int[1] [9];
    var result := SharedElements<int>(a, b);
    expect result == {};
  }

  // Test case for combination {1}/O|b|>=2:
  //   POST: forall x: int :: x in result ==> x in a[..] && x in b[..]
  //   POST: forall x: int :: x in a[..] && x in b[..] ==> x in result
  //   ENSURES: forall x: int :: x in result ==> x in a[..] && x in b[..]
  //   ENSURES: forall x: int :: x in a[..] && x in b[..] ==> x in result
  {
    var a := new int[1] [12];
    var b := new int[2] [5, 6];
    var result := SharedElements<int>(a, b);
    expect result == {};
  }

}

method Main()
{
  TestsForSharedElements();
  print "TestsForSharedElements: all non-failing tests passed!\n";
}
