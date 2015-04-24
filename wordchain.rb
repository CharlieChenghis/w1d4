require 'set'
class WordChainer

  def initialize (filename)
    lines = File.readlines(filename)
    @dictionary = lines.map {|line| line.chomp}.to_set

  end

  def adjacent_words(word_to_check)

    adjacent = []
    @dictionary.each do |word|
      if word_to_check.length == word.length
        if compare_words(word,word_to_check)
          adjacent << word
        end
      end
    end
    p adjacent
  end

  def compare_words(word1,word2)
    return false if word1 == word2
    mismatches = 0

    word1.split('').each_with_index do |char,i|
      if word2[i] != char
        mismatches += 1
      end
    end
    mismatches == 1?  true : false
  end



end

new_chain = WordChainer.new("dictionary.txt")

new_chain.adjacent_words("duck")
