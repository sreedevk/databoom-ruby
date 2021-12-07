# Databoom - Miscellaneous Datastrctures Implemented in Ruby

## Databoom::LinkedList

```ruby
  ll = Databoom::LinkedList.new
  ll.append(12)
  ll.append(255)
  ll.append(30)
  ll.append(90)

  ll.find(90) # => #<Databoom::LinkedList::Node @value=60, @npointer=nil>
  ll.find(0)  #=> nil
```
