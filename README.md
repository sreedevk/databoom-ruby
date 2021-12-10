# Databoom 
#### Miscellaneous Datastrctures Implemented in Ruby

## Installation
### Gemfile
  ```ruby
    gem "databoom", "~> 0.0.2"
  ```
### Direct
  ```bash
    gem install databoom -v 0.0.2
  ```

## Databoom::LinkedList

a linked list is a linear collection of data elements whose order is not given by their physical 
placement in memory. Instead, each element points to the next. It is a data structure consisting 
of a collection of nodes which together represent a sequence

```ruby
  ll = Databoom::LinkedList.new
  ll.append(12)
  ll.append(255)
  ll.append(30)
  ll.append(90)

  ll.find(90) # => #<Databoom::LinkedList::Node @value=60, @npointer=nil>
  ll.find(0)  #=> nil
```

## Databoom::Digraph

In mathematics, and more specifically in graph theory, a directed graph (or digraph) is a graph 
that is made up of a set of vertices connected by directed edges often called arcs.

`NOTE: This Implementation of digraph is heavily inspired by Erlang/OTP :digraph`

```ruby
  dg = Databoom::Digraph.new

  dg.add_vertex(:new_york)
  dg.add_vertex(:london)
  dg.add_vertex(:delhi)

  dg.add_edge(:new_york, :london, "emirates")
  dg.add_edge(:london, :delhi, "lufthansa")

  dg.find_path(:new_york, :delhi) # => [:new_york, :london, :delhi]

  # Additional Helpers
  dg.out_edges(:new_york) 
  #=> [#<Databoom::Digraph::Edge @source=#<Databoom::Digraph::Vertex @value = :new_york>, @sink = #<Databoom::Digraph::Vertex @value = :london>>]

  dg.in_edges(:delhi) 
  #=> [#<Databoom::Digraph::Edge @source=#<Databoom::Digraph::Vertex @value = :london>, @sink = #<Databoom::Digraph::Vertex @value = :delhi>>]

  dg.vertex?(:mumbai) #=> false
  dg.vertex?(:delhi) #=> true

  dg.edge?(:new_york, :london) #=> true
  dg.edge?(:delhi, :london) #=> false
```

## Databoom::Stack
In computer science, a stack is an abstract data type that serves as a collection of elements, with two main principal operations:
Push, which adds an element to the collection, and
Pop, which removes the most recently added element that was not yet removed.

The order in which elements come off a stack gives rise to its alternative name, LIFO (last in, first out). Additionally, a peek operation may give access to the top without modifying the stack.

```ruby
  ds = Databoom::Stack.new
  ds.push(10)  #=> [10]
  ds.push(20)  #=> [10, 20]
  ds.push(500) #=> [10, 20, 500]
  ds.pop       #=> [500, [10, 20]]
  ds.pop!      #=> 20
```
