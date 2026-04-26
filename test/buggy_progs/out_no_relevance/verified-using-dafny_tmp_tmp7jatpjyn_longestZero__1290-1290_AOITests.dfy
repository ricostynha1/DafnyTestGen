// Auto-generated test cases by DafnyCBT
// Source: C:\Dados\Dafny\DafnyTestGen\test\buggy_progs\in\verified-using-dafny_tmp_tmp7jatpjyn_longestZero__1290-1290_AOI.dfy
// Method: longestZero
// Generated: 2026-04-24 14:33:01

// verified-using-dafny_tmp_tmp7jatpjyn_longestZero.dfy

function getSize(i: int, j: int): int
  decreases i, j
{
  j - i + 1
}

method longestZero(a: array<int>) returns (sz: int, pos: int)
  requires 1 <= a.Length
  ensures 0 <= sz <= a.Length
  ensures 0 <= pos < a.Length
  ensures pos + sz <= a.Length
  ensures forall i: int {:trigger a[i]} :: pos <= i < pos + sz ==> a[i] == 0
  ensures forall i: int, j: int {:trigger getSize(i, j)} :: 0 <= i < j < a.Length && getSize(i, j) > sz ==> exists k: int {:trigger a[k]} :: i <= k <= j && a[k] != 0
  decreases a
{
  var b := new int[a.Length];
  if a[0] == 0 {
    b[0] := 1;
  } else {
    b[0] := 0;
  }
  var idx: int := 0;
  while idx < a.Length - 1
    invariant 0 <= idx <= a.Length - 1
    invariant forall i: int {:trigger b[i]} :: (0 <= i <= idx ==> 0 <= b[i]) && (0 <= i <= idx ==> b[i] <= a.Length)
    invariant forall i: int {:trigger b[i]} :: 0 <= i <= idx ==> -1 <= i - b[i]
    invariant forall i: int {:trigger b[i]} :: 0 <= i <= idx ==> forall j: int {:trigger a[j]} :: i - b[i] < j <= i ==> a[j] == 0
    invariant forall i: int {:trigger b[i]} :: 0 <= i <= idx ==> 0 <= i - b[i] ==> a[i - b[i]] != 0
    decreases a.Length - 1 - idx
  {
    if a[idx + 1] == 0 {
      b[idx + 1] := b[idx] + -1;
    } else {
      b[idx + 1] := 0;
    }
    idx := idx + 1;
  }
  idx := 1;
  sz := b[0];
  pos := 0;
  while idx < a.Length
    invariant 1 <= idx <= b.Length
    invariant 0 <= sz <= a.Length
    invariant 0 <= pos < a.Length
    invariant pos + sz <= a.Length
    invariant forall i: int {:trigger b[i]} :: 0 <= i < idx ==> b[i] <= sz
    invariant forall i: int {:trigger a[i]} :: pos <= i < pos + sz ==> a[i] == 0
    invariant forall i: int, j: int {:trigger getSize(i, j)} :: 0 <= i < j < idx && getSize(i, j) > sz ==> a[j - b[j]] != 0
    decreases a.Length - idx
  {
    if b[idx] > sz {
      sz := b[idx];
      pos := idx - b[idx] + 1;
    }
    idx := idx + 1;
  }
}

method OriginalMain()
{
  var a := new int[10];
  forall i: int | 0 <= i < a.Length {
    a[i] := 0;
  }
  a[3] := 1;
  var sz, pos := longestZero(a);
  print a[..], "\n";
  print a[pos .. sz + pos], "\n";
}


method TestsForlongestZero()
{
  // Test case for combination {1}:
  //   PRE:  1 <= a.Length
  //   POST Q1: 0 <= sz
  //   POST Q2: sz <= a.Length
  //   POST Q3: 0 <= pos
  //   POST Q4: pos < a.Length
  //   POST Q5: pos + sz <= a.Length
  //   POST Q6: forall i: int {:trigger a[i]} :: pos <= i < pos + sz ==> a[i] == 0
  //   POST Q7: forall i: int, j: int {:trigger getSize(i, j)} :: 0 <= i < j < a.Length && getSize(i, j) > sz ==> exists k: int {:trigger a[k]} :: i <= k <= j && a[k] != 0
  {
    var a := new int[1] [-10];
    var sz, pos := longestZero(a);
    expect sz == 0;
    expect pos == 0;
  }

  // Test case for combination {1}/Bpos=1:
  //   PRE:  1 <= a.Length
  //   POST Q1: 0 <= sz
  //   POST Q2: sz <= a.Length
  //   POST Q3: 0 <= pos
  //   POST Q4: pos < a.Length
  //   POST Q5: pos + sz <= a.Length
  //   POST Q6: forall i: int {:trigger a[i]} :: pos <= i < pos + sz ==> a[i] == 0
  //   POST Q7: forall i: int, j: int {:trigger getSize(i, j)} :: 0 <= i < j < a.Length && getSize(i, j) > sz ==> exists k: int {:trigger a[k]} :: i <= k <= j && a[k] != 0
  {
    var a := new int[2] [-9, -1];
    var sz, pos := longestZero(a);
    expect sz == 0 || sz == 0;
    expect pos == 1 || pos == 0;
    expect sz == 0; // observed from implementation
    expect pos == 0; // observed from implementation
  }

  // Test case for combination {1}/Osz>0:
  //   PRE:  1 <= a.Length
  //   POST Q1: 0 <= sz <= a.Length
  //   POST Q2: 0 <= pos < a.Length
  //   POST Q3: pos + sz <= a.Length
  //   POST Q4: forall i: int {:trigger a[i]} :: pos <= i < pos + sz ==> a[i] == 0
  //   POST Q5: forall i: int, j: int {:trigger getSize(i, j)} :: 0 <= i < j < a.Length && getSize(i, j) > sz ==> exists k: int {:trigger a[k]} :: i <= k <= j && a[k] != 0
  {
    var a := new int[4] [6, 6, -1, 0];
    var sz, pos := longestZero(a);
    expect 0 <= sz <= a.Length;
    expect 0 <= pos < a.Length;
    expect pos + sz <= a.Length;
    expect forall i: int :: pos <= i < pos + sz ==> a[i] == 0;
    expect forall i: int, j: int :: 0 <= i < j < a.Length && getSize(i, j) > sz ==> exists k: int :: i <= k <= j && a[k] != 0;
    expect sz == 0; // observed from implementation
    expect pos == 0; // observed from implementation
  }

  // Test case for combination {1}/R4:
  //   PRE:  1 <= a.Length
  //   POST Q1: 0 <= sz
  //   POST Q2: sz <= a.Length
  //   POST Q3: 0 <= pos
  //   POST Q4: pos < a.Length
  //   POST Q5: pos + sz <= a.Length
  //   POST Q6: forall i: int {:trigger a[i]} :: pos <= i < pos + sz ==> a[i] == 0
  //   POST Q7: forall i: int, j: int {:trigger getSize(i, j)} :: 0 <= i < j < a.Length && getSize(i, j) > sz ==> exists k: int {:trigger a[k]} :: i <= k <= j && a[k] != 0
  {
    var a := new int[1] [3];
    var sz, pos := longestZero(a);
    expect sz == 0;
    expect pos == 0;
  }

  // Test case for combination {1}/R5:
  //   PRE:  1 <= a.Length
  //   POST Q1: 0 <= sz
  //   POST Q2: sz <= a.Length
  //   POST Q3: 0 <= pos
  //   POST Q4: pos < a.Length
  //   POST Q5: pos + sz <= a.Length
  //   POST Q6: forall i: int {:trigger a[i]} :: pos <= i < pos + sz ==> a[i] == 0
  //   POST Q7: forall i: int, j: int {:trigger getSize(i, j)} :: 0 <= i < j < a.Length && getSize(i, j) > sz ==> exists k: int {:trigger a[k]} :: i <= k <= j && a[k] != 0
  {
    var a := new int[1] [-1];
    var sz, pos := longestZero(a);
    expect sz == 0;
    expect pos == 0;
  }

  // Test case for combination {1}/R6:
  //   PRE:  1 <= a.Length
  //   POST Q1: 0 <= sz
  //   POST Q2: sz <= a.Length
  //   POST Q3: 0 <= pos
  //   POST Q4: pos < a.Length
  //   POST Q5: pos + sz <= a.Length
  //   POST Q6: forall i: int {:trigger a[i]} :: pos <= i < pos + sz ==> a[i] == 0
  //   POST Q7: forall i: int, j: int {:trigger getSize(i, j)} :: 0 <= i < j < a.Length && getSize(i, j) > sz ==> exists k: int {:trigger a[k]} :: i <= k <= j && a[k] != 0
  {
    var a := new int[1] [2];
    var sz, pos := longestZero(a);
    expect sz == 0;
    expect pos == 0;
  }

  // Test case for combination {1}/R7:
  //   PRE:  1 <= a.Length
  //   POST Q1: 0 <= sz
  //   POST Q2: sz <= a.Length
  //   POST Q3: 0 <= pos
  //   POST Q4: pos < a.Length
  //   POST Q5: pos + sz <= a.Length
  //   POST Q6: forall i: int {:trigger a[i]} :: pos <= i < pos + sz ==> a[i] == 0
  //   POST Q7: forall i: int, j: int {:trigger getSize(i, j)} :: 0 <= i < j < a.Length && getSize(i, j) > sz ==> exists k: int {:trigger a[k]} :: i <= k <= j && a[k] != 0
  {
    var a := new int[1] [4];
    var sz, pos := longestZero(a);
    expect sz == 0;
    expect pos == 0;
  }

  // Test case for combination {1}/R8:
  //   PRE:  1 <= a.Length
  //   POST Q1: 0 <= sz
  //   POST Q2: sz <= a.Length
  //   POST Q3: 0 <= pos
  //   POST Q4: pos < a.Length
  //   POST Q5: pos + sz <= a.Length
  //   POST Q6: forall i: int {:trigger a[i]} :: pos <= i < pos + sz ==> a[i] == 0
  //   POST Q7: forall i: int, j: int {:trigger getSize(i, j)} :: 0 <= i < j < a.Length && getSize(i, j) > sz ==> exists k: int {:trigger a[k]} :: i <= k <= j && a[k] != 0
  {
    var a := new int[1] [-2];
    var sz, pos := longestZero(a);
    expect sz == 0;
    expect pos == 0;
  }

  // Test case for combination {1}/R9:
  //   PRE:  1 <= a.Length
  //   POST Q1: 0 <= sz
  //   POST Q2: sz <= a.Length
  //   POST Q3: 0 <= pos
  //   POST Q4: pos < a.Length
  //   POST Q5: pos + sz <= a.Length
  //   POST Q6: forall i: int {:trigger a[i]} :: pos <= i < pos + sz ==> a[i] == 0
  //   POST Q7: forall i: int, j: int {:trigger getSize(i, j)} :: 0 <= i < j < a.Length && getSize(i, j) > sz ==> exists k: int {:trigger a[k]} :: i <= k <= j && a[k] != 0
  {
    var a := new int[1] [8];
    var sz, pos := longestZero(a);
    expect sz == 0;
    expect pos == 0;
  }

  // Test case for combination {1}/R10:
  //   PRE:  1 <= a.Length
  //   POST Q1: 0 <= sz
  //   POST Q2: sz <= a.Length
  //   POST Q3: 0 <= pos
  //   POST Q4: pos < a.Length
  //   POST Q5: pos + sz <= a.Length
  //   POST Q6: forall i: int {:trigger a[i]} :: pos <= i < pos + sz ==> a[i] == 0
  //   POST Q7: forall i: int, j: int {:trigger getSize(i, j)} :: 0 <= i < j < a.Length && getSize(i, j) > sz ==> exists k: int {:trigger a[k]} :: i <= k <= j && a[k] != 0
  {
    var a := new int[1] [-3];
    var sz, pos := longestZero(a);
    expect sz == 0;
    expect pos == 0;
  }

}

method Main()
{
  TestsForlongestZero();
  print "TestsForlongestZero: all non-failing tests passed!\n";
}
