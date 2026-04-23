// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_vampire project_original_Searching.dfy
// Method: Find
// Generated: 2026-04-22 21:37:08

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
    index := index + 1;
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
    var blood := new int[2] [-6, -1];
    var key := -6;
    var index := Find(blood, key);
    expect index == 0;
  }

  // Test case for combination {1}:
  //   PRE:  blood != null
  //   POST Q1: 0 <= index ==> index < blood.Length && blood[index] == key
  //   POST Q2: index < 0 ==> forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[1] [3];
    var key := -2;
    var index := Find(blood, key);
    expect 0 <= index ==> index < blood.Length && blood[index] == key;
    expect index < 0 ==> forall k: int :: 0 <= k < blood.Length ==> blood[k] != key;
    expect index == -1; // observed from implementation
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

  // Test case for combination {1}/O|blood|>=2:
  //   PRE:  blood != null
  //   POST Q1: 0 <= index ==> index < blood.Length && blood[index] == key
  //   POST Q2: index < 0 ==> forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[2] [-1, 5];
    var key := 4;
    var index := Find(blood, key);
    expect 0 <= index ==> index < blood.Length && blood[index] == key;
    expect index < 0 ==> forall k: int :: 0 <= k < blood.Length ==> blood[k] != key;
    expect index == -1; // observed from implementation
  }

}

method Main()
{
  TestsForFind();
  print "TestsForFind: all non-failing tests passed!\n";
}
