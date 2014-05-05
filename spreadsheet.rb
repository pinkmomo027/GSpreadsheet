require "rubygems"
require "google_drive"

class Spreadsheet 
  
	attr_accessor :session

	def initialize
		@session = GoogleDrive.login("lizligithub@gmail.com", "githubaccount")
	end

	def columns
		file = @session.spreadsheet_by_key('1M_CZgLnuLUzsfdhNahPY6WoH8NQklXyj12Ll_qpucYQ')
		rows = file.worksheets[1].rows.map(&:first)
		rows
	end
end
