// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_133.dfy
// Method: CalcSumOfNegatives
// Generated: 2026-04-08 00:06:16

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

method Passing()
{
  // Test case for combination {1}:
  //   POST: result == SumOfNegatives(a)
  {
    var a := new int[0] [];
    var result := CalcSumOfNegatives(a);
    expect result == 0;
  }

  // Test case for combination {1}/Ba=1:
  //   POST: result == SumOfNegatives(a)
  {
    var a := new int[1] [2];
    var result := CalcSumOfNegatives(a);
    expect result == 0;
  }

  // Test case for combination {1}/Ba=2:
  //   POST: result == SumOfNegatives(a)
  {
    var a := new int[2] [4, 3];
    var result := CalcSumOfNegatives(a);
    expect result == 0;
  }

  // Test case for combination {1}/Ba=3:
  //   POST: result == SumOfNegatives(a)
  {
    var a := new int[3] [5, 4, 6];
    var result := CalcSumOfNegatives(a);
    expect result == 0;
  }

  // Test case for combination {1}/Oresult>0:
  //   POST: result == SumOfNegatives(a)
  {
    var a := new int[4] [5, 6, 7, 8];
    var result := CalcSumOfNegatives(a);
    expect result == 0;
  }

  // Test case for combination {1}/Oresult<0:
  //   POST: result == SumOfNegatives(a)
  {
    var a := new int[5] [6, 7, 8, 9, 10];
    var result := CalcSumOfNegatives(a);
    expect result == 0;
  }

  // Test case for combination {1}/Oresult=0:
  //   POST: result == SumOfNegatives(a)
  {
    var a := new int[6] [7, 8, 9, 10, 11, 12];
    var result := CalcSumOfNegatives(a);
    expect result == 0;
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
