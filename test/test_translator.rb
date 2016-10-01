require "minitest/autorun"
require "minitest/reporters"
require "./lib/translator"
Minitest::Reporters.use!

class TestTranslator < Minitest::Test

  # This is a simple, rather useless test to detect if the translator exists.
  def test_exists
    translator = Translator.new({ "hello" => "hola" })
    assert !translator.nil?, "Translator instance does not exist"
  end

  def test_forward_translate
    translator = Translator.new({ "hello" => "hola", "world" => "mundo" })
    expected = "hola mundo"
    actual = translator.translate_forward("hello world")
    assert_equal expected, actual, "did not translate 'hello world' correctly forward"
  end

  def test_backward_translate
    translator = Translator.new({"hello" => "hola", "world" => "mundo"})
    expected = "hello world"
    actual = translator.translate_backward("hola mundo")
    assert_equal expected, actual, "did not translate 'hello world' correctly backward"
  end


end
