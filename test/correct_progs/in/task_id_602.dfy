    // Finds the first repeated character in a string. Returns a pair (found, c) where 
// found is true if a repeated character was found, and c is the repeated character.
method FindFirstRepeatedChar(s: string) returns (found: bool, c: char)
    ensures found ==> exists i, j :: 0 <= i < j < |s| && s[i] == s[j] == c && (forall k, l :: 0 <= k < i && k < l < |s| ==> s[k] != s[l])
    ensures !found ==> (forall i, j :: 0 <= i < j < |s| ==> s[i] != s[j]) && c == '\U{0000}'

{
    found := false;
    
    // scan the string from left to right (until a repeated character is found)
    for i := 0 to |s| 
        invariant forall l, r :: 0 <= l < i && l < r < |s| ==> s[l] != s[r]
    {
        // check if the character is repeated in the subsequent positions
        for j := i + 1 to |s|
            invariant forall r :: i < r < j ==> s[i] != s[r]
        {
            if s[i] == s[j] {
                return true, s[i];
            }
        }
    }
    return false, '\U{0000}';
}
