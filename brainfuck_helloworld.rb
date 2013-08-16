bf_prog = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>."


$output_int = Array.new
@ptr = 0

def bf_interpreter bf_str

	ctr = 0
	bf_str.each_char do |c|
		#bf_str[0] = ''
		ctr += 1
		case c
		when '+'
			$output_int[@ptr] ? $output_int[@ptr] += 1 : $output_int[@ptr] = 1
		when '['
			#puts "in [ here #{ctr}"
			new_ctr = 0
			($output_int[@ptr] ).times { new_ctr = bf_interpreter bf_str[ctr , bf_str.length] }
			#puts bf_str[ctr],"ppasu",bf_str[new_ctr + ctr , bf_str.length]

			bf_interpreter bf_str[new_ctr + ctr , bf_str.length]
		when '>'
			@ptr += 1
		when '<'
			@ptr -= 1
		when '-'
			#puts @ptr
			$output_int[@ptr] -= 1
		when ']'
			#puts "in ] here"
			return ctr;
		when '.'
			print $output_int[@ptr].chr
		end
		#print $output_int,@ptr
		#puts bf_str
	end
end

bf_interpreter bf_prog
#bf_interpreter bf_prog[42 , bf_str.length]
# b = "asdfaf"

# puts b[0, b.length]

#(0- 1).times { puts "fdsaf"}