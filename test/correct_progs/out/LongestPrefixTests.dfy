// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\correct_progs\in\LongestPrefix.dfy
// Method: LongestPrefix
// Generated: 2026-03-22 23:59:11

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
  // Test case for combination {3}:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: a[i] != b[i]
  {
    var a := new int[1] [6];
    var b := new int[1] [5];
    var i := LongestPrefix(a, b);
    expect i <= a.Length;
    expect i <= b.Length;
    expect a[..i] == b[..i];
    expect a[i] != b[i];
  }

  // Test case for combination {3}/Ba=1,b=2:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: a[i] != b[i]
  {
    var a := new int[1] [6];
    var b := new int[2] [8, 7];
    var i := LongestPrefix(a, b);
    expect i <= a.Length;
    expect i <= b.Length;
    expect a[..i] == b[..i];
    expect a[i] != b[i];
  }

  // Test case for combination {3}/Ba=1,b=3:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: a[i] != b[i]
  {
    var a := new int[1] [7];
    var b := new int[3] [9, 8, 10];
    var i := LongestPrefix(a, b);
    expect i <= a.Length;
    expect i <= b.Length;
    expect a[..i] == b[..i];
    expect a[i] != b[i];
  }

  // Test case for combination {3}/Ba=2,b=1:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: a[i] != b[i]
  {
    var a := new int[2] [8, 7];
    var b := new int[1] [6];
    var i := LongestPrefix(a, b);
    expect i <= a.Length;
    expect i <= b.Length;
    expect a[..i] == b[..i];
    expect a[i] != b[i];
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
