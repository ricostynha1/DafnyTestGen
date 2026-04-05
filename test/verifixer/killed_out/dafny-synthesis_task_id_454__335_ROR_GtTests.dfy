// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\killed\dafny-synthesis_task_id_454__335_ROR_Gt.dfy
// Method: ContainsZ
// Generated: 2026-04-05 23:42:10

// dafny-synthesis_task_id_454.dfy

method ContainsZ(s: string) returns (result: bool)
  ensures result <==> exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  decreases s
{
  result := false;
  for i: int := 0 to |s|
    invariant 0 <= i <= |s|
    invariant result <==> exists k: int {:trigger s[k]} :: (0 <= k < i && s[k] == 'z') || (0 <= k < i && s[k] == 'Z')
  {
    if s[i] == 'z' || s[i] > 'Z' {
      result := true;
      break;
    }
  }
}


method Passing()
{
  // Test case for combination {2}:
  //   POST: !result
  //   POST: !exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := [' '];
    var result := ContainsZ(s);
    expect result == false;
  }

  // Test case for combination {1}/Bs=2:
  //   POST: result
  //   POST: exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := ['z', '{'];
    var result := ContainsZ(s);
    expect result == true;
  }

  // Test case for combination {1}/Bs=3:
  //   POST: result
  //   POST: exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := ['z', '{', '|'];
    var result := ContainsZ(s);
    expect result == true;
  }

}

method Failing()
{
  // Test case for combination {1}:
  //   POST: result
  //   POST: exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := ['Z'];
    var result := ContainsZ(s);
    // expect result == true;
  }

}

method Main()
{
  Passing();
  Failing();
}
