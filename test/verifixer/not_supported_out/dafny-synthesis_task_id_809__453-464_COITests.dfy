// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\not_supported\dafny-synthesis_task_id_809__453-464_COI.dfy
// Method: IsSmaller
// Generated: 2026-03-27 19:21:25

// dafny-synthesis_task_id_809.dfy

method IsSmaller(a: seq<int>, b: seq<int>) returns (result: bool)
  requires |a| == |b|
  ensures result <==> forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  ensures !result <==> exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  decreases a, b
{
  result := true;
  for i: int := 0 to |a|
    invariant 0 <= i <= |a|
    invariant result <==> forall k: int {:trigger b[k]} {:trigger a[k]} :: 0 <= k < i ==> a[k] > b[k]
    invariant !result <==> exists k: int {:trigger b[k]} {:trigger a[k]} :: 0 <= k < i && a[k] <= b[k]
  {
    if !(a[i] <= b[i]) {
      result := false;
      break;
    }
  }
}


method Passing()
{
  // Test case for combination {2}:
  //   PRE:  |a| == |b|
  //   POST: result
  //   POST: forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST: !exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := IsSmaller(a, b);
    expect result == true;
  }

  // Test case for combination {3}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: !forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST: exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [-7719, 21238];
    var b: seq<int> := [38, 22];
    var result := IsSmaller(a, b);
    expect result == false;
  }

}

method Failing()
{
  // Test case for combination {3}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: !forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST: exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [-7719];
    var b: seq<int> := [38];
    var result := IsSmaller(a, b);
    // expect result == false;
  }

  // Test case for combination {2}:
  //   PRE:  |a| == |b|
  //   POST: result
  //   POST: forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST: !exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [7719];
    var b: seq<int> := [7718];
    var result := IsSmaller(a, b);
    // expect result == true;
  }

}

method Main()
{
  Passing();
  Failing();
}
