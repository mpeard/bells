require './path'
require 'securerandom'
require 'fileutils'

WORKING_DIR = './working/'
TRUE_DIR = './true/'


def working_filename
  WORKING_DIR + SecureRandom.uuid + '.txt'
end

def true_filename
  TRUE_DIR + SecureRandom.uuid + '.txt'
end

# start at the beginning
# p = Path.new
# p.write working_filename

Dir["#{WORKING_DIR}/*.txt"].each do |f|
  path = Path.read f
  
  [:plain, :bob].each do |call|
    p = path.send call
    if p.rounds? 
      p.write true_filename
    elsif p.true?
      p.write working_filename
    end
  end
  
  FileUtils.rm_f f
end


#
#
# # for each path, generate both bob and plain
#
# path_count = 1
# reject_count = 0
# max_length = 0
#
# while true
#
#   p = paths.shift
#   path_count = path_count - 1
#
#   bob = p.bob
#   if bob.true?
#     paths << bob
#     path_count = path_count + 1
#     max_length = bob.length if bob.length > max_length
#   else
#     reject_count = reject_count + 1
#   end
#
#   plain = p.plain
#   if plain.true?
#     paths << plain
#     path_count = path_count + 1
#     max_length = plain.length if plain.length > max_length
#   else
#     reject_count = reject_count + 1
#   end
#
#   puts "#{path_count} paths, #{reject_count} rejected, max length #{max_length}"
# end
