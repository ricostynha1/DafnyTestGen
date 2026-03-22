// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\dafny\DafnyTestGen\test\Correct_progs2\in\task_id_755.dfy
// Method: SecondSmallest
// Generated: 2026-03-21 23:20:26


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
  // Test case for combination {1}/Bs=2:
  //   PRE:  exists i, j :: 0 <= i < j < s.Length && s[i] != s[j]
  //   POST: smallest in s[..]
  //   POST: forall k :: 0 <= k < s.Length ==> s[k] >= smallest
  //   POST: secondSmallest in s[..]
  //   POST: secondSmallest > smallest
  //   POST: forall k :: 0 <= k < s.Length && s[k] != smallest ==> s[k] >= secondSmallest
  {
    var s := new int[2] [2616, 2619];
    var smallest, secondSmallest := SecondSmallest(s);
    expect smallest == 2616;
    expect secondSmallest == 2619;
  }

  // Test case for combination {1}/Bs=3:
  //   PRE:  exists i, j :: 0 <= i < j < s.Length && s[i] != s[j]
  //   POST: smallest in s[..]
  //   POST: forall k :: 0 <= k < s.Length ==> s[k] >= smallest
  //   POST: secondSmallest in s[..]
  //   POST: secondSmallest > smallest
  //   POST: forall k :: 0 <= k < s.Length && s[k] != smallest ==> s[k] >= secondSmallest
  {
    var s := new int[3] [840, 843, 842];
    var smallest, secondSmallest := SecondSmallest(s);
    expect smallest == 840;
    expect secondSmallest == 842;
  }

  // Test case for combination {1}/R3:
  //   PRE:  exists i, j :: 0 <= i < j < s.Length && s[i] != s[j]
  //   POST: smallest in s[..]
  //   POST: forall k :: 0 <= k < s.Length ==> s[k] >= smallest
  //   POST: secondSmallest in s[..]
  //   POST: secondSmallest > smallest
  //   POST: forall k :: 0 <= k < s.Length && s[k] != smallest ==> s[k] >= secondSmallest
  {
    var s := new int[4] [6927, 6928, 6926, 6926];
    var smallest, secondSmallest := SecondSmallest(s);
    expect smallest == 6926;
    expect secondSmallest == 6927;
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
