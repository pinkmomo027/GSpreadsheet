require "rubygems"
require "google_drive"

class Spreadsheet 
  
	attr_accessor :session

	def initialize
		@session = GoogleDrive.login("lizligithub@gmail.com", "githubaccount")
    @file = @session.spreadsheet_by_key('1M_CZgLnuLUzsfdhNahPY6WoH8NQklXyj12Ll_qpucYQ')
	end

	def columns
		@file.worksheets[1].rows.map(&:first)
	end

  def add_row(params)
    worksheet = @file.worksheets[0]
    index = worksheet.num_rows + 1
    worksheet[index, 1] = params["first_name"]
    worksheet[index, 2] = params["last_name"]
    worksheet[index, 3] = params['date_of_birth']
    worksheet[index, 4] = params['birthday_display']
    worksheet.save()
  end

end
