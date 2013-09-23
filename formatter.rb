class InputStreamReader

    attr_accessor :stream

    def initialize(stream)
        @stream = stream
    end

end

class OutputStreamWriter

	attr_accessor :stream

	def initialize(stream)
		@stream = stream
	end

	def write_symbol(symbol)
		@stream.write(symbol)
	end


end


class Formatter

	SPACES_COUNT_IN_LEVEL = 4

	def initialize
	    @levels_count = 0
	end

	def format(output_stream_reader, output_stream_writer)
		output_stream_reader.stream.each_char do |char|
		    symbol = char.to_s().strip
		    unless is_end_of_str(symbol)
				if is_semicolon(symbol)
					output_stream_writer.write_symbol(symbol)
					output_stream_writer.write_symbol("\n")
					print_indent(output_stream_writer)
			    elsif is_open_bracket(symbol)
			    	@levels_count = @levels_count + 1
			    	output_stream_writer.write_symbol("{")
			    	output_stream_writer.write_symbol("\n")
			    	print_indent(output_stream_writer)
			    elsif is_close_bracket(symbol)
			    	@levels_count = @levels_count - 1
			    	output_stream_writer.write_symbol("\n")
			    	print_indent(output_stream_writer)
			    	output_stream_writer.write_symbol("}")
			    else
			    	output_stream_writer.write_symbol(symbol)
			    end
			end
		end
	end

	private

	def is_open_bracket(symbol)
		symbol.eql?("{")
	end

	def is_close_bracket(symbol)
		symbol.eql?("}")
	end

	def is_semicolon(symbol)
		symbol.eql?(";")
	end

	def is_end_of_str(symbol)
		symbol.eql?("\n")
	end

	def print_indent(writer)
		spaces_count = @levels_count * SPACES_COUNT_IN_LEVEL
    	spaces_count.times do
    		writer.write_symbol(" ")
    	end
	end
end

File.open('code.txt','r') do |input|
	File.open('new_code.txt', 'w') do |output|
	    reader = InputStreamReader.new(input)
	    writer = OutputStreamWriter.new(output)
	    formatter = Formatter.new
		formatter.format(reader, writer)
	end
end

