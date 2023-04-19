# Agda2HS User Study

This repository contains the project that will be used for the Agda2HS user study.

The project has the following structure:

* `app`: the directory containing the executable Haskell app. It runs the QuickCheck test.
* `lib`: The directory which contains the Agda solution files.
* `lib/Help`: A directory containing helper methods for the exercises.
* `src`: A git-ignored directory into which Agda2HS generates the Haskell code. 
* `default`: A helper directory which contains Haskell implementations of all the exercises. They are used to make the Haskell code while the exercise hasn't been implemented yet. They _can_ be used as guides, but feel free to ignore them and implement them in Agda in any way you like.

_The only directory you are supposed to edit is `lib` (excluding `lib/Help`)._

### How to Use this Project

To create a solution for the exercise, do the following:

1. Create a file in the `lib` directory with the indicated filename.
2. Add the following into your newly created file:

```agda
module <module_name> where

open import Haskell.Prelude
```

3. Compile the file using `Ctrl + c, Ctrl + l`.
4. Start implementing.
5. To run the exercise, run `make A=<exercise_tag>`.

## Example: Reverse

File name: `Reverse.agda`
Module name: `Reverse`
Exercise tag: `reverse`

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

File name: `All.agda`
Module name: `All`
Exercise tag: `all`

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

File name: `Lookup.agda`
Module name: `Lookup`
Exercise tag: `lookup`

**Task:** Implement a `lookupSafe` function, which looks up a value in a list of key-value pairs.
The compiled Haskell signature of this method should be `lookupSafe :: Eq a => a -> [(a, b)] -> b`.

*Examples:*
* `lookupSafe 2 [(1, "H"), (2, "e"), (3, "l"), (4, "l"), (5, "o")] == "e"`
* `lookupSafe 'r' [('W', True), ('o', False), ('r', False), ('l', False), ('d', False)] == False`

Include the following guarantees in your Agda code:

1. A `lookupSafe` can only happen if the list contains the key.

You can use the `contains` and `containsTail` definitions in the `Help.Contains` module.

To run the tests for this assignment, run `make A=lookup`.
