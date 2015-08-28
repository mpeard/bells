class Path
  def initialize(p = ["  4675321"])
    @path = p
    test_truth
  end
  
  def plain
    Path.new(@path.clone << (["  "] + [ 1, 2, 3, 4, 5, 6, 0 ].map{ |x| @path.last.chars.last(7)[x] }).join )
  end
  
  def bob
    Path.new(@path.clone << (["- "] + [ 3, 1, 2, 4, 5, 6, 0 ].map{ |x| @path.last.chars.last(7)[x] }).join )
  end
  
  def rounds?
    @path.first[2,4] == @path.last[2,4]
  end
  
  def true?
    @true
  end
  
  def length
    (@path.length-1) * 6
  end
  
  def path
    @path
  end
  
  def test_truth
    @true = true
    @sixes = {}
    
    @path.each do |s|
      @true = false if @sixes[s[2,4]]
      @sixes[s[2,4]] = true
    end
  end
  
  def self.read(filename)
    path = []
    File.open(filename, 'r').each do |l|
      path << l.strip
    end
    
    Path.new path
  end
  
  def write(filename)
    File.open(filename, 'w') do |f|
      @path.each do |p|
        f.puts p
      end
    end
  end
  
end
