require './path'

# start at the beginning
paths = [ Path.new ]

# for each path, generate both bob and plain

path_count = 1
reject_count = 0
max_length = 0

while true

  p = paths.shift
  path_count = path_count - 1
  
  bob = p.bob
  if bob.true?
    paths << bob
    path_count = path_count + 1
    max_length = bob.length if bob.length > max_length
  else
    reject_count = reject_count + 1
  end
  
  plain = p.plain
  if plain.true?
    paths << plain
    path_count = path_count + 1
    max_length = plain.length if plain.length > max_length
  else
    reject_count = reject_count + 1
  end
  
  puts "#{path_count} paths, #{reject_count} rejected, max length #{max_length}"
end
