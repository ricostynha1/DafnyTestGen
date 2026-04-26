// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\dafny-synthesis_task_id_454__330-338_COI.dfy
// Method: ContainsZ
// Generated: 2026-04-24 10:16:33

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
    if s[i] == 'z' || !(s[i] == 'Z') {
      result := true;
      break;
    }
  }
}


method TestsForContainsZ()
{
  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {1}:
  //   POST Q1: result
  //   POST Q2: exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := ['Z'];
    var result := ContainsZ(s);
    // expect result == true; // got false
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}:
  //   POST Q1: !result
  //   POST Q2: !exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := ['~'];
    var result := ContainsZ(s);
    // expect result == false; // got true
  }

  // Test case for combination {1}/O|s|>=2:
  //   POST Q1: result
  //   POST Q2: exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := ['~', 'z'];
    var result := ContainsZ(s);
    expect result == true;
  }

  // Test case for combination {2}/O|s|=0:
  //   POST Q1: !result
  //   POST Q2: !exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := [];
    var result := ContainsZ(s);
    expect result == false;
  }

  // FAILING: expects commented out; see VAL/RHS annotations below
  // Test case for combination {2}/O|s|>=2:
  //   POST Q1: !result
  //   POST Q2: !exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := ['Y', '!'];
    var result := ContainsZ(s);
    // expect result == false; // got true
  }

  // Test case for combination {1}/R3:
  //   POST Q1: result
  //   POST Q2: exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := ['z'];
    var result := ContainsZ(s);
    expect result == true;
  }

  // Test case for combination {1}/R4:
  //   POST Q1: result
  //   POST Q2: exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := ['Z', '('];
    var result := ContainsZ(s);
    expect result == true;
  }

  // Test case for combination {1}/R5:
  //   POST Q1: result
  //   POST Q2: exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := ['z', '~'];
    var result := ContainsZ(s);
    expect result == true;
  }

  // Test case for combination {1}/R6:
  //   POST Q1: result
  //   POST Q2: exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := ['Z', '\U{0027}'];
    var result := ContainsZ(s);
    expect result == true;
  }

  // Test case for combination {1}/R7:
  //   POST Q1: result
  //   POST Q2: exists i: int {:trigger s[i]} :: (0 <= i < |s| && s[i] == 'z') || (0 <= i < |s| && s[i] == 'Z')
  {
    var s: seq<char> := ['Z', '&'];
    var result := ContainsZ(s);
    expect result == true;
  }

}

method Main()
{
  TestsForContainsZ();
  print "TestsForContainsZ: all non-failing tests passed!\n";
}
