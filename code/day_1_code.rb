# frozen_string_literal: true

# gem install colorize      ...if needed
require 'colorize'

@calibration_value = 0

# START OF PART ONE

def part_one
  File.foreach('../text_inputs/day_one/day_one_text.txt') do |line|
    num_arr = line.gsub(/\D/, '')
    @calibration_value += [num_arr[0], num_arr[num_arr.length - 1]].join.to_i
  end
  @calibration_value
end

# END OF PART ONE

# START OF PART TWO

CHARS_TO_INTS = {
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9
}.freeze

def part_two
  File.foreach('../text_inputs/day_one/day_one_text.txt') do |line|
    num_arr = []
    line.chars.each.with_index do |char, index|
      if char.to_i.to_s == char
        num_arr << char.to_i
      else
        num = valid_word?(line, index)
        num_arr << num unless num.nil?
      end
    end
    @calibration_value += [num_arr[0], num_arr[num_arr.length - 1]].join.to_i
  end
  @calibration_value
end

def valid_word?(line, index)
  cur_word = ''
  5.times do
    break if line[index].nil?

    cur_word += line[index]
    return CHARS_TO_INTS[cur_word] if CHARS_TO_INTS.keys.include?(cur_word)

    index += 1
  end
  nil
end

# END OF PART TWO

VERSIONS = %w[part_one part_two part_three].freeze
version = 'no version'
until VERSIONS.include?(version)
  puts "Please enter which version to use... #{'part_one'.green} | #{'part_two'.light_cyan}: "
  version = gets.chomp
end
answer =
  case version
  when 'part_one'
    part_one
  when 'part_two'
    part_two
  end

p "Your Answer is #{answer}"
