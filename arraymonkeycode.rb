class Array
  def my_uniq
    uniqs = []
    self.each do |el|
      uniqs << el unless uniqs.include?(el)
    end
    uniqs
  end

  def two_sum
    pairs = []
    self.each_with_index do |first, idx1|
      self.each_with_index do |second, idx2|
        pairs << [idx1, idx2] if first + second == 0 && idx2 > idx1
      end
    end
    pairs
  end

  def my_transpose
    transposed = Array.new(self.size) { Array.new(self.size) }
    self.each_with_index do |row, row_ind|
      row.each_with_index do |el, col_ind|
        transposed[col_ind][row_ind] = el
      end
    end
    transposed
  end

  def stock_picker
    max_profit = 0
    best_days = nil
    self.each_with_index do |day1, ind1|
      self.each_with_index do |day2, ind2|
        best_days, max_profit = [ind1, ind2], day2 - day1 if ind2 > ind1 && day2 - day1 > max_profit
      end
    end
    best_days
  end

end
