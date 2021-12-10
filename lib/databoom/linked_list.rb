module Databoom
  class LinkedList
    attr_accessor :head

    class Node
      attr_accessor :value, :npointer

      def inspect(buffer = String.new)
        @npointer&.inspect(buffer += "#{value} -> ") || buffer + value
      end

      def find(value)
        return self if @value == value
        return nil unless @npointer

        @npointer.find(value)
      end

      def initialize(value)
        @value = value
      end

      def append(nodeval)
        return @npointer.append(nodeval) if @npointer

        @npointer = Node.new(nodeval)
      end
    end

    def initialize
      @head = Node.new("*")
    end

    def append(value)
      @head.append(value)
    end

    def append_after(find_node, nodeval)
      after_node = find(find_node)
      return append(nodeval) unless after_node
    end

    def find(value)
      @head&.find(value)
    end

    def inspect
      @head&.inspect 
    end
  end
end
