// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_vampire project_original_Searching__506_VER_key.dfy
// Method: Find
// Generated: 2026-03-25 22:55:54

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


method Passing()
{
  // Test case for combination {2}:
  //   PRE:  blood != null
  //   POST: !(0 <= index)
  //   POST: forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[1] [11];
    var key := 9;
    var index := Find(blood, key);
    expect index == -1;
  }

  // Test case for combination {3}:
  //   PRE:  blood != null
  //   POST: index < blood.Length
  //   POST: blood[index] == key
  //   POST: !(index < 0)
  {
    var blood := new int[1] [10];
    var key := 10;
    var index := Find(blood, key);
    expect index == 0;
  }

  // Test case for combination {2}:
  //   PRE:  blood != null
  //   POST: !(0 <= index)
  //   POST: forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[0] [];
    var key := 10;
    var index := Find(blood, key);
    expect index == -1;
  }

  // Test case for combination {3}:
  //   PRE:  blood != null
  //   POST: index < blood.Length
  //   POST: blood[index] == key
  //   POST: !(index < 0)
  {
    var blood := new int[1] [12];
    var key := 12;
    var index := Find(blood, key);
    expect index == 0;
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
