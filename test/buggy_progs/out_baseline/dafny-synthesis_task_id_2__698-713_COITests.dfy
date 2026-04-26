// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_2__698-713_COI.dfy
// Method: SharedElements
// Generated: 2026-04-24 20:01:25

// dafny-synthesis_task_id_2.dfy

predicate InArray(a: array<int>, x: int)
  reads a
  decreases {a}, a, x
{
  exists i: int {:trigger a[i]} :: 
    0 <= i < a.Length &&
    a[i] == x
}

method SharedElements(a: array<int>, b: array<int>) returns (result: seq<int>)
  ensures forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: (x in result ==> InArray(a, x)) && (x in result ==> InArray(b, x))
  ensures forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  decreases a, b
{
  var res: seq<int> := [];
  for i: int := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in res} :: (x in res ==> InArray(a, x)) && (x in res ==> InArray(b, x))
    invariant forall i: int, j: int {:trigger res[j], res[i]} :: 0 <= i < j < |res| ==> res[i] != res[j]
  {
    if !InArray(b, a[i]) && a[i] !in res {
      res := res + [a[i]];
    }
  }
  result := res;
}


method TestsForSharedElements()
{
  // Test case for combination {1}:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: (x in result ==> InArray(a, x)) && (x in result ==> InArray(b, x))
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [33];
    var b := new int[1] [32];
    var result := SharedElements(a, b);
    expect result == [];
  }

  // Test case for combination {1}/O|a|=0:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: (x in result ==> InArray(a, x)) && (x in result ==> InArray(b, x))
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[0] [];
    var b := new int[0] [];
    var result := SharedElements(a, b);
    expect result == [];
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: (x in result ==> InArray(a, x)) && (x in result ==> InArray(b, x))
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[2] [16, 17];
    var b := new int[2] [24, 23];
    var result := SharedElements(a, b);
    expect result == [];
  }

  // Test case for combination {1}/O|result|=1:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: (x in result ==> InArray(a, x)) && (x in result ==> InArray(b, x))
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [8];
    var b := new int[1] [8];
    var result := SharedElements(a, b);
    expect result == [8] || result == [];
  }

  // Test case for combination {1}/O|result|>=2:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: (x in result ==> InArray(a, x)) && (x in result ==> InArray(b, x))
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[3] [9, 11, 11];
    var b := new int[3] [9, 28, 11];
    var result := SharedElements(a, b);
    expect forall x: int  :: (x in result ==> InArray(a, x)) && (x in result ==> InArray(b, x));
    expect forall i: int, j: int :: 0 <= i < j < |result| ==> result[i] != result[j];
  }

  // Test case for combination {1}/R6:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: (x in result ==> InArray(a, x)) && (x in result ==> InArray(b, x))
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [47];
    var b := new int[1] [22];
    var result := SharedElements(a, b);
    expect result == [];
  }

  // Test case for combination {1}/R7:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: (x in result ==> InArray(a, x)) && (x in result ==> InArray(b, x))
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [49];
    var b := new int[1] [36];
    var result := SharedElements(a, b);
    expect result == [];
  }

  // Test case for combination {1}/R8:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: (x in result ==> InArray(a, x)) && (x in result ==> InArray(b, x))
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [27];
    var b := new int[1] [21];
    var result := SharedElements(a, b);
    expect result == [];
  }

  // Test case for combination {1}/R9:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: (x in result ==> InArray(a, x)) && (x in result ==> InArray(b, x))
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [25];
    var b := new int[1] [25];
    var result := SharedElements(a, b);
    expect result == [25] || result == [];
  }

  // Test case for combination {1}/R10:
  //   POST Q1: forall x: int {:trigger InArray(b, x)} {:trigger InArray(a, x)} {:trigger x in result} :: (x in result ==> InArray(a, x)) && (x in result ==> InArray(b, x))
  //   POST Q2: forall i: int, j: int {:trigger result[j], result[i]} :: 0 <= i < j < |result| ==> result[i] != result[j]
  {
    var a := new int[1] [50];
    var b := new int[1] [26];
    var result := SharedElements(a, b);
    expect result == [];
  }

}

method Main()
{
  TestsForSharedElements();
  print "TestsForSharedElements: all tests passed!\n";
}
