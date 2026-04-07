// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_755.dfy
// Method: SecondSmallest
// Generated: 2026-04-06 23:27:42


// Obtains the smallest and second smallest element in an array of integers (in a single scan).
// The array must have at least two distinct elements.
method SecondSmallest(s: array<int>) returns (smallest: int, secondSmallest: int)
    requires exists i, j :: 0 <= i < j < s.Length && s[i] != s[j]
    ensures smallest in s[..]
    ensures forall k :: 0 <= k < s.Length ==> s[k] >= smallest 
    ensures secondSmallest in s[..] && secondSmallest > smallest
    ensures forall k :: 0 <= k < s.Length && s[k] != smallest ==> s[k] >= secondSmallest 
{
    // index of the smallest element inspected so far.
    var minIndex := 0; 

    // or -1 if all elements are equal so far.
    var secondMinIndex := -1; 

    for i := 1 to s.Length
      invariant 0 <= minIndex < i
      invariant -1 <= secondMinIndex < i
      invariant secondMinIndex != -1 ==> s[secondMinIndex] > s[minIndex]
      invariant forall k :: 0 <= k < i ==> s[k] == s[minIndex] || (secondMinIndex != -1 && s[k] >= s[secondMinIndex])
    {
        if s[i] < s[minIndex] {
            secondMinIndex := minIndex;
            minIndex := i;
        } else if s[i] > s[minIndex] && (secondMinIndex == -1 || s[i] < s[secondMinIndex]) {
            secondMinIndex := i;
        }
    }

    return s[minIndex], s[secondMinIndex];
}

// Test cases checked statically.
method SecondSmallestTest(){
    var a1:= new int[] [1, 2, -8, -2, -2, -8];
    assert a1[2] != a1[3]; // proof helper (example for precondition)
    var s1, out1 := SecondSmallest(a1);
    assert  s1 == -8 && out1 == -2;

    var a2:= new int[] [2, 2, 1];
    assert a2[0] != a2[2];
    var s2, out2 := SecondSmallest(a2);
    assert s2 == 1 && out2 == 2;

    var a3:= new int[] [-2, -3, -1];
    assert a3[1] != a3[0];
    var s3, out3 := SecondSmallest(a3);
    assert s3 == -3 && out3 == -2;
}

method Passing()
{
  // Test case for combination {1}:
  //   PRE:  exists i, j :: 0 <= i < j < s.Length && s[i] != s[j]
  //   POST: smallest in s[..]
  //   POST: forall k :: 0 <= k < s.Length ==> s[k] >= smallest
  //   POST: secondSmallest in s[..]
  //   POST: secondSmallest > smallest
  //   POST: forall k :: 0 <= k < s.Length && s[k] != smallest ==> s[k] >= secondSmallest
  {
    var s := new int[2] [0, 1];
    var smallest, secondSmallest := SecondSmallest(s);
    expect smallest == 0;
    expect secondSmallest == 1;
  }

  // Test case for combination {1}/Bs=3:
  //   PRE:  exists i, j :: 0 <= i < j < s.Length && s[i] != s[j]
  //   POST: smallest in s[..]
  //   POST: forall k :: 0 <= k < s.Length ==> s[k] >= smallest
  //   POST: secondSmallest in s[..]
  //   POST: secondSmallest > smallest
  //   POST: forall k :: 0 <= k < s.Length && s[k] != smallest ==> s[k] >= secondSmallest
  {
    var s := new int[3] [0, 1, 40];
    var smallest, secondSmallest := SecondSmallest(s);
    expect smallest == 0;
    expect secondSmallest == 1;
  }

  // Test case for combination {1}/Osmallest>0:
  //   PRE:  exists i, j :: 0 <= i < j < s.Length && s[i] != s[j]
  //   POST: smallest in s[..]
  //   POST: forall k :: 0 <= k < s.Length ==> s[k] >= smallest
  //   POST: secondSmallest in s[..]
  //   POST: secondSmallest > smallest
  //   POST: forall k :: 0 <= k < s.Length && s[k] != smallest ==> s[k] >= secondSmallest
  {
    var s := new int[4] [7760, 7758, 7759, 7761];
    var smallest, secondSmallest := SecondSmallest(s);
    expect smallest == 7758;
    expect secondSmallest == 7759;
  }

  // Test case for combination {1}/Osmallest<0:
  //   PRE:  exists i, j :: 0 <= i < j < s.Length && s[i] != s[j]
  //   POST: smallest in s[..]
  //   POST: forall k :: 0 <= k < s.Length ==> s[k] >= smallest
  //   POST: secondSmallest in s[..]
  //   POST: secondSmallest > smallest
  //   POST: forall k :: 0 <= k < s.Length && s[k] != smallest ==> s[k] >= secondSmallest
  {
    var s := new int[5] [-7721, -7720, -7719, -7718, -7717];
    var smallest, secondSmallest := SecondSmallest(s);
    expect smallest == -7721;
    expect secondSmallest == -7720;
  }

  // Test case for combination {1}/Osmallest=0:
  //   PRE:  exists i, j :: 0 <= i < j < s.Length && s[i] != s[j]
  //   POST: smallest in s[..]
  //   POST: forall k :: 0 <= k < s.Length ==> s[k] >= smallest
  //   POST: secondSmallest in s[..]
  //   POST: secondSmallest > smallest
  //   POST: forall k :: 0 <= k < s.Length && s[k] != smallest ==> s[k] >= secondSmallest
  {
    var s := new int[8] [0, 1, 40, 41, 42, 43, 44, 45];
    var smallest, secondSmallest := SecondSmallest(s);
    expect smallest == 0;
    expect secondSmallest == 1;
  }

  // Test case for combination {1}/OsecondSmallest>0:
  //   PRE:  exists i, j :: 0 <= i < j < s.Length && s[i] != s[j]
  //   POST: smallest in s[..]
  //   POST: forall k :: 0 <= k < s.Length ==> s[k] >= smallest
  //   POST: secondSmallest in s[..]
  //   POST: secondSmallest > smallest
  //   POST: forall k :: 0 <= k < s.Length && s[k] != smallest ==> s[k] >= secondSmallest
  {
    var s := new int[7] [7757, 7758, 7759, 7760, 7761, 7763, 7762];
    var smallest, secondSmallest := SecondSmallest(s);
    expect smallest == 7757;
    expect secondSmallest == 7758;
  }

  // Test case for combination {1}/OsecondSmallest<0:
  //   PRE:  exists i, j :: 0 <= i < j < s.Length && s[i] != s[j]
  //   POST: smallest in s[..]
  //   POST: forall k :: 0 <= k < s.Length ==> s[k] >= smallest
  //   POST: secondSmallest in s[..]
  //   POST: secondSmallest > smallest
  //   POST: forall k :: 0 <= k < s.Length && s[k] != smallest ==> s[k] >= secondSmallest
  {
    var s := new int[6] [-7721, -7720, -7719, -7718, -7716, -7717];
    var smallest, secondSmallest := SecondSmallest(s);
    expect smallest == -7721;
    expect secondSmallest == -7720;
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
