assert_equal %q{[1250, 1250, 1250, 1250, 5000]} ,%q{
  $numbers = 5000
  $groups = 4
  $array = (0..$numbers).to_a.shuffle.take($numbers)
  $arrays = $array.each_slice($numbers/$groups).to_a
  $partial_sums = Array.new($groups, 0)
  $arrays.each_with_index do |arr, spec_group|
    PPR{
      arr.each{|n| $partial_sums[spec_group] += n**10 * n**20 - n**30 +1}
    }
  end

  PPR.over
  $partial_sums << $partial_sums.inject{|sum,x| sum + x }

}
