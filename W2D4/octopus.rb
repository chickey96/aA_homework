#find longest string in array in n*n time (bubblesort)
def sluggish_octopus(fish)
  sorted = false
  until sorted 
    sorted = true
    fish.each_index do |i1|
      fish.each_index do |i2|
        next if i2 <= i1
        if fish[i1].length < fish[i2].length 
          fish[i1], fish[i2] = fish[i2], fish[i1]
          sorted = false 
        end
      end
    end
  end
    fish.first
end
#find longest string in array in nlgn time (quicksort)
def dominant_octopus(fish)
  dominant_octopus_helper(fish).first
end
#helper function orders the array from greatest to least by length, recursively
def dominant_octopus_helper(fish)
  return fish if fish.length <= 1
  pivot = fish.first 
  left = fish[1..-1].select {|el| el.length > pivot.length}
  right = fish[1..-1].select {|el| el.length < pivot.length}
  dominant_octopus_helper(left) + [pivot] + dominant_octopus_helper(right)
end
#find longest string in array in n time
def clever_octopus(fish)
  longest_fish = ""
  fish.each do |f|
    longest_fish = f if f.length > longest_fish.length
  end
  longest_fish
end
#check tiles array to get corresponding tiles index for given direction-time = n 
def slow_dance(dir, tiles)
  tiles.each_with_index do |tile, idx|
    return idx if tile == dir 
  end
end
#use new data structure to get corresponding tile in constant time
def constant_dance(dir, hash_tiles)
  hash_tiles[dir]
end