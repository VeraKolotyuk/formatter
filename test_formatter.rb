require "./formatter"
require "test/unit"

class TestFormatter < Test::Unit::TestCase

  def setup

  end

  def teardown
    ## Nothing really
  end

  def test_simple
    # File.open('code.txt','r') do |input|
    #     File.open('new_code.txt', 'w') do |output|
    #         reader = InputStreamReader.new(input)
    #         writer = OutputStreamWriter.new(output)
    #         formatter = Formatter.new
    #         formatter.format(reader, writer)
    #     end
    # end
    # old_file = File.open("code.txt", "rb")
    # new_file = File.open("new_code.txt", "rb")
    # assert_equal(old_file.read, new_file.read)
  end

end