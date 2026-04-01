// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\Software-Verification_tmp_tmpv4ueky2d_Remove Duplicates from Sorted Array_remove_duplicates_from_sorted_array.dfy
// Method: remove_duplicates_from_sorted_array
// Generated: 2026-04-01 13:54:53

// Software-Verification_tmp_tmpv4ueky2d_Remove Duplicates from Sorted Array_remove_duplicates_from_sorted_array.dfy

method remove_duplicates_from_sorted_array(nums: seq<int>) returns (result: seq<int>)
  requires is_sorted(nums)
  requires 1 <= |nums| <= 30000
  requires forall i: int {:trigger nums[i]} :: (0 <= i < |nums| ==> -100 <= nums[i]) && (0 <= i < |nums| ==> nums[i] <= 100)
  ensures is_sorted_and_distinct(result)
  ensures forall i: int {:trigger i in result} {:trigger i in nums} :: i in nums <==> i in result
  decreases nums
{
  var previous := nums[0];
  result := [nums[0]];
  var i := 1;
  while i < |nums|
    invariant 0 <= i <= |nums|
    invariant |result| >= 1
    invariant previous in nums[0 .. i]
    invariant previous == result[|result| - 1]
    invariant is_sorted_and_distinct(result)
    invariant forall j: int {:trigger j in result} {:trigger j in nums[0 .. i]} :: j in nums[0 .. i] <==> j in result
    decreases |nums| - i
  {
    if previous != nums[i] {
      result := result + [nums[i]];
      previous := nums[i];
    }
    i := i + 1;
  }
}

predicate is_sorted(nums: seq<int>)
  decreases nums
{
  forall i: int, j: int {:trigger nums[j], nums[i]} :: 
    0 <= i < j < |nums| ==>
      nums[i] <= nums[j]
}

predicate is_sorted_and_distinct(nums: seq<int>)
  decreases nums
{
  forall i: int, j: int {:trigger nums[j], nums[i]} :: 
    0 <= i < j < |nums| ==>
      nums[i] < nums[j]
}


method GeneratedTests_remove_duplicates_from_sorted_array()
{
  // Test case for combination {1}:
  //   PRE:  is_sorted(nums)
  //   PRE:  1 <= |nums| <= 30000
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < |nums| ==> -100 <= nums[i]) && (0 <= i < |nums| ==> nums[i] <= 100)
  //   POST: is_sorted_and_distinct(result)
  //   POST: forall i: int {:trigger i in result} {:trigger i in nums} :: i in nums <==> i in result
  {
    var nums: seq<int> := [8];
    expect is_sorted(nums); // PRE-CHECK
    expect 1 <= |nums| <= 30000; // PRE-CHECK
    expect forall i: int {:trigger nums[i]} :: (0 <= i < |nums| ==> -100 <= nums[i]) && (0 <= i < |nums| ==> nums[i] <= 100); // PRE-CHECK
    var result := remove_duplicates_from_sorted_array(nums);
    expect is_sorted_and_distinct(result);
    expect forall i: int {:trigger i in result} {:trigger i in nums} :: i in nums <==> i in result;
  }

  // Test case for combination {1}/Bnums=2:
  //   PRE:  is_sorted(nums)
  //   PRE:  1 <= |nums| <= 30000
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < |nums| ==> -100 <= nums[i]) && (0 <= i < |nums| ==> nums[i] <= 100)
  //   POST: is_sorted_and_distinct(result)
  //   POST: forall i: int {:trigger i in result} {:trigger i in nums} :: i in nums <==> i in result
  {
    var nums: seq<int> := [5, 8];
    expect is_sorted(nums); // PRE-CHECK
    expect 1 <= |nums| <= 30000; // PRE-CHECK
    expect forall i: int {:trigger nums[i]} :: (0 <= i < |nums| ==> -100 <= nums[i]) && (0 <= i < |nums| ==> nums[i] <= 100); // PRE-CHECK
    var result := remove_duplicates_from_sorted_array(nums);
    expect is_sorted_and_distinct(result);
    expect forall i: int {:trigger i in result} {:trigger i in nums} :: i in nums <==> i in result;
  }

  // Test case for combination {1}/Bnums=3:
  //   PRE:  is_sorted(nums)
  //   PRE:  1 <= |nums| <= 30000
  //   PRE:  forall i: int {:trigger nums[i]} :: (0 <= i < |nums| ==> -100 <= nums[i]) && (0 <= i < |nums| ==> nums[i] <= 100)
  //   POST: is_sorted_and_distinct(result)
  //   POST: forall i: int {:trigger i in result} {:trigger i in nums} :: i in nums <==> i in result
  {
    var nums: seq<int> := [-2, -1, 8];
    expect is_sorted(nums); // PRE-CHECK
    expect 1 <= |nums| <= 30000; // PRE-CHECK
    expect forall i: int {:trigger nums[i]} :: (0 <= i < |nums| ==> -100 <= nums[i]) && (0 <= i < |nums| ==> nums[i] <= 100); // PRE-CHECK
    var result := remove_duplicates_from_sorted_array(nums);
    expect is_sorted_and_distinct(result);
    expect forall i: int {:trigger i in result} {:trigger i in nums} :: i in nums <==> i in result;
  }

}

method Main()
{
  GeneratedTests_remove_duplicates_from_sorted_array();
  print "GeneratedTests_remove_duplicates_from_sorted_array: all tests passed!\n";
}
