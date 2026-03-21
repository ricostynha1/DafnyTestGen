// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\correct_progs\in\task_id_433.dfy
// Method: IsGreater
// Generated: 2026-03-21 12:22:06

// Checks if a number 'n' is greater than all elements in an array 'a'
method IsGreater(n: int, a: array<int>) returns (result: bool)
    ensures result <==> (forall i :: 0 <= i < a.Length ==> n > a[i])
{
    for i := 0 to a.Length
        invariant forall k :: 0 <= k < i ==> n > a[k]
    {
        if n <= a[i] {
            return false;
        }
    }
    return true;
}


method GeneratedTests_IsGreater()
{
  // Test case for combination {1}/Bn=0,a=0:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 0;
    var a := new int[0] [];
    var result := IsGreater(n, a);
    expect result == true;
  }

  // Test case for combination {1}/Bn=0,a=1:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 0;
    var a := new int[1] [-1];
    var result := IsGreater(n, a);
    expect result == true;
  }

  // Test case for combination {1}/Bn=0,a=2:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 0;
    var a := new int[2] [-2, -1];
    var result := IsGreater(n, a);
    expect result == true;
  }

  // Test case for combination {1}/Bn=0,a=3:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 0;
    var a := new int[3] [-3, -2, -1];
    var result := IsGreater(n, a);
    expect result == true;
  }

  // Test case for combination {1}/Bn=1,a=0:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 1;
    var a := new int[0] [];
    var result := IsGreater(n, a);
    expect result == true;
  }

  // Test case for combination {1}/Bn=1,a=1:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 1;
    var a := new int[1] [-38];
    var result := IsGreater(n, a);
    expect result == true;
  }

  // Test case for combination {1}/Bn=1,a=2:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 1;
    var a := new int[2] [-39, -38];
    var result := IsGreater(n, a);
    expect result == true;
  }

  // Test case for combination {1}/Bn=1,a=3:
  //   POST: result
  //   POST: forall i :: 0 <= i < a.Length ==> n > a[i]
  {
    var n := 1;
    var a := new int[3] [-40, -39, -38];
    var result := IsGreater(n, a);
    expect result == true;
  }

  // Test case for combination {2}/Bn=0,a=2:
  //   POST: !(result)
  //   POST: !(n > a[0])
  {
    var n := 0;
    var a := new int[2] [2437, -1];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2}/Bn=0,a=3:
  //   POST: !(result)
  //   POST: !(n > a[0])
  {
    var n := 0;
    var a := new int[3] [1236, -2, -1];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2}/Bn=1,a=2:
  //   POST: !(result)
  //   POST: !(n > a[0])
  {
    var n := 1;
    var a := new int[2] [2438, -8855];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2}/Bn=1,a=3:
  //   POST: !(result)
  //   POST: !(n > a[0])
  {
    var n := 1;
    var a := new int[3] [1237, -7720, -7719];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {3}/Bn=0,a=3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  {
    var n := 0;
    var a := new int[3] [-2, 38, -1];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {3}/Bn=1,a=3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  {
    var n := 1;
    var a := new int[3] [-1797, 39, -1796];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,3}/Bn=0,a=3:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  {
    var n := 0;
    var a := new int[3] [1236, 1237, -1];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,3}/Bn=1,a=3:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  {
    var n := 1;
    var a := new int[3] [1797, 1796, -8365];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {4}/Bn=0,a=2:
  //   POST: !(result)
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 0;
    var a := new int[2] [-1, 2437];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {4}/Bn=0,a=3:
  //   POST: !(result)
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 0;
    var a := new int[3] [-2, -1, 7719];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {4}/Bn=1,a=2:
  //   POST: !(result)
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 1;
    var a := new int[2] [-8855, 39];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {4}/Bn=1,a=3:
  //   POST: !(result)
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 1;
    var a := new int[3] [-1237, -1236, 7720];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,4}/Bn=0,a=1:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 0;
    var a := new int[1] [1236];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,4}/Bn=0,a=2:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 0;
    var a := new int[2] [7719, 7720];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,4}/Bn=0,a=3:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 0;
    var a := new int[3] [1236, -1, 3674];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,4}/Bn=1,a=1:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 1;
    var a := new int[1] [1];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,4}/Bn=1,a=2:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 1;
    var a := new int[2] [39, 40];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,4}/Bn=1,a=3:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 1;
    var a := new int[3] [1237, -2437, 1276];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {3,4}/Bn=0,a=3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 0;
    var a := new int[3] [-1, 7720, 7719];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {3,4}/Bn=1,a=3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 1;
    var a := new int[3] [-8365, 7721, 7720];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,3,4}/Bn=0,a=3:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 0;
    var a := new int[3] [2437, 3675, 2438];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,3,4}/Bn=1,a=3:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := 1;
    var a := new int[3] [1237, 1239, 1238];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {3}/R3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  {
    var n := -1237;
    var a := new int[4] [-1238, 37, 23, -1238];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,3}/R3:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  {
    var n := -1;
    var a := new int[4] [37, 1235, 22, -2];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {3,4}/R3:
  //   POST: !(result)
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := -1;
    var a := new int[4] [-2, 7718, 22, 37];
    var result := IsGreater(n, a);
    expect result == false;
  }

  // Test case for combination {2,3,4}/R3:
  //   POST: !(result)
  //   POST: !(n > a[0])
  //   POST: exists i :: 1 <= i < (a.Length - 1) && !(n > a[i])
  //   POST: !(n > a[(a.Length - 1)])
  {
    var n := -1;
    var a := new int[4] [37, 7718, 22, 2436];
    var result := IsGreater(n, a);
    expect result == false;
  }

}

method Main()
{
  GeneratedTests_IsGreater();
  print "GeneratedTests_IsGreater: all tests passed!\n";
}
