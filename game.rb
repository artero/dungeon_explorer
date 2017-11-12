require 'rubygems'
require 'bundler'
Bundler.require(:default)

require_relative 'lib/tile'
require_relative 'lib/tiles/wall_tile'
require_relative 'lib/tiles/floor_tile'
require_relative 'lib/tiles/start_tile'
require_relative 'lib/tiles/end_tile'
require_relative 'lib/map'
require_relative 'lib/window'

Window.new.show
