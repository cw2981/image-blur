class Image

  def initialize (picture)
    @picture = picture
  end

  def grab_ones
    ones = []
    @picture.each_with_index do |row, row_number|
      row.each_with_index do |pixel, col_number|
        if pixel == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end

  def blur!
    ones = grab_ones
      @picture.each_with_index do |row, row_number|
        row.each_with_index do |pixel, col_number|
          ones.each do |found_row_number, found_col_number|

            if row_number == found_row_number && col_number == found_col_number
              @picture[row_number -1][col_number] = 1 unless row_number == 0 
              @picture[row_number +1][col_number] = 1 unless row_number >= 3 
              @picture[row_number][col_number -1] = 1 unless col_number == 0 
              @picture[row_number][col_number +1] = 1 unless col_number >= 3
            end
          end
        end
      end
  end
# blur-1
  def output_image
    @picture.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

# blur-1-output
image.output_image
# blur-2-output
puts
image.blur!
