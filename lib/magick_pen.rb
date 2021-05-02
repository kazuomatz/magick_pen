require "magick_pen/version"
require "magick_pen/engine"
require 'paper_trail'
module MagickPen
  def self.table_name_prefix
    'magick_pen_'
  end
end
