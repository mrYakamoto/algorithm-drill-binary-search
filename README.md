# Algorithm Drill: Binary Search

## Summary
In a [previous challenge][algorithm-drill-linear-search-challenge] we wrote a linear search algorithm to implement search behavior that mimicked the behavior of Ruby's [`Array#index`][rubydocs Array#index] method.  In this challenge, we're going to implement the same behavior using a different type of algorithm:  [binary search][wikipedia binary search].


### Binary Search
If we were going to guess a number randomly chosen from between one and 100, how would we approach it?  We're given no clues about our guesses other than being right or wrong.  We could use a linear search and guess one, and then guess two, and then guess three, and so on.  Or, maybe we could randomly guess each number.  Either way, with each incorrect guess we only eliminate one possibility.

What if we were told whether an incorrect guess was too high or too low?  How would our guessing strategy change?  Could we control the maximum number of guesses it would take to guess correctly?

If we can be told whether or not each guess is too high or too low, we can strategically guess to eliminate the largest number of possibilities.  Given a range of possibilities from one to 100, we might start guessing at 50.  If our guess is incorrect, we'll at least have eliminated half of the possibilities in one guess.  With our next guess we can eliminate half of the remaining possibilities, and we'll continue in this way until we have but one possibility remaining.  This technique is known colloquially as the binary chop. It is a well-known technique for searching through a collection, and we're going to build it in Ruby.


### Better Performance when Searching Ordered Data
There is a constraint to using a binary search algorithm.  The data we're searching through must be sorted.  If that condition is satisfied, a binary search will provide a more efficient search than a linear search algorithm.  

![binary search animation](readme-assets/binary-search.gif)

*Figure 1*. Searching an ordered set of data using a binary search algorithm.

In Figure 1 we see a data set of 13 ordered numbers.  If we were going to use a linear search algorithm to search this set for a specific number, we could potentially end up checking each individual number—up to thirteen checks.  What is the maximum number of checks a binary search algorithm would need to make?

Now what if the size of our data set was increased to 26 elements?  That's twice as many items to search through.  How many more checks would a binary search algorithm need to make?  What about a linear search algorithm, potentially?


### Hidden Complexity
On the surface, writing a binary search algorithm might seem simple, but it's very common to find bugs in a binary search algorithm. In the book *[Programming Pearls]*, Jon Bentley wrote that given two hours, 90% of professional programmers were unable to write a proper implementation of binary search.  Donald Knuth, in *[The Art of Computer Programming]*, wrote that though the first binary search was published in 1946, the first bug-free binary search wasn’t published until 1962.  Taking a test-driven development approach can help us avoid introducing bugs into our algorithm.


## Releases
### Release 0: Is the Value in the Collection?
```ruby
symbols = [:A, :B, :C, :D]
# => [:A, :B, :C, :D]
binary_search_include?(:A, symbols)
# => true
binary_search_include?(:X, symbols)
# => false
```
*Figure 2*.  Determining whether or not a value is in a collection.

We'll begin implementing our binary search algorithm by writing a method, `binary_search_include?` that returns `true` or `false`, depending on whether or not the value we're looking for is in the collection.  The method should take two arguments:  an object and a sorted array.  (see Figure 2)

No tests have been written for us.  We'll need to write them ourselves to determine whether or not our method is behaving as we expect.  We can try to minimize the chance of introducing bugs into our binary search algorithm by taking a test-driven approach.  We can start simple and gradually add complexity.  Does our methods work when the array were searching is empty?  What if there is one element in the array, two elements, etc.?  Are there other edge cases that we should test for?

Beginning with pseudocode might also be beneficial.

**Restrictions**

We need to write our method without replying on Ruby's built in `Array` and `Enumerable` methods.  The only methods we may call on the array we're searching are `Array#[]` and `Array#length`.  We are free to use keywords like `for`, `while`, or `until`.


### Release 1: Where is the Value Found?
```ruby
symbols = [:A, :B, :C, :D, :E, :F, :G, :H]
# => [:A, :B, :C, :D, :E, :F, :G, :H]
binary_search(:G, symbols)
# => 6
binary_search(:X, symbols)
# => nil
```
*Figure 3*. Example binary search method usage.

Now it's time to mimic the behavior of `Array#index` by implementing a binary search algorithm.  We'll write a `binary_search` method that accepts two arguments:  an object and a sorted array.  The method returns the index where a specific value is found or `nil` if it's not found.  (see Figure 3)

Again, we'll want to have a test suite that ensures the accuracy of our binary search method.  We need to cover both common cases and edge cases.


### Release 2: Refactor
Before we conclude this challenge, let's read through our code to see if we might be able to improve it.  Have we followed the Ruby style guide (e.g., spacing and indentation)?  Could our variable names be more descriptive?  Are there any code smells that we can eliminate?  For example, are there any methods we could extract from our `binary_search` method?

Having a solid test suite will help us as we refactor.  Remember:  [red, green, refactor].  We should only refactor when our tests are all passing.  As we refactor, they should continue to pass.  This will inform us when our refactoring breaks functioning code.


## Conclusion
Like linear search, binary search is another common search algorithm and one that we should be familiar with.  Assuming we're searching an ordered data set, a binary search will be more efficient than a linear search method—particularly as the size of the data set grows.

Familiarity with binary search might even help us if we end up playing the [Clock Game][price is right clock game videos] on *The Price is Right*.


[algorithm-drill-linear-search-challenge]: ../../../algorithm-drill-linear-search-challenge
[price is right clock game videos]: https://www.google.com/webhp?&tbm=vid#tbm=vid&q=the+price+is+right+clock+game
[Programming Pearls]: http://www.amazon.com/Programming-Pearls-Press-Louis-Bentley/dp/0201103311/
[red, green, refactor]: http://www.jamesshore.com/Blog/Red-Green-Refactor.html
[rubydocs Array#index]: http://ruby-doc.org/core-2.1.0/Array.html#method-i-index
[The Art of Computer Programming]: http://www.amazon.com/Computer-Programming-Volumes-1-4A-Boxed/dp/0321751043/
[wikipedia binary search]: http://en.wikipedia.org/wiki/Binary_search_algorithm
