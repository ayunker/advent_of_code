require 'test/unit'
include Test::Unit::Assertions


def has_adjacent_sameness ary
  ary[0] == ary[1] ||
  ary[1] == ary[2] ||
  ary[2] == ary[3] ||
  ary[3] == ary[4] ||
  ary[4] == ary[5]
end

def has_non_decreasing ary
  ary[0] <= ary[1] && 
  ary[1] <= ary[2] && 
  ary[2] <= ary[3] && 
  ary[3] <= ary[4] && 
  ary[4] <= ary[5] 
end

def satisfies_that_criteria ary
  has_adjacent_sameness(ary) && has_non_decreasing(ary)
end

def count_potential_passwords min_val, max_val
  (min_val..max_val).select do |value|
    pword = value.to_s
    satisfies_that_criteria pword
  end.count
end

# --- Part 1 ---

assert_equal(false, has_adjacent_sameness([1,2,3,4,5,6]))
assert_equal(true, has_adjacent_sameness([1,2,3,3,5,6]))

assert_equal(false,has_non_decreasing([1,2,3,2,5,6]))
assert_equal(true,has_non_decreasing([1,2,3,3,5,6]))

assert_equal(true, satisfies_that_criteria('111111'))
assert_equal(false, satisfies_that_criteria('223450'))
assert_equal(false, satisfies_that_criteria('123789'))

puts count_potential_passwords(138241,674034)

# => 1890
