module ApplicationHelper

  def self.pluralize(word)
    if word.end_with?("y") && !%w(a e i o u).include?(word[-2].downcase)
      word[0..-2] + "ies"
    elsif word.end_with?("s", "sh", "ch", "x", "z")
      word + "es"
    elsif word.end_with?("f")
      word[0..-2] + "ves"
    elsif word.end_with?("fe")
      word[0..-3] + "ves"
    elsif word.end_with?("o")
      word + "es"
    else
      word + "s"
    end
  end

end
