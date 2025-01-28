module ApplicationHelper

  def self.pluralize(word)
    suffix_two_letters = {
      "sh" => ->(word) { word + "es" },
      "ch" => ->(word) { word + "es" },
      "fe" => ->(word) { word[0..-3] + "es" },
      "ay" => ->(word) { word + "s" },
      "ey" => ->(word) { word + "s" },
      "iy" => ->(word) { word + "s" },
      "oy" => ->(word) { word + "s" },
      "uy" => ->(word) { word + "s" }
    }[word[-2..-1]]
    return suffix_two_letters.call(word) unless suffix_two_letters.nil?

    suffix_one_letter = {
      "y" => ->(word) { word[0..-2] + "ies" },
      "s" => ->(word) { word + "es" },
      "x" => ->(word) { word + "es" },
      "z" => ->(word) { word + "es" },
      "o" => ->(word) { word + "es" },
      "f" => ->(word) { word[0..-2] + "ves" }
    }[word[-1]]
    return suffix_one_letter.call(word) unless suffix_one_letter.nil?

    word + "s"
  end

end
