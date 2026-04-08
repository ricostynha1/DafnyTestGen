// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\LongestPrefix.dfy
// Method: LongestPrefix
// Generated: 2026-04-08 09:42:08

// Computes the length (i) of the longest common prefix (initial subarray) 
// of two arrays a and b. 
method LongestPrefix(a: array<int>, b: array <int>) returns (i: nat) 
 ensures i <= a.Length && i <= b.Length
 ensures a[..i] == b[..i]
 ensures i < a.Length && i < b.Length ==> a[i] != b[i]
{
    i := 0;
    while i < a.Length && i < b.Length && a[i] == b[i]
        invariant i <= a.Length && i <= b.Length
        invariant a[..i] == b[..i]
    {
        i := i + 1;
    }
}


method Passing()
{
  // Test case for combination {7}:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: i < a.Length
  //   POST: i < b.Length
  //   POST: a[i] != b[i]
  {
    var a := new int[1] [6];
    var b := new int[1] [5];
    var i := LongestPrefix(a, b);
    expect i == 0;
  }

  // Test case for combination {7}/Ba=1,b=2:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: i < a.Length
  //   POST: i < b.Length
  //   POST: a[i] != b[i]
  {
    var a := new int[1] [6];
    var b := new int[2] [8, 7];
    var i := LongestPrefix(a, b);
    expect i == 0;
  }

  // Test case for combination {7}/Ba=1,b=3:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: i < a.Length
  //   POST: i < b.Length
  //   POST: a[i] != b[i]
  {
    var a := new int[1] [7];
    var b := new int[3] [9, 8, 10];
    var i := LongestPrefix(a, b);
    expect i == 0;
  }

  // Test case for combination {7}/Ba=2,b=1:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: i < a.Length
  //   POST: i < b.Length
  //   POST: a[i] != b[i]
  {
    var a := new int[2] [8, 7];
    var b := new int[1] [6];
    var i := LongestPrefix(a, b);
    expect i == 0;
  }

  // Test case for combination {7}/Oi>=2:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: i < a.Length
  //   POST: i < b.Length
  //   POST: a[i] != b[i]
  {
    var a := new int[3] [20, 21, 8];
    var b := new int[3] [20, 21, 7];
    var i := LongestPrefix(a, b);
    expect i == 2;
  }

  // Test case for combination {7}/Oi=1:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: i < a.Length
  //   POST: i < b.Length
  //   POST: a[i] != b[i]
  {
    var a := new int[2] [6, 5];
    var b := new int[2] [6, 4];
    var i := LongestPrefix(a, b);
    expect i == 1;
  }

  // Test case for combination {7}/Oi=0:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: i < a.Length
  //   POST: i < b.Length
  //   POST: a[i] != b[i]
  {
    var a := new int[1] [5];
    var b := new int[1] [4];
    var i := LongestPrefix(a, b);
    expect i == 0;
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
