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

To run the tests for this assignment, run `make A=reverse`.

## Exercise 1: (Ordered) Set

**Task:** Implement an (ordered) set data structure. An (ordered) set contains each element *at most once*, and the order of the elements *matters* (this means that `{1, 2}` and `{2, 1}` are **not** equal sets). Implement the following methods for this new data structure:

* `add :: Eq a => a -> OrderedSet a -> OrderedSet a`: this method adds an element to the set (if it was not already present)
* `fromList :: Eq a => [a] -> OrderedSet a`: this method takes a list and puts all the elements from it into an ordered set

Feel free to define any other helper methods, use intrinsic verification, or use anything else that seems like a good approach.

*Note:* Make sure you implement the `Eq` instance for your `OrderedSet`.

Include the following guarantees in your Agda code:

1. If you try to add an element which is already present in the set, the set doesn't change.

To run the tests for this assignment, run `make A=set`.
