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

	def print_indent(levels_count, spaces_count_in_level)
		spaces_count = levels_count * spaces_count_in_level
    	spaces_count.times do
    		write_symbol(" ")
    	end
	end
end


class Formatter

	SPACES_COUNT_IN_LEVEL = 4
	OPEN_BRACKET = "{"
	CLOSE_BRACKET = "}"
	SEMICOLON = ";"
	END_OF_STRING = "\n"
	SPACE_SYMBOL = " "

	def initialize
	    @levels_count = 0
	end

	def is_open_bracket(symbol)
		symbol.eql?(OPEN_BRACKET)
	end

	def is_close_bracket(symbol)
		symbol.eql?(CLOSE_BRACKET)
	end

	def is_semicolon(symbol)
		symbol.eql?(SEMICOLON)
	end

	def is_end_of_str(symbol)
		symbol.eql?(END_OF_STRING)
	end

	
	def format(input_stream_reader, output_stream_writer, c)
	    symbol = c.to_s().strip
	    unless is_end_of_str(symbol)
			if is_semicolon(symbol)
				output_stream_writer.write_symbol(symbol)
				output_stream_writer.write_symbol(END_OF_STRING)
		    elsif is_open_bracket(symbol)
		    	@levels_count = @levels_count + 1
		    	output_stream_writer.write_symbol(SPACE_SYMBOL)
		    	output_stream_writer.write_symbol(OPEN_BRACKET)
		    	output_stream_writer.write_symbol(END_OF_STRING)		    	
		    	output_stream_writer.print_indent(@levels_count, SPACES_COUNT_IN_LEVEL)		    			    	
		    elsif is_close_bracket(symbol)
		    	@levels_count = @levels_count - 1
		    	output_stream_writer.write_symbol(END_OF_STRING)
		    	output_stream_writer.print_indent(@levels_count, SPACES_COUNT_IN_LEVEL)
		    	output_stream_writer.write_symbol(CLOSE_BRACKET)
		    else	    	
		    	output_stream_writer.write_symbol(symbol)
		    end
		end
	end
end

File.open('code.txt','r') do |input|
  File.open('new_code.txt', 'w') do |output|
	    reader = InputStreamReader.new(input)
	    writer = OutputStreamWriter.new(output)
	    formatter = Formatter.new
	    reader.stream.each_char do |c|
		    formatter.format(reader, writer, c)
	    end
	end
end

