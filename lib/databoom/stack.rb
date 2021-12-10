require 'forwardable'

module Databoom
  class Stack
    extend Forwardable
    def initialize; @mem = []; end
    def pop; [@mem.pop, @mem]; end

    def_delegator   :@mem, :push
    def_delegator   :@mem, :pop, :pop!
    def_delegator   :@mem, :last, :peek
    def_delegators  :@mem, :size, :inspect
  end
end
