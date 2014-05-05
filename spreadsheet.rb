require "rubygems"
require "google_drive"

class Spreadsheet 
  
	attr_accessor :session

	def initialize
		@session = GoogleDrive.login("xiangninglicornell@gmail.com", "")
	end

	def columns
		file = @session.spreadsheet_by_key('0Ag55hNpvj_MZdEdyOFZISjZTSXpiRUhEcVpYX3F0ZFE')
		rows = file.worksheets[1].rows.map(&:first)
		rows.delete("COLUMNS")
		rows
	end
end
