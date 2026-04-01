// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_vampire project_original_Searching__506_VER_key.dfy
// Method: Find
// Generated: 2026-04-01 14:02:50

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
    expect blood != null; // PRE-CHECK
    var index := Find(blood, key);
    // expect index == -1; // (actual runtime value — not uniquely determined by spec)
    expect !(0 <= index);
    expect forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key;
  }

  // Test case for combination {3}:
  //   PRE:  blood != null
  //   POST: index < blood.Length
  //   POST: blood[index] == key
  //   POST: !(index < 0)
  {
    var blood := new int[1] [10];
    var key := 10;
    expect blood != null; // PRE-CHECK
    var index := Find(blood, key);
    expect index == 0;
  }

  // Test case for combination {2}/Bblood=2,key=1:
  //   PRE:  blood != null
  //   POST: !(0 <= index)
  //   POST: forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[2] [3, 4];
    var key := 1;
    expect blood != null; // PRE-CHECK
    var index := Find(blood, key);
    // expect index == -1; // (actual runtime value — not uniquely determined by spec)
    expect !(0 <= index);
    expect forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key;
  }

}

method Failing()
{
  // Test case for combination {2}/Bblood=3,key=0:
  //   PRE:  blood != null
  //   POST: !(0 <= index)
  //   POST: forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[3] [4, 5, 6];
    var key := 0;
    // expect blood != null; // PRE-CHECK
    var index := Find(blood, key);
    // expect !(0 <= index);
    // expect forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key;
  }

}

method Main()
{
  Passing();
  Failing();
}
