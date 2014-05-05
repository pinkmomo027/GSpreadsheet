require 'rubygems'
require 'bundler'
Bundler.require(:default)
require 'sass/plugin/rack'

# use scss for stylesheets
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

$: << File.expand_path(File.dirname(__FILE__))

require './myapp'
run Sinatra::Application