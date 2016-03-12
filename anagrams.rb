
#O(n!)
def ana1(string1, string2)

  string1.split("").permutation.to_a.include?(string2.split(""))

end

#O(n^2)
def ana2(string1, string2)
  str1_split = string1.split("")
  str2_split = string2.split("")

  str1_split.each_with_index do |char1, idx1|
    str2_split.each_with_index do |char2, idx2|
      if char1 == char2
        str1_split[idx1] = nil
        str2_split[idx2] = nil
      end
    end
  end

  str1_split.delete(nil)
  str2_split.delete(nil)
  str1_split.empty? && str2_split.empty?
end

#O(n) ?ignore sort's own complexity?
def ana3(string1, string2)

  string1.split("").sort == string2.split("").sort

end

#O(n)
def ana4(string1, string2)
  letter_count1 = Hash.new(0)
  letter_count2 = Hash.new(0)

  string1.split("").each {|letter| letter_count1[letter] += 1}
  string2.split("").each {|letter| letter_count2[letter] += 1}

  letter_count1 == letter_count2
end

#O(n)
def ana5(string1, string2)
  return false if string1.length != string2.length
  letter_count = Hash.new(0)

  string1.split("").each {|letter| letter_count[letter] += 1}
  string2.split("").each {|letter| letter_count[letter] -= 1}

  letter_count.all? {|key, value| value == 0}
end
