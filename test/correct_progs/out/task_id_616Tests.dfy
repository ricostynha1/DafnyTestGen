// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_616.dfy
// Method: ElementWiseModulo
// Generated: 2026-04-02 18:13:32

// Given two arrays of integers, a and b (without zeros), of the same length, 
// return an array of the same length, where each element is the remainder 
// of the corresponding element in 'a' divided by the corresponding element in 'b'.
method ElementWiseModulo(a: array<int>, b: array<int>) returns (result: array<int>)
    requires a.Length == b.Length
    requires forall i :: 0 <= i < b.Length ==> b[i] != 0
    ensures fresh(result)
    ensures result.Length == a.Length
    ensures forall i :: 0 <= i < result.Length ==> result[i] == a[i] % b[i]
{
    result := new int[a.Length];
    for i := 0 to a.Length
        invariant forall k :: 0 <= k < i ==> result[k] == a[k] % b[k]
    {
        result[i] := a[i] % b[i];
    }
}

// Test cases checked statically.
method ElementWiseModuloTest(){
    var a1:= new int[] [10, 4, 5, 6];
    var a2:= new int[] [5, 6, 7, 5];
    var res1 := ElementWiseModulo(a1, a2);
    assert res1[..] == [0, 4, 5, 1];

    var a3:= new int[] [11, 5, 6, 7];
    var a4:= new int[] [6, 7, 8, 6];
    var res2 := ElementWiseModulo(a3, a4);
    assert res2[..] == [5, 5, 6, 1];
}



method GeneratedTests_ElementWiseModulo()
{
  // Test case for combination {1}:
  //   PRE:  a.Length == b.Length
  //   PRE:  forall i :: 0 <= i < b.Length ==> b[i] != 0
  //   POST: result.Length == a.Length
  //   POST: forall i :: 0 <= i < result.Length ==> result[i] == a[i] % b[i]
  {
    var a := new int[1] [18];
    var b := new int[1] [12];
    var result := ElementWiseModulo(a, b);
    expect result.Length == a.Length;
    expect forall i :: 0 <= i < result.Length ==> result[i] == a[i] % b[i];
  }

  // Test case for combination {1}/Ba=0,b=0:
  //   PRE:  a.Length == b.Length
  //   PRE:  forall i :: 0 <= i < b.Length ==> b[i] != 0
  //   POST: result.Length == a.Length
  //   POST: forall i :: 0 <= i < result.Length ==> result[i] == a[i] % b[i]
  {
    var a := new int[0] [];
    var b := new int[0] [];
    var result := ElementWiseModulo(a, b);
    expect result.Length == a.Length;
    expect forall i :: 0 <= i < result.Length ==> result[i] == a[i] % b[i];
  }

  // Test case for combination {1}/Ba=2,b=2:
  //   PRE:  a.Length == b.Length
  //   PRE:  forall i :: 0 <= i < b.Length ==> b[i] != 0
  //   POST: result.Length == a.Length
  //   POST: forall i :: 0 <= i < result.Length ==> result[i] == a[i] % b[i]
  {
    var a := new int[2] [6, 5];
    var b := new int[2] [3, 4];
    var result := ElementWiseModulo(a, b);
    expect result.Length == a.Length;
    expect forall i :: 0 <= i < result.Length ==> result[i] == a[i] % b[i];
  }

  // Test case for combination {1}/Ba=3,b=3:
  //   PRE:  a.Length == b.Length
  //   PRE:  forall i :: 0 <= i < b.Length ==> b[i] != 0
  //   POST: result.Length == a.Length
  //   POST: forall i :: 0 <= i < result.Length ==> result[i] == a[i] % b[i]
  {
    var a := new int[3] [8, 7, 9];
    var b := new int[3] [4, 5, 6];
    var result := ElementWiseModulo(a, b);
    expect result.Length == a.Length;
    expect forall i :: 0 <= i < result.Length ==> result[i] == a[i] % b[i];
  }

}

method Main()
{
  GeneratedTests_ElementWiseModulo();
  print "GeneratedTests_ElementWiseModulo: all tests passed!\n";
}
