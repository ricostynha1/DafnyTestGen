// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\correct_progs\in\task_id_804.dfy
// Method: ContainsEvenNumber
// Generated: 2026-03-31 21:47:17

// Checks if an array contains an even number.
method ContainsEvenNumber(a: array<int>) returns (result: bool)
  ensures result <==> exists i :: 0 <= i < a.Length && IsEven(a[i])
{
  result := false;
  for i := 0 to a.Length
    invariant ! exists k :: 0 <= k < i && IsEven(a[k])
  {
    if IsEven(a[i]) {
      result := true;
      break;
    }
  }
}

// Checks if a number is even.
predicate IsEven(n: int) {
  n % 2 == 0
}

method ContainsEvenNumberTest(){
  var a1 := new int[] [1, 2, 3];
  var out1 := ContainsEvenNumber(a1);
  assert IsEven(a1[1]); // proof helper
  assert out1;

  var a2:= new int[] [1, 2, 1, 4];
  var out2 := ContainsEvenNumber(a2);
  assert IsEven(a2[1]);
  assert out2;

  var a3:= new int[] [1,1];
  var out3 := ContainsEvenNumber(a3);
  assert ! out3;
}


method GeneratedTests_ContainsEvenNumber()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: exists i :: 0 <= i < a.Length && IsEven(a[i])
  {
    var a := new int[1] [0];
    var result := ContainsEvenNumber(a);
    expect result == true;
    expect exists i :: 0 <= i < a.Length && IsEven(a[i]);
  }

  // Test case for combination {2}:
  //   POST: !result
  //   POST: !exists i :: 0 <= i < a.Length && IsEven(a[i])
  {
    var a := new int[0] [];
    var result := ContainsEvenNumber(a);
    expect result == false;
    expect !exists i :: 0 <= i < a.Length && IsEven(a[i]);
  }

  // Test case for combination {1}/Ba=2:
  //   POST: result
  //   POST: exists i :: 0 <= i < a.Length && IsEven(a[i])
  {
    var a := new int[2] [0, 3];
    var result := ContainsEvenNumber(a);
    expect result == true;
    expect exists i :: 0 <= i < a.Length && IsEven(a[i]);
  }

  // Test case for combination {1}/Ba=3:
  //   POST: result
  //   POST: exists i :: 0 <= i < a.Length && IsEven(a[i])
  {
    var a := new int[3] [0, 4, 5];
    var result := ContainsEvenNumber(a);
    expect result == true;
    expect exists i :: 0 <= i < a.Length && IsEven(a[i]);
  }

}

method Main()
{
  GeneratedTests_ContainsEvenNumber();
  print "GeneratedTests_ContainsEvenNumber: all tests passed!\n";
}
