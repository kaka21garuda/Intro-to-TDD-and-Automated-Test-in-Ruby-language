class Translator
  def initialize(dictionary)
    @dictionary = dictionary
    @forward_array = []
    @backward_array = []
    @proc = Proc.new {|a,b| @forward_array << a}
    @second_proc = Proc.new {|a,b| @backward_array << b}
    @dictionary.select(&@proc)
    @dictionary.select(&@second_proc)
  end

  def translate_forward(sentence)
    new_word = []
    sentence = sentence.downcase.split(" ")
    sentence.each do |words|
      if @dictionary.key?(words)
        new_word << words.replace(@dictionary[words])
      else
        new_word << words
      end
    end
    return new_word.join(" ")
  end

  def translate_backward(sentence)
    new_word = []
    sentence = sentence.downcase.split(" ")
    sentence.each do |words|
      if @dictionary.has_value?(words)
        new_word << words.replace(@dictionary.key(words))
      else
        new_word << words
      end
    end
    return new_word.join(" ")
  end
end
