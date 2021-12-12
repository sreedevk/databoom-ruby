# frozen_string_literal: true

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

    def vertex?(vertex_value)
      !find_vertex(vertex_value).nil?
    end

    def edge?(source_vertex_value, sink_vertex_value, label = nil)
      !find_edge(source_vertex_value, sink_vertex_value, label).nil?
    end

    # NOTE: label has to be unique. Only one edge with the same source & sink can exist with no label
    def add_edge(source_value, sink_value, label = nil)
      find_edge(source_value, sink_value, label) || create_edge(source_value, sink_value, label)
    end

    def out_edges(vertex_value)
      return nil unless vertex?(vertex_value)

      @edges.select { |edge| edge.source = find_vertex(vertex_value) }
    end

    def in_edges(vertex_value)
      return nil unless vertex?(vertex_value)

      @edges.select { |edge| edge.sink = find_vertex(vertex_value) }
    end

    def find_path(origin_value, terminal_value, path = [])
      return nil unless vertex?(origin_value) && vertex?(terminal_value)
      return nil if out_edges(origin_value).none?
      return path if find_edge(origin_value, terminal_value)

      return out_edges(origin_value)
        .map(&:value)
        .filter_map { |recur_branch| [*path, recur_branch] if find_path(recur_branch, terminal_value, [*path, recur_branch]) }
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
      @vertices.find { |iter_vertex| iter_vertex.value == vertex_value }
    end

    def create_vertex(vertex_value, label = nil)
      @vertices << Vertex.new(vertex_value, label)
    end
  end
end
