# frozen_string_literal: true

require 'colorize'

# START OF PART ONE
def part_one
  # Some Code
end

# END OF PART ONE

# START OF PART TWO

def part_two
  # Some Code
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
