require "./formatter"
require "test/unit"
require 'fileutils'

class TestFormatter < Test::Unit::TestCase

  def setup

  end

  def teardown
    ## Nothing really
  end

  def test_correct
    File.open('test-data/source-correct.txt','r') do |input|
        File.open('test-data/target-test-correct.txt', 'w') do |output|
            reader = InputStreamReader.new(input)
            writer = OutputStreamWriter.new(output)
            formatter = Formatter.new
            formatter.format(reader, writer)
        end
    end
    assert_equal(FileUtils.compare_file('test-data/target-test-correct.txt', 'test-data/target-correct.txt'), true)
  end

end