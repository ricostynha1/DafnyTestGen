// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\not_supported\dafny-synthesis_task_id_809__453-464_COI.dfy
// Method: IsSmaller
// Generated: 2026-04-08 18:57:29

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
  // Test case for combination {4}:
  //   PRE:  |a| == |b|
  //   POST: result
  //   POST: forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   POST: result
  //   POST: !exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  //   ENSURES: result <==> forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   ENSURES: !result <==> exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [];
    var b: seq<int> := [];
    var result := IsSmaller(a, b);
    expect result == true;
  }

  // Test case for combination {5}/Oresult=false:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: !(a[0] > b[0])
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: a[0] <= b[0]
  //   ENSURES: result <==> forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   ENSURES: !result <==> exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [-2438, 20652];
    var b: seq<int> := [-1, 20651];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {10}/Oresult=false:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] > b[i])
  //   POST: !result
  //   POST: exists i :: 1 <= i < (|a| - 1) && a[i] <= b[i]
  //   ENSURES: result <==> forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   ENSURES: !result <==> exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [2438, 0, 62897, 11797];
    var b: seq<int> := [2437, 21238, 34, 11796];
    var result := IsSmaller(a, b);
    expect result == false;
  }

  // Test case for combination {15}/Oresult=false:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: !(a[(|a| - 1)] > b[(|a| - 1)])
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: a[(|a| - 1)] <= b[(|a| - 1)]
  //   ENSURES: result <==> forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   ENSURES: !result <==> exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [7719, -2];
    var b: seq<int> := [7718, -1];
    var result := IsSmaller(a, b);
    expect result == false;
  }

}

method Failing()
{
  // Test case for combination {5}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: !(a[0] > b[0])
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: a[0] <= b[0]
  //   ENSURES: result <==> forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   ENSURES: !result <==> exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [-7719];
    var b: seq<int> := [38];
    var result := IsSmaller(a, b);
    // expect result == false;
  }

  // Test case for combination {6}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: !(a[0] > b[0])
  //   POST: !result
  //   POST: exists i :: 1 <= i < (|a| - 1) && a[i] <= b[i]
  //   ENSURES: result <==> forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   ENSURES: !result <==> exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [38, 21238, 25];
    var b: seq<int> := [38, 21238, 25];
    var result := IsSmaller(a, b);
    // expect result == false;
  }

  // Test case for combination {7}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: !(a[0] > b[0])
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: a[(|a| - 1)] <= b[(|a| - 1)]
  //   ENSURES: result <==> forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   ENSURES: !result <==> exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [0];
    var b: seq<int> := [0];
    var result := IsSmaller(a, b);
    // expect result == false;
  }

  // Test case for combination {9}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] > b[i])
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: a[0] <= b[0]
  //   ENSURES: result <==> forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   ENSURES: !result <==> exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [21238, 38, 25];
    var b: seq<int> := [21238, 38, 25];
    var result := IsSmaller(a, b);
    // expect result == false;
  }

  // Test case for combination {10}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] > b[i])
  //   POST: !result
  //   POST: exists i :: 1 <= i < (|a| - 1) && a[i] <= b[i]
  //   ENSURES: result <==> forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   ENSURES: !result <==> exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [21238, 0, 7719];
    var b: seq<int> := [21238, 0, 7719];
    var result := IsSmaller(a, b);
    // expect result == false;
  }

  // Test case for combination {11}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: exists i :: 1 <= i < (|a| - 1) && !(a[i] > b[i])
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: a[(|a| - 1)] <= b[(|a| - 1)]
  //   ENSURES: result <==> forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   ENSURES: !result <==> exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [7719, 21238, 0, 0];
    var b: seq<int> := [7719, 21238, 0, 0];
    var result := IsSmaller(a, b);
    // expect result == false;
  }

  // Test case for combination {14}:
  //   PRE:  |a| == |b|
  //   POST: !result
  //   POST: 0 < |a|
  //   POST: !(a[(|a| - 1)] > b[(|a| - 1)])
  //   POST: !result
  //   POST: exists i :: 1 <= i < (|a| - 1) && a[i] <= b[i]
  //   ENSURES: result <==> forall i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| ==> a[i] > b[i]
  //   ENSURES: !result <==> exists i: int {:trigger b[i]} {:trigger a[i]} :: 0 <= i < |a| && a[i] <= b[i]
  {
    var a: seq<int> := [21238, 7719, 0, 0];
    var b: seq<int> := [21238, 7719, 0, 0];
    var result := IsSmaller(a, b);
    // expect result == false;
  }

}

method Main()
{
  Passing();
  Failing();
}
