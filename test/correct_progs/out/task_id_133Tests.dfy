// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_133.dfy
// Method: CalcSumOfNegatives
// Generated: 2026-04-17 13:35:54

// Recursive definition of the sum of negative numbers in
// an array 'a' up to index 'n' (exclusive).  
function {:fuel 4} SumOfNegatives(a: array<int>, n: nat := a.Length) : (result: int)
  requires 0 <= n <= a.Length
  reads a
{
  if n == 0 then 0 
  else if a[n-1] < 0 then SumOfNegatives(a, n-1) + a[n-1] 
  else SumOfNegatives(a, n-1)
}

// Iterative implementatiom.
// Returns the sum of the negative numbers in an array 'a'.  
method CalcSumOfNegatives(a: array<int>) returns (result: int)
  ensures result == SumOfNegatives(a)
{
  result := 0;
  for i := 0 to a.Length
    invariant result == SumOfNegatives(a, i)
  {
    if a[i] < 0 {
      result := result + a[i];
    }
  }
}

// Test cases checked statically.
method SumOfNegativesTest(){
  var a1 := new int[] [2, -6, -9];
  var out1 := CalcSumOfNegatives(a1);
  assert out1 == -15;

  var a2 := new int[] [10, -14, 13];
  var out2 := CalcSumOfNegatives(a2);
  assert out2 == -14;
}

method TestsForCalcSumOfNegatives()
{
  // Test case for combination {1}:
  //   POST: result == SumOfNegatives(a)
  //   POST: result == 0
  //   ENSURES: result == SumOfNegatives(a)
  {
    var a := new int[0] [];
    var result := CalcSumOfNegatives(a);
    expect result == 0;
  }

  // Test case for combination {2}:
  //   POST: !(a.Length == 0)
  //   POST: result == if a[a.Length - 1] < 0 then SumOfNegatives(a, a.Length - 1) + a[a.Length - 1] else SumOfNegatives(a, a.Length - 1)
  //   ENSURES: result == SumOfNegatives(a)
  {
    var a := new int[1] [2];
    var result := CalcSumOfNegatives(a);
    expect result == 0;
  }

  // Test case for combination {2}/O|a|>=2:
  //   POST: !(a.Length == 0)
  //   POST: result == if a[a.Length - 1] < 0 then SumOfNegatives(a, a.Length - 1) + a[a.Length - 1] else SumOfNegatives(a, a.Length - 1)
  //   ENSURES: result == SumOfNegatives(a)
  {
    var a := new int[2] [3, 4];
    var result := CalcSumOfNegatives(a);
    expect result == 0;
  }

  // Test case for combination {2}/Oresult>0:
  //   POST: !(a.Length == 0)
  //   POST: result == if a[a.Length - 1] < 0 then SumOfNegatives(a, a.Length - 1) + a[a.Length - 1] else SumOfNegatives(a, a.Length - 1)
  //   ENSURES: result == SumOfNegatives(a)
  {
    var a := new int[1] [5];
    var result := CalcSumOfNegatives(a);
    expect result == 0;
  }

}

method Main()
{
  TestsForCalcSumOfNegatives();
  print "TestsForCalcSumOfNegatives: all non-failing tests passed!\n";
}
