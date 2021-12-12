# frozen_string_literal: true

require 'matrix'
module Databoom
  class Matrix < ::Matrix
    def neighbors(x, y, depth = 1)
      neighboring_indices(x, y, depth).map do |depth_neighbor_indices|
        depth_neighbor_indices.map do |nx, ny|
          self[nx, ny]
        end
      end
    end

    def neighboring_indices(x, y, depth = 1)
      depth.times.map do |cdepth|
        neighboring_indices_at_depth(x, y, cdepth.next).filter do |coords|
          coords.none?(&:negative?) && coords.all? { |coord| coord < rank }
        end
      end
    end

    def neighboring_indices_at_depth(x, y, cdepth)
      [
        [x - cdepth, y],
        [x + cdepth, y],
        [x, y + cdepth],
        [x + cdepth, y + cdepth],
        [x - cdepth, y + cdepth],
        [x, y - cdepth],
        [x + cdepth, y - cdepth],
        [x - cdepth, y - cdepth]
      ]
    end
  end
end
