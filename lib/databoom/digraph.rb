module Databoom
  class Digraph
    attr_reader :vertices, :edges

    class Vertex
      attr_accessor :value, :label

      def initialize(value, label = nil)
        @value = value
        @label = label
      end
    end

    class Edge
      attr_accessor :source, :sink, :label

      def initialize(source_vertex, sink_vertex, label)
        @source = source_vertex
        @sink   = sink_vertex
        @label  = label
      end
    end

    def initialize
      @vertices = []
      @edges = []
    end


    # NOTE: Vertex values are uniq
    def add_vertex(vertex_value, label = nil)
      find_vertex(vertex_value) || create_vertex(vertex_value, label)
    end

    def del_vertex(vertex_value)
      @vertices.reject! { |iter_vertex| iter_vertex.value == vertex_value }
    end

    # NOTE: label has to be unique. Only one edge with the same source & sink can exist with no label
    def add_edge(source_value, sink_value, label = nil)
      find_edge(source_value, sink_value, label) || create_edge(source_value, sink_value, label)
    end

    private 

    def find_edge(source_value, sink_value, label = nil)
      @edges.find do |iter_edge|
        iter_edge.source == find_vertex(source_value) && 
          iter_edge.sink == find_vertex(sink_value) && 
          iter_edge.label == label  
      end
    end

    def create_edge(source_value, sink_value, label = nil)
      @edges << Edge.new(find_vertex(source_value), find_vertex(sink_value), label)
    end

    def find_vertex(vertex_value)
      @vertices.find { |iter_vertval| iter_vertval == vertex_value }
    end

    def create_vertex(vertex_value, label = nil)
      @vertices << Vertex.new(vertex_value, label)
    end
  end
end
