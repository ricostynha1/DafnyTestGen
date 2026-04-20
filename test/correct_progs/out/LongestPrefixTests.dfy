// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\LongestPrefix.dfy
// Method: LongestPrefix
// Generated: 2026-04-20 22:07:00

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


method TestsForLongestPrefix()
{
  // Test case for combination {3}/Rel:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: i < a.Length
  //   POST: i < b.Length
  //   POST: a[i] != b[i]
  //   ENSURES: i <= a.Length && i <= b.Length
  //   ENSURES: a[..i] == b[..i]
  //   ENSURES: i < a.Length && i < b.Length ==> a[i] != b[i]
  {
    var a := new int[2] [-10, -5];
    var b := new int[2] [-10, -4];
    var i := LongestPrefix(a, b);
    expect i == 1;
  }

  // Test case for combination {1}:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: !(i < a.Length)
  //   ENSURES: i <= a.Length && i <= b.Length
  //   ENSURES: a[..i] == b[..i]
  //   ENSURES: i < a.Length && i < b.Length ==> a[i] != b[i]
  {
    var a := new int[1] [9];
    var b := new int[1] [9];
    var i := LongestPrefix(a, b);
    expect i == 1;
  }

  // Test case for combination {2}:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: i < a.Length
  //   POST: !(i < b.Length)
  //   ENSURES: i <= a.Length && i <= b.Length
  //   ENSURES: a[..i] == b[..i]
  //   ENSURES: i < a.Length && i < b.Length ==> a[i] != b[i]
  {
    var a := new int[2] [9, 8];
    var b := new int[1] [9];
    var i := LongestPrefix(a, b);
    expect i == 1;
  }

  // Test case for combination {1}/Bi=0:
  //   POST: i <= a.Length
  //   POST: i <= b.Length
  //   POST: a[..i] == b[..i]
  //   POST: !(i < a.Length)
  //   ENSURES: i <= a.Length && i <= b.Length
  //   ENSURES: a[..i] == b[..i]
  //   ENSURES: i < a.Length && i < b.Length ==> a[i] != b[i]
  {
    var a := new int[0] [];
    var b := new int[1] [-1];
    var i := LongestPrefix(a, b);
    expect i == 0;
  }

}

method Main()
{
  TestsForLongestPrefix();
  print "TestsForLongestPrefix: all non-failing tests passed!\n";
}
