# Algorithm Drill Binary Search

##Learning Competencies

* Implement Binary Search

##Summary

Children who are learning arithmetic sometimes play a number-guessing game:

- "I’m thinking of a number between 1 and 100. Can you guess it?"
- *"Is the number less than 50?"*
- "Yes."
- *"Is the number less than 25?"*
- "No."

And so on, halving the interval at each step until only one number is left.

This technique is known colloquially as the binary chop. It is a well-known technique for searching through a collection. Let's build it in Ruby.

Beware that this exercise is harder than it looks. Jon Bentley, in his book Programming Pearls, reports that 90% of professional programmers cannot write a proper implementation of binary search in two hours, and Donald Knuth, in the second volume of his book The Art of Computer Programming, reports that though the first binary search was published in 1946, the first bug-free binary search wasn’t published until 1962.

If you want to read more, check out the [Wikipedia article](http://en.wikipedia.org/wiki/Binary_search_algorithm).

<cite>Source: Chris Pine, [Learn to Program](http://pine.fm/LearnToProgram/): | [Programming Praxis](http://programmingpraxis.com/2009/03/23/binary-search/)</cite>


##Releases

###Release 0 : Write the [MVP](http://en.wikipedia.org/wiki/Minimum_viable_product) algorithm

Start by writing an algorithm that satisfies the minumum viable product (MVP) for binary search.  Your algorithm should take a target number and a **sorted** array of numbers in non-decreasing order and return `true` or `false` to indicate if the number exists in the array.  

```ruby
binary_search(32, [24, 29, 32, 37, 43])  # => true  (because `32` is in the array)
```

Start with pseudocode! What are the steps?  Using specific examples for input can be extremely helpful for fleshing out your pseudocode.  Remember to start with **simple** test input like `binary_search(3, [0, 3, 4, 7])`.  Allow some repetition of your code so you can notice the repetition and refactor accordingly.

*You can't use `Array#.include?`. Sorry. The point is to build a binary search from scratch, not use Ruby's built in search methods. Also, don't use `Array#index`.*


###Release 1 : Write the full-fledged algorithm

Now we want to be able to know **where** in a sorted array a target number is.  Instead of returning `true` or `false`, your algorithm should return the position of the number in the array. 

```ruby
binary_search(32, [13, 19, 24, 29, 32, 37, 43])  # => 4
# since `32` is the fourth element of the array (counting from zero)
```

If the number is not in the array, your algorithm should return `-1`.

You should be able to use your initial release 0 algorithm to help you, but there is a deeper challenge hidden in this full-fledged version.  Walking through this test may shed some light on the new complexity:  `binary_search(37, [13, 19, 24, 29, 32, 37, 43])`.  


###Release 2: Ensuring accuracy with tests

Write suitable tests that ensure the accuracy of your binary search method. Test your method against a variety of inputs. Does it always return the correct answer?

A basic test suite might have tests like this (yours should have more examples):

```ruby
test_array = (100..200).to_a
puts binary_search(135, test_array) == 35
# => true

test_array = [13, 19, 24, 29, 32, 37, 43]
puts binary_search(35, test_array) == -1
# => true
```

Make sure you cover both the common cases and the edge cases!  A robust testing suite will allow you to refactor or extend your code with confidence (and without much manual testing).

