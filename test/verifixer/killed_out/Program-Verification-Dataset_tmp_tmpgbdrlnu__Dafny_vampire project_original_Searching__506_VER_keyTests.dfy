// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_vampire project_original_Searching__506_VER_key.dfy
// Method: Find
// Generated: 2026-04-22 21:53:06

// Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_vampire project_original_Searching.dfy

method Find(blood: array<int>, key: int) returns (index: int)
  requires blood != null
  ensures 0 <= index ==> index < blood.Length && blood[index] == key
  ensures index < 0 ==> forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  decreases blood, key
{
  index := 0;
  while index < blood.Length
    invariant 0 <= index <= blood.Length
    invariant forall k: int {:trigger blood[k]} :: 0 <= k < index ==> blood[k] != key
    decreases blood.Length - index
  {
    if blood[index] == key {
      return;
    }
    index := key + 1;
  }
  index := -1;
}


method TestsForFind()
{
  // Test case for combination {2}/Rel:
  //   PRE:  blood != null
  //   POST Q1: 0 <= index
  //   POST Q2: index < blood.Length
  //   POST Q3: blood[index] == key
  //   POST Q4: index >= 0
  {
    var blood := new int[2] [-10, -1];
    var key := -10;
    var index := Find(blood, key);
    expect index == 0;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   PRE:  blood != null
  //   POST Q1: 0 <= index ==> index < blood.Length && blood[index] == key
  //   POST Q2: index < 0 ==> forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[1] [-10];
    var key := -9;
    var index := Find(blood, key);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.Find(BigInteger[] blood, BigInteger key) in C:\cygwin64\tmp\DafnyTestGen_lp4c2wc2cqw\runner.cs:line 5814
    // runtime error: at _module.__default.TestCase__1() in C:\cygwin64\tmp\DafnyTestGen_lp4c2wc2cqw\runner.cs:line 5882
    // expect 0 <= index ==> index < blood.Length && blood[index] == key;
    // expect index < 0 ==> forall k: int :: 0 <= k < blood.Length ==> blood[k] != key;
  }

  // Test case for combination {1}/O|blood|=0:
  //   PRE:  blood != null
  //   POST Q1: 0 <= index ==> index < blood.Length && blood[index] == key
  //   POST Q2: index < 0 ==> forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[0] [];
    var key := -10;
    var index := Find(blood, key);
    expect 0 <= index ==> index < blood.Length && blood[index] == key;
    expect index < 0 ==> forall k: int :: 0 <= k < blood.Length ==> blood[k] != key;
    expect index == -1; // observed from implementation
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}/O|blood|>=2:
  //   PRE:  blood != null
  //   POST Q1: 0 <= index ==> index < blood.Length && blood[index] == key
  //   POST Q2: index < 0 ==> forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[2] [-5, -1];
    var key := -6;
    var index := Find(blood, key);
    // runtime error: Unhandled exception. System.IndexOutOfRangeException: Index was outside the bounds of the array.
    // runtime error: at _module.__default.Find(BigInteger[] blood, BigInteger key) in C:\cygwin64\tmp\DafnyTestGen_lp4c2wc2cqw\runner.cs:line 5814
    // runtime error: at _module.__default.TestCase__3() in C:\cygwin64\tmp\DafnyTestGen_lp4c2wc2cqw\runner.cs:line 5962
    // expect 0 <= index ==> index < blood.Length && blood[index] == key;
    // expect index < 0 ==> forall k: int :: 0 <= k < blood.Length ==> blood[k] != key;
  }

}

method Main()
{
  TestsForFind();
  print "TestsForFind: all non-failing tests passed!\n";
}
