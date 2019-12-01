require 'test/unit'
include Test::Unit::Assertions

MASSES = %w(142536
            103450
            101545
            133505
            112476
            62461
            108718
            93376
            149609
            147657
            120888
            85008
            82501
            122988
            109493
            91656
            70001
            130308
            140298
            104623
            103542
            129220
            67381
            143889
            105384
            139467
            129004
            89271
            123863
            108567
            95453
            109698
            139953
            107458
            69734
            106036
            126036
            84832
            68715
            51484
            92833
            50734
            58267
            109650
            137004
            77709
            95073
            84817
            55711
            95408
            148990
            51697
            129180
            56196
            72692
            77049
            124294
            85102
            124400
            75981
            135842
            119561
            79871
            98771
            134213
            141322
            131828
            65692
            113994
            104632
            129273
            118023
            54700
            148185
            61618
            132304
            88308
            121386
            119548
            115527
            76627
            63168
            137582
            113598
            100899
            100167
            134345
            90716
            55476
            113403
            52745
            78755
            73421
            93337
            71171
            122979
            134298
            123117
            111244
            122177
)


def required_fuel_for mass
  (mass / 3).to_i - 2
end

def adj_required_fuel_for mass
  fuel = required_fuel_for(mass)

  if fuel >= 0
    return fuel + adj_required_fuel_for(fuel)
  else
    return 0
  end
end

def fuel_counter_upper
  MASSES.map { |i| required_fuel_for(i.to_i) }.reduce(:+)
end

def adj_fuel_counter_upper
  MASSES.map{ |m| adj_required_fuel_for(m.to_i) }.reduce(:+) 
end

# --- Part 1 ---
assert_equal(2, required_fuel_for(12))
assert_equal(654, required_fuel_for(1969))
assert_equal(33583, required_fuel_for(100756))

puts "Part 1: Fuel Requirement: #{fuel_counter_upper}"
# => Part 1: Fuel Requirement: 3432671


# --- Part 2 ---
assert_equal(2, adj_required_fuel_for(14), 'wrong for input 14')
assert_equal(966, adj_required_fuel_for(1969), 'wrong for input 1969')
assert_equal(50346, adj_required_fuel_for(100756), 'wrong for input 100756')


puts "Part 2: Adjusted Fuel Requirement: #{adj_fuel_counter_upper}"
# => Part 2: Adjusted Fuel Requirement: 5146132
