require "rubygems"
require "google_drive"

class Spreadsheet 
  
	attr_accessor :session

	def initialize
		@session = GoogleDrive.login("lizligithub@gmail.com", "githubaccount")
    @file = @session.spreadsheet_by_key('1M_CZgLnuLUzsfdhNahPY6WoH8NQklXyj12Ll_qpucYQ')
	end

  def meta_tags
    meta_sheet = @file.worksheet_by_title('meta')
    rows       = meta_sheet.rows
    Hash[ rows[0].zip(rows[1]) ]
  end


	def columns
		@file.worksheet_by_title('columns').rows.uniq(&:first)
	end

  def add_row(params)

   #Confirm Sheet1 Column Titles(row1) 
   check_titles
  
    worksheet = @file.worksheets[0]
    row_index = worksheet.num_rows + 1

    params.each do |key, value|
      col_index = @titles.index(key)
      if col_index
        worksheet[row_index, col_index + 1] = value
      end
    end

    worksheet.save()
  end
  

  # @titles: Sheet1 First Row (First Name, Last Name, etc)
  # cols: Sheet2, Admin entered columns (First Name, Title, etc)
  # if cols contains data that current_titles doesn't carry
  # update current_titles
  def check_titles
    worksheet = @file.worksheets[0]
    @titles   = worksheet.rows.first.map(&:downcase).reject(&:empty?).uniq
    cols      = columns.map(&:first).map(&:downcase).map{ |col| col.gsub(/\s+/, '_') }.uniq
    
    #rewrite Sheet1 row1 (which contains the title)
    if !((diff = cols - @titles).empty?)
      @titles.concat(diff).to_enum.with_index(1) do |title, index|
        worksheet[1, index] = title
      end
      worksheet.save()
    end

  end

end
