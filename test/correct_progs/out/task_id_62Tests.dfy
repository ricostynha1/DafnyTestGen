// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_62.dfy
// Method: FindSmallest
// Generated: 2026-04-08 09:45:57

// Find the smallest number (minimum) in a non-empty array of integers.
method FindSmallest(s: array<int>) returns (min: int)
  requires s.Length > 0
  ensures isMin(s[..], min)
{
  min := s[0];
  for i := 1 to s.Length
    invariant isMin(s[..i], min)
  {
    if s[i] < min {
      min := s[i];
    }
  }
}

// Auxiliary (reusable) predicate to check the minimum of a sequence.
predicate isMin(s: seq<int>, x: int) {
  (x in s) && (forall k :: 0 <= k < |s| ==> x <= s[k])
}

// Test cases checked statically
method FindSmallestTest(){
  // sorted array
  var a1 := new int[] [1, 2, 3];
  var out1 := FindSmallest(a1);
  assert a1[0] == 1; // proof helper (1 is in the array)
  assert out1 == 1;

  // unsorted array
  var a2 := new int[] [3, 2, 1, 4];
  var out2 := FindSmallest(a2);
  assert a2[2] == 1; // proof helper
  assert out2 == 1;

  // unsorted array with duplicate elements
  var a3 := new int[] [3, 3, 1, 4, 1];
  var out3 := FindSmallest(a3);
  assert a3[2] == a3[4] == 1; // proof helper
  assert out3 == 1;
}

method Passing()
{
  // Test case for combination {1}:
  //   PRE:  s.Length > 0
  //   POST: isMin(s[..], min)
  {
    var s := new int[1] [0];
    var min := FindSmallest(s);
    expect min == 0;
  }

  // Test case for combination {1}/Bs=2:
  //   PRE:  s.Length > 0
  //   POST: isMin(s[..], min)
  {
    var s := new int[2] [7718, 7719];
    var min := FindSmallest(s);
    expect min == 7718;
  }

  // Test case for combination {1}/Bs=3:
  //   PRE:  s.Length > 0
  //   POST: isMin(s[..], min)
  {
    var s := new int[3] [28957, 28958, 28959];
    var min := FindSmallest(s);
    expect min == 28957;
  }

  // Test case for combination {1}/Omin>0:
  //   PRE:  s.Length > 0
  //   POST: isMin(s[..], min)
  {
    var s := new int[4] [7758, 7758, 7758, 7758];
    var min := FindSmallest(s);
    expect min == 7758;
  }

  // Test case for combination {1}/Omin<0:
  //   PRE:  s.Length > 0
  //   POST: isMin(s[..], min)
  {
    var s := new int[5] [38, 7719, -1, 21238, 2437];
    var min := FindSmallest(s);
    expect min == -1;
  }

  // Test case for combination {1}/Omin=0:
  //   PRE:  s.Length > 0
  //   POST: isMin(s[..], min)
  {
    var s := new int[6] [38, 7719, 21238, 2437, 8855, 0];
    var min := FindSmallest(s);
    expect min == 0;
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
