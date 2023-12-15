calibration_value = 0
File.foreach("../text_inputs/day_1_text.txt") do |line|
  num_arr = line.gsub(/\D/, "").chars
  calibration_value += [num_arr.first, num_arr.last].join.to_i
end
puts calibration_value
