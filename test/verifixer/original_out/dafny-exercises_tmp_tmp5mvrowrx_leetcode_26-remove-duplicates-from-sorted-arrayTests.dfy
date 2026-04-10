// Auto-generated test cases by DafnyTestGen
// Source: C:\Dados\Dafny\DafnyTestGen\test\verifixer\original\dafny-exercises_tmp_tmp5mvrowrx_leetcode_26-remove-duplicates-from-sorted-array.dfy
// Method: RemoveDuplicates
// Generated: 2026-04-08 19:07:14

// dafny-exercises_tmp_tmp5mvrowrx_leetcode_26-remove-duplicates-from-sorted-array.dfy

method RemoveDuplicates(nums: array<int>) returns (num_length: int)
  requires forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < nums.Length :: nums[i] <= nums[j]
  modifies nums
  ensures nums.Length == old(nums).Length
  ensures 0 <= num_length <= nums.Length
  ensures forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < num_length :: nums[i] != nums[j]
  ensures forall i: int {:trigger nums[i]} | 0 <= i < num_length :: nums[i] in old(nums[..])
  ensures forall i: int {:trigger old(nums[i])} | 0 <= i < nums.Length :: old(nums[i]) in nums[..num_length]
  decreases nums
{
  if nums.Length <= 1 {
    return nums.Length;
  }
  var last := 0;
  var i := 1;
  var nums_before := nums[..];
  while i < nums.Length
    invariant 0 <= last < i <= nums.Length
    invariant nums[i..] == nums_before[i..]
    invariant forall j: int, k: int {:trigger nums[k], nums[j]} | 0 <= j < k <= last :: nums[j] < nums[k]
    invariant forall j: int {:trigger nums[j]} | 0 <= j <= last :: nums[j] in nums_before[..i]
    invariant forall j: int {:trigger nums_before[j]} | 0 <= j < i :: nums_before[j] in nums[..last + 1]
    decreases nums.Length - i
  {
    if nums[last] < nums[i] {
      last := last + 1;
      nums[last] := nums[i];
      assert forall j: int {:trigger nums_before[j]} | 0 <= j < i :: nums_before[j] in nums[..last];
      assert forall j: int {:trigger nums_before[j]} | 0 <= j <= i :: nums_before[j] in nums[..last + 1];
    }
    i := i + 1;
  }
  return last + 1;
}

method Testing()
{
  var nums1 := new int[3];
  nums1[0] := 1;
  nums1[1] := 1;
  nums1[2] := 2;
  var num_length1 := RemoveDuplicates(nums1);
  assert forall i: int, j: int {:trigger nums1[j], nums1[i]} | 0 <= i < j < num_length1 :: nums1[i] != nums1[j];
  assert num_length1 <= nums1.Length;
  print "nums1: ", nums1[..], ", num_length1: ", num_length1, "\n";
  var nums2 := new int[10];
  nums2[0] := 0;
  nums2[1] := 0;
  nums2[2] := 1;
  nums2[3] := 1;
  nums2[4] := 1;
  nums2[5] := 2;
  nums2[6] := 2;
  nums2[7] := 3;
  nums2[8] := 3;
  nums2[9] := 4;
  var num_length2 := RemoveDuplicates(nums2);
  assert forall i: int, j: int {:trigger nums1[j], nums1[i]} | 0 <= i < j < num_length1 :: nums1[i] != nums1[j];
  assert num_length2 <= nums2.Length;
  print "nums2: ", nums2[..], ", num_length2: ", num_length2, "\n";
}

method OriginalMain()
{
  Testing();
}


method Passing()
{
  // Test case for combination {1}:
  //   PRE:  forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < nums.Length :: nums[i] <= nums[j]
  //   POST: nums.Length == old(nums).Length
  //   POST: 0 <= num_length <= nums.Length
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < num_length :: nums[i] != nums[j]
  //   POST: forall i: int {:trigger nums[i]} | 0 <= i < num_length :: nums[i] in old(nums[..])
  //   POST: forall i: int {:trigger old(nums[i])} | 0 <= i < nums.Length :: old(nums[i]) in nums[..num_length]
  //   ENSURES: nums.Length == old(nums).Length
  //   ENSURES: 0 <= num_length <= nums.Length
  //   ENSURES: forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < num_length :: nums[i] != nums[j]
  //   ENSURES: forall i: int {:trigger nums[i]} | 0 <= i < num_length :: nums[i] in old(nums[..])
  //   ENSURES: forall i: int {:trigger old(nums[i])} | 0 <= i < nums.Length :: old(nums[i]) in nums[..num_length]
  {
    var nums := new int[1] [38];
    var num_length := RemoveDuplicates(nums);
    expect num_length == 1;
    expect nums[..] == [38];
  }

  // Test case for combination {1}/Bnums=0:
  //   PRE:  forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < nums.Length :: nums[i] <= nums[j]
  //   POST: nums.Length == old(nums).Length
  //   POST: 0 <= num_length <= nums.Length
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < num_length :: nums[i] != nums[j]
  //   POST: forall i: int {:trigger nums[i]} | 0 <= i < num_length :: nums[i] in old(nums[..])
  //   POST: forall i: int {:trigger old(nums[i])} | 0 <= i < nums.Length :: old(nums[i]) in nums[..num_length]
  //   ENSURES: nums.Length == old(nums).Length
  //   ENSURES: 0 <= num_length <= nums.Length
  //   ENSURES: forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < num_length :: nums[i] != nums[j]
  //   ENSURES: forall i: int {:trigger nums[i]} | 0 <= i < num_length :: nums[i] in old(nums[..])
  //   ENSURES: forall i: int {:trigger old(nums[i])} | 0 <= i < nums.Length :: old(nums[i]) in nums[..num_length]
  {
    var nums := new int[0] [];
    var num_length := RemoveDuplicates(nums);
    expect num_length == 0;
    expect nums[..] == [];
  }

  // Test case for combination {1}/Bnums=2:
  //   PRE:  forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < nums.Length :: nums[i] <= nums[j]
  //   POST: nums.Length == old(nums).Length
  //   POST: 0 <= num_length <= nums.Length
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < num_length :: nums[i] != nums[j]
  //   POST: forall i: int {:trigger nums[i]} | 0 <= i < num_length :: nums[i] in old(nums[..])
  //   POST: forall i: int {:trigger old(nums[i])} | 0 <= i < nums.Length :: old(nums[i]) in nums[..num_length]
  //   ENSURES: nums.Length == old(nums).Length
  //   ENSURES: 0 <= num_length <= nums.Length
  //   ENSURES: forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < num_length :: nums[i] != nums[j]
  //   ENSURES: forall i: int {:trigger nums[i]} | 0 <= i < num_length :: nums[i] in old(nums[..])
  //   ENSURES: forall i: int {:trigger old(nums[i])} | 0 <= i < nums.Length :: old(nums[i]) in nums[..num_length]
  {
    var nums := new int[2] [28957, 28958];
    var old_nums := nums;
    var old_nums2 := nums[..];
    var num_length := RemoveDuplicates(nums);
    expect nums.Length == old_nums.Length;
    expect num_length == 2;
    expect 0 <= num_length <= nums.Length;
    expect forall i: int, j: int | 0 <= i < j < num_length :: nums[i] != nums[j];
    expect forall i: int | 0 <= i < num_length :: nums[i] in old_nums2;
    expect forall i: int | 0 <= i < nums.Length :: old_nums2[i] in nums[..num_length];
  }

  // Test case for combination {1}/Bnums=3:
  //   PRE:  forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < nums.Length :: nums[i] <= nums[j]
  //   POST: nums.Length == old(nums).Length
  //   POST: 0 <= num_length <= nums.Length
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < num_length :: nums[i] != nums[j]
  //   POST: forall i: int {:trigger nums[i]} | 0 <= i < num_length :: nums[i] in old(nums[..])
  //   POST: forall i: int {:trigger old(nums[i])} | 0 <= i < nums.Length :: old(nums[i]) in nums[..num_length]
  //   ENSURES: nums.Length == old(nums).Length
  //   ENSURES: 0 <= num_length <= nums.Length
  //   ENSURES: forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < num_length :: nums[i] != nums[j]
  //   ENSURES: forall i: int {:trigger nums[i]} | 0 <= i < num_length :: nums[i] in old(nums[..])
  //   ENSURES: forall i: int {:trigger old(nums[i])} | 0 <= i < nums.Length :: old(nums[i]) in nums[..num_length]
  {
    var nums := new int[3] [23675, 23676, 23677];
    var old_nums := nums;
    var old_nums2 := nums[..];
    var num_length := RemoveDuplicates(nums);
    expect nums.Length == old_nums.Length;
    expect num_length == 3;
    expect 0 <= num_length <= nums.Length;
    expect forall i: int, j: int | 0 <= i < j < num_length :: nums[i] != nums[j];
    expect forall i: int | 0 <= i < num_length :: nums[i] in old_nums2;
    expect forall i: int | 0 <= i < nums.Length :: old_nums2[i] in nums[..num_length];
  }

  // Test case for combination {1}/Onum_length>0:
  //   PRE:  forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < nums.Length :: nums[i] <= nums[j]
  //   POST: nums.Length == old(nums).Length
  //   POST: 0 <= num_length <= nums.Length
  //   POST: forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < num_length :: nums[i] != nums[j]
  //   POST: forall i: int {:trigger nums[i]} | 0 <= i < num_length :: nums[i] in old(nums[..])
  //   POST: forall i: int {:trigger old(nums[i])} | 0 <= i < nums.Length :: old(nums[i]) in nums[..num_length]
  //   ENSURES: nums.Length == old(nums).Length
  //   ENSURES: 0 <= num_length <= nums.Length
  //   ENSURES: forall i: int, j: int {:trigger nums[j], nums[i]} | 0 <= i < j < num_length :: nums[i] != nums[j]
  //   ENSURES: forall i: int {:trigger nums[i]} | 0 <= i < num_length :: nums[i] in old(nums[..])
  //   ENSURES: forall i: int {:trigger old(nums[i])} | 0 <= i < nums.Length :: old(nums[i]) in nums[..num_length]
  {
    var nums := new int[4] [-18802, -18801, 2438, 2439];
    var old_nums := nums;
    var old_nums2 := nums[..];
    var num_length := RemoveDuplicates(nums);
    expect nums.Length == old_nums.Length;
    expect num_length == 4;
    expect 0 <= num_length <= nums.Length;
    expect forall i: int, j: int | 0 <= i < j < num_length :: nums[i] != nums[j];
    expect forall i: int | 0 <= i < num_length :: nums[i] in old_nums2;
    expect forall i: int | 0 <= i < nums.Length :: old_nums2[i] in nums[..num_length];
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
