#Ruby Gems
require 'sinatra'
require 'Haml'
require 'sass'

require 'spreadsheet'

get '/' do

  spreadsheet = Spreadsheet.new
  haml :index, :format => :html5, :locals => {:columns => spreadsheet.columns}
end
