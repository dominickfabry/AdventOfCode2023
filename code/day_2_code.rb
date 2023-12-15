# frozen_string_literal: true

require 'colorize'

# 12 Reds 13 Greens 14 blues can be played at one time
# We put all the cubes back in the bag at the end of each round
# Rounds are deliminated by a semi-colan ;
# Round Ids are deliminated by a colan
# Different cubes are deliminated by a comma during a round

# START OF PART ONE

CUBE_INVENTORY = { 'red' => 12, 'green' => 13, 'blue' => 14 }.freeze
@game_id_sum = 0

def part_one
  File.foreach('../text_inputs/day_2_text.txt') do |line|
    valid_game = true
    game_id = line.match(/Game (\d+)/)
    CUBE_INVENTORY.each_key do |color|
      max_color_count = line.scan(/(\d+) #{color}/).map { |nums| nums[0].to_i }.max
      valid_game = false if max_color_count > CUBE_INVENTORY[color]
    end
    @game_id_sum += game_id[1].to_i if valid_game
  end
  @game_id_sum
end

# END OF PART ONE

# START OF PART TWO
CUBE_COLORS = %w[red blue green].freeze
@cube_power_sum = 0

def part_two
  File.foreach('../text_inputs/day_2_text.txt') do |line|
    cube_counts = []
    CUBE_COLORS.each do |color|
      cube_counts << line.scan(/(\d+) #{color}/).map { |nums| nums[0].to_i }.max
    end
    @cube_power_sum += cube_counts.inject(:*)
  end
  @cube_power_sum
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
