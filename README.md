# Agda2HS User Study

This repository contains the project that will be used for the Agda2HS user study.

## Example: Reverse

**Task:** Implement a `reverse` function, which takes a list and reverses it.

*Examples:*
* `reverse [1, 2, 4] == [4, 2, 1]`
* `reverse [] == []`
* `reverse ['d', 'g', '5', 'x'] == ['x', '5', 'g', 'd']`

Include the following guarantees in your Agda code:

1. Reversing an empty list yields an empty list (`reverse [] == []`).
2. Reversing a list with a single element yields the same list (`reverse [x] == [x]`).
3. Reversing a reversed list yields the original list, i.e. reverse is the inverse of itself (`reverse (reverse xs) == xs`).
4. Reversing two appended lists is the same as appending the second list reversed to the first list reversed (`reverse (xs ++ ys) ≡ reverse ys ++ reverse xs`).

To run the tests for this assignment, run `make`.
