#Ruby Gems
require 'sinatra'
require 'Haml'
require 'sass'
require 'spreadsheet'

set :spreadsheet, Spreadsheet.new

get '/' do
  spreadsheet = Spreadsheet.new
  columns = spreadsheet.columns
  haml :index, :format => :html5, :locals => {:columns => columns}
end

post '/' do
	settings.spreadsheet.add_row(params)
	haml :thankyou, :format => :html5
end