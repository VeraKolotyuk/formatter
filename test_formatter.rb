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
    format('test-data/source-correct.txt', 'test-data/target-test-correct.txt')
    assert_equal(FileUtils.compare_file('test-data/target-test-correct.txt', 'test-data/target-correct.txt'), true)
  end

  private

  def format(source_path, target_path)
    File.open(source_path,'r') do |input|
        File.open(target_path, 'w') do |output|
            reader = InputStreamReader.new(input)
            writer = OutputStreamWriter.new(output)
            formatter = Formatter.new
            formatter.format(reader, writer)
        end
    end
  end

end