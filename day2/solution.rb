require 'test/unit'
include Test::Unit::Assertions

INPUT = [1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,19,5,23,1,23,9,27,2,27,6,31,1,31,6,35,2,35,9,39,1,6,39,43,2,10,43,47,1,47,9,51,1,51,6,55,1,55,6,59,2,59,10,63,1,6,63,67,2,6,67,71,1,71,5,75,2,13,75,79,1,10,79,83,1,5,83,87,2,87,10,91,1,5,91,95,2,95,6,99,1,99,6,103,2,103,6,107,2,107,9,111,1,111,5,115,1,115,6,119,2,6,119,123,1,5,123,127,1,127,13,131,1,2,131,135,1,135,10,0,99,2,14,0,0]

def intcode_program arry
  i = 0
  while arry[i] != 99 do
    op_code = arry[i]
    input_1 = arry[arry[i+1]]
    input_2 = arry[arry[i+2]]
    output_index = arry[i+3]

    if op_code == 1
      output = input_1 + input_2
    elsif op_code == 2
      output = input_1 * input_2
    end

    arry[output_index] = output
    i = i + 4
  end

  arry
end

# --- Part 1 ---
assert_equal([2,0,0,0,99], intcode_program([1,0,0,0,99]))
assert_equal([2,3,0,6,99], intcode_program([2,3,0,3,99]))
assert_equal([2,4,4,5,99,9801], intcode_program([2,4,4,5,99,0]))
assert_equal([30,1,1,4,2,5,6,0,99], intcode_program([1,1,1,4,99,5,6,0,99]))
assert_equal([3500,9,10,70, 2,3,11,0, 99, 30,40,50], intcode_program([1,9,10,3,2,3,11,0,99,30,40,50]))


intcode_program_output = intcode_program(INPUT.dup)

puts "Part 1: output program: #{intcode_program_output}"
puts "Part 1: first position: #{intcode_program_output[0]}"

# => Part 1: first position: 4945026

# --- Part 2 ---

(0..99).each do |j|
  (0..99).each do |k|
    program = INPUT.dup
    program[1] = j
    program[2] = k
    outputter = intcode_program(program)
    puts "noun: #{j}, verb: #{k}" if outputter[0] == 19690720
  end
end

# => noun: 52, verb: 96
# => (100 * noun) + verb = 5296
