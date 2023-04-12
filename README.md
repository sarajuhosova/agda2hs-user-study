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

## Exercise 1: The `All` Type

**Task:** Implement the [Haskell `All` type](https://hackage.haskell.org/package/base-4.18.0.0/docs/Data-Monoid.html#t:All) - the boolean monoid under conjunction.

1. Define the `All` type.
2. Create an instance for `Eq`, `Ord`, `Show`, and `Bounded`.
3. Create an instance for `Semigroup`
4. Prove that the `Semigroup` instance is lawful.
4. Create an instance for `Monoid`.
5. Create an instance for `Read`.
6. Create an instance for `Generic`.

To run the tests for this assignment, run `make A=all`.

## Exercise 2: Safe `lookup`

**Task:** Implement a `lookupSafe` function, which looks up a value in a list of key-value pairs.
The compiled Haskell signature of this method should be `lookupSafe :: Eq a => a -> [(a, b)] -> b`.

Include the following guarantees in your Agda code:

1. A `lookupSafe` can only happen if the list contains the key.

You can use the `contains` and `containsTail` definitions in the `Help.Contains` module.
