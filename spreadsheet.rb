require "rubygems"
require "google_drive"

class Spreadsheet 
  
	attr_accessor :session

	def initialize
		@session = GoogleDrive.login("lizligithub@gmail.com", "githubaccount")
    @file = @session.spreadsheet_by_key('1M_CZgLnuLUzsfdhNahPY6WoH8NQklXyj12Ll_qpucYQ')
	end

	def columns
		cols = @file.worksheets[1].rows
	end

  def add_row(params)
    worksheet = @file.worksheets[0]
    index = worksheet.num_rows + 1

    params.to_enum.with_index(1) do |(key, value), cell_index|
      worksheet[index, cell_index] = value
    end
    worksheet.save()
  end

end
