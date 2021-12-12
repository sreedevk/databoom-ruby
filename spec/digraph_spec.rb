require "minitest/autorun"
require "minitest/spec"
require "minitest/assertions"

require_relative "../lib/databoom.rb"

describe Databoom::Digraph do
  describe "#new" do
    it "creates a new digraph" do
      assert_kind_of(Databoom::Digraph, Databoom::Digraph.new) 
    end

    it "has empty vertex list" do
      assert_empty(Databoom::Digraph.new.vertices) 
    end

    it "has empty edge list" do
      assert_empty(Databoom::Digraph.new.vertices) 
    end
  end

  describe "#add_vertex" do
    it "adds a vertex to a digraph" do
      digraph = Databoom::Digraph.new
      digraph.add_vertex(:bangalore)
      assert_includes(digraph.vertices.map(&:value), :bangalore)
    end

    it "does not add duplicate vertices" do
      digraph = Databoom::Digraph.new
      10.times { digraph.add_vertex(:bangalore, :b1) }
      digraph_values = digraph.vertices.map(&:value)
      assert(digraph_values.include?(:bangalore) && digraph_values.length == 1)
    end
  end
end
