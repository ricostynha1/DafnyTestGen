// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\LongestPrefix.dfy
// Method: LongestPrefix
// Generated: 2026-04-23 20:27:24

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
  // Test case for combination {1}/Rel:
  //   POST Q1: i <= a.Length
  //   POST Q2: i <= b.Length
  //   POST Q3: a[..i] == b[..i]
  //   POST Q4: i >= a.Length
  {
    var a := new int[1] [-10];
    var b := new int[1] [-10];
    var i := LongestPrefix(a, b);
    expect i == 1;
  }

  // Test case for combination {2}/Rel:
  //   POST Q1: i < a.Length
  //   POST Q2: i <= b.Length
  //   POST Q3: a[..i] == b[..i]
  //   POST Q4: i >= b.Length
  {
    var a := new int[3] [-1, -10, -2];
    var b := new int[1] [-1];
    var i := LongestPrefix(a, b);
    expect i == 1;
  }

  // Test case for combination {3}/Rel:
  //   POST Q1: i < a.Length
  //   POST Q2: i < b.Length
  //   POST Q3: a[..i] == b[..i]
  //   POST Q4: a[i] != b[i]
  {
    var a := new int[5] [10, 5, -10, 53, 54];
    var b := new int[5] [10, 5, -1, 55, 56];
    var i := LongestPrefix(a, b);
    expect i == 2;
  }

  // Test case for combination {1}/Bi=0:
  //   POST Q1: i <= a.Length
  //   POST Q2: i <= b.Length
  //   POST Q3: a[..i] == b[..i]
  //   POST Q4: i >= a.Length
  {
    var a := new int[0] [];
    var b := new int[1] [7];
    var i := LongestPrefix(a, b);
    expect i == 0;
  }

  // Test case for combination {2}/Bi=0:
  //   POST Q1: i < a.Length
  //   POST Q2: i <= b.Length
  //   POST Q3: a[..i] == b[..i]
  //   POST Q4: i >= b.Length
  {
    var a := new int[1] [8];
    var b := new int[0] [];
    var i := LongestPrefix(a, b);
    expect i == 0;
  }

  // Test case for combination {3}/Bi=0:
  //   POST Q1: i < a.Length
  //   POST Q2: i < b.Length
  //   POST Q3: a[..i] == b[..i]
  //   POST Q4: a[i] != b[i]
  {
    var a := new int[1] [-10];
    var b := new int[1] [-9];
    var i := LongestPrefix(a, b);
    expect i == 0;
  }

  // Test case for combination {3}/Bi=1:
  //   POST Q1: i < a.Length
  //   POST Q2: i < b.Length
  //   POST Q3: a[..i] == b[..i]
  //   POST Q4: a[i] != b[i]
  {
    var a := new int[2] [-1, -10];
    var b := new int[2] [-1, -9];
    var i := LongestPrefix(a, b);
    expect i == 1;
  }

  // Test case for combination {1}/O|a|>=2:
  //   POST Q1: i <= a.Length
  //   POST Q2: i <= b.Length
  //   POST Q3: a[..i] == b[..i]
  //   POST Q4: i >= a.Length
  {
    var a := new int[2] [6, -10];
    var b := new int[2] [6, -10];
    var i := LongestPrefix(a, b);
    expect i == 2;
  }

  // Test case for combination {1}/O|b|=0:
  //   POST Q1: i <= a.Length
  //   POST Q2: i <= b.Length
  //   POST Q3: a[..i] == b[..i]
  //   POST Q4: i >= a.Length
  {
    var a := new int[0] [];
    var b := new int[0] [];
    var i := LongestPrefix(a, b);
    expect i == 0;
  }

  // Test case for combination {2}/O|b|>=2:
  //   POST Q1: i < a.Length
  //   POST Q2: i <= b.Length
  //   POST Q3: a[..i] == b[..i]
  //   POST Q4: i >= b.Length
  {
    var a := new int[3] [-10, -10, 6];
    var b := new int[2] [-10, -10];
    var i := LongestPrefix(a, b);
    expect i == 2;
  }

}

method Main()
{
  TestsForLongestPrefix();
  print "TestsForLongestPrefix: all non-failing tests passed!\n";
}
