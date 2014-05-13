#Ruby Gems
require 'sinatra'
require 'haml'
require 'sass'
require 'spreadsheet'

set :spreadsheet, Spreadsheet.new

get '/' do
  spreadsheet = Spreadsheet.new
  columns     = spreadsheet.columns
  meta_tags   = spreadsheet.meta_tags
  haml :index, :format => :html5, :locals => {:columns => columns, :meta_tags => meta_tags}
end

post '/' do
	settings.spreadsheet.add_row(params)
	haml :thankyou, :format => :html5
end
