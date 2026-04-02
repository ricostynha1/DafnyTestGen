// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_284.dfy
// Method: AllElementsEqualTo
// Generated: 2026-04-02 18:20:57

// Checks if all elements in an array are equal to a given number.
method AllElementsEqualTo<T(==)>(a: array<T>, x: T) returns (result: bool)
  ensures result <==> forall i :: 0 <= i < a.Length ==> a[i] == x
{
  for i := 0 to a.Length
    invariant forall k :: 0 <= k < i ==> a[k] == x
  {
    if a[i] != x {
      return false;
    }
  }
  return true;
}

method AllElementsEqualTest(){
  var a1:= new int[] [1, 3, 5, 7, 9, 2, 4, 6, 8];
  var res1:=AllElementsEqualTo(a1, 3);
  assert a1[0] != 3; // proof helper (counter-example)
  assert !res1;

  var a2:= new int[] [1,1,1,1,1,1,1];
  var res2:=AllElementsEqualTo(a2, 1);
  assert res2;

  var a3 := new int[] [5,6,7,4,8];
  var res3 := AllElementsEqualTo(a3, 6);
  assert a3[2] != 6;
  assert !res3;
}


method GeneratedTests_AllElementsEqualTo()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> a[i] == x
  {
    var a := new int[0] [];
    var x := 0;
    var result := AllElementsEqualTo<int>(a, x);
    expect result == true;
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: !forall i :: 0 <= i < a.Length ==> a[i] == x
  {
    var a := new int[1] [9];
    var x := 8;
    var result := AllElementsEqualTo<int>(a, x);
    expect result == false;
  }

  // Test case for combination {1}/Ba=0,x=1:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> a[i] == x
  {
    var a := new int[0] [];
    var x := 1;
    var result := AllElementsEqualTo<int>(a, x);
    expect result == true;
  }

  // Test case for combination {1}/Ba=1,x=0:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> a[i] == x
  {
    var a := new int[1] [0];
    var x := 0;
    var result := AllElementsEqualTo<int>(a, x);
    expect result == true;
  }

}

method Main()
{
  GeneratedTests_AllElementsEqualTo();
  print "GeneratedTests_AllElementsEqualTo: all tests passed!\n";
}
