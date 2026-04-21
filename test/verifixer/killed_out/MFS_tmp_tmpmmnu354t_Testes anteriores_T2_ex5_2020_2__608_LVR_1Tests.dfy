// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\MFS_tmp_tmpmmnu354t_Testes anteriores_T2_ex5_2020_2__608_LVR_1.dfy
// Method: leq
// Generated: 2026-04-08 16:20:33

// MFS_tmp_tmpmmnu354t_Testes anteriores_T2_ex5_2020_2.dfy

method leq(a: array<int>, b: array<int>) returns (result: bool)
  ensures result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  decreases a, b
{
  var i := 0;
  while i < a.Length && i < b.Length
    invariant 0 <= i <= a.Length && 0 <= i <= b.Length
    invariant a[..i] == b[..i]
    decreases a.Length - i
  {
    if a[i] < b[i] {
      return true;
    } else if a[i] > b[i] {
      return false;
    } else {
      i := i + 1;
    }
  }
  return a.Length <= b.Length;
}

method testLeq()
{
  var b := new int[] [1, 2];
  var a1 := new int[] [];
  var r1 := leq(a1, b);
  assert r1;
  var a2 := new int[] [1];
  var r2 := leq(a2, b);
  assert r2;
  var a3 := new int[] [1, 2];
  var r3 := leq(a3, b);
  assert r3;
  var a4 := new int[] [1, 1, 2];
  var r4 := leq(a4, b);
  assert a4[1] < b[1] && r4;
  var a5 := new int[] [1, 2, 3];
  var r5 := leq(a5, b);
  assert !r5;
  var a6 := new int[] [2];
  var r6 := leq(a6, b);
  assert !r6;
}


method Passing()
{
  // Test case for combination {4}:
  //   POST: result
  //   POST: a.Length <= b.Length
  //   POST: a[..] == b[..a.Length]
  //   POST: !exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  //   ENSURES: result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[0] [];
    var b := new int[0] [];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {5}:
  //   POST: result
  //   POST: !(a.Length <= b.Length)
  //   POST: !(a[..] == b[..a.Length])
  //   POST: 0 < a.Length
  //   POST: 0 < b.Length && a[..0] == b[..0] && a[0] < b[0]
  //   ENSURES: result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[2] [7718, 11];
    var b := new int[1] [7719];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {6}:
  //   POST: result
  //   POST: !(a.Length <= b.Length)
  //   POST: !(a[..] == b[..a.Length])
  //   POST: exists k :: 1 <= k < (a.Length - 1) && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  //   ENSURES: result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[3] [0, 11796, 30612];
    var b := new int[2] [0, 11797];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {11}:
  //   POST: result
  //   POST: a.Length <= b.Length
  //   POST: !(a[..] == b[..a.Length])
  //   POST: 0 < a.Length
  //   POST: 0 < b.Length && a[..0] == b[..0] && a[0] < b[0]
  //   ENSURES: result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[1] [7718];
    var b := new int[1] [7719];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {12}:
  //   POST: result
  //   POST: a.Length <= b.Length
  //   POST: !(a[..] == b[..a.Length])
  //   POST: exists k :: 1 <= k < (a.Length - 1) && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  //   ENSURES: result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[3] [0, 40650, 10449];
    var b := new int[3] [0, 40651, 10450];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {13}:
  //   POST: result
  //   POST: a.Length <= b.Length
  //   POST: !(a[..] == b[..a.Length])
  //   POST: 0 < a.Length
  //   POST: (a.Length - 1) < b.Length && a[..(a.Length - 1)] == b[..(a.Length - 1)] && a[(a.Length - 1)] < b[(a.Length - 1)]
  //   ENSURES: result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[1] [42734];
    var b := new int[1] [42735];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {14}:
  //   POST: !result
  //   POST: !(a.Length <= b.Length)
  //   POST: !(a[..] == b[..a.Length])
  //   POST: !exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  //   ENSURES: result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[1] [2437];
    var b := new int[0] [];
    var result := leq(a, b);
    expect result == false;
  }

  // Test case for combination {16}:
  //   POST: !result
  //   POST: a.Length <= b.Length
  //   POST: !(a[..] == b[..a.Length])
  //   POST: !exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  //   ENSURES: result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[1] [11797];
    var b := new int[1] [8855];
    var result := leq(a, b);
    expect result == false;
  }

  // Test case for combination {5}/Oresult=true:
  //   POST: result
  //   POST: !(a.Length <= b.Length)
  //   POST: !(a[..] == b[..a.Length])
  //   POST: 0 < a.Length
  //   POST: 0 < b.Length && a[..0] == b[..0] && a[0] < b[0]
  //   ENSURES: result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[2] [11796, 30612];
    var b := new int[1] [11797];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {6}/Oresult=true:
  //   POST: result
  //   POST: !(a.Length <= b.Length)
  //   POST: !(a[..] == b[..a.Length])
  //   POST: exists k :: 1 <= k < (a.Length - 1) && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  //   ENSURES: result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[3] [0, 8364, 0];
    var b := new int[2] [0, 8365];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {11}/Oresult=true:
  //   POST: result
  //   POST: a.Length <= b.Length
  //   POST: !(a[..] == b[..a.Length])
  //   POST: 0 < a.Length
  //   POST: 0 < b.Length && a[..0] == b[..0] && a[0] < b[0]
  //   ENSURES: result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[2] [1139, 1141];
    var b := new int[2] [1140, 1140];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {12}/Oresult=true:
  //   POST: result
  //   POST: a.Length <= b.Length
  //   POST: !(a[..] == b[..a.Length])
  //   POST: exists k :: 1 <= k < (a.Length - 1) && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  //   ENSURES: result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[3] [0, -1, 0];
    var b := new int[3] [0, 0, 282];
    var result := leq(a, b);
    expect result == true;
  }

  // Test case for combination {13}/Oresult=true:
  //   POST: result
  //   POST: a.Length <= b.Length
  //   POST: !(a[..] == b[..a.Length])
  //   POST: 0 < a.Length
  //   POST: (a.Length - 1) < b.Length && a[..(a.Length - 1)] == b[..(a.Length - 1)] && a[(a.Length - 1)] < b[(a.Length - 1)]
  //   ENSURES: result <==> (a.Length <= b.Length && a[..] == b[..a.Length]) || exists k: int {:trigger b[k]} {:trigger a[k]} {:trigger b[..k]} {:trigger a[..k]} :: 0 <= k < a.Length && k < b.Length && a[..k] == b[..k] && a[k] < b[k]
  {
    var a := new int[2] [0, 42734];
    var b := new int[2] [0, 42735];
    var result := leq(a, b);
    expect result == true;
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
