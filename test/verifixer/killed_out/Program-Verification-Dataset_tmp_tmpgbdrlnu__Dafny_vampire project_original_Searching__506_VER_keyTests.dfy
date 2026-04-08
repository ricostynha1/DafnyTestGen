// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\Program-Verification-Dataset_tmp_tmpgbdrlnu__Dafny_vampire project_original_Searching__506_VER_key.dfy
// Method: Find
// Generated: 2026-04-08 16:21:44

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
  // Test case for combination {6}:
  //   PRE:  blood != null
  //   POST: 0 <= index
  //   POST: index < blood.Length
  //   POST: blood[index] == key
  //   POST: !(index < 0)
  //   POST: 0 < blood.Length
  //   POST: !(blood[0] != key)
  //   ENSURES: 0 <= index ==> index < blood.Length && blood[index] == key
  //   ENSURES: index < 0 ==> forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[1] [4];
    var key := 4;
    var index := Find(blood, key);
    expect index == 0;
  }

  // Test case for combination {6}/Bblood=1,key=0:
  //   PRE:  blood != null
  //   POST: 0 <= index
  //   POST: index < blood.Length
  //   POST: blood[index] == key
  //   POST: !(index < 0)
  //   POST: 0 < blood.Length
  //   POST: !(blood[0] != key)
  //   ENSURES: 0 <= index ==> index < blood.Length && blood[index] == key
  //   ENSURES: index < 0 ==> forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[1] [0];
    var key := 0;
    var index := Find(blood, key);
    expect index == 0;
  }

  // Test case for combination {6}/Oindex=0:
  //   PRE:  blood != null
  //   POST: 0 <= index
  //   POST: index < blood.Length
  //   POST: blood[index] == key
  //   POST: !(index < 0)
  //   POST: 0 < blood.Length
  //   POST: !(blood[0] != key)
  //   ENSURES: 0 <= index ==> index < blood.Length && blood[index] == key
  //   ENSURES: index < 0 ==> forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[2] [15, 13];
    var key := 15;
    var index := Find(blood, key);
    expect index == 0;
  }

}

method Failing()
{
  // Test case for combination {7}:
  //   PRE:  blood != null
  //   POST: 0 <= index
  //   POST: index < blood.Length
  //   POST: blood[index] == key
  //   POST: !(index < 0)
  //   POST: exists k :: 1 <= k < (blood.Length - 1) && !(blood[k] != key)
  //   ENSURES: 0 <= index ==> index < blood.Length && blood[index] == key
  //   ENSURES: index < 0 ==> forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[3] [17, 10, 24];
    var key := 10;
    var index := Find(blood, key);
    // expect index == 1;
  }

  // Test case for combination {7}/Oindex>0:
  //   PRE:  blood != null
  //   POST: 0 <= index
  //   POST: index < blood.Length
  //   POST: blood[index] == key
  //   POST: !(index < 0)
  //   POST: exists k :: 1 <= k < (blood.Length - 1) && !(blood[k] != key)
  //   ENSURES: 0 <= index ==> index < blood.Length && blood[index] == key
  //   ENSURES: index < 0 ==> forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[4] [19, 18, 18, 16];
    var key := 18;
    var index := Find(blood, key);
    // expect 0 <= index;
    // expect index < blood.Length;
    // expect blood[index] == key;
    // expect !(index < 0);
    // expect exists k :: 1 <= k < (blood.Length - 1) && !(blood[k] != key);
  }

  // Test case for combination {8}/Oindex>0:
  //   PRE:  blood != null
  //   POST: 0 <= index
  //   POST: index < blood.Length
  //   POST: blood[index] == key
  //   POST: !(index < 0)
  //   POST: 0 < blood.Length
  //   POST: !(blood[(blood.Length - 1)] != key)
  //   ENSURES: 0 <= index ==> index < blood.Length && blood[index] == key
  //   ENSURES: index < 0 ==> forall k: int {:trigger blood[k]} :: 0 <= k < blood.Length ==> blood[k] != key
  {
    var blood := new int[2] [18, 10];
    var key := 10;
    var index := Find(blood, key);
    // expect index == 1;
  }

}

method Main()
{
  Passing();
  Failing();
}
