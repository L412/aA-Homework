FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
TILES_HASH = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

#find the biggest fish in O(n**2) time.
def sluggish_octopus(fish_array)
  longest = 0
  big_fish = nil

  fish_array.each do |fish1|
    fish_array.each do |fish2|
      if fish1.length > fish2.length && fish1.length > longest
        longest = fish1.length
        big_fish = fish1
      end
    end
  end

  big_fish
end


#find the biggest fish in O(n log n) time.
def dominant_octopus(fishes)
  merge_sort(fishes).last
end

def merge_sort(fishes)
  return fishes if fishes.length == 1

  mid = fishes.length / 2

  left = merge_sort(fishes[0...mid])
  right = merge_sort(fishes[mid..-1])

  merge(left, right)
end

def merge(left, right)
  answer = []

  until left.empty? || right.empty?
    if left.first.length < right.first.length
      answer << left.shift
    else
      answer << right.shift
    end
  end

  answer + left  + right
end


#find the biggest fish in O(n) time.
def clever_octopus(fishes)
  longest_so_far = fishes.shift

  fishes.each do |fish|
    if fish.length > longest_so_far.length
      longest_so_far = fish
    end
  end

  longest_so_far
end

puts "Below is answer with Big-O(n**2), from Bubble Sort:"
print sluggish_octopus(FISH)
puts

puts "Below is answer with Big-O(nlog(n)), from Merge Sort:"
print dominant_octopus(FISH)
puts

puts "Below is answer with Big-O(n), with temporary variable + comparison:"
print clever_octopus(FISH)
puts


def slow_dance(dir, tiles)
  tentacle_index = nil

  tiles.each_with_index do |tile, idx|
    if tile == dir
      tentacle_index = idx
    end
  end

  tentacle_index
end

def constant_dance(dir, tiles_hash)
  tiles_hash[dir]
end

puts "Below is the index of the tentacle that the octopus must move to play DDR slowly:"
puts "This takes Big-O(n) time."
print slow_dance("right-down", TILES_ARRAY)
puts

puts "Below is the index of the tentacle that the octopus must move to play DDR quickly:"
puts "This takes Big-O(n) time."
print constant_dance("right-down", TILES_HASH)
puts
